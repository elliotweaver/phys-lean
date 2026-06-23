/-
  Counterexamples.CountingClosesCostume — N7 ℕ-from-the-fold costume (must be
  REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for THE DERIVED COUNT, in the precise wrong shape the trunk
  rules out: claiming the count CLOSES — that two re-entries of the distinction
  return to the void, `step (step void) = void`. This is the period-2 fold-orbit
  (`fold_involutive`: on a FIXED carrier the look-back closes, `look² = id`)
  masquerading as the count itself.

  The whole content of `Phys/Foundation/Counting.lean` is that counting is the
  OPEN re-entry tower, strictly finer than the closing look-orbit
  (`count_transcends_fold_closure` : `step (step void) ≠ void`, from the Peano
  `step_ne_void`). The fold closing on a fixed carrier is exactly WHY the count
  must open at a fresh level — if the count instead closed at period 2, the
  re-entry tower would collapse to a finite cycle, "2" would equal "0", the
  successor would not be injective-and-missing-its-base, and `Re` would not carry
  ℕ at all (the vacuity/wrong-stop the battery exists to catch, docs/RUNBOOK.md
  W8). If a future node ever conflated the look-orbit (period-2) with the count
  (open), this is the move that would force the collapse in; the gate must
  REJECT the closing claim outright.

  Substituting nothing but the constructors' disjointness, the bogus equality
  reduces to `False` (`simp` discharges the cross-constructor equality to the
  `False` goal), so the proof below must FAIL to elaborate. The manifest's
  PASS_SIGNATURE matches the resulting `False` goal.
-/
import Phys.Foundation.Counting

namespace Counterexamples

open Phys.Foundation

/-- WRONG (GATE) CLAIM: that the count CLOSES at period 2 — `step (step void) =
    void` (the fold's closing look-orbit mistaken for the count). This is the
    literal negation of the banked `count_transcends_fold_closure`; the two
    re-entries are not the void, so `simp` reduces the goal to `False`. It must
    FAIL to elaborate. -/
theorem counting_closes_BOGUS : Re.step (Re.step Re.void) = Re.void := by
  simp

end Counterexamples
