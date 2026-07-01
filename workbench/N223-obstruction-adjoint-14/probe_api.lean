import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.DerivationRep7
import Mathlib.Algebra.Lie.SkewAdjoint

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

def bornBil : BilinForm ℚ ImO :=
  LinearMap.mk₂ ℚ (fun x y => gForm (x : O ℚ) (y : O ℚ))
    (fun x₁ x₂ y => by simp only [Submodule.coe_add]; rw [gForm_add_left])
    (fun c x y => by simp only [SetLike.val_smul]; rw [gForm_smul_left, smul_eq_mul])
    (fun x y₁ y₂ => by simp only [Submodule.coe_add]; rw [gForm_add_right])
    (fun c x y => by simp only [SetLike.val_smul]; rw [gForm_smul_right, smul_eq_mul])

@[simp] theorem bornBil_apply (x y : ImO) : bornBil x y = gForm (x : O ℚ) (y : O ℚ) := rfl

example (D : derivationLieQ) : imRep D ∈ skewAdjointLieSubalgebra bornBil := by
  show imRep D ∈ bornBil.skewAdjointSubmodule
  rw [LinearMap.mem_skewAdjointSubmodule]
  intro y z
  show gForm ((D : Module.End ℚ (O ℚ)) (y : O ℚ)) (z : O ℚ)
      = gForm (y : O ℚ) (((-imRep D) z : ImO) : O ℚ)
  have hskew := gFormQ_skew (D : Module.End ℚ (O ℚ)) D.2 (y : O ℚ) (z : O ℚ)
  simp only [LinearMap.neg_apply, Submodule.coe_neg, imRep_coe, gForm_neg_right]
  linarith [hskew]

end
end Phys.Algebra
