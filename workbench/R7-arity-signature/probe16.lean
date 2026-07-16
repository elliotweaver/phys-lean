import Phys.Algebra.Alternative
import Phys.Algebra.DerivationFinrank
import Phys.Cascade.ForcedStop
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option maxHeartbeats 4000000

-- a * star a = iota (Nrm a)  is banked (selfMul). Now: iota c for c : H ℚ is in span{1}? NO,
-- iota embeds H ℚ into O ℚ as the imaginary part -> that is NOT a scalar multiple of 1.
-- Wait: selfMul gives z*star z = iota(Nrm z). Nrm z : H ℚ. iota (Nrm z) : O ℚ.
-- Is iota(Nrm z) a ℚ-multiple of 1? Only if Nrm z is a ℚ-multiple of (1:H ℚ). Check Nrm z form.

-- Probe: is a*star a always a scalar multiple of (1:O ℚ)?  i.e. does a*star a ∈ span{1}?
example (a : O ℚ) : ∃ c : ℚ, a * star a = c • (1 : O ℚ) := by
  refine ⟨(a * star a).re.re.re, ?_⟩
  ext <;>
    simp only [cd_qsmul_re, cd_qsmul_im, mul_re, mul_im, star_re, star_im,
      one_re, one_im, star_neg, neg_re, neg_im, star_add, star_mul', star_star,
      neg_mul, mul_neg, neg_neg, add_re, add_im, smul_eq_mul, mul_one, mul_zero] <;>
    ring

end Phys.Algebra
