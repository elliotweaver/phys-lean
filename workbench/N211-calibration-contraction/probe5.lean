import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- PROBE 5: prove a helper lemma first, then the main identity.
-- Helper: for imaginary x,y,z,w:
--   gForm (octCross x y) (octCross z w) = gForm (x*y) (z*w) - gForm x y * gForm z w
-- This follows from bilinearity + gForm_ImO_one + gForm_one_right

-- Actually let me try the direct coordinate approach but more carefully.
-- The issue is that star needs to be handled for composite expressions.
-- Let me use a different strategy: convert gForm to reQ first (using star = -x for imaginary),
-- then work purely in reQ coordinates.

set_option maxHeartbeats 400000 in
theorem coassoc4_contraction_probe {x y z w : O ℚ}
    (hx : x ∈ ImO) (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    coassoc4 x y z w =
      2 * gForm (octCross x y) (octCross z w)
        - 2 * (gForm x z * gForm y w - gForm x w * gForm y z) := by
  -- Strategy: convert everything to reQ of products, then use coordinate ring
  -- LHS: coassoc4 x y z w = gForm (assoc x y z) w = -reQ(assoc x y z * w) [via coassoc4_eq_neg_reQ]
  rw [coassoc4_eq_neg_reQ hw]
  -- RHS: need to convert gForm terms to reQ terms
  -- For imaginary u: gForm a u = reQ(a * star u) = reQ(a * (-u)) = -reQ(a * u)
  -- So gForm x z = -reQ(x*z), gForm y w = -reQ(y*w), etc.
  -- gForm(octCross x y)(octCross z w) = reQ(octCross x y * star(octCross z w))
  -- octCross z w is imaginary (octCross_mem_ImO), so star(octCross z w) = -(octCross z w)
  -- gForm(octCross x y)(octCross z w) = -reQ(octCross x y * octCross z w)
  have hocz : octCross z w ∈ ImO := octCross_mem_ImO hw
  have hocx : octCross x y ∈ ImO := octCross_mem_ImO hy
  -- Convert all gForm to reQ
  rw [show gForm (octCross x y) (octCross z w) = -reQ (octCross x y * octCross z w) := by
    unfold gForm; rw [(mem_ImO).mp hocz, mul_neg, reQ_neg]]
  rw [show gForm x z = -reQ (x * z) := by
    unfold gForm; rw [hsz, mul_neg, reQ_neg]]
  rw [show gForm y w = -reQ (y * w) := by
    unfold gForm; rw [hsw, mul_neg, reQ_neg]]
  rw [show gForm x w = -reQ (x * w) := by
    unfold gForm; rw [hsw, mul_neg, reQ_neg]]
  rw [show gForm y z = -reQ (y * z) := by
    unfold gForm; rw [hsz, mul_neg, reQ_neg]]
  -- Now expand octCross
  unfold octCross assoc
  -- Everything is in reQ now. Expand to coordinates and ring.
  simp only [reQ, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im,
    Dbl.star_re', Dbl.star_im']
  ring

end
end Phys.Algebra
