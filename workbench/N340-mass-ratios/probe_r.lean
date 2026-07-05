import Phys.Algebra.LorentzContinuumSqrt
import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

-- r = cutSqrt(3 - 3*p*p), p bracketed. Get r bracket.
-- v = 3-3p² ∈ [3-3(975411/1e6)², 3-3(975410/1e6)²] = [0.145720143.., 0.145725995..]
-- r ∈ [381732/1e6, 381742/1e6]
example (p : Cut) (hplo : (975410:Cut)/1000000 ≤ p) (hphi : p ≤ 975411/1000000)
    (hppos : 0 < p) :
    (381732:Cut)/1000000 ≤ cutSqrt (3 - 3*p*p) ∧ cutSqrt (3 - 3*p*p) ≤ 381742/1000000 := by
  -- bound v = 3-3p²
  have hp2hi : p*p ≤ (975411:Cut)/1000000 * (975411/1000000) :=
    mul_le_mul hphi hphi (le_of_lt hppos) (by norm_num)
  have hp2lo : (975410:Cut)/1000000 * (975410/1000000) ≤ p*p :=
    mul_le_mul hplo hplo (by norm_num) (le_of_lt (by linarith))
  have hvpos : (0:Cut) ≤ 3 - 3*p*p := by nlinarith [hp2hi]
  have hx : 0 ≤ cutSqrt (3 - 3*p*p) := cutSqrt_nonneg _
  have hxx : cutSqrt (3 - 3*p*p) * cutSqrt (3 - 3*p*p) = 3 - 3*p*p := cutSqrt_sq hvpos
  constructor
  · nlinarith [hx, hxx, hp2hi]
  · nlinarith [hx, hxx, hp2lo]

end
end Phys.Algebra
