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

theorem quad_rel (a : O ℚ) :
    a * a = (2 * reQ a) • a - (reQ (a * star a)) • (1 : O ℚ) := by
  rw [sub_eq_add_neg]
  unfold reQ
  ext
  case a.a.a =>
    simp only [cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im,
      mul_re, mul_im, star_re, star_im,
      one_re, one_im, star_neg, neg_re, neg_im, star_add, star_mul', star_star,
      neg_mul, mul_neg, neg_neg, add_re, add_im, smul_eq_mul,
      mul_one, mul_zero]
    sorry
  all_goals sorry

end Phys.Algebra
