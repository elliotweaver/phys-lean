import Phys.Algebra.Alternative
import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option maxHeartbeats 4000000

theorem obash_ab (a b : O ℚ) : assoc a b (a*b) = 0 := by
  unfold assoc; rw [sub_eq_zero]
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg,
      neg_neg, add_mul, mul_add, zero_mul, mul_zero] <;> ring
theorem asw12 (x y z : O ℚ) : assoc x y z = - assoc y x z :=
  eq_neg_of_add_eq_zero_left (assoc_swap12 x y z)
theorem asw23 (x y z : O ℚ) : assoc x y z = - assoc x z y :=
  eq_neg_of_add_eq_zero_left (assoc_swap23 x y z)

theorem perm_abab (a b : O ℚ) :
    assoc a b (a*b) = 0 ∧ assoc b a (a*b) = 0 ∧ assoc a (a*b) b = 0
      ∧ assoc b (a*b) a = 0 ∧ assoc (a*b) a b = 0 ∧ assoc (a*b) b a = 0 := by
  have h := obash_ab a b
  refine ⟨h, ?_, ?_, ?_, ?_, ?_⟩
  · rw [asw12, h, neg_zero]
  · rw [asw23, h, neg_zero]
  · rw [asw23 b (a*b) a, asw12 b a (a*b), h, neg_zero, neg_zero]
  · rw [asw12 (a*b) a b, asw23 a (a*b) b, h, neg_zero, neg_zero]
  · rw [asw12 (a*b) b a, asw23 b (a*b) a, asw12 b a (a*b), h, neg_zero, neg_zero, neg_zero]

#print axioms Phys.Algebra.perm_abab

end Phys.Algebra
