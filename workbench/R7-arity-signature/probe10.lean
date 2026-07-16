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

-- the six permutations, as named lemmas (fast to apply)
theorem p_a_b_ab (a b : O ℚ) : assoc a b (a*b) = 0 := obash_ab a b
theorem p_b_a_ab (a b : O ℚ) : assoc b a (a*b) = 0 := by
  rw [asw12, obash_ab, neg_zero]
theorem p_a_ab_b (a b : O ℚ) : assoc a (a*b) b = 0 := by
  rw [asw23, obash_ab, neg_zero]
theorem p_b_ab_a (a b : O ℚ) : assoc b (a*b) a = 0 := by
  rw [asw23 b (a*b) a, asw12 b a (a*b), obash_ab, neg_zero, neg_zero]
theorem p_ab_a_b (a b : O ℚ) : assoc (a*b) a b = 0 := by
  rw [asw12 (a*b) a b, asw23 a (a*b) b, obash_ab, neg_zero, neg_zero]
theorem p_ab_b_a (a b : O ℚ) : assoc (a*b) b a = 0 := by
  rw [asw12 (a*b) b a, asw23 b (a*b) a, asw12 b a (a*b), obash_ab, neg_zero, neg_zero, neg_zero]

noncomputable def gen4 (a b : O ℚ) : Set (O ℚ) := {1, a, b, a*b}

theorem assoc_gen_triple (a b : O ℚ) {p q r : O ℚ}
    (hp : p ∈ gen4 a b) (hq : q ∈ gen4 a b) (hr : r ∈ gen4 a b) :
    assoc p q r = 0 := by
  simp only [gen4, Set.mem_insert_iff, Set.mem_singleton_iff] at hp hq hr
  rcases hp with rfl|rfl|rfl|rfl <;> rcases hq with rfl|rfl|rfl|rfl <;>
    rcases hr with rfl|rfl|rfl|rfl
  all_goals
    first
      | exact assoc_one_left _ _
      | exact assoc_one_mid _ _
      | exact assoc_one_right _ _
      | exact alt_left _ _
      | exact alt_right _ _
      | exact alt_flex _ _
      | exact p_a_b_ab a b
      | exact p_b_a_ab a b
      | exact p_a_ab_b a b
      | exact p_b_ab_a a b
      | exact p_ab_a_b a b
      | exact p_ab_b_a a b

#print axioms Phys.Algebra.assoc_gen_triple

end Phys.Algebra
