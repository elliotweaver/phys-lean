import Phys.Cascade.ForcedStop
import Mathlib.Tactic
open Phys.Cascade

-- CANDIDATE A: weaken hypothesis to bare Ring (non-commutative inner base). Should FAIL:
-- commutativity of B is load-bearing for the forward law.
namespace CandA
theorem bogus {B : Type*} [Ring B] [StarRing B]
    (x y : CD (CD B)) : CD.Nrm (x * y) = CD.Nrm x * CD.Nrm y := by
  rw [CD.Nrm_def, CD.Nrm_def, CD.Nrm_def]
  ext <;>
    simp only [CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
      CD.neg_re, CD.neg_im, star_add, star_neg, star_mul', star_star, neg_mul,
      mul_neg, neg_neg, add_mul, mul_add] <;>
    ring
end CandA
