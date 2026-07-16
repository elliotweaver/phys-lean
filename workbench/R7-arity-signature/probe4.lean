import Phys.Algebra.Alternative
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option maxHeartbeats 4000000

-- generic coordinate-bash closer for identities of the form LHS = RHS on O ℚ
macro "obash" : tactic =>
  `(tactic| (ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg,
      neg_neg, add_mul, mul_add, zero_mul, mul_zero] <;> ring))

-- Does ba ∈ span{1,a,b,ab}?  Test the composition-algebra identity:
--   a*b + b*a = (tr a)•b + (tr b)•a − (bilin a b)•1  ... hard to state generically.
-- Instead: probe whether span{1,a,b,a*b} is closed under the SPECIFIC products.

-- CRUX generated associators (arbitrary a b), coordinate bash:
theorem p_ab_a_b (a b : O ℚ) : assoc (a*b) a b = 0 := by unfold assoc; rw [sub_eq_zero]; obash
theorem p_a_ab_b (a b : O ℚ) : assoc a (a*b) b = 0 := by unfold assoc; rw [sub_eq_zero]; obash
theorem p_a_b_ab (a b : O ℚ) : assoc a b (a*b) = 0 := by unfold assoc; rw [sub_eq_zero]; obash
theorem p_ab_ba_a (a b : O ℚ) : assoc (a*b) (b*a) a = 0 := by unfold assoc; rw [sub_eq_zero]; obash

end Phys.Algebra

#print axioms Phys.Algebra.p_ab_a_b
#print axioms Phys.Algebra.p_a_ab_b
#print axioms Phys.Algebra.p_a_b_ab
#print axioms Phys.Algebra.p_ab_ba_a
