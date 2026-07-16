import Phys.Algebra.Alternative
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.DerivationSkew
import Phys.Cascade.ForcedStop
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option maxHeartbeats 4000000

-- LYNCHPIN 1: self-overlap is a real scalar:  a * star a = (reQ (a*star a)) • 1
theorem selfmul_scalar (a : O ℚ) : a * star a = (reQ (a * star a)) • (1 : O ℚ) := by
  unfold reQ
  ext <;>
    simp only [cd_qsmul_re, cd_qsmul_im, mul_re, mul_im, star_re, star_im,
      one_re, one_im, star_neg, neg_re, neg_im, star_add, star_mul', star_star,
      neg_mul, mul_neg, neg_neg, add_re, add_im, smul_eq_mul, mul_one, mul_zero] <;>
    ring

-- LYNCHPIN 2: quadratic minimal relation:  a*a = (2 reQ a)•a − (reQ(a*star a))•1
theorem quad_rel (a : O ℚ) :
    a * a = (2 * reQ a) • a - (reQ (a * star a)) • (1 : O ℚ) := by
  unfold reQ
  ext <;>
    simp only [cd_qsmul_re, cd_qsmul_im, mul_re, mul_im, star_re, star_im,
      one_re, one_im, star_neg, neg_re, neg_im, star_add, star_mul', star_star,
      neg_mul, mul_neg, neg_neg, add_re, add_im, sub_re, sub_im, smul_eq_mul,
      mul_one, mul_zero] <;>
    ring

#print axioms Phys.Algebra.selfmul_scalar
#print axioms Phys.Algebra.quad_rel

end Phys.Algebra
