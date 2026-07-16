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
theorem p_b_a_ab (a b : O ℚ) : assoc b a (a*b) = 0 := by rw [asw12, obash_ab, neg_zero]
theorem p_a_ab_b (a b : O ℚ) : assoc a (a*b) b = 0 := by rw [asw23, obash_ab, neg_zero]
theorem p_b_ab_a (a b : O ℚ) : assoc b (a*b) a = 0 := by
  rw [asw23 b (a*b) a, asw12 b a (a*b), obash_ab, neg_zero, neg_zero]
theorem p_ab_a_b (a b : O ℚ) : assoc (a*b) a b = 0 := by
  rw [asw12 (a*b) a b, asw23 a (a*b) b, obash_ab, neg_zero, neg_zero]
theorem p_ab_b_a (a b : O ℚ) : assoc (a*b) b a = 0 := by
  rw [asw12 (a*b) b a, asw23 b (a*b) a, asw12 b a (a*b), obash_ab, neg_zero, neg_zero, neg_zero]

-- Test: 64-case with explicit disjunction but a SMALLER `first` list built per-slot.
-- Try `simp` closing repeats/units automatically:
theorem assoc_gen_triple (a b : O ℚ) {p q r : O ℚ}
    (hp : p ∈ ({1, a, b, a*b} : Set (O ℚ))) (hq : q ∈ ({1, a, b, a*b} : Set (O ℚ)))
    (hr : r ∈ ({1, a, b, a*b} : Set (O ℚ))) :
    assoc p q r = 0 := by
  simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hp hq hr
  rcases hp with rfl|rfl|rfl|rfl <;> rcases hq with rfl|rfl|rfl|rfl <;>
    rcases hr with rfl|rfl|rfl|rfl <;>
    simp only [assoc_one_left, assoc_one_mid, assoc_one_right, alt_left, alt_right,
      alt_flex, obash_ab, p_b_a_ab, p_a_ab_b, p_b_ab_a, p_ab_a_b, p_ab_b_a]

#print axioms Phys.Algebra.assoc_gen_triple

end Phys.Algebra
