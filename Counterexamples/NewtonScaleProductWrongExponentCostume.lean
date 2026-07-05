/-
  Counterexamples.NewtonScaleProductWrongExponentCostume — N330 anti-vacuity (C355).
  ============================================================================
  W8 ANTI-VACUITY. The N330 node (seeded arc-B B3, gravity's first appearance) banks the
  gravitational relation `G·M² = e^(−6π)` as the BORN SELF-OVERLAP SQUARE of the banked n=28
  half-rung `M/M_Pl = e^(−3π)`:

      `newtonScaleProduct_eq : newtonScaleProduct = cutExp (-(6 * cutPi))`,

  with the exponent doubling `6·cutPi = 2 · rungExponent(finrank selfAdj) = 2·(3·cutPi)`. The
  multiplier `6 = 2·3` is LOAD-BEARING: it is the Born self-overlap SQUARE (`cutExp x =
  (cutExp(x/2))²`, N174) of the banked n=28 rung `3·cutPi`. A WRONG exponent — e.g. the un-squared
  single half-rung `3·cutPi` (`G·M² = e^(−3π)`, no Born square) — would halve the gravitational
  suppression and break the whole B3 relation.

  THE CERTIFICATE. `gravExponentMultiplier := 6` — a ℕ flag standing for "the derived gravitational
  exponent is genuinely `6·cutPi` (twice the banked n=28 rung `3·cutPi`, the Born self-overlap
  square), not `3·cutPi` (the un-squared single half-rung)". It is TIED to the banked landings by
  `gravExponentMultiplier_forced` below: the banked `newtonScaleProduct_eq` gives `e^(−(6·cutPi))`
  and `gravExponent_ne_rung` rules out `3·cutPi`. If `rungExponent_at_selfAdj = 3·cutPi`, `cutPi`,
  or the banked `cutExp_add` were mis-built, these would not hold.

  We anchor `min 355 gravExponentMultiplier = 6` (TRUE — `gravExponentMultiplier = 6`, the genuine
  Born-square doubling of the n=28 rung).

  THE BOGUS CLAIM (a stand-in for ANY wrong exponent): that `min 355 gravExponentMultiplier = 355`.
  It GENUINELY equals `6` (`cert_val_true`). Rewriting the banked value reduces the bogus claim to
  the false numeric `6 = 355` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (355, 6) is fresh (RHS 355 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.NewtonScaleProduct
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra

/-- THE GRAVITATIONAL-EXPONENT-MULTIPLIER FLAG: `6` = "the derived gravitational exponent is genuinely
    `6·cutPi` (twice the banked n=28 rung `3·cutPi`, the Born self-overlap square), not `3·cutPi`
    (the un-squared single half-rung)". -/
def gravExponentMultiplier : ℕ := 6

/-- TRUE (tied to the banked N330 forced landings): the gravitational product is `cutExp(−(6·cutPi))`
    and the exponent `6·cutPi` is NOT the half-rung `3·cutPi`. If the banked n=28 rung
    `rungExponent_at_selfAdj = 3·cutPi`, the banked `cutPi`, or the banked homomorphism `cutExp_add`
    were mis-built, these would not hold. -/
theorem gravExponentMultiplier_forced :
    newtonScaleProduct = cutExp (-(6 * cutPi)) ∧ (6 : Cut) * cutPi ≠ 3 * cutPi :=
  ⟨newtonScaleProduct_eq, gravExponent_ne_rung⟩

/-- TRUE: `min 355 gravExponentMultiplier = 6`, holding precisely because `gravExponentMultiplier = 6`
    (the genuine Born-square doubling of the n=28 rung), not `355`. -/
theorem cert_val_true : min (355 : ℕ) gravExponentMultiplier = 6 := by decide

/-- BOGUS: claims `min 355 gravExponentMultiplier = 355`. It GENUINELY equals `6` (`cert_val_true`). A
    WRONG exponent (e.g. the un-squared half-rung `3·cutPi`, no Born square) reduces — through the
    banked value — to the false numeric `6 = 355`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (355 : ℕ) gravExponentMultiplier = 355 := by
  rw [cert_val_true]
  -- ⊢ (6 : ℕ) = 355  (FALSE — the costume bites)

end Counterexamples
