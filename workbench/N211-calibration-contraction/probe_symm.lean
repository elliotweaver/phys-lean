import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- reQ_four_symm
set_option maxRecDepth 100000 in
set_option maxHeartbeats 400000 in
theorem reQ_four_symm {x y z w : O ℚ}
    (_hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    reQ (x * (y * (z * w))) + reQ (x * (y * (w * z))) =
      2 * gForm x y * gForm z w := by
  have hsymm : z * w + w * z = (-(2 * gForm z w)) • (1 : O ℚ) := octMul_symm_eq hz hw
  -- y*(z*w) + y*(w*z) = y*(z*w + w*z) = -(2*g(z,w))•y
  have h1 : y * (z * w) + y * (w * z) = (-(2 * gForm z w)) • y := by
    rw [← mul_add, hsymm, qsmul_mul_right, mul_one]
  -- x*(y*(z*w)) + x*(y*(w*z)) = x*(y*(z*w) + y*(w*z)) = x*(-(2*g(z,w))•y) = -(2*g(z,w))•(x*y)
  have h2 : x * (y * (z * w)) + x * (y * (w * z)) = (-(2 * gForm z w)) • (x * y) := by
    rw [← mul_add, h1, qsmul_mul_right]
  rw [← reQ_add, h2, reQ_smul, reQ_neg, octMul_re_eq_neg_gForm hy]
  ring

end
end Phys.Algebra
