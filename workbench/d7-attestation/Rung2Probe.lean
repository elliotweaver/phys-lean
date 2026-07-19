import Phys.Algebra.D7CompositionAttestation
import Phys.Algebra.NarrowedBracket4
import Phys.Algebra.NarrowedBracket11
import Mathlib.Tactic

namespace Phys.Algebra.Rung2Probe

open Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- W9 COST PROBE: the deepest exp cert (mb, N=29 lower / N=30 upper) with 15-digit rationals.
-- Measures whether norm_num [Nat.factorial] on partialExp at N=30 with big numerators fits 2M.

set_option maxHeartbeats 2000000 in
theorem probe_mb_lower :
    (4089306640006 : Cut) / 1000000000000 ≤ cutLog (1000000000000000 / 16750843898062) := by
  apply cutLog_ge_certified (1000000000000000 / 16750843898062) (4089306640006 / 1000000000000) 29
    (by norm_num) (by norm_num)
  show partialExp (4089306640006 / 1000000000000 : Cut) 29
      + expRemBound (4089306640006 / 1000000000000 : Cut) 29
    ≤ (1000000000000000 : Cut) / 16750843898062
  unfold partialExp expTermC expRemBound
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

set_option maxHeartbeats 2000000 in
theorem probe_mb_upper :
    cutLog (1000000000000000 / 16750843898049) ≤ (4089306640008 : Cut) / 1000000000000 := by
  apply cutLog_le_certified (1000000000000000 / 16750843898049) (4089306640008 / 1000000000000) 30
    (by norm_num) (by norm_num)
  show (1000000000000000 : Cut) / 16750843898049
      ≤ partialExp (4089306640008 / 1000000000000 : Cut) 30
  unfold partialExp expTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

end

end Phys.Algebra.Rung2Probe
