import Phys.Algebra.Alternative
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option maxHeartbeats 4000000

-- CRUX PROBE A: does [a,b,a*b] = 0 fall to the raw coordinate bash?
theorem probe_assoc_a_b_ab (a b : O ℚ) : assoc a b (a * b) = 0 := by
  unfold assoc
  rw [sub_eq_zero]
  ext <;>
    simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg,
      neg_neg, add_mul, mul_add, zero_mul, mul_zero] <;>
    ring

end Phys.Algebra

#print axioms Phys.Algebra.probe_assoc_a_b_ab
