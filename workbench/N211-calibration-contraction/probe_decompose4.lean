import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- ============================================================
-- Sub-lemmas for the contraction identity
-- ============================================================

theorem gForm_xy_one (x y : O ℚ) (hy : y ∈ ImO) :
    gForm (x * y) (1 : O ℚ) = - gForm x y := by
  rw [gForm_one_right]; exact octMul_re_eq_neg_gForm hy

theorem gForm_one_zw (z w : O ℚ) (hw : w ∈ ImO) :
    gForm (1 : O ℚ) (z * w) = - gForm z w := by
  show reQ (1 * star (z * w)) = - reQ (z * star w)
  rw [one_mul, reQ_star]; exact octMul_re_eq_neg_gForm hw

theorem gForm_octCross_octCross {x y z w : O ℚ}
    (_hx : x ∈ ImO) (hy : y ∈ ImO) (_hz : z ∈ ImO) (hw : w ∈ ImO) :
    gForm (octCross x y) (octCross z w) = gForm (x * y) (z * w) - gForm x y * gForm z w := by
  unfold octCross
  simp only [gForm_add_left, gForm_add_right, gForm_smul_left, gForm_smul_right]
  rw [gForm_xy_one x y hy, gForm_one_zw z w hw, gForm_one_one]
  ring

-- Cyclic trace-associator: reQ(assoc x y z * w) + reQ(x * assoc y z w) = 0
set_option maxRecDepth 100000 in
set_option maxHeartbeats 400000 in
theorem reQ_assoc_cyclic (x y z w : O ℚ) :
    reQ (assoc x y z * w) + reQ (x * assoc y z w) = 0 := by
  unfold assoc
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

-- Symmetry: reQ(x*(y*(z*w))) + reQ(x*(y*(w*z))) = 2*g(x,y)*g(z,w) for imaginary
-- z*w + w*z = -(2*g(z,w))•1, so y*(z*w + w*z) = y*(-(2*g(z,w))•1) = -(2*g(z,w))•(y*1) = -(2*g(z,w))•y
-- x*(y*(z*w + w*z)) = x*(-(2*g(z,w))•y) = -(2*g(z,w))•(x*y)
-- reQ(-(2*g(z,w))•(x*y)) = -(2*g(z,w))*reQ(x*y) = -(2*g(z,w))*(-g(x,y)) = 2*g(x,y)*g(z,w)
set_option maxRecDepth 100000 in
set_option maxHeartbeats 400000 in
theorem reQ_four_symm {x y z w : O ℚ}
    (_hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    reQ (x * (y * (z * w))) + reQ (x * (y * (w * z))) =
      2 * gForm x y * gForm z w := by
  have hsymm : z * w + w * z = (-(2 * gForm z w)) • (1 : O ℚ) := octMul_symm_eq hz hw
  -- y*(z*w + w*z) = y * (-(2*g(z,w))•1) = -(2*g(z,w))•y  [via qsmul_mul_right + mul_one]
  have h1 : y * (z * w + w * z) = (-(2 * gForm z w)) • y := by
    rw [hsymm, qsmul_mul_right, mul_one]
  -- x*(y*(z*w + w*z)) = x*(-(2*g(z,w))•y) = -(2*g(z,w))•(x*y)  [via qsmul_mul_right]
  have h2 : x * (y * (z * w + w * z)) = (-(2 * gForm z w)) • (x * y) := by
    rw [h1, qsmul_mul_right]
  -- LHS = reQ(x*(y*(z*w)) + x*(y*(w*z))) = reQ(x*(y*(z*w + w*z)))  [via mul_add]
  rw [← reQ_add, ← mul_add, h2]
  -- reQ(-(2*g(z,w))•(x*y)) = -(2*g(z,w)) * reQ(x*y)
  rw [reQ_smul, reQ_neg, octMul_re_eq_neg_gForm hy]
  ring

-- Key degree-4 identity: reQ(x*((y*z)*w)) + reQ(x*(y*(z*w))) = 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)
-- for imaginary x,y,z,w.
set_option maxRecDepth 200000 in
set_option maxHeartbeats 2000000 in
theorem reQ_four_key {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    reQ (x * ((y * z) * w)) + reQ (x * (y * (z * w))) =
      2 * gForm x y * gForm z w - 2 * gForm x z * gForm y w + 2 * gForm x w * gForm y z := by
  unfold gForm
  have hsy : star y = -y := (mem_ImO).mp hy
  have hsz : star z = -z := (mem_ImO).mp hz
  have hsw : star w = -w := (mem_ImO).mp hw
  rw [hsy, hsz, hsw]
  simp only [mul_neg, reQ_neg, neg_mul]
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra
