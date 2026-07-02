import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

theorem gForm_xy_one (x y : O ℚ) (hy : y ∈ ImO) :
    gForm (x * y) (1 : O ℚ) = - gForm x y := by
  rw [gForm_one_right]; exact octMul_re_eq_neg_gForm hy

theorem gForm_one_zw (z w : O ℚ) (hw : w ∈ ImO) :
    gForm (1 : O ℚ) (z * w) = - gForm z w := by
  show reQ (1 * star (z * w)) = - reQ (z * star w)
  rw [one_mul, reQ_star]; exact octMul_re_eq_neg_gForm hw

theorem gForm_octCross_octCross {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    gForm (octCross x y) (octCross z w) = gForm (x * y) (z * w) - gForm x y * gForm z w := by
  unfold octCross
  simp only [gForm_add_left, gForm_add_right, gForm_smul_left, gForm_smul_right]
  rw [gForm_xy_one x y hy, gForm_one_zw z w hw, gForm_one_one]
  ring

-- The cyclic trace-associator identity: reQ(assoc x y z * w) = -reQ(x * assoc y z w)
-- Proved via trace associativity (reQ_mul_assoc3) applied to 3-fold products.
theorem reQ_assoc_cyclic (x y z w : O ℚ) :
    reQ (assoc x y z * w) = - reQ (x * assoc y z w) := by
  unfold assoc
  -- ((x*y)*z - x*(y*z)) * w = ((x*y)*z)*w - (x*(y*z))*w  [sub_mul]
  rw [sub_mul, sub_eq_add_neg, reQ_add, reQ_neg]
  -- LHS = reQ(((x*y)*z)*w) - reQ((x*(y*z))*w)
  -- RHS = -(reQ(x*(y*z)*w) - reQ(x*(y*(z*w))))
  rw [reQ_mul_assoc3 (x * y) z w, reQ_mul_assoc3 x y (z * w),
      reQ_mul_assoc3 x (y * z) w]
  -- reQ(x*(y*(z*w))) - reQ(x*((y*z)*w)) = -(reQ(x*((y*z)*w)) - reQ(x*(y*(z*w))))
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

-- Main contraction identity
set_option maxRecDepth 200000 in
set_option maxHeartbeats 2000000 in
theorem coassoc4_contraction_probe {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  rw [gForm_octCross_octCross hx hy hz hw]
  rw [show coassoc4 x y z w = gForm (assoc x y z) w from rfl]
  have h1 : gForm (assoc x y z) w = - reQ (assoc x y z * w) :=
    coassoc4_eq_neg_reQ hw _ _ _
  have h2 : gForm (x * y) (z * w) = reQ ((x * y) * (w * z)) := by
    show reQ ((x * y) * star (z * w)) = reQ ((x * y) * (w * z))
    rw [star_mul, show star w = -w from (mem_ImO).mp hw,
        show star z = -z from (mem_ImO).mp hz, mul_neg, neg_mul, neg_neg]
  have h3 : gForm x y = - reQ (x * y) := by
    show reQ (x * star y) = - reQ (x * y)
    rw [show star y = -y from (mem_ImO).mp hy, mul_neg, reQ_neg]
  have h4 : gForm z w = - reQ (z * w) := by
    show reQ (z * star w) = - reQ (z * w)
    rw [show star w = -w from (mem_ImO).mp hw, mul_neg, reQ_neg]
  have h5 : gForm x z = - reQ (x * z) := by
    show reQ (x * star z) = - reQ (x * z)
    rw [show star z = -z from (mem_ImO).mp hz, mul_neg, reQ_neg]
  have h6 : gForm y w = - reQ (y * w) := by
    show reQ (y * star w) = - reQ (y * w)
    rw [show star w = -w from (mem_ImO).mp hw, mul_neg, reQ_neg]
  have h7 : gForm x w = - reQ (x * w) := by
    show reQ (x * star w) = - reQ (x * w)
    rw [show star w = -w from (mem_ImO).mp hw, mul_neg, reQ_neg]
  have h8 : gForm y z = - reQ (y * z) := by
    show reQ (y * star z) = - reQ (y * z)
    rw [show star z = -z from (mem_ImO).mp hz, mul_neg, reQ_neg]
  rw [h1, h2, h3, h4, h5, h6, h7, h8, reQ_assoc_cyclic x y z w]
  rw [show reQ ((x * y) * (w * z)) = reQ (x * (y * (w * z))) from reQ_mul_assoc3 x y (w * z)]
  unfold assoc
  -- x * ((y*z)*w - y*(z*w)) = x*(y*z)*w - x*(y*(z*w))  [mul_sub]
  rw [mul_sub, sub_eq_add_neg, reQ_add, reQ_neg]
  rw [reQ_mul_assoc3 x (y * z) w]
  -- Now: reQ(x*((y*z)*w)) - reQ(x*(y*(z*w))) = 2*reQ(x*(y*(w*z))) - 2*reQ(x*y)*reQ(z*w) - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra