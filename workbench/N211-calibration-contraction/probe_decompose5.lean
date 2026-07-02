import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- reQ_four_symm: reQ(x*(y*(z*w))) + reQ(x*(y*(w*z))) = 2*g(x,y)*g(z,w)
-- z*w + w*z = -(2*g(z,w))•1
-- y*(z*w + w*z) = -(2*g(z,w))•y  [qsmul_mul_right + mul_one]
-- x*(y*(z*w) + y*(w*z)) = x*(y*(z*w+w*z)) = x*(-(2*g(z,w))•y) = -(2*g(z,w))•(x*y)  [qsmul_mul_right]
-- reQ(-(2*g(z,w))•(x*y)) = -(2*g(z,w))*reQ(x*y) = 2*g(x,y)*g(z,w)  [reQ_smul, reQ_neg, octMul_re_eq_neg_gForm]
set_option maxRecDepth 100000 in
set_option maxHeartbeats 400000 in
theorem reQ_four_symm {x y z w : O ℚ}
    (_hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    reQ (x * (y * (z * w))) + reQ (x * (y * (w * z))) =
      2 * gForm x y * gForm z w := by
  have hsymm : z * w + w * z = (-(2 * gForm z w)) • (1 : O ℚ) := octMul_symm_eq hz hw
  have h1 : y * (z * w + w * z) = (-(2 * gForm z w)) • y := by
    rw [hsymm, qsmul_mul_right, mul_one]
  -- y*(z*w) + y*(w*z) = y*(z*w + w*z) = -(2*g(z,w))•y
  -- x*(y*(z*w)) + x*(y*(w*z)) = x*(y*(z*w) + y*(w*z)) = x*(y*(z*w+w*z))
  have h2 : x * (y * (z * w)) + x * (y * (w * z)) = (-(2 * gForm z w)) • (x * y) := by
    rw [← mul_add, h1, qsmul_mul_right]
  rw [← reQ_add, h2]
  rw [reQ_smul, reQ_neg, octMul_re_eq_neg_gForm hy]
  ring

-- reQ_four_key: still too large for ring. Let me try a DIFFERENT decomposition.
-- The identity: reQ(x*((y*z)*w)) + reQ(x*(y*(z*w))) = 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)
--
-- Note: reQ(x*((y*z)*w)) = reQ((x*(y*z))*w) is NOT generally true (the grouping matters for 4-fold).
-- But reQ_mul_assoc3 gives reQ((a*b)*c) = reQ(a*(b*c)) for 3-fold.
-- reQ((x*(y*z))*w) = reQ(x*((y*z)*w))  [reQ_mul_assoc3 with a=x, b=y*z, c=w]
-- So reQ(x*((y*z)*w)) = reQ((x*(y*z))*w).
-- And reQ_mul_assoc3 with a=x*y, b=z, c=w: reQ(((x*y)*z)*w) = reQ((x*y)*(z*w))
-- And reQ_mul_assoc3 with a=x, b=y, c=z*w: reQ((x*y)*(z*w)) = reQ(x*(y*(z*w)))
-- So reQ(((x*y)*z)*w) = reQ(x*(y*(z*w)))
-- But reQ(x*((y*z)*w)) ≠ reQ(((x*y)*z)*w) in general (different grouping of 4-fold).
--
-- Let me try yet another approach: prove reQ_four_key as a SUM of two identities:
-- (1) reQ(x*((y*z)*w)) + reQ(x*(y*(w*z))) = ?  (swap z,w in the second term)
-- (2) reQ(x*(y*(z*w))) - reQ(x*(y*(w*z))) = ?  (difference)
--
-- Or: use reQ_mul_comm to swap the outermost pair.
-- reQ(x*(y*(z*w))) = reQ((y*(z*w))*x)  [reQ_mul_comm]
-- = reQ(y*((z*w)*x))  [reQ_mul_assoc3]
-- = reQ(y*(z*(w*x)))  [reQ_mul_assoc3]
-- Hmm, this generates many terms.
--
-- Let me try the SIMPLEST possible approach: test whether reQ_four_key is even TRUE
-- by checking it on specific witnesses.

set_option maxHeartbeats 400000 in
theorem test_reQ_four_key_witness :
    reQ (u1 * ((u2 * u1) * u2)) + reQ (u1 * (u2 * (u1 * u2))) =
      2 * gForm u1 u2 * gForm u1 u2 - 2 * gForm u1 u1 * gForm u2 u2 + 2 * gForm u1 u2 * gForm u2 u1 := by
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im',
    u1, u2, CD.iota, CD.e2, ιJ, Dbl.J,
    star_zero, star_one, mul_zero, zero_mul, mul_one, one_mul, add_zero, zero_add, neg_zero, neg_neg]
  norm_num

end
end Phys.Algebra
