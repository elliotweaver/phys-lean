import Phys.Algebra.Alternative
import Phys.Algebra.ConfinementColourSinglet
import Phys.Algebra.TowerGatherObstructionRep7
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.DerivationSkew
import Phys.Cascade.ForcedStop
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option maxHeartbeats 4000000

-- crux 1: quad_rel — square lies in span{1,a}
theorem quad_rel (a : O ℚ) :
    a * a = (2 * reQ a) • a - (reQ (a * star a)) • (1 : O ℚ) := by
  rw [sub_eq_add_neg]
  unfold reQ
  ext <;>
    simp only [cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
      mul_re, mul_im, star_re, star_im,
      one_re, one_im, star_neg, neg_re, neg_im, star_add, star_mul', star_star,
      neg_mul, mul_neg, neg_neg, add_re, add_im, smul_eq_mul,
      mul_one, mul_zero] <;>
    ring

-- crux 2: b*a formula (the hard mixed product) — lies in span{1,a,b,ab}
theorem ba_formula (a b : O ℚ) :
    b * a = (2 * reQ (a * b) - 4 * reQ a * reQ b) • (1 : O ℚ)
      + (2 * reQ b) • a + (2 * reQ a) • b - a * b := by
  rw [sub_eq_add_neg]
  unfold reQ
  ext <;>
    simp only [cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
      mul_re, mul_im, star_re, star_im,
      one_re, one_im, star_neg, neg_re, neg_im, star_add, star_mul', star_star,
      neg_mul, mul_neg, neg_neg, add_re, add_im, smul_eq_mul,
      mul_one, mul_zero] <;>
    ring

#print axioms quad_rel
#print axioms ba_formula

end Phys.Algebra
