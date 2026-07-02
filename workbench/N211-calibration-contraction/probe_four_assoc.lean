import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- Test: is reQ(x*((y*z)*w)) = reQ(x*(y*(z*w))) TRUE?
set_option maxRecDepth 100000 in
set_option maxHeartbeats 400000 in
theorem reQ_four_assoc_test (x y z w : O ℚ) :
    reQ (x * ((y * z) * w)) = reQ (x * (y * (z * w))) := by
  simp only [reQ, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra
