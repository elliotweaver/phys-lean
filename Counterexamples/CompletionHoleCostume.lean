/-
  Counterexamples.CompletionHoleCostume — N6-pre continuum-gate increment-2 costume
  (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for THE COMPLETION, in the precise wrong shape the gate names:
  claiming the completion's derived √2 cut SWALLOWS the boundary `3/2`, i.e.
  `sqrt2.S (3/2)`.

  `sqrt2` (`Phys/Foundation/CompletionContinuum.lean`) is the DERIVED √2 — the banked
  canonical gather `sqrtTwoGather` packaged as a completion element. Its lower set is
  exactly `{q | q ≤ 0 ∨ q² < 2}`, the approximants from below to the point whose square
  is `2`. The boundary `3/2` is NOT below √2: `(3/2)² = 9/4 > 2`. If `sqrt2.S (3/2)`
  compiled, the derived √2 would contain a point past the gap — it would be an
  all-swallowing fake, not the genuine √2 coherence point, and the claim that "the
  completion fills the banked miss with the derived √2" (`sqrt2_fills_gap`) would be
  vacuous. It is also the exact shape a future node would use to assert "the completion
  still has the √2 hole at 3/2," or to silently re-pose the ground's failure as the
  completion's. The gate must REJECT it (docs/RUNBOOK.md W8 — anti-vacuity).

  Unfolding `sqrt2.S (3/2)` to `(3/2 : ℚ) ≤ 0 ∨ (3/2)² < 2` and discharging the false
  disjuncts (`3/2 > 0` and `(3/2)² = 9/4 ≥ 2`) leaves the goal `False`, so the proof
  below must FAIL to elaborate. The manifest's PASS_SIGNATURE matches the `False` goal.
-/
import Phys.Foundation.CompletionContinuum
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation

/-- WRONG (GATE) CLAIM: that the completion's derived √2 cut contains the boundary
    `3/2` — `sqrt2.S (3/2)`. This unfolds to `(3/2 : ℚ) ≤ 0 ∨ (3/2)² < 2`; both
    disjuncts are false (`3/2 > 0`, `(3/2)² = 9/4 > 2`), so the goal reduces to
    `False`. It must FAIL to elaborate. -/
theorem completion_hole_BOGUS : sqrt2.S (3 / 2) := by
  show sqrtTwoGather (3 / 2)
  unfold sqrtTwoGather
  norm_num

end Counterexamples
