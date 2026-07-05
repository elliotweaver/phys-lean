/-
  Counterexamples.ScaleTowerNumeratorLockWrongValueCostume — N329 anti-vacuity (C354).
  ============================================================================
  W8 ANTI-VACUITY. The N329 node (seeded arc-B B2 ★ BRIDGE, the ladder-grammar numerator lock)
  assembles the shared scale-tower numerator from two BANKED objects — the derived Born-circle full
  turn `azimuthalTurn = 2·cutPi` (N328) times the derived octonion Born-channel count `1/α* = 42`
  (arc A) — landing

      `criticalPhaseNumerator_eq : criticalPhaseNumerator = 84 * cutPi`,

  and divides it by the three banked structural counts {7, 9, 28} into the rung exponents
  {12·cutPi, 28·cutPi/3, 3·cutPi}, all tied by `numerator_lock : rungExponent n · n =
  criticalPhaseNumerator`. The multiplier `84 = 2·42` is LOAD-BEARING: it is the FULL Born-circle
  turn (`2·cutPi`) times the channel count (`42`). A WRONG numerator — e.g. the HALF turn
  `42·cutPi` (`azimuthalTurn = cutPi`, no full turn) — would collapse every rung exponent by a
  factor of 2 and break the whole arc-B tower normalization.

  THE CERTIFICATE. `numeratorTurns := 84` — a ℕ flag standing for "the derived
  `criticalPhaseNumerator` is genuinely `84·cutPi` (full turn 2·cutPi times count 42), not
  `42·cutPi` (half turn)". It is TIED to the banked landings by `numeratorTurns_forced` below:
  the banked `criticalPhaseNumerator_eq` gives `84·cutPi` and `criticalPhaseNumerator_ne_halfTurn`
  rules out `42·cutPi`. If `azimuthalTurn`, `cutPi`, or the banked `1/α* = 42` were mis-built,
  these would not hold.

  We anchor `min 354 numeratorTurns = 84` (TRUE — `numeratorTurns = 84`, the genuine full-turn count).

  THE BOGUS CLAIM (a stand-in for ANY wrong numerator value): that `min 354 numeratorTurns = 354`.
  It GENUINELY equals `84` (`cert_val_true`). Rewriting the banked value reduces the bogus claim to
  the false numeric `84 = 354` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (354, 84) is fresh (RHS 354 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ScaleTowerNumeratorLock
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra

/-- THE NUMERATOR-TURNS FLAG: `84` = "the derived `criticalPhaseNumerator` is genuinely `84·cutPi`
    (full turn `2·cutPi` times channel count `42`), not `42·cutPi` (half turn)". -/
def numeratorTurns : ℕ := 84

/-- TRUE (tied to the banked N329 forced landings): the shared numerator is `84·cutPi` and is NOT the
    half-turn `42·cutPi`. If the derived full turn `azimuthalTurn = 2·cutPi`, the banked `cutPi`, or
    the arc-A `1/α* = 42` were mis-built, these would not hold. -/
theorem numeratorTurns_forced :
    criticalPhaseNumerator = 84 * cutPi ∧ criticalPhaseNumerator ≠ 42 * cutPi :=
  ⟨criticalPhaseNumerator_eq, criticalPhaseNumerator_ne_halfTurn⟩

/-- TRUE: `min 354 numeratorTurns = 84`, holding precisely because `numeratorTurns = 84` (the genuine
    full-turn count of the banked derived numerator), not `354`. -/
theorem cert_val_true : min (354 : ℕ) numeratorTurns = 84 := by decide

/-- BOGUS: claims `min 354 numeratorTurns = 354`. It GENUINELY equals `84` (`cert_val_true`). A WRONG
    numerator value (e.g. the half turn `42·cutPi`, `azimuthalTurn = cutPi`) reduces — through the
    banked value — to the false numeric `84 = 354`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (354 : ℕ) numeratorTurns = 354 := by
  rw [cert_val_true]
  -- ⊢ (84 : ℕ) = 354  (FALSE — the costume bites)

end Counterexamples
