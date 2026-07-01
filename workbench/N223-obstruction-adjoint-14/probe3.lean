import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.OctonionCrossProductDerivation
import Phys.Algebra.DerivationRep7
import Mathlib.Algebra.Lie.SkewAdjoint

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- The Born self-overlap form restricted to the fundamental 7-rep ImO, as a Mathlib BilinForm. -/
def bornBil : BilinForm ℚ ImO :=
  LinearMap.mk₂ ℚ (fun x y => gForm (x : O ℚ) (y : O ℚ))
    (fun x₁ x₂ y => by simp only [Submodule.coe_add]; rw [gForm_add_left])
    (fun c x y => by simp only [SetLike.val_smul]; rw [gForm_smul_left, smul_eq_mul])
    (fun x y₁ y₂ => by simp only [Submodule.coe_add]; rw [gForm_add_right])
    (fun c x y => by simp only [SetLike.val_smul]; rw [gForm_smul_right, smul_eq_mul])

@[simp] theorem bornBil_apply (x y : ImO) : bornBil x y = gForm (x : O ℚ) (y : O ℚ) := rfl

end

end Phys.Algebra
