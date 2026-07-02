import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- Sub-lemma: gForm(x*y)(1) = -gForm(x,y) for imaginary y
theorem gForm_xy_one (x y : O ℚ) (hy : y ∈ ImO) :
    gForm (x * y) (1 : O ℚ) = - gForm x y := by
  rw [gForm_one_right]; exact octMul_re_eq_neg_gForm hy

-- Sub-lemma: gForm(1)(z*w) = -gForm(z,w) for imaginary w
theorem gForm_one_zw (z w : O ℚ) (hw : w ∈ ImO) :
    gForm (1 : O ℚ) (z * w) = - gForm z w := by
  show reQ (1 * star (z * w)) = - reQ (z * star w)
  rw [one_mul, reQ_star]; exact octMul_re_eq_neg_gForm hw

-- Main sub-lemma: gForm(octCross x y)(octCross z w) = gForm(x*y)(z*w) - gForm(x,y)*gForm(z,w)
theorem gForm_octCross_octCross {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    gForm (octCross x y) (octCross z w) = gForm (x * y) (z * w) - gForm x y * gForm z w := by
  unfold octCross
  simp only [gForm_add_left, gForm_add_right, gForm_smul_left, gForm_smul_right]
  rw [gForm_xy_one x y hy, gForm_one_zw z w hw, gForm_one_one]
  ring

-- The cyclic trace-associator identity: reQ(assoc x y z * w) = -reQ(x * assoc y z w)
-- This normalizes the associator*w to x*assoc, using trace associativity.
set_option maxRecDepth 100000 in
set_option maxHeartbeats 400000 in
theorem reQ_assoc_cyclic (x y z w : O ℚ) :
    reQ (assoc x y z * w) = - reQ (x * assoc y z w) := by
  unfold assoc
  rw [sub_mul, sub_eq_add_neg, reQ_add, reQ_neg]
  -- LHS = reQ(((x*y)*z)*w) - reQ((x*(y*z))*w)
  -- RHS = -(reQ(x*((y*z)*w)) - reQ(x*(y*(z*w))))
  --       = reQ(x*(y*(z*w))) - reQ(x*((y*z)*w))
  -- Need: reQ(((x*y)*z)*w) = reQ(x*(y*(z*w)))  [trace assoc applied twice]
  --        reQ((x*(y*z))*w) = reQ(x*((y*z)*w))  [trace assoc]
  rw [reQ_mul_assoc3 (x * y) z w, reQ_mul_assoc3 x y (z * w),
      reQ_mul_assoc3 x (y * z) w]
  ring

-- Now the key degree-4 identity in reQ form:
-- After applying gForm_octCross_octCross, coassoc4_eq_neg_reQ, and the reQ conversions:
-- -reQ(assoc x y z * w) = 2*(reQ(x*(y*(w*z))) - g(x,y)*g(z,w)) - 2*(g(x,z)*g(y,w) - g(x,w)*g(y,z))
-- Using reQ_assoc_cyclic: -reQ(assoc x y z * w) = reQ(x * assoc y z w)
-- So: reQ(x * assoc y z w) = 2*reQ(x*(y*(w*z))) - 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)
--
-- Expanding assoc y z w = (y*z)*w - y*(z*w):
-- reQ(x*((y*z)*w)) - reQ(x*(y*(z*w))) = 2*reQ(x*(y*(w*z))) - 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)
--
-- Using trace assoc: reQ(x*((y*z)*w)) = reQ(x*(y*(z*w)))  [reQ_mul_assoc3 x y (z*w) reversed... no]
-- Actually reQ_mul_assoc3 says reQ((a*b)*c) = reQ(a*(b*c)).
-- So reQ(x*((y*z)*w)) = reQ(x*((y*z)*w)) — this is already in the a*(b*c) form.
-- And reQ((x*(y*z))*w) = reQ(x*((y*z)*w)) by trace assoc with a=x, b=y*z, c=w.
-- But we already applied reQ_assoc_cyclic which did this.

-- Let me try a completely different approach: convert the gForm terms to reQ and use
-- reQ_mul_assoc3 + reQ_mul_comm to normalize ALL 4-fold products to reQ(a*(b*(c*d))),
-- then the identity becomes a degree-4 coordinate identity on a canonical form.

-- Helper: reQ_mul_comm gives reQ(a*b) = reQ(b*a), so reQ of 2-fold is symmetric.
-- For 4-fold: reQ((a*b)*(c*d)) = reQ(a*(b*(c*d)))  [trace assoc with a=a, b=b, c=(c*d)]
-- reQ(a*(b*(c*d))) is the canonical form.

-- The identity to prove (after all conversions):
-- reQ(x*(y*(z*w))) - reQ(x*(y*(z*w))) ... wait, let me be more careful.

-- After reQ_assoc_cyclic:
-- LHS = reQ(x * assoc y z w) = reQ(x * ((y*z)*w - y*(z*w)))
--      = reQ(x * (y*z)*w) - reQ(x * (y*(z*w)))
--      = reQ(x*(y*z)*w) - reQ(x*(y*(z*w)))
-- But reQ(x*(y*z)*w) = reQ((x*(y*z))*w) = reQ(x*((y*z)*w)) by mul_assoc... no, x*(y*z)*w = (x*(y*z))*w by left-assoc in Lean.
-- reQ_mul_assoc3 (x*(y*z)) w ??? no, reQ_mul_assoc3 a b c : reQ((a*b)*c) = reQ(a*(b*c)).
-- So reQ((x*(y*z))*w) = reQ(x*((y*z)*w))  [a=x, b=y*z, c=w]
-- And reQ_mul_assoc3 x (y*z) w gives reQ((x*(y*z))*w) = reQ(x*((y*z)*w)).
-- But (x*(y*z))*w = x*(y*z)*w in Lean (left-assoc). So reQ(x*(y*z)*w) = reQ(x*((y*z)*w)).
-- But reQ_mul_assoc3 x y (z*w) gives reQ((x*y)*(z*w)) = reQ(x*(y*(z*w))).

-- OK, this is getting complicated. Let me just try the direct approach:
-- 1. Apply gForm_octCross_octCross
-- 2. Convert everything to reQ
-- 3. Use reQ_assoc_cyclic to move the associator
-- 4. Normalize ALL 4-fold reQ products to reQ(a*(b*(c*d))) using reQ_mul_assoc3
-- 5. Then ring on the resulting expression

-- Let me try a clean version that normalizes step by step.

set_option maxRecDepth 200000 in
set_option maxHeartbeats 2000000 in
theorem coassoc4_contraction_probe {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  -- Step 1: Apply gForm_octCross_octCross
  rw [gForm_octCross_octCross hx hy hz hw]
  -- Step 2: Convert gForm to reQ
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
  -- Now: reQ(x * assoc y z w) = 2*reQ((x*y)*(w*z)) - 2*(-reQ(x*y))*(-reQ(z*w)) - 2*(-reQ(x*z))*(-reQ(y*w)) + 2*(-reQ(x*w))*(-reQ(y*z))
  -- = 2*reQ((x*y)*(w*z)) - 2*reQ(x*y)*reQ(z*w) - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
  -- Normalize reQ((x*y)*(w*z)) = reQ(x*(y*(w*z))) via reQ_mul_assoc3
  rw [reQ_mul_assoc3 x y (w * z)]
  -- Normalize reQ(x * assoc y z w): unfold assoc, then normalize
  unfold assoc
  -- x * ((y*z)*w - y*(z*w)) = x*(y*z)*w - x*(y*(z*w))  [mul_sub]
  rw [mul_sub, sub_eq_add_neg, reQ_add, reQ_neg]
  -- Now: reQ(x*(y*z)*w) - reQ(x*(y*(z*w))) = 2*reQ(x*(y*(w*z))) - 2*reQ(x*y)*reQ(z*w) - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
  -- Normalize: reQ(x*(y*z)*w) = reQ((x*(y*z))*w) = reQ(x*((y*z)*w))  [trace assoc]
  -- But (x*(y*z)) = x*(y*z) in Lean, so reQ(x*(y*z)*w) = reQ((x*(y*z))*w).
  rw [show reQ (x * (y * z) * w) = reQ (x * ((y * z) * w)) from
      reQ_mul_assoc3 x (y * z) w]
  -- Now: reQ(x*((y*z)*w)) - reQ(x*(y*(z*w))) = 2*reQ(x*(y*(w*z))) - 2*reQ(x*y)*reQ(z*w) - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
  -- Apply trace assoc to reQ(x*((y*z)*w)) = reQ(x*(y*(z*w)))  [reQ_mul_assoc3 x y (z*w)]
  -- Wait: reQ_mul_assoc3 says reQ((a*b)*c) = reQ(a*(b*c)). So reQ((y*z)*w) = reQ(y*(z*w)).
  -- So reQ(x*((y*z)*w)) is NOT directly simplified by reQ_mul_assoc3 x ... because it's already in a*(b*c) form.
  -- But reQ_mul_assoc3 y z w gives reQ((y*z)*w) = reQ(y*(z*w)).
  -- However, reQ(x*((y*z)*w)) has x * ((y*z)*w) which is x * ((y*z)*w). We can't directly apply reQ_mul_assoc3 to the outer product because (y*z)*w is already a 2-fold product inside.
  -- Actually: reQ_mul_assoc3 x (y*z) w gives reQ((x*(y*z))*w) = reQ(x*((y*z)*w)). That's what we just used.
  -- To go further: reQ((y*z)*w) = reQ(y*(z*w))  [reQ_mul_assoc3 y z w].
  -- But this is INSIDE reQ(x * ...). We can't rewrite inside reQ directly.
  -- However, we CAN use reQ_mul_comm to swap: reQ(x * ((y*z)*w)) = reQ(((y*z)*w) * x) = reQ(((y*z)*w) * x)
  -- Hmm, this doesn't help.

  -- Let me just try: keep reQ(x*((y*z)*w)) as is and go to coordinates.
  -- The 4-fold products are:
  --   reQ(x*((y*z)*w)), reQ(x*(y*(z*w))), reQ(x*(y*(w*z)))
  -- Each is a degree-4 coordinate expression. Let me try ring.
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra
