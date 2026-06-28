import Phys.Algebra.LorentzContinuumGenerationSO8PeelOracle
import Phys.Algebra.LorentzContinuumMetricCondition

namespace Phys.Algebra.N125Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## BvC right-slot bilinearity (helpers — not banked in the chain yet). -/

theorem BvC_add_right' (p q q' : STVC) : BvC p (q + q') = BvC p q + BvC p q' := by
  rw [BvC_symm p (q + q'), BvC_add_left, BvC_symm q p, BvC_symm q' p]

theorem BvC_smul_right' (c : Cut) (p q : STVC) : BvC p (c • q) = c * BvC p q := by
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', v'⟩ := q
  show t * (c • t') - x * (c • x') - gFormC v (c • v') = c * (t * t' - x * x' - gFormC v v')
  rw [gFormC_smul_right]; show t * (c * t') - x * (c * x') - c * gFormC v v' = _; ring

/-- The bundled Minkowski functional `BvCRight a : p ↦ BvC a p`. -/
def BvCRight (a : STVC) : STVC →ₗ[Cut] Cut where
  toFun := fun p => BvC a p
  map_add' := BvC_add_right' a
  map_smul' := fun c p => by simpa using BvC_smul_right' c a p

/-! ## The fixed-subspace and the linear isometry predicate on `STVC`. -/

def fixSubmoduleM (S : Module.End Cut STVC) : Submodule Cut STVC :=
  LinearMap.ker (S - LinearMap.id)

theorem mem_fixSubmoduleM (S : Module.End Cut STVC) (p : STVC) :
    p ∈ fixSubmoduleM S ↔ S p = p := by
  unfold fixSubmoduleM
  rw [LinearMap.mem_ker, LinearMap.sub_apply, LinearMap.id_apply, sub_eq_zero]

def IsBvIsomLin (S : Module.End Cut STVC) : Prop := ∀ p q : STVC, BvC (S p) (S q) = BvC p q

theorem IsBvIsomLin.comp {R T : Module.End Cut STVC}
    (hR : IsBvIsomLin R) (hT : IsBvIsomLin T) : IsBvIsomLin (R * T) := by
  intro p q
  rw [Module.End.mul_apply, Module.End.mul_apply, hR, hT]

/-! ## The indefinite Householder reflection. -/

/-- THE INDEFINITE-SIGNATURE HOUSEHOLDER REFLECTION across the `BvC`-hyperplane orthogonal to an
    ANISOTROPIC `a` (`BvC a a ≠ 0`): `v ↦ v − (2·(BvC a a)⁻¹·BvC a v)•a`. -/
def houseHolderM (a : STVC) : Module.End Cut STVC :=
  LinearMap.id - (2 * (BvC a a)⁻¹) • (LinearMap.smulRight (BvCRight a) a)

theorem houseHolderM_apply (a p : STVC) :
    houseHolderM a p = p - (2 * (BvC a a)⁻¹ * BvC a p) • a := by
  unfold houseHolderM
  rw [LinearMap.sub_apply, LinearMap.id_apply, LinearMap.smul_apply,
      LinearMap.smulRight_apply]
  show p - (2 * (BvC a a)⁻¹) • (BvCRight a p • a) = _
  rw [smul_smul]; rfl

theorem houseHolderM_fixes_ortho {a u : STVC} (h : BvC a u = 0) :
    houseHolderM a u = u := by
  rw [houseHolderM_apply, h, mul_zero, zero_smul, sub_zero]

theorem houseHolderM_neg_self {a : STVC} (ha : BvC a a ≠ 0) :
    houseHolderM a a = -a := by
  rw [houseHolderM_apply]
  have : (2 * (BvC a a)⁻¹ * BvC a a) = 2 := by field_simp
  rw [this]; module

/-! ## The reflection preserves `BvC` and is an involution. -/

theorem BvC_houseterm (x y a : STVC) (s t : Cut) :
    BvC (x - s • a) (y - t • a)
      = BvC x y - t * BvC x a - s * BvC a y + s * t * BvC a a := by
  rw [BvC_sub_left, BvC_sub_right, BvC_sub_right]
  have hsa_y : BvC (s • a) y = s * BvC a y := by rw [BvC_symm, BvC_smul_right', BvC_symm]
  have hx_ta : BvC x (t • a) = t * BvC x a := by rw [BvC_smul_right']
  have hsa_ta : BvC (s • a) (t • a) = s * t * BvC a a := by
    rw [BvC_smul_right', BvC_symm (s • a) a, BvC_smul_right']; ring
  rw [hsa_y, hx_ta, hsa_ta]; ring

theorem houseHolderM_isom {a : STVC} (ha : BvC a a ≠ 0) :
    IsBvIsomLin (houseHolderM a) := by
  intro u v
  rw [houseHolderM_apply, houseHolderM_apply, BvC_houseterm, BvC_symm u a]
  field_simp; ring

theorem houseHolderM_involutive {a : STVC} (ha : BvC a a ≠ 0) :
    houseHolderM a * houseHolderM a = 1 := by
  apply LinearMap.ext
  intro v
  rw [Module.End.mul_apply, houseHolderM_apply, houseHolderM_apply]
  have hinner : BvC a (v - (2 * (BvC a a)⁻¹ * BvC a v) • a)
      = BvC a v - (2 * (BvC a a)⁻¹ * BvC a v) * BvC a a := by
    rw [BvC_sub_right, BvC_smul_right']
  rw [hinner]
  have hcoef : (2 * (BvC a a)⁻¹ * BvC a v)
      + (2 * (BvC a a)⁻¹ * (BvC a v - (2 * (BvC a a)⁻¹ * BvC a v) * BvC a a)) = 0 := by
    field_simp; ring
  rw [sub_sub, ← add_smul, hcoef, zero_smul, sub_zero]; rfl

end

end Phys.Algebra.N125Probe
