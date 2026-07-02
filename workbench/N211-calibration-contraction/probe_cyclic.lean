import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- Sub-lemmas (same as before)
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

-- The identity in reQ form (after structural conversion):
-- -reQ(assoc x y z * w) = 2*reQ((x*y)*(w*z)) - 2*reQ(x*y)*reQ(z*w)
--                         - 2*(reQ(x*z)*reQ(y*w) - reQ(x*w)*reQ(y*z))
-- 
-- LHS = -reQ((x*y)*z*w) + reQ(x*(y*z)*w)
-- Using reQ_mul_comm: reQ(a*b) = reQ(b*a)
-- Using reQ_mul_assoc3: reQ((a*b)*c) = reQ(a*(b*c))
--
-- Key idea: reQ((x*y)*(w*z)) = reQ(x*(y*(w*z))) [trace assoc: a=x, b=y, c=(w*z)]
-- And reQ((x*y)*z*w) = reQ(((x*y)*z)*w) = reQ((x*y)*(z*w)) [trace assoc: a=(x*y), b=z, c=w]
--   = reQ(x*(y*(z*w))) [trace assoc: a=x, b=y, c=(z*w)]
-- And reQ(x*(y*z)*w) = reQ((x*(y*z))*w) = reQ(x*((y*z)*w)) [trace assoc: a=x, b=(y*z), c=w]
--
-- So the identity becomes:
-- -(reQ(x*(y*(z*w))) - reQ(x*((y*z)*w))) = 2*reQ(x*(y*(w*z))) - 2*reQ(x*y)*reQ(z*w)
--                                          - 2*(reQ(x*z)*reQ(y*w) - reQ(x*w)*reQ(y*z))
--
-- Now reQ(x*((y*z)*w)) — the inner (y*z)*w is a 3-fold product; trace assoc gives
-- reQ((y*z)*w) is a 2-fold reQ, not 3-fold, so we can't apply trace assoc there.
-- But we can use reQ_mul_comm on the outer: reQ(x*((y*z)*w)) = reQ(((y*z)*w)*x)
-- Then trace assoc: reQ(((y*z)*w)*x) = reQ((y*z)*(w*x)) [a=(y*z), b=w, c=x]
-- = reQ(y*(z*(w*x))) [a=y, b=z, c=(w*x)]
--
-- Similarly reQ(x*(y*(z*w))) = reQ((y*(z*w))*x) = reQ(y*((z*w)*x)) [trace assoc: a=y, b=(z*w), c=x]
-- = reQ(y*(z*(w*x))) [trace assoc: a=z, b=w, c=x on inner (z*w)*x: reQ((z*w)*x) = reQ(z*(w*x))]
-- Wait, reQ(y*((z*w)*x)) — this is reQ(y * something), 2-fold. Can't apply trace assoc to inner.
-- But by comm: reQ(y*((z*w)*x)) = reQ(((z*w)*x)*y) = reQ((z*w)*(x*y)) [trace assoc: a=(z*w), b=x, c=y]
-- = reQ(z*(w*(x*y))) [trace assoc: a=z, b=w, c=(x*y)]
--
-- OK this is getting very complicated. Let me try a DIFFERENT structural decomposition.
-- 
-- The identity is: reQ(assoc x y z * w) = 2*reQ((x*y)*(w*z)) - 2*reQ(x*y)*reQ(z*w)
--   - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
--
-- Let me try: define a helper that's a 2-variable coordinate identity.
-- Actually, let me try the approach of splitting reQ(assoc x y z * w) using
-- reQ_mul_assoc3 to transform it, then see if the resulting identity is smaller.

-- Helper: reQ(assoc x y z * w) as a coordinate identity in just (x, y, z, w) where
-- we use the 8-coord expansion. The issue is this is degree-4 × 4 vars × 8 coords.
-- But the LHS and RHS share many sub-expressions; if I rewrite using the trace lemmas
-- FIRST, the coordinate ring might be smaller.

-- Let me try: use reQ_mul_assoc3 to rewrite reQ((x*y)*(w*z)) = reQ(x*(y*(w*z)))
-- and reQ((x*y)*z*w) = reQ(((x*y)*z)*w) = reQ((x*y)*(z*w)) = reQ(x*(y*(z*w)))
-- and reQ(x*(y*z)*w) = reQ((x*(y*z))*w) = reQ(x*((y*z)*w))

-- Then the identity becomes:
-- -(reQ(x*(y*(z*w))) - reQ(x*((y*z)*w))) = 2*reQ(x*(y*(w*z))) - 2*reQ(x*y)*reQ(z*w)
--   - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
--
-- This is still degree-4, but the LHS has two terms (not one product of 4 vars).
-- Let me check if this form is amenable to ring by measuring.

-- Actually, let me just try `linear_combination` with the trace lemmas as proofs.
-- The identity is:
-- reQ(assoc x y z * w) = 2*reQ((x*y)*(w*z)) - 2*reQ(x*y)*reQ(z*w)
--   - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
-- 
-- where assoc x y z = (x*y)*z - x*(y*z)
-- so reQ(assoc x y z * w) = reQ((x*y)*z*w) - reQ(x*(y*z)*w)
-- = reQ(x*(y*(z*w))) - reQ(x*((y*z)*w))  [trace assoc on the first term only]
--
-- Actually, both can be transformed. Let me compute:
-- reQ(((x*y)*z)*w) = reQ((x*y)*(z*w)) [trace assoc, a=(x*y), b=z, c=w]
-- = reQ(x*(y*(z*w))) [trace assoc, a=x, b=y, c=(z*w)]
-- reQ((x*(y*z))*w) = reQ(x*((y*z)*w)) [trace assoc, a=x, b=(y*z), c=w]
-- 
-- So LHS = reQ(x*(y*(z*w))) - reQ(x*((y*z)*w))
-- And reQ((x*y)*(w*z)) = reQ(x*(y*(w*z))) [trace assoc, a=x, b=y, c=(w*z)]
-- 
-- The identity:
-- reQ(x*(y*(z*w))) - reQ(x*((y*z)*w)) = 2*reQ(x*(y*(w*z))) - 2*reQ(x*y)*reQ(z*w)
--   - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
--
-- Using reQ_mul_comm on reQ(x*(y*(w*z))) = reQ((y*(w*z))*x) = reQ(y*((w*z)*x)):
-- This doesn't simplify nicely. Let me try a completely different approach.
-- 
-- W9.4: PREFER STRUCTURE OVER EXPANSION.
-- The identity is a SCALAR identity in ℚ, but the products are in a NON-commutative ring.
-- The `ring` tactic only works for commutative rings. But after `simp only [reQ, CD.mul_re, ...]`,
-- everything should be in ℚ. The issue is that the EXPRESSION IS TOO LARGE for `ring`.
--
-- Solution: break the coordinate ring into TWO smaller ring calls.
-- The LHS minus RHS = 0. Split as:
-- Part A: reQ(assoc x y z * w) - 2*reQ((x*y)*(w*z)) [the "trace" part]
-- Part B: + 2*reQ(x*y)*reQ(z*w) + 2*reQ(x*z)*reQ(y*w) - 2*reQ(x*w)*reQ(y*z) [the "metric" part]
-- 
-- If each part is a smaller coordinate identity that ring can handle, we win.
-- But this requires proving Part A = -Part B separately, which is the same difficulty.
--
-- Better: use `linear_combination` with the trace lemmas as certificates.
-- Or: prove a key intermediate lemma reQ(assoc x y z * w) = 2*(reQ((x*y)*(w*z)) - reQ((x*y)*z*w))
-- ... no, that's not right.
--
-- Let me try the NUMERICAL approach to find the right decomposition:
-- reQ(assoc x y z * w) = reQ(((x*y)*z)*w) - reQ((x*(y*z))*w)
-- Each of these is a reQ of a 4-fold product. Trace assoc transforms 3-fold products.
-- For 4-fold: reQ(((a*b)*c)*d) = reQ((a*b)*(c*d)) = reQ(a*(b*(c*d)))
-- So reQ(((x*y)*z)*w) = reQ(x*(y*(z*w)))
-- And reQ((x*(y*z))*w) = reQ(x*((y*z)*w))
-- 
-- The key question: can reQ(x*(y*(z*w))) - reQ(x*((y*z)*w)) be simplified?
-- = reQ(x*(y*(z*w)) - x*((y*z)*w))  [since reQ is additive]
-- = reQ(x * (y*(z*w) - (y*z)*w))  [left distributivity]
-- = reQ(x * assoc y z w)  [since assoc y z w = (y*z)*w - y*(z*w), so y*(z*w) - (y*z)*w = -assoc y z w]
-- Wait: assoc y z w = (y*z)*w - y*(z*w). So y*(z*w) - (y*z)*w = -(assoc y z w).
-- So LHS = reQ(x * (-assoc y z w)) = -reQ(x * assoc y z w)
-- = -reQ(x * ((y*z)*w - y*(z*w)))
-- = -(reQ(x*(y*z)*w) - reQ(x*(y*(z*w))))
-- = reQ(x*(y*(z*w))) - reQ(x*(y*z)*w)
-- 
-- So reQ(assoc x y z * w) = reQ(x*(y*(z*w))) - reQ(x*(y*z)*w) = -reQ(x * assoc y z w).
-- This means reQ(assoc x y z * w) = -reQ(x * assoc y z w) !!
-- 
-- Let me verify: assoc x y z = (x*y)*z - x*(y*z).
-- reQ(assoc x y z * w) = reQ(((x*y)*z - x*(y*z)) * w)
-- = reQ((x*y)*z*w) - reQ(x*(y*z)*w)
-- 
-- And -reQ(x * assoc y z w) = -reQ(x * ((y*z)*w - y*(z*w)))
-- = -(reQ(x*(y*z)*w) - reQ(x*(y*(z*w))))
-- = reQ(x*(y*(z*w))) - reQ(x*(y*z)*w)
-- 
-- And reQ((x*y)*z*w) = reQ(x*(y*(z*w))) by trace assoc (3-fold applied twice).
-- So yes! reQ(assoc x y z * w) = -reQ(x * assoc y z w).
-- 
-- This is the KEY structural identity. And by trace commutativity:
-- reQ(x * assoc y z w) = reQ(assoc y z w * x).
-- So reQ(assoc x y z * w) = -reQ(assoc y z w * x).
-- 
-- But this doesn't directly help with the contraction identity. Let me think more.
-- 
-- Actually, the contraction identity can be re-derived:
-- reQ(assoc x y z * w) = reQ(x*(y*(z*w))) - reQ(x*(y*z)*w)
-- And the RHS of the contraction (in reQ form):
-- 2*reQ((x*y)*(w*z)) - 2*reQ(x*y)*reQ(z*w) - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
-- = 2*reQ(x*(y*(w*z))) - 2*reQ(x*y)*reQ(z*w) - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
-- 
-- So the identity is:
-- reQ(x*(y*(z*w))) - reQ(x*(y*z)*w) = 2*reQ(x*(y*(w*z))) - 2*reQ(x*y)*reQ(z*w) - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
-- 
-- Rearranging:
-- 0 = reQ(x*(y*(w*z))) - reQ(x*(y*z)*w) + reQ(x*(y*(z*w))) - 2*reQ(x*y)*reQ(z*w) - 2*reQ(x*z)*reQ(y*w) + 2*reQ(x*w)*reQ(y*z)
-- Hmm, not obviously simpler.
--
-- Let me try yet another approach: PROVE A SMALLER LEMMA.
-- The identity reQ(assoc x y z * w) = -reQ(x * assoc y z w) is a genuinely useful
-- structural lemma (it's the "cyclic" property of the associator under the trace).
-- Let me prove THAT first (it's a degree-4 identity but with a simpler structure),
-- and see if the contraction follows.
-- 
-- Actually, reQ(assoc x y z * w) = -reQ(x * assoc y z w) means:
-- reQ((x*y)*z*w) - reQ(x*(y*z)*w) = -(reQ(x*(y*z)*w) - reQ(x*y*(z*w)))
-- = reQ(x*y*(z*w)) - reQ(x*(y*z)*w)
-- So: reQ((x*y)*z*w) = reQ(x*y*(z*w))
-- This is just trace associativity applied twice! reQ(((x*y)*z)*w) = reQ((x*y)*(z*w)) = reQ(x*(y*(z*w)))
-- So reQ(assoc x y z * w) = reQ(x*(y*(z*w))) - reQ(x*(y*z)*w) is correct, but this
-- DOESN'T simplify to -reQ(x * assoc y z w) because:
-- reQ(x * assoc y z w) = reQ(x*((y*z)*w)) - reQ(x*(y*(z*w)))
-- = reQ(x*(y*z)*w) - reQ(x*(y*(z*w)))
-- And reQ(assoc x y z * w) = reQ(x*(y*(z*w))) - reQ(x*(y*z)*w) = -(reQ(x*(y*z)*w) - reQ(x*(y*(z*w))))
-- = -reQ(x * assoc y z w). ✓
-- 
-- So reQ(assoc x y z * w) = -reQ(x * assoc y z w). This IS trace associativity.
-- It's NOT a new lemma — it's a direct consequence of reQ_mul_assoc3.
-- And it's exactly assoc_reQ_skew (N210) in disguise? Let me check.
-- assoc_reQ_skew: reQ(assoc x y z * w) + reQ(assoc x y w * z) = 0
-- This says reQ(assoc x y z * w) = -reQ(assoc x y w * z).
-- My identity: reQ(assoc x y z * w) = -reQ(x * assoc y z w).
-- These are different! assoc_reQ_skew swaps z and w; mine shifts the bracketing.
-- 
-- Actually, by trace commutativity: reQ(assoc x y z * w) = reQ(w * assoc x y z)
-- = reQ(w * ((x*y)*z - x*(y*z)))
-- = reQ(w*(x*y)*z) - reQ(w*x*(y*z))
-- = reQ(z*(w*(x*y))) - reQ((y*z)*(w*x))   [trace comm + assoc]
-- This is getting complicated.
-- 
-- Let me try a COMPLETELY DIFFERENT approach: the `linear_combination` tactic
-- with trace-associativity certificates.

-- First, prove the key cyclic identity:
theorem reQ_assoc_cyclic (x y z w : O ℚ) :
    reQ (assoc x y z * w) = - reQ (x * assoc y z w) := by
  unfold assoc
  rw [reQ_sub, reQ_sub, mul_sub, sub_sub]
  -- Need: reQ(((x*y)*z)*w) - reQ((x*(y*z))*w) = reQ(x*((y*z)*w)) - reQ(x*(y*(z*w)))
  -- LHS: reQ(((x*y)*z)*w) - reQ((x*(y*z))*w)
  -- = reQ((x*y)*(z*w)) - reQ(x*((y*z)*w))   [trace assoc on each]
  -- = reQ(x*(y*(z*w))) - reQ(x*((y*z)*w))    [trace assoc on first term]
  -- = -(reQ(x*((y*z)*w)) - reQ(x*(y*(z*w))))
  -- = -(reQ(x * ((y*z)*w - y*(z*w))))
  -- = -(reQ(x * assoc y z w))   [since assoc y z w = (y*z)*w - y*(z*w)]
  -- Wait, I need to be careful with subtraction signs.
  rw [reQ_mul_assoc3 (x * y) z w, reQ_mul_assoc3 x (y * z) w]
  -- Now: reQ((x*y)*(z*w)) - reQ(x*((y*z)*w)) = reQ(x*(y*(z*w))) - reQ(x*((y*z)*w))
  -- Hmm, that's not right. Let me redo.
  -- After unfold assoc and rw [reQ_sub, reQ_sub, mul_sub, sub_sub]:
  -- The goal is some rearrangement. Let me just try the trace lemmas.
  sorry

end
end Phys.Algebra