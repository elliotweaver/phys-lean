import Phys.Cascade.ForcedStop
import Mathlib.Tactic

open Phys.Cascade

namespace Scratch

variable {B : Type*} [CommRing B] [StarRing B]

set_option maxHeartbeats 2000000 in
theorem F1 (x y : CD (CD B)) : (x * y).Nrm = x.Nrm * y.Nrm := by
  rw [CD.Nrm_def, CD.Nrm_def, CD.Nrm_def]
  ext <;>
    simp only [CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
      CD.neg_re, CD.neg_im, star_add, star_neg, star_mul', star_star, neg_mul,
      mul_neg, neg_neg, add_mul, mul_add] <;>
    ring

-- Instantiation at the ℍ→𝕆 rung: O R = CD (H R) = CD (CD (Dbl R)), base B := Dbl R.
example (x y : O ℚ) : (x * y).Nrm = x.Nrm * y.Nrm := F1 x y

-- COSTUME idea C12: claim F1's conclusion holds ONE rung further, at the sedenion
-- level S = CD (O) where the base O is non-associative. This must be FALSE (it
-- contradicts the banked genNrm_not_mul_at_S). So asserting it lets us derive the
-- contradiction — the costume "F1 stays true at S" must fail to be provable.
-- We DEMONSTRATE the bite: assuming the multiplicative law at the witnesses gives 0=4.
example (hbad : CD.Nrm (zdX * zdY) = CD.Nrm zdX * CD.Nrm zdY) : False :=
  genNrm_not_mul_at_S hbad

end Scratch
