import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- PROBE v6: Break stars with simp, rewrite individual stars with `simp only [hsy, hsz, hsw]`
-- but use `←` to avoid looping. Actually, the key insight: after star_mul breaks star(a*b),
-- we get star(a)*star(b). Then star y appears, and we need to rewrite it to -y.
-- The problem with simp is that star(-y) = -star(y) = -(-y) = y, creating a loop.
-- Solution: don't use simp for the rewrite; use rw AFTER simp finishes.
-- But rw failed because the pattern wasn't found...
-- Let me try: after simp only [star_add, star_mul, star_one, star_smul], check if star y/z/w appear
-- by using `rw [show star y = -y from (mem_ImO).mp hy]` etc.

set_option maxHeartbeats 400000 in
theorem coassoc4_contraction_probe {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  unfold coassoc4 gForm octCross assoc
  have hsy : star y = -y := (mem_ImO).mp hy
  have hsz : star z = -z := (mem_ImO).mp hz
  have hsw : star w = -w := (mem_ImO).mp hw
  -- Break composite stars
  simp only [star_add, star_mul, star_one, star_smul]
  -- Now rewrite individual stars — they should appear as star y, star z, star w
  -- after star_mul broke star(y*z) = star y * star z etc.
  rw [hsy, hsz, hsw]
  -- Clean up negations
  simp only [neg_neg, mul_neg, neg_mul]
  -- Coordinate ring
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra
