import Phys.Algebra.OctonionCrossProduct
import Phys.Algebra.OctonionCrossProductContraction

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! ## MEASURE-FIRST probes for N209: the calibration 3-form cyclic lever. -/

-- P1: trace cyclicity reQ(a*b)=reQ(b*a) for ALL a b — coordinate route.
theorem reQ_mul_comm (a b : O ℚ) : reQ (a * b) = reQ (b * a) := by
  simp only [reQ, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

-- P2: trace associativity reQ((a*b)*c)=reQ(a*(b*c)) for ALL a b c — coordinate route.
theorem reQ_mul_assoc (a b c : O ℚ) : reQ ((a * b) * c) = reQ (a * (b * c)) := by
  simp only [reQ, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

#print axioms reQ_mul_comm
#print axioms reQ_mul_assoc

end
end Phys.Algebra
