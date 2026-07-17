import Phys.Algebra.NarrowedBracket6

namespace Phys.Algebra.NarrowedBracket4
open Phys.Algebra Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

-- assume banked sharp products for structure; here just test the exp reads at index 27/30
-- over the m01 6dp bracket [3477472814/1e6, 3477472936/1e6].
set_option maxHeartbeats 1000000 in
theorem cutLog_lo_s5_PROBE : (815406110 / 100000000 : Cut) ≤ cutLog ((3477472814 : Cut) / 1000000) := by
  apply cutLog_ge_certified ((3477472814 : Cut) / 1000000) (815406110 / 100000000) 27 (by norm_num) (by norm_num)
  show partialExp (815406110 / 100000000) 27 + expRemBound (815406110 / 100000000) 27
    ≤ (3477472814 : Cut) / 1000000
  unfold partialExp expTermC expRemBound
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

set_option maxHeartbeats 1000000 in
theorem cutLog_hi_s5_PROBE : cutLog ((3477472936 : Cut) / 1000000) ≤ (815406115 / 100000000 : Cut) := by
  apply cutLog_le_certified ((3477472936 : Cut) / 1000000) (815406115 / 100000000) 30 (by norm_num) (by norm_num)
  show (3477472936 : Cut) / 1000000 ≤ partialExp (815406115 / 100000000) 30
  unfold partialExp expTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

end
end Phys.Algebra.NarrowedBracket4
