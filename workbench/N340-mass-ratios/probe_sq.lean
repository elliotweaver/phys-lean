import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ
noncomputable section

-- ONE direction, default budget, products+amps GIVEN as atoms (b1,b2 abstract).
-- This measures ONLY the square-monotone + ratio combination cost.
example (b1 b2 : Cut)
    (hb1lo : (4034:Cut)/100000 ≤ b1) (hb1pos : (0:Cut) < b1)
    (hb2hi : b2 ≤ (58022:Cut)/100000) (hb2pos : (0:Cut) < b2) :
    (483:Cut)/100000 * b2^2 ≤ b1^2 := by
  have hb1sqlo : (4034:Cut)/100000 * (4034/100000) ≤ b1^2 := by
    have := mul_le_mul hb1lo hb1lo (by norm_num) (le_of_lt hb1pos); nlinarith [this]
  have hb2sqhi : b2^2 ≤ (58022:Cut)/100000 * (58022/100000) := by
    have := mul_le_mul hb2hi hb2hi (le_of_lt hb2pos) (by norm_num); nlinarith [this]
  nlinarith [hb1sqlo, hb2sqhi]

end
end ContinuumQ
end Phys.Foundation
