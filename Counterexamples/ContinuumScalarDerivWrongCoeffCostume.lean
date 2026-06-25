/-
  Counterexamples.ContinuumScalarDerivWrongCoeffCostume — N41g (part 1) costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N41g SCALAR POWER-SERIES DERIVATIVE AT 0 over the DERIVED ℝ
  `ContinuumQ.Cut`. N41g part 1 banks `cut_powerseries_deriv`:
    for `a : ℕ → Cut` with `∑ |a n|` summable (an ENTIRE series — radius ≥ 1, exactly the
    exponential setting), the difference quotient `t⁻¹ ((∑' n, tⁿ aₙ) − a₀)` tends to `a₁` as
    `t → 0` in `𝓝[≠] 0`. The LIMIT POINT is `a 1` — the FIRST-ORDER coefficient — because the
    decomposition is `f(t) = a₀ + a₁·t + t²·R(t)`, so `t⁻¹(f(t)−a₀) = a₁ + t·R(t) → a₁`. The `a 1`
    is the derivative; it is LOAD-BEARING, NOT decorative.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the SAME difference quotient
  tends to `a 2` (the SECOND-order coefficient) instead of `a 1`. This is FALSE in general: the
  derivative at 0 of an entire power series is its linear (`a₁`) coefficient, NOT its quadratic
  (`a₂`) coefficient. Routing the bogus statement through the banked `cut_powerseries_deriv` (whose
  limit point is the genuine `a 1`) leaves the limit-point identity
    `a 2 = a 1`
  as an unsolved goal (the two `Tendsto` statements share their function, differing only in the
  neighbourhood filter's centre) — FALSE in general (e.g. `a 1 = 0`, `a 2 = 1`). The bogus claim
  collapses to that unsatisfiable equation: the derivative-at-0 reads the LINEAR coefficient, and
  no other.

  This costume DIRECTLY exercises the NEW N41g content: it uses `cut_powerseries_deriv` (the banked
  scalar power-series derivative). Deleting `Phys/Foundation/ContinuumScalarDeriv.lean` removes the
  `cut_powerseries_deriv` the costume's `convert` resolves against, so the costume would fail with a
  DIFFERENT (unknown-identifier) error and the PASS_SIGNATURE below would not match. If the
  derivative were (wrongly) stated to recover `a 2`, this false statement would go through — the
  costume is exactly the guard against that.
-/
import Phys.Foundation.ContinuumScalarDeriv

namespace Counterexamples

open Phys.Foundation.ContinuumQ
open Filter
open scoped Topology

noncomputable section

/-- WRONG: claiming the difference quotient `t⁻¹ ((∑' n, tⁿ aₙ) − a₀)` tends to `a 2` (the SECOND
    coefficient) rather than `a 1` (the genuine first-order / derivative coefficient). Routing it
    through the banked `cut_powerseries_deriv` (limit point the genuine `a 1`) leaves the
    limit-point identity `a 2 = a 1` unsolved — false in general (e.g. `a 1 = 0`, `a 2 = 1`). The
    derivative at 0 is the linear coefficient and no other. Must FAIL to compile. -/
theorem cut_powerseries_deriv_wrong_coeff_BOGUS (a : ℕ → Cut)
    (hsum1 : Summable (fun n => |a n|)) :
    Tendsto (fun t : Cut => t⁻¹ * ((∑' n, t ^ n * a n) - a 0)) (𝓝[≠] (0 : Cut)) (𝓝 (a 2)) := by
  have h : Tendsto (fun t : Cut => t⁻¹ * ((∑' n, t ^ n * a n) - a 0)) (𝓝[≠] (0 : Cut))
      (𝓝 (a 1)) := cut_powerseries_deriv a hsum1
  convert h using 2

end

end Counterexamples
