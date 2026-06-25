/-
  Counterexamples.DerivationOExpNoDerivCostume — N41c costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N41c ANALYTIC INTEGRATION (the literal `O Cut` product-preservation of
  the vector exponential). N41c banks `expO_term_antidiag`:
    `IsDeriv D → (1/n!)•(Dⁿ(x·y)) = ∑_{k+l=n} ((1/k!)•Dᵏx)·((1/l!)•Dˡy)`
  — the per-`n` algebraic integration that, passed to the Cauchy-product limit over the topological
  semiring `O Cut`, yields `expO D (x·y) = expO D x · expO D y`. The Leibniz hypothesis `IsDeriv D`
  is LOAD-BEARING: it is exactly what supplies the banked N41a iterated-Leibniz binomial
  `Dⁿ(x·y) = ∑ C(n,k)•(Dᵏx·Dˡy)` the rewrite consumes. For an arbitrary linear endomorphism `D`
  (e.g. `D = 1`, the identity map, NOT a derivation) the identity is FALSE: `1ⁿ(x·y) = x·y`, while
  the antidiagonal RHS is a genuine multi-term binomial sum of products of `x` and `y` — the
  product is not preserved by the exponential of a non-derivation.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the per-`n` exponential
  product-integration holds for an ARBITRARY endomorphism `D`, dropping the `IsDeriv D` hypothesis.
  Routing it through the banked `expO_term_antidiag` via `apply` unifies the conclusion and leaves
  the UNDISCHARGEABLE hypothesis `IsDeriv D`, which is FALSE for general endomorphisms and cannot be
  proved. The bogus claim collapses to the unsatisfiable goal `⊢ IsDeriv D` (the Leibniz law made
  explicit: the exponential flow preserves the product only when the flow's generator satisfies the
  product rule — only a derivation integrates to an automorphism).

  This costume DIRECTLY exercises the NEW N41c content: it uses `expO_term_antidiag` (the banked
  per-`n` analytic integration); deleting `Phys/Algebra/DerivationOExp.lean` removes the
  `expO_term_antidiag` the costume's `apply` resolves against, so the costume would fail with a
  DIFFERENT (unknown-identifier) error and the PASS_SIGNATURE `IsDeriv D` would not match. If the
  integration were stated without its `IsDeriv` hypothesis, this false claim would go through — the
  costume is exactly the guard against that.
-/
import Phys.Algebra.DerivationOExp

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
open scoped BigOperators

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-- WRONG: claiming the per-`n` exponential product-integration holds for an ARBITRARY endomorphism
    `D` (not assumed to be a Leibniz-derivation). `apply expO_term_antidiag` unifies the conclusion
    and leaves the `IsDeriv D` hypothesis, which is false in general and is left unsolved. The
    exponential flow preserves the octonion product only for a derivation. Must FAIL to compile. -/
theorem expO_term_antidiag_no_deriv_BOGUS (D : Module.End ℤ (O Cut)) (x y : O Cut) (n : ℕ) :
    (1 / (n.factorial : Cut)) • ((D ^ n) (x * y))
      = ∑ kl ∈ Finset.antidiagonal n,
          ((1 / (kl.1.factorial : Cut)) • ((D ^ kl.1) x)) *
            ((1 / (kl.2.factorial : Cut)) • ((D ^ kl.2) y)) := by
  apply expO_term_antidiag

end

end Counterexamples
