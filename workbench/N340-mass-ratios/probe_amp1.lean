import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ
noncomputable section

-- amplitude bracket lemmas (each its own budget). b1=1-w(p+r)/2, b2=1-w(p-r)/2, a0=1+wp.
-- given p,w,r brackets. Product brackets internal via le_trans.
section amps
variable (p w r : Cut)

theorem b1_lo (hplo : (975410:Cut)/1000000 ≤ p) (hphi : p ≤ 975411/1000000)
    (hwlo : (1414213:Cut)/1000000 ≤ w) (hwhi : w ≤ 1414214/1000000)
    (hrlo : (381732:Cut)/1000000 ≤ r) (hrhi : r ≤ 381742/1000000) :
    (4034:Cut)/100000 ≤ 1 - w*(p+r)/2 := by
  have hppos : (0:Cut) < p := by linarith
  have hrpos : (0:Cut) < r := by linarith
  have hwphi : w*p ≤ (137944:Cut)/100000 :=
    le_trans (mul_le_mul hwhi hphi (le_of_lt hppos) (by norm_num)) (by norm_num)
  have hwrhi : w*r ≤ (53987:Cut)/100000 :=
    le_trans (mul_le_mul hwhi hrhi (le_of_lt hrpos) (by norm_num)) (by norm_num)
  have he : (1:Cut) - w*(p+r)/2 = 1 - (w*p + w*r)/2 := by ring
  rw [he]; linarith

end amps

end
end ContinuumQ
end Phys.Foundation
