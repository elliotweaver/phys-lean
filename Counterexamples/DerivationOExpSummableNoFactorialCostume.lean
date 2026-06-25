/-
  Counterexamples.DerivationOExpSummableNoFactorialCostume — N41d costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N41d UNCONDITIONAL SUMMABILITY of the `O Cut` vector exponential series
  over the DERIVED ℝ `ContinuumQ.Cut`. N41d banks `expO_summable`:
    `Summable (fun n => (1/n!)•((D'ⁿ) x))`  — UNCONDITIONAL, for a `Cut`-linear endomorphism `D'`.
  The convergence is supplied by transporting the banked N39 matrix `expTerm_summable`, whose
  majorant is the `Cut`-valued operator-norm factorial series `∑ (opNorm M)ⁿ / n!`. The `1/n!`
  factorial normalization is EXACTLY what makes that majorant converge (the C6 eternal-approach: the
  factorial outruns `(opNorm M)ⁿ`). It is LOAD-BEARING, NOT decorative.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the UN-NORMALIZED power series
  `fun n => (D'ⁿ) x` — with the `1/n!` factorial DROPPED — is `Summable`. This is FALSE in general:
  for `D' = 1` (the identity) and `x ≠ 0` the terms are the constant `x`, whose partial sums are
  `N • x`, unbounded (divergent) by the Archimedean property (N35). Routing it through the banked
  `expO_summable` via `.congr` unifies the summand-up-to-congruence and leaves the per-term identity
    `(1/n!)•((D'ⁿ) x) = (D'ⁿ) x`
  as an unsolved goal — FALSE for `n ≥ 2` (`1/n! ≠ 1`). The bogus claim collapses to that
  unsatisfiable equation (the convergence-structure made explicit: a series summable WITH the
  factorial normalization is NOT summable without it — the factorial is the majorant's engine).

  This costume DIRECTLY exercises the NEW N41d content: it uses `expO_summable` (the banked
  unconditional summability lever); deleting `Phys/Algebra/DerivationOExpSummable.lean` removes the
  `expO_summable` the costume's `.congr` resolves against, so the costume would fail with a DIFFERENT
  (unknown-identifier) error and the PASS_SIGNATURE below would not match. If the summability were
  stated WITHOUT the `1/n!` normalization (dropping the majorant structure), this divergent series
  would go through — the costume is exactly the guard against that.
-/
import Phys.Algebra.DerivationOExpSummable

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-- WRONG: claiming the UN-NORMALIZED power series `fun n => (D'ⁿ) x` (the `1/n!` factorial that
    makes the operator-norm majorant converge DROPPED) is `Summable` over the derived ℝ. Routing it
    through the banked unconditional `expO_summable` via `.congr` leaves the per-term identity
    `(1/n!)•((D'ⁿ) x) = (D'ⁿ) x` unsolved — false for `n ≥ 2`. The series converges WITH the
    factorial normalization (the C6 eternal-approach majorant) but DIVERGES without it (e.g. `D'=1`,
    `x≠0` gives the constant series, unbounded). Must FAIL to compile. -/
theorem expO_summable_no_factorial_BOGUS (D' : Module.End Cut (O Cut)) (x : O Cut) :
    Summable (fun n => (D' ^ n) x) := by
  refine (expO_summable D' x).congr (fun n => ?_)

end

end Counterexamples
