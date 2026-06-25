/-
  Counterexamples.ContinuumCCLOWrongSupCostume — N33 costume (must be REJECTED).
  ===========================================================================
  N33 banks that the derived ℝ `ContinuumQ.Cut` is a `ConditionallyCompleteLinearOrder`:
  every nonempty bounded-above set of cuts has its union cut as LEAST UPPER BOUND
  (`isLUB_csSupCut`). In particular the supremum of a singleton is that point:
  `sSup {0} = 0` (the LUB of `{0}` is `0`, and `IsLUB.unique` pins `sSup {0}` to it).

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the supremum of the
  nonempty bounded set `{0}` equals `1` instead of `0`. The banked completeness
  `isLUB_csSupCut` (with `isLUB_singleton` + `IsLUB.unique`) proves `sSup {0} = 0`, so the
  bogus claim collapses to `0 = 1`, which cannot be discharged. If the completeness theorem
  were FALSE or VACUOUS — if `isLUB_csSupCut` did not genuinely identify the union cut as the
  least upper bound — this costume could not be forced to `0 = 1`; W8 demands it bite.
  (A supremum that does not agree with the obvious least upper bound of a singleton is exactly
  a broken completeness, the whole content of the `ConditionallyCompleteLinearOrder` rung.)

  The manifest's PASS_SIGNATURE matches the elaboration error below (`⊢ 0 = 1`).
-/
import Phys.Foundation.ContinuumCCLO

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-- WRONG: claiming the supremum of the nonempty bounded set `{0}` is `1`. The banked
    completeness `isLUB_csSupCut` (via `isLUB_singleton` + `IsLUB.unique`) proves it is `0`,
    so the claim reduces to `0 = 1`. Must FAIL to compile. -/
theorem sSup_singleton_BOGUS : sSup ({0} : Set Cut) = 1 := by
  have hne : ({0} : Set Cut).Nonempty := ⟨0, rfl⟩
  have hbdd : BddAbove ({0} : Set Cut) := ⟨0, fun x hx => le_of_eq hx⟩
  have h0 : sSup ({0} : Set Cut) = 0 := (isLUB_csSupCut {0} hbdd hne).unique isLUB_singleton
  rw [h0]

end

end Counterexamples
