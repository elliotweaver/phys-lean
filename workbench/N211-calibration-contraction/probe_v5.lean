import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- PROBE v5: Use the approach from N210's assoc_reQ_skew: unfold everything including
-- the star of the imaginary elements, then coordinate ring.
-- Key: we DON'T need to manually break stars — the CD.star_re/CD.star_im/Dbl.star_re'/Dbl.star_im'
-- simp lemmas handle the star coordinates directly, just like in assoc_reQ_skew.
-- BUT: the LHS has gForm (assoc x y z) w = reQ(assoc x y z * star w), and star w = -w for imaginary w.
-- The RHS has gForm (octCross x y)(octCross z w) = reQ(octCross x y * star(octCross z w)).
-- octCross z w = z*w + gForm(z,w)*1. star(octCross z w) = star(z*w + ...) = star(z*w) + star(...)*star(1)
--   = star(w)*star(z) + gForm(z,w)*1 = (-w)*(-z) + gForm(z,w)*1 = w*z + gForm(z,w)*1
-- So star(octCross z w) = w*z + gForm(z,w)*1 (for imaginary z,w).
-- This is complex. Let me try a different route:
-- Use coassoc4_eq_neg_reQ to convert LHS to -reQ(assoc x y z * w),
-- and use a similar approach for the RHS.

-- Actually, let me try the direct coordinate approach: unfold EVERYTHING and let ring handle it.
-- The star terms will be expanded by the CD.star_re etc. lemmas.
-- But we need star(w) = -w to be applied. The CD.star_re/CD.star_im lemmas expand star of a CD element
-- into its coordinates, so they handle it automatically.

-- The problem: after unfold, we have terms like star (z * w) which the CD.star_re/CD.star_im lemmas
-- should handle. Let me check: CD.star_re/star_im are about star of a CD element (a,b) → (a, -b).
-- But star (z * w) is star of a PRODUCT, which needs star_mul first.

-- Let me try: unfold, then simp with star_mul + star_add + star_one to break all composite stars,
-- then rewrite star y/z/w = -y/-z/-w, then coordinate ring.
-- The issue was that simp loops on star y = -y. Solution: use rw for the individual stars
-- AFTER breaking composites, but use a context that finds them.

-- Let me try: after breaking composites with star_mul/star_add, the stars on y/z/w should appear.
-- The problem in v3 was that rw couldn't find star y. Maybe the simp already consumed them?
-- Let me try with ONLY star_mul and star_add (no star_smul), then check.

set_option maxHeartbeats 400000 in
theorem coassoc4_contraction_probe {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  unfold coassoc4 gForm octCross assoc
  -- Don't break stars manually; instead, go straight to coordinates.
  -- The reQ simp will expand everything including star via CD.star_re etc.
  -- But we need star_mul to break star of products first.
  -- Actually, gForm is reQ(v * star w). After unfold, we have:
  --   reQ((x*y*z - x*(y*z)) * star w)  on the LHS
  --   reQ((x*y + reQ(x*star y)*1) * star(z*w + reQ(z*star w)*1))  on the RHS
  -- star w, star(z*w), star(reQ(z*star w)*1) all need breaking.
  -- star(z*w) = star w * star z (star_mul, reversed)
  -- star(reQ(z*star w)*1) = reQ(z*star w) * star 1 = reQ(z*star w) * 1 (star_smul, star_one)
  -- Then star w = -w, star z = -z (from ImO hypotheses)
  -- So star(z*w) = (-w)*(-z) = w*z

  -- Strategy: unfold, then use the `simplifier` with all star-breaking lemmas + the ImO hypotheses
  -- as simp lemmas, but mark them as `←` to avoid looping, or use a different approach.

  -- Actually, the simplest approach: convert everything to reQ, then use reQ_mul_comm and
  -- reQ_mul_assoc3 (trace associativity) to manipulate, avoiding star entirely.

  -- For the LHS: coassoc4 x y z w = -reQ(assoc x y z * w) (coassoc4_eq_neg_reQ)
  -- For the RHS: we need to express gForm(octCross x y)(octCross z w) in terms of reQ.

  -- Let me try a structural approach instead of coordinate bashing.
  sorry

end
end Phys.Algebra
