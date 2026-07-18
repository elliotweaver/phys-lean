import Phys.Foundation.ContinuumBracket
import Mathlib.Tactic

namespace Phys.Probe
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

-- Heaviest upper cert obligations (measure cost): N=14 and N=12
theorem probe_b0_upper : (57 : Cut) / 10 ≤ partialExp (18 / 10 : Cut) 14 := by
  unfold partialExp expTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

theorem probe_dcb_upper : (7288 : Cut) / 100 ≤ partialExp (45 / 10 : Cut) 12 := by
  unfold partialExp expTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

-- lower cert with remainder: partialExp+rem <= c
theorem probe_b0_lower : partialExp (17 / 10 : Cut) 12 + expRemBound (17 / 10 : Cut) 12 ≤ (56 : Cut) / 10 := by
  unfold partialExp expTermC expRemBound
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

end
end Phys.Probe
