import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ
noncomputable section

-- isolate the amplitude-bracket linarith step
example (wp wr : Cut)
    (hwphi : wp ≤ (137944:Cut)/100000) (hwplo : (137943:Cut)/100000 ≤ wp)
    (hwrhi : wr ≤ (53987:Cut)/100000) (hwrlo : (53984:Cut)/100000 ≤ wr) :
    (4034:Cut)/100000 ≤ 1 - (wp + wr)/2 := by linarith

end
end ContinuumQ
end Phys.Foundation
