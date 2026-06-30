import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.Alternative

namespace Phys.Algebra.N210Probe

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- THE (z,w)-EXCHANGE LEVER, coordinate-ring brute, ALL elements (measure truth + cost).
-- assoc x y z = (x*y)*z − x*(y*z) (banked Alternative.lean).
set_option maxHeartbeats 400000 in
theorem zw_lever_allcoord (x y z w : O ℚ) :
    reQ (((x*y)*z - x*(y*z)) * w) + reQ (((x*y)*w - x*(y*w)) * z) = 0 := by
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end

#print axioms zw_lever_allcoord

end Phys.Algebra.N210Probe
