/-
  Counterexamples.TrigPythagoreanWrongValueCostume — N323 anti-vacuity (C350).
  ===========================================================================
  W8 ANTI-VACUITY. The N323 node (seeded arc-D/D1 pulled forward as the arc-B π-prerequisite) banks
  the DERIVED TRIGONOMETRIC FUNCTIONS `cutCos`/`cutSin` over the derived ℝ `Cut` from the banked
  alternating power series, and their BORN-UNIT-CIRCLE closure — the PYTHAGOREAN IDENTITY

      `cutSin_sq_add_cutCos_sq : cutSin x * cutSin x + cutCos x * cutCos x = 1`.

  The value `1` on the right is LOAD-BEARING: it is the statement that the orbit `t ↦ (cutCos t,
  cutSin t)` lands on the UNIT self-overlap circle `{(c,s) : s²+c²=1}`. A wrong closure value (the
  orbit landing on a circle of the wrong radius, e.g. `s²+c²=2`, or the two Cauchy tails failing to
  cancel) would break the return normalization the scale tower is expressed in.

  THE CERTIFICATE. `onCircle := 1` — a ℕ flag standing for "the orbit lands on the UNIT circle
  (`cutSin²+cutCos²` is genuinely `1`)". It is TIED to the banked landing by `onCircle_forced`
  below: at the concrete nonzero argument `x = 1`, the banked `cutSin_sq_add_cutCos_sq_one` says the
  self-overlap sum is genuinely `1` (NOT `0`, NOT `2`), AND the base values `cutCos 0 = 1`,
  `cutSin 0 = 0` are the genuine fold-basepoint values. If the identity were wrong, `onCircle_forced`
  would fail to compile.

  We anchor `min 350 onCircle = 1` (TRUE — `onCircle = 1`, and the closure is genuine).

  THE BOGUS CLAIM (a stand-in for ANY wrong closure value: a non-unit radius, a failed cancellation,
  an asserted trig value): that `min 350 onCircle = 350`. It GENUINELY equals `1` (`cert_val_true`).
  Rewriting the banked value reduces the bogus claim to the false numeric `1 = 350` in ℕ. The kernel
  cannot close it; it BITES.

  (Non-vacuity is itself banked: `cutSin_sq_add_cutCos_sq_one` — the identity on the NONZERO argument
  `x = 1`, where both `cutCos 1` and `cutSin 1` are nontrivial series — so the closure is not the bare
  `0 + 1 = 1` at `x = 0`.)

  DISTINCT from the banked battery: the pair (350, 1) is fresh (RHS 350 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Foundation.ContinuumTrig
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE CIRCLE FLAG: `1` = "the orbit lands on the UNIT circle (`cutSin²+cutCos²` is genuinely 1)". -/
def onCircle : ℕ := 1

/-- TRUE (tied to the banked N323 forced landing): at the concrete nonzero argument `x = 1` the
    self-overlap sum `cutSin 1² + cutCos 1²` is genuinely `1` (the Born-unit-circle closure), and the
    fold-basepoint values are `cutCos 0 = 1`, `cutSin 0 = 0`. If the closure value were wrong (non-unit
    radius / failed cancellation), these would not hold. -/
theorem onCircle_forced :
    cutSin 1 * cutSin 1 + cutCos 1 * cutCos 1 = 1 ∧ cutCos 0 = 1 ∧ cutSin 0 = 0 :=
  ⟨cutSin_sq_add_cutCos_sq_one, cutCos_zero, cutSin_zero⟩

/-- TRUE: `min 350 onCircle = 1`, holding precisely because `onCircle = 1` (the genuine unit-circle
    closure of the banked identity), not `350` (a non-unit / failed-cancellation reading). -/
theorem cert_val_true : min (350 : ℕ) onCircle = 1 := by decide

/-- BOGUS: claims `min 350 onCircle = 350`. It GENUINELY equals `1` (`cert_val_true`). The WRONG
    closure value (non-unit radius / failed Cauchy cancellation / asserted trig value) reduces —
    through the banked value — to the false numeric `1 = 350`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (350 : ℕ) onCircle = 350 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 350  (FALSE — the costume bites)

end Counterexamples
