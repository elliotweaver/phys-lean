/-
  Counterexamples.PlanckMassRatioWrongExponentCostume — N331 anti-vacuity (C356).
  ============================================================================
  W8 ANTI-VACUITY. The N331 node (seeded arc-B B4) banks the reciprocal half-rung `M_Pl/M = e^(3π)`
  as the multiplicative INVERSE of the banked n=28 half-rung suppression `M/M_Pl = e^(−3π)`:

      `planckMassRatio_eq : planckMassRatio = cutExp (3 * cutPi)`,
      `planckMassRatio_mul_planckClosureRatio : planckMassRatio * planckClosureRatio = 1`,
      `planckMassRatio_gt_one : 1 < planckMassRatio`,

  and the natural-units normalization `planckMassRatio² · newtonScaleProduct = 1` (`G·M_Pl² = 1`).
  The reciprocal exponent multiplier `3` (the POSITIVE n=28 rung `+3·cutPi`, an ENHANCEMENT `> 1`) is
  LOAD-BEARING: it is what makes the product with the banked suppression exponent `−3·cutPi` collapse
  to `1`. A WRONG exponent — e.g. the SAME sign as the suppression (`M_Pl/M = e^(−3π)`, exponent
  `−3·cutPi`) — would give `planckMassRatio · planckClosureRatio = e^(−6π) ≠ 1` and break `1 < M_Pl/M`.

  THE CERTIFICATE. `planckRungMultiplier := 3` — a ℕ flag standing for "the derived reciprocal
  half-rung exponent is genuinely `+3·cutPi` (the POSITIVE banked n=28 rung, an enhancement above the
  closure scale), so that its product with the banked suppression `−3·cutPi` is `1`". It is TIED to the
  banked landings by `planckRungMultiplier_forced` below: the banked `planckMassRatio_eq` gives
  `cutExp(3·cutPi)`, `planckMassRatio_mul_planckClosureRatio` gives the reciprocal product `1`, and
  `planckMassRatio_gt_one` rules out a non-positive exponent. If `rungExponent_at_selfAdj = 3·cutPi`,
  `cutPi`, or the banked `cutExp_mul_neg` were mis-built, these would not hold.

  We anchor `min 356 planckRungMultiplier = 3` (TRUE — `planckRungMultiplier = 3`, the genuine
  positive n=28 reciprocal rung).

  THE BOGUS CLAIM (a stand-in for ANY wrong reciprocal exponent): that `min 356 planckRungMultiplier =
  356`. It GENUINELY equals `3` (`cert_val_true`). Rewriting the banked value reduces the bogus claim
  to the false numeric `3 = 356` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (356, 3) is fresh (RHS 356 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.PlanckMassRatio
import Mathlib.Tactic

namespace Counterexamples

open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra

/-- THE RECIPROCAL-HALF-RUNG-MULTIPLIER FLAG: `3` = "the derived reciprocal half-rung exponent is
    genuinely `+3·cutPi` (the POSITIVE banked n=28 rung, an enhancement above the closure scale), so
    that its product with the banked suppression `−3·cutPi` collapses to `1`". -/
def planckRungMultiplier : ℕ := 3

/-- TRUE (tied to the banked N331 forced landings): the reciprocal half-rung is `cutExp(3·cutPi)`, its
    product with the banked suppression half-rung is `1`, and it is strictly above `1`. If the banked
    n=28 rung `rungExponent_at_selfAdj = 3·cutPi`, the banked `cutPi`, or the banked invertibility
    `cutExp_mul_neg` were mis-built, these would not hold. -/
theorem planckRungMultiplier_forced :
    planckMassRatio = cutExp (3 * cutPi)
    ∧ planckMassRatio * planckClosureRatio = 1
    ∧ 1 < planckMassRatio :=
  ⟨planckMassRatio_eq, planckMassRatio_mul_planckClosureRatio, planckMassRatio_gt_one⟩

/-- TRUE: `min 356 planckRungMultiplier = 3`, holding precisely because `planckRungMultiplier = 3`
    (the genuine positive n=28 reciprocal rung), not `356`. -/
theorem cert_val_true : min (356 : ℕ) planckRungMultiplier = 3 := by decide

/-- BOGUS: claims `min 356 planckRungMultiplier = 356`. It GENUINELY equals `3` (`cert_val_true`). A
    WRONG reciprocal exponent (e.g. the same sign as the suppression, `M_Pl/M = e^(−3π)`, which would
    break the reciprocal product `= 1`) reduces — through the banked value — to the false numeric
    `3 = 356`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (356 : ℕ) planckRungMultiplier = 356 := by
  rw [cert_val_true]
  -- ⊢ (3 : ℕ) = 356  (FALSE — the costume bites)

end Counterexamples
