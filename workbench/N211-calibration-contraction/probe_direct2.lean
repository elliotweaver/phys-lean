import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- The issue: gForm is defined as reQ(v * star w), so after `unfold gForm`, all gForm become reQ.
-- But the gForm appears INSIDE octCross (which is x*y + gForm(x,y)•1) and inside the metric terms.
-- The star_smul creates star(reQ(x*star y)) which is star of a SCALAR — that's just the scalar itself.
-- Let me unfold gForm everywhere first, THEN break stars.

set_option maxRecDepth 200000 in
set_option maxHeartbeats 2000000 in
theorem coassoc4_contraction {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  -- Unfold everything: coassoc4, gForm, octCross, assoc
  unfold coassoc4 gForm octCross assoc
  -- Now the goal is in terms of reQ, *, +, -, star, smul, 1
  -- Break all composite stars first
  have hsy : star y = -y := (mem_ImO).mp hy
  have hsz : star z = -z := (mem_ImO).mp hz
  have hsw : star w = -w := (mem_ImO).mp hw
  -- star_smul: star(c • v) = c • star(v) (c is a scalar, star is R-linear)
  -- star of a scalar (reQ(...)) = reQ(...) since reQ produces ℚ and star on ℚ is identity
  -- But star_smul might produce star(reQ(x*star y)) • 1, and star(reQ(...)) = reQ(...) since ℚ is commutative
  -- Let me try: simp with star-breaking lemmas, then rw the individual stars, then ring.
  simp only [star_add, star_mul, star_one, star_smul, star_neg, star_zero]
  -- Now individual stars should appear
  rw [hsy, hsz, hsw]
  -- Clean up negations
  simp only [neg_neg, mul_neg, neg_mul]
  -- Now expand to coordinates and ring
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra
