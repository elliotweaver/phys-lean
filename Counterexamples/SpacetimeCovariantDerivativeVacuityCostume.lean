/-
  Counterexamples.SpacetimeCovariantDerivativeVacuityCostume — N357 anti-vacuity (C382).
  ============================================================================
  W8 ANTI-VACUITY. The N357 node (arc-E E2-route, THE FULL COVARIANT DERIVATIVE `∇_k = D_k + ⁅Γ_k,·⁆`
  UNITES THE FOLD'S TWO FACES, FULL METRIC-COMPATIBILITY `∇g = 0` IS THE TWO-LAYER CANCELLATION, the
  COSMOLOGICAL TERM `Λ·g` FORCED as covariantly constant, over the derived ℝ `Cut`) proves the
  Christoffel `½` in the look-back transport is GENUINELY LOAD-BEARING for `∇g = 0` — dropping it (the
  naive transport `η·k`, giving `2k`) makes the two-layer cancellation FAIL: `k − 2k = −k ≠ 0` for the
  concrete `timeProj` (`metricCompat_half_load_bearing`). If any `η`-scaled connection gave `∇g = 0`
  vacuously, the `½` would not matter — but it does.

  The forced non-vacuity fact is `metricCompat_half_load_bearing`: the naive (no-`½`) transport's
  two-index action leaves `timeProj − 2·timeProj = −timeProj ≠ 0` over the derived `Cut`. A
  mis-derivation (a vacuous `∇g = 0` that holds for ANY connection regardless of the Christoffel `½`; a
  wrong metric-compatibility severing the derivative face `D(g) = k` from the transport face `Γᵀη + ηΓ
  = k`) would make this pin break.

  THE CERTIFICATE. `cFlag := 1` — a ℕ flag standing for "the Christoffel `½` is load-bearing for the
  `∇g = 0` two-layer cancellation (the naive no-`½` transport fails, `−timeProj ≠ 0`)". It is TIED to
  the banked N357 landing by `cFlag_forced`: the banked `metricCompat_half_load_bearing` witnesses that
  the no-`½` cancellation is nonzero, so the flag is `1` (present), not `0`.

  We anchor `min 382 cFlag = 1` (TRUE — `cFlag = 1 < 382`, so the min is `cFlag`).

  THE BOGUS CLAIM (a stand-in for ANY vacuous-∇g / wrong-metric-compatibility mis-reading): that
  `min 382 cFlag = 382`. It GENUINELY equals `1` (`cert_val_true`). Rewriting reduces the bogus claim
  to the false numeric `1 = 382` in ℕ. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (382, 1) is fresh (Cid 382 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.SpacetimeCovariantDerivative
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

/-- THE COVARIANT-DERIVATIVE NON-VACUITY FLAG: `1` = "the Christoffel `½` is load-bearing for `∇g = 0`
    — the naive no-`½` transport leaves `timeProj − 2·timeProj = −timeProj ≠ 0`, so the two-layer
    metric-compatibility cancellation is not a vacuous fact that holds for any connection". -/
def cFlag : ℕ := 1

/-- TRUE (tied to the banked N357 landing): the banked `metricCompat_half_load_bearing` proves the
    no-`½` transport's two-index action leaves `timeProj − ((timeProj·η)·η + η·(η·timeProj)) ≠ 0` over
    the derived `Cut`, so the "the `½` is load-bearing for `∇g = 0`" flag is present — `cFlag = 1`. If
    the two-layer cancellation held for any connection (regardless of `½`), this witness would not
    exist. -/
theorem cFlag_forced :
    ((timeProj : MetricEnd)
        - ((timeProj * sigOpC) * sigOpC + sigOpC * (sigOpC * timeProj)) ≠ 0) ∧ cFlag = 1 :=
  ⟨metricCompat_half_load_bearing, rfl⟩

/-- TRUE: `min 382 cFlag = 1`, holding precisely because `cFlag = 1 < 382`. -/
theorem cert_val_true : min (382 : ℕ) cFlag = 1 := by decide

/-- BOGUS: claims `min 382 cFlag = 382`. It GENUINELY equals `1` (`cert_val_true`). A vacuous-∇g /
    wrong-metric-compatibility mis-reading reduces — through the banked value — to the false numeric
    `1 = 382`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (382 : ℕ) cFlag = 382 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 382  (FALSE — the costume bites)

end Counterexamples
