import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- PROBE v8: Use the approach that works: unfold everything, break stars with
-- simp only, but DON'T unfold gForm with simp. Instead, use `show` to manually
-- expand the goal, then `rw` the star hypotheses, then ring.
-- Key: we need star(y), star(z), star(w) to appear. They appear in the
-- gForm definitions. So we need to unfold gForm first.
-- Use `unfold gForm` (which is a def, so unfold works), not `simp only [gForm]`.

set_option maxHeartbeats 400000 in
theorem coassoc4_contraction_probe {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  -- Unfold the outer definitions
  unfold coassoc4 octCross assoc
  -- Now we need to unfold ALL gForm occurrences. Use `simp only` with the equation.
  -- gForm is `def gForm (v w : O ℚ) : ℚ := reQ (v * star w)`
  -- So simp only [gForm] should replace gForm v w with reQ (v * star w).
  -- The recursion issue might be from reQ or star. Let me try with just the
  -- specific gForm unfold.
  simp only [show gForm = (fun v w => reQ (v * star w)) from rfl]
  -- Now break composite stars
  have hsy : star y = -y := (mem_ImO).mp hy
  have hsz : star z = -z := (mem_ImO).mp hz
  have hsw : star w = -w := (mem_ImO).mp hw
  simp only [star_add, star_mul, star_one, star_smul]
  rw [hsy, hsz, hsw]
  simp only [neg_neg, mul_neg, neg_mul]
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra
