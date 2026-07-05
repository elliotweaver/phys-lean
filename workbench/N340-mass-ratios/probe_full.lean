import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ
noncomputable section

-- FULL probe: R1 = m1/m2 both sides, with clean route.
example (p w r : Cut)
    (hplo : (975410:Cut)/1000000 ≤ p) (hphi : p ≤ 975411/1000000)
    (hwlo : (1414213:Cut)/1000000 ≤ w) (hwhi : w ≤ 1414214/1000000)
    (hrlo : (381732:Cut)/1000000 ≤ r) (hrhi : r ≤ 381742/1000000) :
    (483:Cut)/100000 * (1 - w*(p-r)/2)^2 ≤ (1 - w*(p+r)/2)^2
      ∧ (1 - w*(p+r)/2)^2 ≤ (485:Cut)/100000 * (1 - w*(p-r)/2)^2 := by
  have hppos : (0:Cut) < p := by linarith
  have hrpos : (0:Cut) < r := by linarith
  -- product brackets (rounded, proven via le_trans; never norm_num a variable term)
  have hwphi : w*p ≤ (137944:Cut)/100000 :=
    le_trans (mul_le_mul hwhi hphi (le_of_lt hppos) (by norm_num)) (by norm_num)
  have hwplo : (137943:Cut)/100000 ≤ w*p :=
    le_trans (by norm_num) (mul_le_mul hwlo hplo (by norm_num) (le_of_lt (by linarith)))
  have hwrhi : w*r ≤ (53987:Cut)/100000 :=
    le_trans (mul_le_mul hwhi hrhi (le_of_lt hrpos) (by norm_num)) (by norm_num)
  have hwrlo : (53984:Cut)/100000 ≤ w*r :=
    le_trans (by norm_num) (mul_le_mul hwlo hrlo (by norm_num) (le_of_lt (by linarith)))
  -- amplitude brackets: b1 = 1-(wp+wr)/2, b2 = 1-(wp-wr)/2
  have he1 : (1:Cut) - w*(p+r)/2 = 1 - (w*p + w*r)/2 := by ring
  have he2 : (1:Cut) - w*(p-r)/2 = 1 - (w*p - w*r)/2 := by ring
  have hb1lo : (4034:Cut)/100000 ≤ 1 - w*(p+r)/2 := by rw [he1]; linarith
  have hb1hi : 1 - w*(p+r)/2 ≤ (40365:Cut)/1000000 := by rw [he1]; linarith
  have hb1pos : (0:Cut) < 1 - w*(p+r)/2 := by linarith
  have hb2lo : (5802:Cut)/10000 ≤ 1 - w*(p-r)/2 := by rw [he2]; linarith
  have hb2hi : 1 - w*(p-r)/2 ≤ (58022:Cut)/100000 := by rw [he2]; linarith
  have hb2pos : (0:Cut) < 1 - w*(p-r)/2 := by linarith
  -- square-monotone
  have hb1sqlo : (4034:Cut)/100000 * (4034/100000) ≤ (1 - w*(p+r)/2)^2 := by
    have := mul_le_mul hb1lo hb1lo (by norm_num) (le_of_lt hb1pos); nlinarith [this]
  have hb1sqhi : (1 - w*(p+r)/2)^2 ≤ (40365:Cut)/1000000 * (40365/1000000) := by
    have := mul_le_mul hb1hi hb1hi (le_of_lt hb1pos) (by norm_num); nlinarith [this]
  have hb2sqlo : (5802:Cut)/10000 * (5802/10000) ≤ (1 - w*(p-r)/2)^2 := by
    have := mul_le_mul hb2lo hb2lo (by norm_num) (le_of_lt hb2pos); nlinarith [this]
  have hb2sqhi : (1 - w*(p-r)/2)^2 ≤ (58022:Cut)/100000 * (58022/100000) := by
    have := mul_le_mul hb2hi hb2hi (le_of_lt hb2pos) (by norm_num); nlinarith [this]
  constructor
  · nlinarith [hb1sqlo, hb2sqhi]
  · nlinarith [hb1sqhi, hb2sqlo]

end
end ContinuumQ
end Phys.Foundation
