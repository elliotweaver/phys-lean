import Phys.Algebra.SpacetimeRicci
import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Phys.Algebra.LorentzContinuumCliffordSpinCover
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.LinearAlgebra.Trace

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

theorem BvCBilin_nondeg : (BvCBilin : BilinForm Cut STVC).Nondegenerate := by
  refine ⟨?_, ?_⟩
  · intro p hp
    apply BvC_nondegenerate p
    intro q; have := hp q; simpa [BvCBilin_apply] using this
  · intro q hq
    apply BvC_nondegenerate q
    intro p; have := hq p; rw [BvC_symm]; simpa [BvCBilin_apply] using this

def IsRicciRaise (G : STVC →ₗ[Cut] MetricEnd) (T : MetricEnd) : Prop :=
  ∀ Y Z : STVC, BvC Y (T Z) = ricci G Y Z

theorem ricciRaise_unique (G : STVC →ₗ[Cut] MetricEnd) (T T' : MetricEnd)
    (hT : IsRicciRaise G T) (hT' : IsRicciRaise G T') : T = T' := by
  refine LinearMap.ext fun Z => ?_
  have hZ : T Z - T' Z = 0 := by
    apply BvC_nondegenerate (T Z - T' Z)
    intro q; rw [BvC_symm, BvC_sub_right, hT q Z, hT' q Z, sub_self]
  exact sub_eq_zero.mp hZ

def ricciRightFun (G : STVC →ₗ[Cut] MetricEnd) (Z : STVC) : Module.Dual Cut STVC where
  toFun Y := ricci G Y Z
  map_add' Y₁ Y₂ := by rw [ricci_add_Y]
  map_smul' c Y := by rw [ricci_smul_Y]; rfl

def ricciRaiseMap (G : STVC →ₗ[Cut] MetricEnd) : MetricEnd where
  toFun Z := (BvCBilin.toDual BvCBilin_nondeg).symm (ricciRightFun G Z)
  map_add' Z₁ Z₂ := by
    rw [show ricciRightFun G (Z₁ + Z₂) = ricciRightFun G Z₁ + ricciRightFun G Z₂ from by
      refine LinearMap.ext fun Y => ?_
      simp only [ricciRightFun, LinearMap.coe_mk, AddHom.coe_mk, LinearMap.add_apply, ricci_add_Z]]
    rw [map_add]
  map_smul' c Z := by
    rw [show ricciRightFun G (c • Z) = c • ricciRightFun G Z from by
      refine LinearMap.ext fun Y => ?_
      simp only [ricciRightFun, LinearMap.coe_mk, AddHom.coe_mk, LinearMap.smul_apply,
        ricci_smul_Z, smul_eq_mul]]
    rw [map_smul]; rfl

theorem ricciRaiseMap_isRaise (G : STVC →ₗ[Cut] MetricEnd) :
    IsRicciRaise G (ricciRaiseMap G) := by
  intro Y Z
  show BvC Y ((BvCBilin.toDual BvCBilin_nondeg).symm (ricciRightFun G Z)) = ricci G Y Z
  rw [BvC_symm, ← BvCBilin_apply, LinearMap.BilinForm.apply_toDual_symm_apply]; rfl

/-- THE RICCI SCALAR: the metric (BvC) trace of the genuine Ricci tensor, `R = trace(g⁻¹ Ric)`. -/
def ricciScalar (G : STVC →ₗ[Cut] MetricEnd) : Cut :=
  LinearMap.trace Cut STVC (ricciRaiseMap G)

/-! ## concrete route -/

theorem lbCurv_gen_comp1 (Z : STVC) :
    (lbCurv timeProj offDiagVar Z).1 = (4⁻¹ : Cut) * Z.2.1 := by
  rw [lbCurv_eq]
  simp only [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, offDiagVar_apply, Prod.smul_fst, Prod.fst_sub,
    neg_zero, sub_zero, smul_eq_mul]

theorem lbCurv_gen_comp2 (Z : STVC) :
    (lbCurv timeProj offDiagVar Z).2.1 = (0 : Cut) := by
  rw [lbCurv_eq]
  simp only [LinearMap.smul_apply, LinearMap.sub_apply, Module.End.mul_apply,
    sigOpC_apply, timeProj_apply, offDiagVar_apply, Prod.smul_snd, Prod.smul_fst,
    Prod.snd_sub, Prod.fst_sub, neg_zero, sub_zero, smul_eq_mul, mul_zero]

theorem ricci_solder_form (Y Z : STVC) :
    ricci solderWit Y Z = (4⁻¹ : Cut) * Y.2.1 * Z.2.1 := by
  rw [ricci_solder, lbCurv_gen_comp1, lbCurv_gen_comp2]; ring

theorem ricci_solder_symm (Y Z : STVC) :
    ricci solderWit Y Z = ricci solderWit Z Y := by
  rw [ricci_solder_form, ricci_solder_form]; ring

def xFun : STVC →ₗ[Cut] Cut :=
  (LinearMap.fst Cut Cut (O Cut)).comp (LinearMap.snd Cut Cut (Cut × O Cut))

theorem xFun_apply (Z : STVC) : xFun Z = Z.2.1 := rfl

def solderRicciRaise : MetricEnd := xFun.smulRight (((0:Cut), (-(4⁻¹):Cut), (0 : O Cut)) : STVC)

theorem solderRicciRaise_apply (Z : STVC) :
    solderRicciRaise Z = ((0:Cut), (-(4⁻¹):Cut) * Z.2.1, (0 : O Cut)) := by
  show Z.2.1 • (((0:Cut), (-(4⁻¹):Cut), (0 : O Cut)) : STVC) = _
  refine Prod.ext ?_ (Prod.ext ?_ ?_)
  · show Z.2.1 • (0:Cut) = 0; rw [smul_zero]
  · show Z.2.1 • (-(4⁻¹):Cut) = (-(4⁻¹):Cut) * Z.2.1; rw [smul_eq_mul]; ring
  · show Z.2.1 • (0:O Cut) = 0; rw [smul_zero]

theorem solder_isRicciRaise : IsRicciRaise solderWit solderRicciRaise := by
  intro Y Z
  rw [ricci_solder_form, solderRicciRaise_apply]
  show Y.1 * 0 - Y.2.1 * ((-(4⁻¹):Cut) * Z.2.1) - gFormC Y.2.2 0 = 4⁻¹ * Y.2.1 * Z.2.1
  rw [gFormC_zero_right']; ring

-- the general map on solderWit EQUALS the concrete raise (via uniqueness)
theorem ricciRaiseMap_solder_eq : ricciRaiseMap solderWit = solderRicciRaise :=
  ricciRaise_unique solderWit _ _ (ricciRaiseMap_isRaise solderWit) solder_isRicciRaise

-- THE RICCI SCALAR for the concrete field gradient = −¼
theorem ricciScalar_solder : ricciScalar solderWit = -(4⁻¹ : Cut) := by
  unfold ricciScalar
  rw [ricciRaiseMap_solder_eq]
  unfold solderRicciRaise
  rw [LinearMap.trace_smulRight, xFun_apply]

-- W8 non-vacuity
theorem ricciScalar_solder_ne_zero : ricciScalar solderWit ≠ 0 := by
  rw [ricciScalar_solder]; norm_num

-- THE HEART: metric trace contentful, fiber trace blind
theorem ricciScalar_contentful_not_fiberTrace :
    LinearMap.trace Cut STVC (lbCurv timeProj offDiagVar) = 0
      ∧ ricciScalar solderWit ≠ 0 :=
  ⟨fiberTrace_lbCurv_zero timeProj offDiagVar, ricciScalar_solder_ne_zero⟩

end

end Phys.Algebra
