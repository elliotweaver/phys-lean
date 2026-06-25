/-
  Counterexamples.DerivationOTangentWrongDerivCostume — N41g (part 2) costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N41g TANGENT HALF `d/dt exp(tD)|₀ = D` over the DERIVED ℝ
  `ContinuumQ.Cut`. N41g part 2 banks `expO_tangent`:
    for a `Cut`-linear endomorphism `D'` of the non-associative 8-dim `*`-algebra `O Cut` and any
    `x`, the difference quotient `t⁻¹ • (expO ((t • D').restrictScalars ℤ) x − x)` of the
    one-parameter exponential flow tends to `D' x` as `t → 0` in `𝓝[≠] 0`. The LIMIT POINT is
    `D' x` — the FIRST-ORDER coefficient of the flow (the `n = 1` term `t • (D' x)`, which gives
    `D' x` after dividing by `t`); every higher term is `O(t²)` and vanishes in the limit. The
    `D' x` IS the derivation recovered; it is LOAD-BEARING, NOT decorative.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the SAME difference quotient
  tends to `2 • (D' x)` — TWICE the derivation — instead of `D' x`. This is FALSE in general: the
  derivative at 0 of the exponential flow is the GENERATOR `D'`, not `2 D'`. Routing the bogus
  statement through the banked `expO_tangent` (whose limit point is the genuine `D' x`) leaves the
  limit-point identity
    `2 • D' x = D' x`
  as an unsolved goal (the two `Tendsto` statements share their function, differing only in the
  neighbourhood filter's centre) — FALSE in general (e.g. any `D'`, `x` with `D' x ≠ 0`, since
  `2 • y = y ⟺ y = 0` in the torsion-free derived ℝ-module). The bogus claim collapses to that
  unsatisfiable equation: the tangent map reads the GENERATOR, with coefficient exactly one.

  This costume DIRECTLY exercises the NEW N41g content: it uses `expO_tangent` (the banked tangent
  half). Deleting `Phys/Algebra/DerivationOTangent.lean` removes the `expO_tangent` the costume's
  `convert` resolves against, so the costume would fail with a DIFFERENT (unknown-identifier) error
  and the PASS_SIGNATURE below would not match. If the tangent map were (wrongly) stated to recover
  `2 D'`, this false statement would go through — the costume is exactly the guard against that.
-/
import Phys.Algebra.DerivationOTangent

namespace Counterexamples

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra Filter
open scoped Topology

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-- WRONG: claiming the difference quotient of the exponential flow tends to `2 • (D' x)` (TWICE the
    derivation) rather than `D' x` (the genuine generator). Routing it through the banked
    `expO_tangent` (limit point the genuine `D' x`) leaves the limit-point identity `2 • D' x = D' x`
    unsolved — false in general (true only when `D' x = 0`, by torsion-freeness). The tangent map of
    the exponential flow recovers the generator with coefficient one. Must FAIL to compile. -/
theorem expO_tangent_wrong_deriv_BOGUS (D' : Module.End Cut (O Cut)) (x : O Cut) :
    Tendsto (fun t : Cut => t⁻¹ • (expO ((t • D').restrictScalars ℤ) x - x))
      (𝓝[≠] (0 : Cut)) (𝓝 ((2 : Cut) • D' x)) := by
  have h := expO_tangent D' x
  convert h using 2

end

end Counterexamples
