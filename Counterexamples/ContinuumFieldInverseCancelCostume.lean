/-
  Counterexamples.ContinuumFieldInverseCancelCostume — N13 ℝ-field-ops (Field Cut +
  IsStrictOrderedRing Cut) costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the MULTIPLICATIVE INVERSE CANCELLATION
  `x · x⁻¹ = 1` on the derived-ℚ completion `ContinuumQ.Cut`, in the precise wrong
  shape the FIELD structure forbids: claiming the cancellation product
  `sqrt2 · (pinv √2)` CONTAINS the value `1` — i.e. that `√2 · √2⁻¹ ≥ 1` (the inverse
  cut would OVERSHOOT, failing to cancel to exactly the unit).

  The load-bearing theorem of `Phys/Foundation/ContinuumFieldInverse.lean` is
  `mul_pinv_cancel` (`x * (pinv x) = 1` for `x > 0`) — the multiplicative analogue of
  the additive inverse `add_neg_self`, where the C6 ETERNAL APPROACH (the multiplicative
  approximation `mul_approx`) is load-bearing. By it, the cancellation cut IS
  `1 = Qcut 1 = {q | q < 1}`, an OPEN lower cut that contains NO element `≥ 1`. If the
  cancellation cut contained `1`, the reflect-and-reciprocate inverse would overshoot —
  `mul_pinv_cancel` would be false, there would be no `Field Cut`, and the multiplicative
  inverse would fail to invert. The degenerate/non-inverting error the construction exists
  to rule out (docs/RUNBOOK.md W8).

  Rewriting by the banked `mul_pinv_cancel`, the claim `(sqrt2 * (pinv …)).S 1`
  reduces (`Qcut` is `{q | q < a}`) to `(1 : Q) < 1`, impossible. The proof below must
  FAIL to elaborate; the manifest's PASS_SIGNATURE matches the resulting `1 < 1` goal.
-/
import Phys.Foundation.ContinuumFieldInverse
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation
open Phys.Foundation.ContinuumQ

/-- WRONG CLAIM: that the inverse-cancellation cut `sqrt2 * (pinv √2)` contains the
    value `1` — `(sqrt2 * (pinv zero_lt_sqrt2)).S 1`. By the banked `mul_pinv_cancel`
    this cut is `1 = Qcut 1 = {q | q < 1}`, so the claim reduces to `(1 : Q) < 1`,
    impossible. It must FAIL to elaborate. -/
theorem inverse_cancel_contains_one_BOGUS : (sqrt2 * (pinv zero_lt_sqrt2)).S 1 := by
  rw [mul_pinv_cancel zero_lt_sqrt2]
  show (1 : Q) < 1

end Counterexamples
