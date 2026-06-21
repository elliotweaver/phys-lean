import Phys.Cascade.ForcedStop
import Mathlib.Tactic
namespace Phys.Cascade.CD
variable {B : Type*} [CommRing B] [StarRing B]

-- The iota-LEFT central lemma SPECIALIZED to t = Nrm x (a self-overlap, central+self-conj).
-- Over the doubled base CD(CD B), with x : CD(CD(CD B)), Nrm x : CD(CD B).
-- Claim: bilin (iota (Nrm x) * y) w = Nrm x * bilin y w.  ext+ring (Nrm x expanded).
set_option maxHeartbeats 8000000 in
theorem bilin_iota_Nrm_left (x y w : CD (CD (CD B))) :
    bilin (iota (Nrm x) * y) w = Nrm x * bilin y w := by
  unfold bilin Nrm
  ext <;>
    simp only [iota, mul_re, mul_im, star_re, star_im, add_re, add_im,
      neg_re, neg_im, zero_re, zero_im, star_add, star_neg, star_mul', star_star,
      neg_mul, mul_neg, neg_neg, add_mul, mul_add, zero_mul, mul_zero, zero_add,
      add_zero, star_zero, neg_zero, sub_zero] <;>
    ring

#print axioms bilin_iota_Nrm_left
end Phys.Cascade.CD
