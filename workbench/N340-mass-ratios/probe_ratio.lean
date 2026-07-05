import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ
noncomputable section

-- MEASURE (W9): clean decomposed route via explicit product brackets.
example (p w r : Cut)
    (hplo : (975410:Cut)/1000000 ≤ p) (hphi : p ≤ 975411/1000000)
    (hwlo : (1414213:Cut)/1000000 ≤ w) (hwhi : w ≤ 1414214/1000000)
    (hrlo : (381732:Cut)/1000000 ≤ r) (hrhi : r ≤ 381742/1000000) :
    (483:Cut)/100000 * (1 - w*(p-r)/2)^2 ≤ (1 - w*(p+r)/2)^2 := by
  have hwpos : (0:Cut) < w := by linarith
  have hppos : (0:Cut) < p := by linarith
  have hrpos : (0:Cut) < r := by linarith
  -- product brackets
  have hwphi : w*p ≤ (1414214:Cut)/1000000 * (975411/1000000) :=
    mul_le_mul hwhi hphi (le_of_lt hppos) (by norm_num)
  have hwplo : (1414213:Cut)/1000000 * (975410/1000000) ≤ w*p :=
    mul_le_mul hwlo hplo (by norm_num) (le_of_lt (by linarith))
  have hwrhi : w*r ≤ (1414214:Cut)/1000000 * (381742/1000000) :=
    mul_le_mul hwhi hrhi (le_of_lt hrpos) (by norm_num)
  have hwrlo : (1414213:Cut)/1000000 * (381732/1000000) ≤ w*r :=
    mul_le_mul hwlo hrlo (by norm_num) (le_of_lt (by linarith))
  -- amplitude brackets. b1 = 1 - (w*p + w*r)/2 ;  b2 = 1 - (w*p - w*r)/2
  have hexp1 : 1 - w*(p+r)/2 = 1 - (w*p + w*r)/2 := by ring
  have hexp2 : 1 - w*(p-r)/2 = 1 - (w*p - w*r)/2 := by ring
  have hb1lo : (40347:Cut)/1000000 ≤ 1 - w*(p+r)/2 := by rw [hexp1]; norm_num at hwphi hwrhi ⊢; linarith
  have hb1pos : (0:Cut) < 1 - w*(p+r)/2 := by linarith
  have hb2hi : 1 - w*(p-r)/2 ≤ (58022:Cut)/100000 := by rw [hexp2]; norm_num at hwplo hwrhi ⊢; linarith
  have hb2lo : (5802:Cut)/10000 ≤ 1 - w*(p-r)/2 := by rw [hexp2]; norm_num at hwphi hwrlo ⊢; linarith
  have hb2pos : (0:Cut) < 1 - w*(p-r)/2 := by linarith
  -- square-monotone + ratio
  have hb1sq : (40347:Cut)/1000000 * (40347/1000000) ≤ (1 - w*(p+r)/2)^2 := by
    have := mul_le_mul hb1lo hb1lo (by norm_num) (le_of_lt hb1pos); nlinarith [this]
  have hb2sq : (1 - w*(p-r)/2)^2 ≤ (58022:Cut)/100000 * (58022/100000) := by
    have := mul_le_mul hb2hi hb2hi (le_of_lt hb2pos) (by norm_num); nlinarith [this]
  nlinarith [hb1sq, hb2sq]

end
end ContinuumQ
end Phys.Foundation
