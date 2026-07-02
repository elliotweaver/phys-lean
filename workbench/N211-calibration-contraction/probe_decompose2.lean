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

-- Sub-lemma: gForm(x*y)(1) = -gForm(x,y) for imaginary y
theorem gForm_xy_one (x y : O ℚ) (hy : y ∈ ImO) :
    gForm (x * y) (1 : O ℚ) = - gForm x y := by
  rw [gForm_one_right]; exact octMul_re_eq_neg_gForm hy

-- Sub-lemma: gForm(1)(z*w) = -gForm(z,w) for imaginary w
theorem gForm_one_zw (z w : O ℚ) (hw : w ∈ ImO) :
    gForm (1 : O ℚ) (z * w) = - gForm z w := by
  show reQ (1 * star (z * w)) = - reQ (z * star w)
  rw [one_mul, reQ_star]; exact octMul_re_eq_neg_gForm hw

-- Sub-lemma C: gForm(octCross x y)(octCross z w) = gForm(x*y)(z*w) - gForm(x,y)*gForm(z,w)
theorem gForm_octCross_octCross {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (_hz : z ∈ ImO) (hw : w ∈ ImO) :
    gForm (octCross x y) (octCross z w) = gForm (x * y) (z * w) - gForm x y * gForm z w := by
  unfold octCross
  simp only [gForm_add_left, gForm_add_right, gForm_smul_left, gForm_smul_right]
  rw [gForm_xy_one x y hy, gForm_one_zw z w hw, gForm_one_one]
  ring

-- Sub-lemma: the cyclic trace-associator identity
set_option maxRecDepth 100000 in
set_option maxHeartbeats 400000 in
theorem reQ_assoc_cyclic (x y z w : O ℚ) :
    reQ (assoc x y z * w) + reQ (x * assoc y z w) = 0 := by
  unfold assoc
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

-- Sub-lemma: z*w + w*z = -(2*gForm z w)•1 for imaginary z,w (this IS octMul_symm_eq)
-- We need: reQ(x*(y*(z*w))) + reQ(x*(y*(w*z))) = reQ(x*(y*((z*w)+(w*z))))
-- = reQ(x*(y*(-(2*gForm z w)•1)))  [via octMul_symm_eq]
-- = -(2*gForm z w) * reQ(x*y)  [bilinearity + reQ(x*y*1) = reQ(x*y)]
-- = -(2*gForm z w) * (-gForm x y)  [octMul_re_eq_neg_gForm for imaginary y]
-- = 2*gForm x y * gForm z w

-- Sub-lemma D: reQ(x*(y*(z*w))) + reQ(x*(y*(w*z))) = 2*gForm(x,y)*gForm(z,w)
-- for imaginary x,y,z,w. PROVED STRUCTURALLY via octMul_symm_eq.
set_option maxRecDepth 100000 in
set_option maxHeartbeats 400000 in
theorem reQ_four_symm {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    reQ (x * (y * (z * w))) + reQ (x * (y * (w * z))) =
      2 * gForm x y * gForm z w := by
  -- z*w + w*z = -(2*gForm z w)•1
  have hsymm : z * w + w * z = (-(2 * gForm z w)) • (1 : O ℚ) := octMul_symm_eq hz hw
  -- x*(y*((z*w)+(w*z))) = x*(y*(-(2*gForm z w)•1))
  -- = -(2*gForm z w) • x*(y*1) = -(2*gForm z w) • x*y
  have : x * (y * (z * w + w * z)) = (-(2 * gForm z w)) • (x * y) := by
    rw [hsymm, smul_mul, smul_mul, mul_one]
  -- reQ(x*(y*(z*w))) + reQ(x*(y*(w*z))) = reQ(x*(y*(z*w + w*z)))  [additivity]
  rw [← reQ_add, this]
  -- reQ(-(2*gForm z w) • (x*y)) = -(2*gForm z w) * reQ(x*y) = -(2*gForm z w)*(-gForm x y) = 2*gForm x y*gForm z w
  rw [reQ_smul, reQ_neg, octMul_re_eq_neg_gForm hy]
  ring

-- Now: the contraction identity, using the decomposition:
-- LHS = coassoc4 = -reQ(assoc x y z * w) = reQ(x * assoc y z w)  [cyclic]
-- = reQ(x*((y*z)*w)) - reQ(x*(y*(z*w)))
-- RHS = 2*(gForm(x*y)(z*w) - g(x,y)*g(z,w)) - 2*(g(x,z)*g(y,w) - g(x,w)*g(y,z))
-- = 2*gForm(x*y)(z*w) - 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)
--
-- Convert gForm(x*y)(z*w) to reQ: for imaginary z,w, star(z*w) = w*z, so
-- gForm(x*y)(z*w) = reQ((x*y)*(w*z)) = reQ((x*y)*(w*z))
-- Using reQ_mul_assoc3: reQ((x*y)*(w*z)) = reQ(x*(y*(w*z)))
--
-- So RHS = 2*reQ(x*(y*(w*z))) - 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)
--
-- And LHS = reQ(x*((y*z)*w)) - reQ(x*(y*(z*w)))
--
-- Via reQ_four_symm: reQ(x*(y*(z*w))) + reQ(x*(y*(w*z))) = 2*g(x,y)*g(z,w)
-- So reQ(x*(y*(w*z))) = 2*g(x,y)*g(z,w) - reQ(x*(y*(z*w)))
--
-- Substituting into RHS:
-- RHS = 2*(2*g(x,y)*g(z,w) - reQ(x*(y*(z*w)))) - 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)
-- = 4*g(x,y)*g(z,w) - 2*reQ(x*(y*(z*w))) - 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)
-- = 2*g(x,y)*g(z,w) - 2*reQ(x*(y*(z*w))) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)
--
-- So: LHS = RHS becomes:
-- reQ(x*((y*z)*w)) - reQ(x*(y*(z*w))) = 2*g(x,y)*g(z,w) - 2*reQ(x*(y*(z*w))) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)
-- i.e. reQ(x*((y*z)*w)) + reQ(x*(y*(z*w))) = 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)
--
-- Hmm, but reQ(x*((y*z)*w)) is NOT the same as reQ(x*(y*(z*w))) (we proved reQ_four_assoc is FALSE).
-- So this is a NEW degree-4 identity. But it's SMALLER — it only has 2 degree-4 terms instead of 4.

-- Actually wait, let me re-derive more carefully.
-- LHS = reQ(x*((y*z)*w)) - reQ(x*(y*(z*w)))
-- RHS = 2*reQ(x*(y*(w*z))) - 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)
-- Using reQ_four_symm: reQ(x*(y*(w*z))) = 2*g(x,y)*g(z,w) - reQ(x*(y*(z*w)))
-- RHS = 2*(2*g(x,y)*g(z,w) - reQ(x*(y*(z*w)))) - 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)
-- = 2*g(x,y)*g(z,w) - 2*reQ(x*(y*(z*w))) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)
--
-- LHS = RHS:
-- reQ(x*((y*z)*w)) - reQ(x*(y*(z*w))) = 2*g(x,y)*g(z,w) - 2*reQ(x*(y*(z*w))) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)
-- Rearranging:
-- reQ(x*((y*z)*w)) + reQ(x*(y*(z*w))) = 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)

-- This is a degree-4 identity with only 2 degree-4 terms on the LHS and 0 on the RHS (all degree-2×2).
-- The degree-4 coordinate ring should be MUCH smaller.

-- Sub-lemma E: the key degree-4 identity
-- reQ(x*((y*z)*w)) + reQ(x*(y*(z*w))) = 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)
-- for imaginary x,y,z,w.
-- This is degree-4 but with only 2 terms. Let me try the coordinate ring.
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
  rw [hsy, hsz, hsw, mul_neg, reQ_neg, mul_neg, reQ_neg, mul_neg, reQ_neg]
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra
