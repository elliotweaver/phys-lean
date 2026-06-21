import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD

/-! Scratch: Hcore over the DOUBLED-BASE structure A = CD (CD B), B CommRing.
    At this shape, traces/self-overlaps are central STRUCTURALLY (doubled-double),
    so the adjoint and Nrm-star-invariance are ext+ring identities (derived, NOT
    posited). The only H-step is the banked P2. -/

variable {B : Type*} [CommRing B] [StarRing B]
-- A := CD (CD B), CD A = CD (CD (CD B))

-- (1) Nrm star-invariance over the doubled base CD(CD B):
set_option maxHeartbeats 4000000 in
theorem Nrm_star_doubled (z : CD (CD (CD B))) : Nrm (star z) = Nrm z := by
  rw [Nrm_def, Nrm_def]
  ext <;>
    simp only [star_star, mul_re, mul_im, star_re, star_im, add_re, add_im,
      neg_re, neg_im, star_add, star_neg, star_mul', neg_mul, mul_neg, neg_neg] <;>
    ring

-- (2) iota-left scaling of bilin over the doubled base:
--     bilin (iota t * y) w = t * bilin y w   for t : CD (CD B) (a base element)
set_option maxHeartbeats 4000000 in
theorem bilin_iota_left_doubled (t : CD (CD B)) (y w : CD (CD (CD B))) :
    bilin (iota t * y) w = t * bilin y w := by
  unfold bilin
  ext <;>
    simp only [iota, mul_re, mul_im, star_re, star_im, add_re, add_im,
      neg_re, neg_im, star_add, star_neg, star_mul', star_star, neg_mul,
      mul_neg, neg_neg, add_mul, mul_add, zero_mul, mul_zero, zero_add,
      add_zero, star_zero, neg_zero, sub_zero] <;>
    ring

#print axioms Nrm_star_doubled
#print axioms bilin_iota_left_doubled
end Phys.Cascade.CD
