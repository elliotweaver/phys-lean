import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ
noncomputable section

-- MEASURE (W9): products as abstract bounds, linarith without norm_num-at on Cut.
example (p w r : Cut)
    (hplo : (975410:Cut)/1000000 ≤ p) (hphi : p ≤ 975411/1000000)
    (hwlo : (1414213:Cut)/1000000 ≤ w) (hwhi : w ≤ 1414214/1000000)
    (hrlo : (381732:Cut)/1000000 ≤ r) (hrhi : r ≤ 381742/1000000) :
    (483:Cut)/100000 * (1 - w*(p-r)/2)^2 ≤ (1 - w*(p+r)/2)^2 := by
  have hppos : (0:Cut) < p := by linarith
  have hrpos : (0:Cut) < r := by linarith
  -- product brackets as opaque numerals (do NOT norm_num them)
  have hwphi : w*p ≤ 1382 / 1000 :=
    le_trans (mul_le_mul hwhi hphi (le_of_lt hppos) (by norm_num)) (by norm_num)
  have hwplo : (1379:Cut) / 1000 ≤ w*p :=
    le_trans (by norm_num) (mul_le_mul hwlo hplo (by norm_num) (le_of_lt (by linarith)))
  have hwrhi : w*r ≤ 5400 / 10000 :=
    le_trans (mul_le_mul hwhi hrhi (le_of_lt hrpos) (by norm_num)) (by norm_num)
  have hwrlo : (5398:Cut) / 10000 ≤ w*r :=
    le_trans (by norm_num) (mul_le_mul hwlo hrlo (by norm_num) (le_of_lt (by linarith)))
  sorry

end
end ContinuumQ
end Phys.Foundation
