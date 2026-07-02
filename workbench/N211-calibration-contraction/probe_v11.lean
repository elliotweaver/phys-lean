import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- PROBE v11: Single simp with everything, avoid recursion by being careful with ordering.
-- The issue: gForm z w = reQ(z * star w). When we simp only [gForm], it creates star w.
-- Then star_mul breaks star(z*w) etc. But the gForm z w is INSIDE a smul coefficient,
-- and when it unfolds, the star w inside it needs to be broken too.
-- Solution: unfold gForm, then break ALL stars (including nested ones), then rewrite.
-- The recursion issue might be from star_neg or star on negations looping.
-- Let me try: unfold, break stars WITHOUT the hypotheses, then rewrite with hypotheses
-- using `simp only [...] at *` or `rw`.

set_option maxRecDepth 200000 in
set_option maxHeartbeats 600000 in
theorem coassoc4_contraction_probe {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  unfold coassoc4 octCross assoc
  -- Unfold gForm everywhere
  unfold gForm
  -- Get star hypotheses
  have hsy : star y = -y := (mem_ImO).mp hy
  have hsz : star z = -z := (mem_ImO).mp hz
  have hsw : star w = -w := (mem_ImO).mp hw
  -- Break ALL composite stars (star_add, star_mul, star_smul, star_one, star_neg, star_zero)
  simp only [star_add, star_mul, star_one, star_smul, star_neg, star_zero]
  -- Now rewrite star y, star z, star w to their negations
  rw [hsy, hsz, hsw]
  -- Simplify the resulting negations
  simp only [neg_neg, mul_neg, neg_mul]
  -- Now everything is in terms of x, y, z, w and their products (no star).
  -- Expand to coordinates and ring.
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra
