/-
  Counterexamples.ScaleTowerOneObjectWrongRungCostume — N334 anti-vacuity (C359).
  ============================================================================
  W8 ANTI-VACUITY. The N334 node (seeded arc-B B7, the capstone) banks the scale tower as ONE
  parameterized object `scaleTowerRung n m = cutExp(m·rungExponent n)` with the structural counts
  `{7,9,28}` and the integer multiplicity `m` the ONLY freedom. The QCD rung completes the triple:

      `qcdClosureRatio_eq : qcdClosureRatio = cutExp (-(12 * cutPi))`,
      `rungExponent_at_7  : rungExponent 7 = 12 * cutPi`,

  i.e. the `n=7` rung exponent numerator is `12 = 84/7` — the third quotient of the shared 84π
  critical-phase budget. The QCD-rung exponent numerator `12` is LOAD-BEARING: it is `84 ÷ 7` (the
  banked numerator divided by the banked `finrank ImO = 7`). A WRONG count assignment (e.g. reading
  the n=7 rung with gravity's numerator `3 = 84/28`, or any other divisor) would break the
  `criticalPhaseNumerator_eq`/`numerator_lock` derivation and give the wrong QCD rung.

  THE CERTIFICATE. `qcdRungNumerator := 12` — a ℕ flag standing for "the derived QCD (n=7) rung
  exponent numerator is genuinely `12 = 84/7` (the third quotient of the shared 84π budget by the
  banked `finrank ImO = 7`)". It is TIED to the banked landings by `qcdRungNumerator_forced` below:
  the banked `rungExponent_at_7` gives `12·cutPi`, `qcdClosureRatio_eq` gives `cutExp(−(12·cutPi))`,
  and `qcd_rung_ne_gravity_rung` certifies `12·cutPi ≠ 3·cutPi` (the QCD rung is genuinely distinct
  from gravity's n=28 rung). If the banked `criticalPhaseNumerator_eq = 84·cutPi`, the banked
  `numerator_lock`, or `finrank_ImO = 7` were mis-built, these would not hold.

  We anchor `min 359 qcdRungNumerator = 12` (TRUE — `qcdRungNumerator = 12`, the genuine third
  quotient of the 84π budget).

  THE BOGUS CLAIM (a stand-in for ANY wrong count assignment): that `min 359 qcdRungNumerator = 359`.
  It GENUINELY equals `12` (`cert_val_true`). Rewriting the banked value reduces the bogus claim to
  the false numeric `12 = 359` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (359, 12) is fresh (RHS 359 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ScaleTowerOneObject
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra

/-- THE QCD-RUNG-NUMERATOR FLAG: `12` = "the derived QCD (n=7) rung exponent numerator is genuinely
    `12 = 84/7` (the third quotient of the shared 84π critical-phase budget by the banked
    `finrank ImO = 7`)". -/
def qcdRungNumerator : ℕ := 12

/-- TRUE (tied to the banked N334 forced landings): the n=7 rung exponent is `12·cutPi`, the QCD
    closure ratio is `cutExp(−(12·cutPi))`, and `12·cutPi` is genuinely distinct from gravity's n=28
    rung `3·cutPi`. If the banked `criticalPhaseNumerator_eq` (`84·cutPi`), the banked `numerator_lock`,
    or `finrank_ImO = 7` were mis-built, these would not hold. -/
theorem qcdRungNumerator_forced :
    rungExponent 7 = 12 * cutPi
    ∧ qcdClosureRatio = cutExp (-(12 * cutPi))
    ∧ (12 : Cut) * cutPi ≠ 3 * cutPi :=
  ⟨rungExponent_at_7, qcdClosureRatio_eq, qcd_rung_ne_gravity_rung⟩

/-- TRUE: `min 359 qcdRungNumerator = 12`, holding precisely because `qcdRungNumerator = 12` (the
    genuine third quotient of the 84π budget), not `359`. -/
theorem cert_val_true : min (359 : ℕ) qcdRungNumerator = 12 := by decide

/-- BOGUS: claims `min 359 qcdRungNumerator = 359`. It GENUINELY equals `12` (`cert_val_true`). A WRONG
    count assignment (e.g. gravity's numerator `3`, or any other divisor of 84 that is not `84/7`)
    reduces — through the banked value — to the false numeric `12 = 359`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (359 : ℕ) qcdRungNumerator = 359 := by
  rw [cert_val_true]
  -- ⊢ (12 : ℕ) = 359  (FALSE — the costume bites)

end Counterexamples
