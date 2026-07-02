import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- FULL DIRECT approach: unfold coassoc4, gForm, octCross, assoc all at once,
-- rewrite stars of imaginary vars, then coordinate ring.
-- This is the same approach that worked for assoc_reQ_skew (degree-4, ~15s).

set_option maxRecDepth 200000 in
set_option maxHeartbeats 2000000 in
theorem coassoc4_contraction {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  unfold coassoc4 gForm octCross assoc
  have hsy : star y = -y := (mem_ImO).mp hy
  have hsz : star z = -z := (mem_ImO).mp hz
  have hsw : star w = -w := (mem_ImO).mp hw
  simp only [star_add, star_mul, star_one, star_smul, star_neg, star_zero]
  rw [hsy, hsz, hsw]
  simp only [neg_neg, mul_neg, neg_mul]
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra
