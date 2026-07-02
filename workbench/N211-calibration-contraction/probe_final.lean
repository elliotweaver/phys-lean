import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- Sub-lemma: gForm(x*y)(1) = -gForm(x,y) for imaginary y
theorem gForm_xy_one {x y : O ℚ} (hy : y ∈ ImO) :
    gForm (x * y) (1 : O ℚ) = - gForm x y := by
  rw [gForm_one_right]
  exact octMul_re_eq_neg_gForm hy

-- Sub-lemma: gForm(1)(z*w) = -gForm(z,w) for imaginary w
-- gForm 1 (z*w) = reQ(1 * star(z*w)) = reQ(star(z*w)) = reQ(z*w) (reQ_star)
-- = -gForm(z,w) for imaginary w
theorem gForm_one_zw {z w : O ℚ} (hw : w ∈ ImO) :
    gForm (1 : O ℚ) (z * w) = - gForm z w := by
  show reQ (1 * star (z * w)) = - reQ (z * star w)
  rw [one_mul, reQ_star]
  exact octMul_re_eq_neg_gForm hw

-- Main sub-lemma: gForm(octCross x y)(octCross z w) = gForm(x*y)(z*w) - gForm(x,y)*gForm(z,w)
-- for imaginary x,y,z,w
set_option maxRecDepth 100000 in
set_option maxHeartbeats 400000 in
theorem gForm_octCross_octCross {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    gForm (octCross x y) (octCross z w) = gForm (x * y) (z * w) - gForm x y * gForm z w := by
  unfold octCross
  rw [gForm_add_left, gForm_add_right, gForm_smul_left, gForm_smul_right,
      gForm_smul_left, gForm_smul_right]
  rw [gForm_xy_one hy, gForm_one_zw hw, gForm_one_one, gForm_one_right]
  ring

-- Main identity via structural conversion to reQ
set_option maxRecDepth 200000 in
set_option maxHeartbeats 2000000 in
theorem coassoc4_contraction_probe {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  -- Apply the sub-lemma
  rw [gForm_octCross_octCross hx hy hz hw]
  -- Now: gForm(assoc x y z) w = 2*(gForm(x*y)(z*w) - g(x,y)*g(z,w)) - 2*(g(x,z)*g(y,w) - g(x,w)*g(y,z))
  -- Convert gForm(a,b) to reQ for imaginary arguments
  -- gForm(assoc x y z) w = -reQ(assoc x y z * w) (imaginary w, coassoc4_eq_neg_reQ)
  -- gForm(x*y)(z*w) = reQ((x*y)*(w*z)) (imaginary z,w: star(z*w)=star(w)*star(z)=(-w)*(-z)=w*z)
  -- gForm(x,y) = -reQ(x*y) (imaginary y)
  -- gForm(z,w) = -reQ(z*w) (imaginary w)
  -- gForm(x,z) = -reQ(x*z) (imaginary z)
  -- gForm(y,w) = -reQ(y*w) (imaginary w)
  -- gForm(x,w) = -reQ(x*w) (imaginary w)
  -- gForm(y,z) = -reQ(y*z) (imaginary z)
  rw [show coassoc4 x y z w = gForm (assoc x y z) w from rfl]
  have h1 : gForm (assoc x y z) w = - reQ (assoc x y z * w) :=
    coassoc4_eq_neg_reQ hw _ _ _
  -- gForm (x * y) (z * w) = reQ((x*y) * (w*z))
  have h2 : gForm (x * y) (z * w) = reQ ((x * y) * (w * z)) := by
    show reQ ((x * y) * star (z * w)) = reQ ((x * y) * (w * z))
    rw [star_mul]
    rw [show star w = -w from (mem_ImO).mp hw]
    rw [show star z = -z from (mem_ImO).mp hz]
    rw [mul_neg, neg_mul, neg_neg]
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
  rw [h1, h2, h3, h4, h5, h6, h7, h8]
  unfold assoc
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra