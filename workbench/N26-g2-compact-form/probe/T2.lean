import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationRep7
import Mathlib.LinearAlgebra.BilinearForm.Basic
import Mathlib.LinearAlgebra.BilinearForm.Properties
import Mathlib.LinearAlgebra.SesquilinearForm.Basic
import Mathlib.Algebra.Lie.SkewAdjoint

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

theorem reQ_smul (c : ℚ) (x : O ℚ) : reQ (c • x) = c * reQ x := by
  simp [reQ, cd_qsmul_re, Dbl.smul_re]

def gBil : BilinForm ℚ (O ℚ) where
  toFun v := {
    toFun := fun w => gForm v w
    map_add' := by intro w1 w2; simp only [gForm, star_add, mul_add]; rw [reQ_add]
    map_smul' := by
      intro c w
      simp only [gForm, RingHom.id_apply, smul_eq_mul]
      rw [show star (c • w) = c • star w from map_smul starL c w |>.symm ▸ rfl,
          qsmul_mul_right, reQ_smul] }
  map_add' := by
    intro v1 v2; ext w
    simp only [gForm, add_mul, LinearMap.add_apply, LinearMap.coe_mk, AddHom.coe_mk]; rw [reQ_add]
  map_smul' := by
    intro c v; ext w
    simp only [gForm, RingHom.id_apply, qsmul_mul_left, reQ_smul,
      LinearMap.smul_apply, LinearMap.coe_mk, AddHom.coe_mk, smul_eq_mul]

@[simp] theorem gBil_apply (v w : O ℚ) : gBil v w = gForm v w := rfl

theorem deriv_isSkewAdjoint_gBil (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) :
    gBil.IsSkewAdjoint D := by
  intro x y
  show gForm (D x) y = gForm x ((-D) y)
  rw [LinearMap.neg_apply]
  have hsk := gFormQ_skew D hD x y
  have hneg : gForm x (-(D y)) = - gForm x (D y) := by
    simp only [gForm, star_neg, mul_neg, reQ_neg]
  rw [hneg]; linarith

-- the whole derivation algebra embeds in skew-adjoint operators (compact g₂ ↪ so(7))
theorem derivationLieQ_le_skewAdjoint :
    derivationLieQ ≤ skewAdjointLieSubalgebra gBil := by
  intro D hD
  show D ∈ gBil.skewAdjointSubmodule
  rw [LinearMap.mem_skewAdjointSubmodule]
  exact deriv_isSkewAdjoint_gBil D hD

-- gBil is nondegenerate (anisotropic: gForm x x = 0 ↔ x = 0)
theorem gBil_separatingLeft : gBil.SeparatingLeft := by
  intro x hx
  have hxx : gForm x x = 0 := by have := hx x; rwa [gBil_apply] at this
  exact gForm_self_eq_zero.mp hxx

end

end Phys.Algebra
