import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ
noncomputable section

-- test 1: positivity of p from bracket
example (p : Cut) (hplo : (975410:Cut)/1000000 ≤ p) : (0:Cut) < p := by linarith

-- test 2: product upper bound via le_trans
example (p w : Cut) (hppos : (0:Cut) < p)
    (hphi : p ≤ 975411/1000000) (hwhi : w ≤ 1414214/1000000)
    (hwlo : (1414213:Cut)/1000000 ≤ w) :
    w*p ≤ (137944:Cut)/100000 :=
  le_trans (mul_le_mul hwhi hphi (le_of_lt hppos) (by norm_num)) (by norm_num)

end
end ContinuumQ
end Phys.Foundation
