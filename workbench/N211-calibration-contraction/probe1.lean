import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- PROBE: the contraction identity
-- coassoc4 x y z w = 2 * gForm (octCross x y) (octCross z w) - 2 * (gForm x z * gForm y w - gForm x w * gForm y z)
-- for imaginary x,y,z,w

-- Step 1: gForm(octCross x y)(octCross z w) = gForm(x*y)(z*w) for imaginary x,y,z,w
-- Because octCross x y = x*y + gForm(x,y)*1, and gForm(correction*1)(anything) = gForm(x*y)(correction*1) + ...
-- For imaginary u: gForm u 1 = reQ u = 0 (reQ_ImO_zero), gForm 1 u = gForm_symm → 0
-- octCross x y ∈ ImO (octCross_mem_ImO), so gForm(octCross x y) 1 = 0
-- So gForm(octCross x y)(octCross z w) = gForm(octCross x y)(z*w) + gForm(z,w)*gForm(octCross x y) 1
--   = gForm(octCross x y)(z*w) + 0
-- And gForm(octCross x y)(z*w) = gForm(x*y)(z*w) + gForm(x,y)*gForm(1)(z*w)
-- gForm 1 v = gForm_symm → gForm v 1 = reQ v. For z*w: reQ(z*w) = -gForm z w (imaginary).
-- Wait, gForm 1 (z*w) = reQ(1 * star(z*w)) = reQ(star(z*w)) = reQ(z*w) (since reQ is self-conjugate: reQ(star a) = reQ a)
-- Actually: gForm 1 (z*w) = reQ(1 * star(z*w)) = reQ(star(z*w)).
-- And reQ(star a) = reQ a (banked). So gForm 1 (z*w) = reQ(z*w).
-- For imaginary z,w: reQ(z*w) = -gForm z w (since gForm z w = reQ(z * star w) = reQ(z * (-w)) = -reQ(z*w)).
-- So gForm 1 (z*w) = reQ(z*w) = -gForm z w.

-- Hmm, this means the correction does NOT vanish! Let me reconsider.

-- gForm(octCross x y)(octCross z w) = gForm(x*y + g(x,y)*1)(z*w + g(z,w)*1)
-- = gForm(x*y)(z*w) + g(z,w)*gForm(x*y)(1) + g(x,y)*gForm(1)(z*w) + g(x,y)*g(z,w)*gForm(1)(1)
-- gForm(x*y)(1) = reQ(x*y) = -gForm x y (for imaginary y: star y = -y, gForm(x*y) 1 = reQ((x*y)*star 1) = reQ(x*y))
--   Wait: gForm v 1 = reQ(v * star 1) = reQ(v * 1) = reQ v. And reQ(x*y) = ?
--   gForm x y = reQ(x * star y) = reQ(x * (-y)) = -reQ(x*y). So reQ(x*y) = -gForm x y. ✓
-- gForm(1)(z*w) = reQ(1 * star(z*w)) = reQ(star(z*w)) = reQ(z*w) = -gForm z w (similar)
-- gForm(1)(1) = reQ(1*1) = 1

-- So: gForm(octCross x y)(octCross z w) = gForm(x*y)(z*w) + g(z,w)*(-g(x,y)) + g(x,y)*(-g(z,w)) + g(x,y)*g(z,w)*1
-- = gForm(x*y)(z*w) - 2*g(x,y)*g(z,w) + g(x,y)*g(z,w)
-- = gForm(x*y)(z*w) - g(x,y)*g(z,w)

-- So the identity becomes:
-- coassoc4 x y z w = 2*(gForm(x*y)(z*w) - g(x,y)*g(z,w)) - 2*(g(x,z)*g(y,w) - g(x,w)*g(y,z))
-- = 2*gForm(x*y)(z*w) - 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)

-- And coassoc4 = gForm(assoc x y z) w = -reQ(assoc x y z * w) for imaginary w
-- = -reQ(((x*y)*z - x*(y*z))*w) = -reQ((x*y)*z*w) + reQ(x*(y*z)*w)

-- For imaginary w: gForm(x*y)(z*w) = reQ((x*y)*star(z*w)) = reQ((x*y)*star(w)*star(z)) = reQ((x*y)*(-w)*(-z)) = reQ((x*y)*(w*z))
-- So gForm(x*y)(z*w) = reQ((x*y)*(w*z)) (using star(z*w) = star(w)*star(z) = w*z for imaginary)

-- The identity in reQ form:
-- -reQ(((x*y)*z - x*(y*z))*w) = 2*reQ((x*y)*(w*z)) - 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)

-- Using reQ_mul_assoc3 (trace associativity): reQ((x*y)*z*w) = reQ(x*y*(z*w)) = reQ(x*(y*(z*w)))
-- Hmm, reQ_mul_assoc3 says reQ((a*b)*c) = reQ(a*(b*c)). So:
-- reQ((x*y)*(z*w)) = reQ(x*(y*(z*w)))  [trace assoc]
-- reQ(((x*y)*z)*w) = reQ((x*y)*(z*w))   [trace assoc with a=x*y, b=z, c=w]
-- reQ((x*(y*z))*w) = reQ(x*((y*z)*w)) = reQ(x*(y*(z*w)))  [trace assoc twice]

-- So: reQ(((x*y)*z)*w) = reQ(x*(y*(z*w))) = reQ((x*(y*z))*w)
-- Therefore: reQ(assoc x y z * w) = reQ(((x*y)*z)*w) - reQ((x*(y*z))*w) = 0 !??
-- That can't be right... the associator is nonzero.

-- Wait: reQ_mul_assoc3 says reQ((a*b)*c) = reQ(a*(b*c)).
-- reQ(((x*y)*z)*w) = reQ((x*y)*(z*w))  [a=x*y, b=z, c=w]
-- reQ((x*(y*z))*w) = reQ(x*((y*z)*w))  [a=x, b=y*z, c=w]
-- And reQ(x*((y*z)*w)) = reQ(x*(y*(z*w)))  [a=y*z → a=y, b=z... no]
-- Actually reQ((y*z)*w) = reQ(y*(z*w))  [a=y, b=z, c=w]
-- So reQ(x*((y*z)*w)) = reQ(x*(y*(z*w)))  [substituting]
-- And reQ((x*y)*(z*w)) = reQ(x*(y*(z*w)))  [a=x, b=y, c=z*w]
-- So indeed reQ(((x*y)*z)*w) = reQ((x*(y*z))*w), which means reQ(assoc x y z * w) = 0 for ALL x,y,z,w!

-- But that contradicts assoc_reQ_skew (N210) which says reQ(assoc x y z * w) + reQ(assoc x y w * z) = 0.
-- If reQ(assoc x y z * w) = 0 for all, then assoc_reQ_skew is trivially 0+0=0. And coassoc4 = 0 always??
-- But coassoc4_witness_coord says coassoc4 wa wb wc (assoc wa wb wc) = 4 ≠ 0!

-- The resolution: reQ_mul_assoc3 says reQ((a*b)*c) = reQ(a*(b*c)). This is the REAL PART.
-- But assoc x y z * w is a PRODUCT of assoc with w, not a triple product (a*b)*c.
-- reQ(assoc x y z * w) = reQ(((x*y)*z - x*(y*z)) * w) = reQ(((x*y)*z)*w) - reQ((x*(y*z))*w)
-- Each of these IS a triple product: ((x*y)*z)*w = (a)*w where a = (x*y)*z, so reQ(a*w) = reQ((a)*w).
-- But reQ_mul_assoc3 needs the form reQ((p*q)*r). Here p = (x*y)*z, q = w, but reQ(p * w) is NOT reQ((p*w)) in the triple form.
-- Actually reQ(p * w) IS a 2-fold product: reQ of the product of p and w.
-- reQ_mul_assoc3 is about 3-fold products: reQ((a*b)*c) = reQ(a*(b*c)).
-- For reQ(p * w) where p = (x*y)*z, we have reQ(((x*y)*z) * w) which IS reQ((a*b)*c) with a=x*y, b=z, c=w.
-- So reQ(((x*y)*z)*w) = reQ((x*y)*(z*w)) by trace assoc.
-- And reQ((x*(y*z))*w) = reQ(x*((y*z)*w)) by trace assoc with a=x, b=y*z, c=w.
-- Then reQ(x*((y*z)*w)) = reQ(x*(y*(z*w))) by trace assoc applied to (y*z)*w: reQ((y*z)*w) = reQ(y*(z*w))... but that's reQ of a 2-fold product, not 3-fold.

-- AH WAIT. reQ_mul_assoc3: reQ((a*b)*c) = reQ(a*(b*c)). This is about the REAL PART of a TRIPLE product.
-- reQ(((x*y)*z)*w) is a 4-fold product: it's reQ of the product of ((x*y)*z) and w.
-- Trace assoc only says reQ of a 3-fold (a*b)*c equals reQ of a*(b*c). It does NOT extend to 4-fold!
-- reQ(((x*y)*z)*w) — let a = (x*y)*z, then reQ(a*w) is a 2-fold product. There's no trace-assoc for 2-fold.

-- So my earlier reasoning was wrong. Let me redo:
-- reQ(assoc x y z * w) = reQ(((x*y)*z)*w) - reQ((x*(y*z))*w)
-- These are 4-fold products (3 multiplications). Trace assoc (3-fold) does NOT collapse them.
-- Trace assoc gives: reQ(((x*y)*z)*w) = reQ((x*y)*(z*w))  [3-fold: a=x*y, b=z, c=w → reQ((a*b)*c) = reQ(a*(b*c))]
--   No! reQ((a*b)*c) = reQ(a*(b*c)). Here a = x*y, b = z, c = w. So reQ(((x*y)*z)*w) = reQ((x*y)*(z*w)). ✓
-- And reQ((x*(y*z))*w) = reQ(x*((y*z)*w))  [a=x, b=y*z, c=w → reQ((a*b)*c) = reQ(a*(b*c))]
-- And reQ(x*((y*z)*w)) = reQ(x*(y*(z*w)))  [Need: reQ((y*z)*w) = reQ(y*(z*w)). But this is reQ of a 3-fold product!
--   reQ((y*z)*w) = reQ(y*(z*w)) by trace assoc with a=y, b=z, c=w. ✓
--   So reQ(x*(y*(z*w))) = reQ(x*((y*z)*w)). But x*(y*(z*w)) ≠ x*((y*z)*w) as octonion elements — only their REAL PARTS agree.
--   Actually we need reQ(x * ((y*z)*w)) and we substitute (y*z)*w with... no, we can't.
--   reQ(x * ((y*z)*w)) is a 3-fold product: a=x, b=(y*z), c=w. reQ((x*(y*z))*w) = reQ(x*((y*z)*w)). ✓
--   And reQ(x*((y*z)*w)) — we can't simplify further with trace assoc because we'd need the inner part to be a*b form.
--   Actually: (y*z)*w is a 2-fold product p = (y*z)*w. reQ(x * p) is a 2-fold product.
--   But using trace assoc on reQ(x * ((y*z)*w)): this is reQ(a * b) where a = x, b = (y*z)*w. Not a 3-fold.
--   To use trace assoc we'd need reQ((a*b)*c) form. Here we have reQ(x * ((y*z)*w)) = reQ(x * q) where q = (y*z)*w.
--   That's a 2-fold reQ, no simplification.

-- OK so the point is: reQ(((x*y)*z)*w) = reQ((x*y)*(z*w)) by trace assoc, and
-- reQ((x*(y*z))*w) = reQ(x*((y*z)*w)) by trace assoc. These are NOT equal in general.
-- The difference reQ(assoc x y z * w) = reQ((x*y)*(z*w)) - reQ(x*((y*z)*w)) is genuinely nonzero.

-- Good, so the identity is nontrivial. Let me now think about the proof more carefully.

-- The identity to prove (in reQ form, for imaginary x,y,z,w):
-- -reQ(assoc x y z * w) = 2*reQ((x*y)*(w*z)) - 2*g(x,y)*g(z,w) - 2*g(x,z)*g(y,w) + 2*g(x,w)*g(y,z)

-- where g(a,b) = gForm a b = -reQ(a*b) for imaginary b (since star b = -b).

-- Hmm wait, gForm a b = reQ(a * star b) = reQ(a * (-b)) = -reQ(a*b) for imaginary b.
-- So reQ(a*b) = -gForm a b for imaginary b.
-- And reQ(a*b) = reQ(b*a) = -gForm b a = -gForm a b (by symmetry). Consistent.

-- So: reQ((x*y)*(z*w)) = -gForm(x*y)(z*w)  [z*w is imaginary? No! z*w is NOT necessarily imaginary.]
-- Actually for imaginary z,w: z*w = octCross z w - gForm(z,w)*1. So z*w has a real part = -gForm z w.
-- star(z*w) = star(w)*star(z) = (-w)*(-z) = w*z. So gForm(x*y)(z*w) = reQ((x*y)*star(z*w)) = reQ((x*y)*(w*z)).
-- And reQ((x*y)*(w*z)): is w*z imaginary? No. But we don't need it to be.
-- reQ((x*y)*(w*z)) is just reQ of a product. We can't directly convert to gForm.

-- Let me try a different approach. The key identity is a COORDINATE identity.
-- Let me just try to prove it by expanding to reQ coordinates and using ring.

-- The approach from N210: unfold to CD.mul_re etc + ring.
-- For imaginary x,y,z,w, the identity is a degree-4 polynomial in the coordinates.
-- This should close with the standard simp + ring approach.

-- Let me write the probe:

set_option maxHeartbeats 400000 in
theorem coassoc4_contraction_probe {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  -- Expand everything to reQ coordinates
  unfold coassoc4 gForm octCross assoc
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, CD.iota, CD.e2, ιJ, Dbl.J,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im,
    Dbl.star_re', Dbl.star_im',
    star_zero, star_one,
    mul_zero, zero_mul, mul_one, one_mul, add_zero, zero_add, neg_zero, neg_neg,
    gForm_one_right, gForm_ImO_one, reQ_ImO_zero]
  -- For imaginary x,y,z,w: star x = -x etc
  rw [show star x = -x from (mem_ImO).mp hx,
      show star y = -y from (mem_ImO).mp hy,
      show star z = -z from (mem_ImO).mp hz,
      show star w = -w from (mem_ImO).mp hw]
  ring

end
end Phys.Algebra
