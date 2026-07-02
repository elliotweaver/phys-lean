import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- ============================================================
-- N211: THE CALIBRATION CONTRACTION IDENTITY
-- coassoc4 x y z w = 2*gForm(octCross x y)(octCross z w) - 2*(g(x,z)*g(y,w) - g(x,w)*g(y,z))
-- for imaginary x,y,z,w
-- ============================================================

-- Test 1: reQ_assoc_cyclic via direct coordinate ring (same approach as assoc_reQ_skew)
set_option maxRecDepth 100000 in
set_option maxHeartbeats 400000 in
theorem reQ_assoc_cyclic (x y z w : O ℚ) :
    reQ (assoc x y z * w) + reQ (x * assoc y z w) = 0 := by
  unfold assoc
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra
