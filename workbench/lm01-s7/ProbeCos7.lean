import Phys.Algebra.NarrowedBracket11

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Algebra
noncomputable section

-- PROBE: cost of partialCos (2/9) 7 evaluation (one term beyond banked six)
set_option maxHeartbeats 2000000 in
theorem partialCos_two_ninths_seven_PROBE :
    partialCos (2 / 9 : Cut) 7 = 128864817323146777 / 132113476427399775 := by
  unfold partialCos cosTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

end
end ContinuumQ
end Phys.Foundation
