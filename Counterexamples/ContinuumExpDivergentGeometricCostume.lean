/-
  Counterexamples.ContinuumExpDivergentGeometricCostume — N39 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N39 POWER-SERIES-EXP convergence rung over the DERIVED ℝ
  `ContinuumQ.Cut`. N39 (part c·1) banks the scalar summability levers — among them
  `cut_summable_geometric : 0 ≤ r → r < 1 → Summable (fun n => rⁿ)` — and (part c·2) the matrix
  exponential series convergence `expTerm_summable`, whose majorant is exactly a geometric series
  with ratio STRICTLY below 1 (`c/M < 1` for an Archimedean `M > c`). The geometric series DIVERGES
  at ratio `1` — the boundary the exponential majorant rides just below — so the `r < 1` hypothesis
  is load-bearing, NOT decorative.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the geometric series at ratio
  `1` — i.e. the constant-one series `fun n => (1 : Cut)ⁿ`, manifestly DIVERGENT (its partial sums
  are `N`, unbounded by the Archimedean property N35) — is `Summable`. Routing it through the banked
  `cut_summable_geometric` unifies `r := 1`, discharges `0 ≤ 1`, and leaves the SECOND hypothesis
  `(1 : Cut) < 1` — which is FALSE and cannot be discharged. The bogus claim collapses to the
  unsatisfiable order goal `⊢ (1 : Cut) < 1` (the divergence boundary made explicit: a series
  summable for every `r < 1` is NOT summable at `r = 1`).

  This costume DIRECTLY exercises the NEW N39 content: it uses `cut_summable_geometric` (the banked
  geometric-summability lever) on the derived ℝ; deleting `Phys/Foundation/ContinuumSummable.lean`
  removes the `cut_summable_geometric` the costume's `apply` resolves against, so the costume would
  fail with a DIFFERENT (unknown-identifier) error and the PASS_SIGNATURE `1 < 1` would not match.
  If the lever were vacuous or its `r < 1` hypothesis missing/wrong, this divergent series would go
  through — the costume is exactly the guard against that. The manifest's PASS_SIGNATURE matches the
  elaboration error below (`⊢ 1 < 1`).
-/
import Phys.Foundation.ContinuumSummable

namespace Counterexamples

open Phys.Foundation.ContinuumQ

noncomputable section

/-- WRONG: claiming the geometric series at ratio `1` (the constant-one series, divergent) is
    `Summable` over the derived ℝ. `apply cut_summable_geometric` unifies `r := 1`; `zero_le_one`
    discharges `0 ≤ 1`; the remaining hypothesis `(1 : Cut) < 1` is false and is left unsolved. The
    geometric series converges for every `r < 1` but DIVERGES at `r = 1`. Must FAIL to compile. -/
theorem geometric_at_one_summable_BOGUS : Summable (fun n => (1 : Cut) ^ n) := by
  apply cut_summable_geometric zero_le_one

end

end Counterexamples
