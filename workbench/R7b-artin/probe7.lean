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
set_option linter.unusedSimpArgs false

/-- Master coordinate-bash simp set for octonion identities.  -/
macro "obash" : tactic =>
  `(tactic| (ext <;>
    simp only [cd_qsmul_re, cd_qsmul_im,
      Dbl.smul_re, Dbl.smul_im, Dbl.mul_re, Dbl.mul_im,
      Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im,
      Dbl.one_re, Dbl.one_im, Dbl.zero_re, Dbl.zero_im,
      Dbl.star_re', Dbl.star_im',
      mul_re, mul_im, star_re, star_im, zero_re, zero_im,
      one_re, one_im, star_neg, neg_re, neg_im, star_add, star_mul', star_star,
      neg_mul, mul_neg, neg_neg, add_re, add_im, smul_eq_mul,
      mul_one, mul_zero] <;> ring))

-- squares: quad_rel
theorem quad_rel (a : O ℚ) :
    a * a = (2 * reQ a) • a - (reQ (a * star a)) • (1 : O ℚ) := by
  rw [sub_eq_add_neg]; unfold reQ; obash

-- mixed b*a
theorem ba_formula (a b : O ℚ) :
    b * a = (2 * reQ (a * b) - 4 * reQ a * reQ b) • (1 : O ℚ)
      + (2 * reQ b) • a + (2 * reQ a) • b - a * b := by
  rw [sub_eq_add_neg]; unfold reQ; obash

#print axioms quad_rel
#print axioms ba_formula

end Phys.Algebra
