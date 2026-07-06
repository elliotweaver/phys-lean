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

-- Package the Ricci form (with G fixed) as a BilinForm: Z ↦ (Y ↦ ricci G Y Z)... careful with slots.
-- We want T with BvC Y (T Z) = ricci G Y Z. Define the "lowered" functional in Z as element of dual,
-- then apply (toDual).symm. The functional (fun Y => ricci G Y Z) is linear in Y (ricci_add_Y/_smul_Y).
def ricciRightFun (G : STVC →ₗ[Cut] MetricEnd) (Z : STVC) : Module.Dual Cut STVC where
  toFun Y := ricci G Y Z
  map_add' Y₁ Y₂ := by rw [ricci_add_Y]
  map_smul' c Y := by rw [ricci_smul_Y]; rfl

-- The raise via toDual.symm, assembled as a linear map Z ↦ (toDual.symm (ricciRightFun G Z))
-- Need ricciRightFun linear in Z too.
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

-- (A) EXISTENCE: ricciRaiseMap is a raise.
theorem ricciRaiseMap_isRaise (G : STVC →ₗ[Cut] MetricEnd) :
    IsRicciRaise G (ricciRaiseMap G) := by
  intro Y Z
  show BvC Y ((BvCBilin.toDual BvCBilin_nondeg).symm (ricciRightFun G Z)) = ricci G Y Z
  rw [BvC_symm, ← BvCBilin_apply]
  rw [LinearMap.BilinForm.apply_toDual_symm_apply]
  rfl

end

end Phys.Algebra
