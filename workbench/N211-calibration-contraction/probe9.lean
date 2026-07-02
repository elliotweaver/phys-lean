import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- PROBE 9: debug what's in the target
set_option maxHeartbeats 400000 in
theorem coassoc4_contraction_probe {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  rw [coassoc4_eq_neg_reQ hw]
  have hocz : octCross z w ∈ ImO := octCross_mem_ImO hw
  have hgz : star (octCross z w) = -(octCross z w) := (mem_ImO).mp hocz
  have hsz : star z = -z := (mem_ImO).mp hz
  have hsy : star y = -y := (mem_ImO).mp hy
  have hsx : star x = -x := (mem_ImO).mp hx
  have hsw : star w = -w := (mem_ImO).mp hw
  have h1 : gForm (octCross x y) (octCross z w) = -reQ (octCross x y * octCross z w) := by
    unfold gForm; rw [hgz, mul_neg, reQ_neg]
  have h2 : gForm x z = -reQ (x * z) := by unfold gForm; rw [hsz, mul_neg, reQ_neg]
  have h3 : gForm y w = -reQ (y * w) := by unfold gForm; rw [hsw, mul_neg, reQ_neg]
  have h4 : gForm x w = -reQ (x * w) := by unfold gForm; rw [hsw, mul_neg, reQ_neg]
  have h5 : gForm y z = -reQ (y * z) := by unfold gForm; rw [hsz, mul_neg, reQ_neg]
  rw [h1, h2, h3, h4, h5]
  unfold octCross assoc gForm
  -- NO simp - just try ring directly
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

-- Also try a simpler test: just the assoc_reQ_skew form (which is known to work)
set_option maxHeartbeats 400000 in
theorem test_skew (x y z w : O ℚ) :
    reQ (assoc x y z * w) + reQ (assoc x y w * z) = 0 := by
  unfold assoc
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im,
    Dbl.neg_re, Dbl.neg_im, Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra
