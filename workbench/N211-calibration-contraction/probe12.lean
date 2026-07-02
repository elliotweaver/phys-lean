import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- PROBE 12: unfold gForm, octCross, assoc. Then rewrite stars. Then coordinate simp + ring.
set_option maxHeartbeats 400000 in
theorem coassoc4_contraction_probe {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  -- Start by unfolding gForm, octCross, assoc (NOT coassoc4 — it's already been rw'd)
  unfold gForm octCross assoc
  -- Rewrite star of individual vars
  have hsx : star x = -x := (mem_ImO).mp hx
  have hsy : star y = -y := (mem_ImO).mp hy
  have hsz : star z = -z := (mem_ImO).mp hz
  have hsw : star w = -w := (mem_ImO).mp hw
  rw [hsx, hsy, hsz, hsw]
  -- Break apart star of composite expressions
  simp only [star_add, star_mul, star_one, star_zero, neg_neg,
    mul_neg, neg_mul, mul_one, one_mul, add_zero, zero_add, neg_zero]
  -- Now expand to coordinates
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra
