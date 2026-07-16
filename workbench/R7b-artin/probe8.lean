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

macro "obash" : tactic =>
  `(tactic| (rw [sub_eq_add_neg] <;> try skip) )

-- generic bash: rewrite subtractions then coordinate-expand
macro "obashcore" : tactic =>
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

-- a*(a*b) explicit
theorem a_ab (a b : O ℚ) :
    a * (a * b) = (2 * reQ a) • (a * b) - (reQ (a * star a)) • b := by
  rw [sub_eq_add_neg]; unfold reQ; obashcore

-- (a*b)*b explicit
theorem ab_b (a b : O ℚ) :
    (a * b) * b = (2 * reQ b) • (a * b) - (reQ (b * star b)) • a := by
  rw [sub_eq_add_neg]; unfold reQ; obashcore

-- (a*b)*a explicit
theorem ab_a (a b : O ℚ) :
    (a * b) * a = (2 * reQ (a * b)) • a - (2 * reQ b * reQ (a * star a)) • (1 : O ℚ)
      + (reQ (a * star a)) • b := by
  rw [sub_eq_add_neg]; unfold reQ; obashcore

-- b*(a*b) explicit
theorem b_ab (a b : O ℚ) :
    b * (a * b) = (2 * reQ (a * b)) • b - (2 * reQ a * reQ (b * star b)) • (1 : O ℚ)
      + (reQ (b * star b)) • a := by
  rw [sub_eq_add_neg]; unfold reQ; obashcore

#print axioms a_ab
#print axioms ab_b
#print axioms ab_a
#print axioms b_ab

end Phys.Algebra
