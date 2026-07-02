import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- PROBE: Break the proof into structural sub-lemmas.
-- Sub-lemma 1: gForm(octCross x y)(octCross z w) = gForm(x*y)(z*w) - gForm(x,y)*gForm(z,w)
--   for imaginary x,y,z,w. Uses gForm bilinearity + orthogonality.

-- First, let me establish the key identities:
-- For imaginary y: reQ(x*y) = -gForm x y (octMul_re_eq_neg_gForm from N206)
-- For imaginary u: gForm u 1 = 0 (gForm_ImO_one from N206) and gForm 1 u = 0 (by symmetry)
-- gForm 1 1 = 1 (gForm_one_one from N206)

-- Sub-lemma: gForm(x*y)(1) = reQ(x*y) = -gForm(x,y) for imaginary y
theorem gForm_xy_one {x y : O ℚ} (hy : y ∈ ImO) :
    gForm (x * y) (1 : O ℚ) = - gForm x y := by
  rw [gForm_one_right]
  exact octMul_re_eq_neg_gForm hy

-- Sub-lemma: gForm(1)(z*w) = -gForm(z,w) for imaginary w
-- gForm 1 (z*w) = reQ(1 * star(z*w)) = reQ(star(z*w)) = reQ(z*w) (reQ self-conjugate)
-- = -gForm(z,w) for imaginary w
theorem reQ_star {a : O ℚ} : reQ (star a) = reQ a := by
  simp only [reQ, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']

theorem gForm_one_zw {z w : O ℚ} (hw : w ∈ ImO) :
    gForm (1 : O ℚ) (z * w) = - gForm z w := by
  show reQ (1 * star (z * w)) = - reQ (z * star w)
  rw [one_mul, star_mul, reQ_star, reQ_star]
  exact octMul_re_eq_neg_gForm hw

-- Now the main sub-lemma: gForm(octCross x y)(octCross z w) for imaginary x,y,z,w
-- octCross x y = x*y + gForm(x,y)*1
-- octCross z w = z*w + gForm(z,w)*1
-- gForm(x*y + g(x,y)*1)(z*w + g(z,w)*1)
-- = gForm(x*y)(z*w) + g(z,w)*gForm(x*y)(1) + g(x,y)*gForm(1)(z*w) + g(x,y)*g(z,w)*gForm(1)(1)
-- = gForm(x*y)(z*w) + g(z,w)*(-g(x,y)) + g(x,y)*(-g(z,w)) + g(x,y)*g(z,w)*1
-- = gForm(x*y)(z*w) - g(x,y)*g(z,w)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 400000 in
theorem gForm_octCross_octCross {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    gForm (octCross x y) (octCross z w) = gForm (x * y) (z * w) - gForm x y * gForm z w := by
  unfold octCross
  rw [gForm_add_left, gForm_add_right, gForm_smul_left, gForm_smul_right,
      gForm_smul_left, gForm_smul_right]
  -- gForm(x*y)(z*w) + g(z,w)*gForm(x*y)(1) + g(x,y)*gForm(1)(z*w) + g(x,y)*g(z,w)*gForm(1)(1)
  rw [gForm_xy_one hy, gForm_one_zw hw, gForm_one_one]
  -- = gForm(x*y)(z*w) + g(z,w)*(-g(x,y)) + g(x,y)*(-g(z,w)) + g(x,y)*g(z,w)*1
  ring

-- Now the main identity:
-- coassoc4 x y z w = 2*(gForm(x*y)(z*w) - g(x,y)*g(z,w)) - 2*(g(x,z)*g(y,w) - g(x,w)*g(y,z))
-- LHS = gForm(assoc x y z) w = gForm((x*y)*z - x*(y*z)) w
-- = gForm((x*y)*z) w - gForm(x*(y*z)) w
-- For imaginary w: gForm a w = -reQ(a*w)
-- So LHS = -reQ((x*y)*z*w) + reQ(x*(y*z)*w)
-- And gForm(x*y)(z*w) = reQ((x*y)*star(z*w)) = reQ((x*y)*(w*z)) for imaginary z,w
-- g(x,y) = -reQ(x*y) for imaginary y
-- g(x,z) = -reQ(x*z), g(y,w) = -reQ(y*w), g(x,w) = -reQ(x*w), g(y,z) = -reQ(y*z)

-- So the identity in reQ form:
-- -reQ((x*y)*z*w) + reQ(x*(y*z)*w) = 2*reQ((x*y)*(w*z)) - 2*reQ(x*y)*reQ(z*w)
--   - 2*(reQ(x*z)*reQ(y*w) - reQ(x*w)*reQ(y*z))

-- This is still a degree-4 coordinate identity. Let me try to prove it with ring
-- but on a SMALLER expression by splitting into two sub-lemmas.

-- Sub-lemma A: reQ(assoc x y z * w) = 2*reQ((x*y)*(w*z)) - 2*reQ((x*y)*z*w) ... 
-- Actually, let me try the full coordinate ring on this smaller form

set_option maxRecDepth 200000 in
set_option maxHeartbeats 2000000 in
theorem coassoc4_contraction_main {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  rw [show coassoc4 x y z w = gForm (assoc x y z) w from rfl]
  -- Use the sub-lemma to rewrite the RHS
  rw [gForm_octCross_octCross hx hy hz hw]
  -- Now: gForm(assoc x y z) w = 2*(gForm(x*y)(z*w) - g(x,y)*g(z,w)) - 2*(g(x,z)*g(y,w) - g(x,w)*g(y,z))
  -- Convert everything to reQ for imaginary arguments
  have h1 : gForm (assoc x y z) w = - reQ (assoc x y z * w) := coassoc4_eq_neg_reQ hw _ _ _
  have h2 : gForm (x * y) (z * w) = reQ ((x * y) * (w * z)) := by
    show reQ ((x * y) * star (z * w)) = reQ ((x * y) * (w * z))
    rw [star_mul]
    have hsz : star z = -z := (mem_ImO).mp hz
    have hsw : star w = -w := (mem_ImO).mp hw
    rw [hsz, hsw, mul_neg, neg_mul, neg_neg]
  have h3 : gForm x y = - reQ (x * y) := by
    show reQ (x * star y) = - reQ (x * y)
    rw [(mem_ImO).mp hy, mul_neg, reQ_neg]
  have h4 : gForm z w = - reQ (z * w) := by
    show reQ (z * star w) = - reQ (z * w)
    rw [(mem_ImO).mp hw, mul_neg, reQ_neg]
  have h5 : gForm x z = - reQ (x * z) := by
    show reQ (x * star z) = - reQ (x * z)
    rw [(mem_ImO).mp hz, mul_neg, reQ_neg]
  have h6 : gForm y w = - reQ (y * w) := by
    show reQ (y * star w) = - reQ (y * w)
    rw [(mem_ImO).mp hw, mul_neg, reQ_neg]
  have h7 : gForm x w = - reQ (x * w) := by
    show reQ (x * star w) = - reQ (x * w)
    rw [(mem_ImO).mp hw, mul_neg, reQ_neg]
  have h8 : gForm y z = - reQ (y * z) := by
    show reQ (y * star z) = - reQ (y * z)
    rw [(mem_ImO).mp hz, mul_neg, reQ_neg]
  rw [h1, h2, h3, h4, h5, h6, h7, h8]
  unfold assoc
  -- Now everything is in reQ of products of x,y,z,w (no star, no gForm)
  -- -reQ(((x*y)*z - x*(y*z))*w) = 2*reQ((x*y)*(w*z)) - 2*reQ(x*y)*reQ(z*w) + 2*reQ(x*y)*reQ(z*w) ...
  -- wait, let me expand the RHS carefully
  -- 2*(reQ((x*y)*(w*z)) - (-reQ(x*y))*(-reQ(z*w))) - 2*((-reQ(x*z))*(-reQ(y*w)) - (-reQ(x*w))*(-reQ(y*z)))
  -- = 2*reQ((x*y)*(w*z)) - 2*reQ(x*y)*reQ(z*w) - 2*(reQ(x*z)*reQ(y*w) - reQ(x*w)*reQ(y*z))
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra