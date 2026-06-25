/-
  Counterexamples.DerivationLeibnizPowNoDerivCostume — N41a costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N41a ITERATED LEIBNIZ BINOMIAL over the non-associative octonion
  algebra `CD (CD B)`. N41a banks `iter_leibniz_range`:
    `IsDeriv D → Dⁿ(x·y) = ∑_{m≤n} C(n,m)·(Dᵐx · D^{n-m}y)`
  — the binomial expansion of the iterated derivation on a product holds ONLY when `D` is a
  Leibniz-derivation (`IsDeriv D`, i.e. `D(uv) = Du·v + u·Dv`). The Leibniz hypothesis is
  load-bearing: it is precisely the per-step split `D(Dᵏx · Dˡy) = D^{k+1}x·Dˡy + Dᵏx·D^{l+1}y`
  (`dterm_split`) that drives the induction. For an arbitrary linear endomorphism `D` the identity
  is FALSE (e.g. `D = `the identity map `1` is not a derivation, and `1ⁿ(xy) = xy ≠ ∑ C(n,m) xy`).

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the iterated-Leibniz binomial
  holds for an ARBITRARY endomorphism `D` — dropping the `IsDeriv D` hypothesis. Routing it through
  the banked `iter_leibniz_range` via `apply` unifies the conclusion and leaves the UNDISCHARGEABLE
  hypothesis `IsDeriv D`, which is FALSE for general endomorphisms and cannot be proved. The bogus
  claim collapses to the unsatisfiable goal `⊢ IsDeriv D` (the Leibniz law made explicit: the
  binomial expansion of a flow on a product needs the flow to satisfy the product rule).

  This costume DIRECTLY exercises the NEW N41a content: it uses `iter_leibniz_range` (the banked
  iterated Leibniz binomial); deleting `Phys/Algebra/DerivationLeibnizPow.lean` removes the
  `iter_leibniz_range` the costume's `apply` resolves against, so the costume would fail with a
  DIFFERENT (unknown-identifier) error and the PASS_SIGNATURE `IsDeriv D` would not match. If the
  binomial were stated without its `IsDeriv` hypothesis, this false claim would go through — the
  costume is exactly the guard against that.
-/
import Phys.Algebra.DerivationLeibnizPow

namespace Counterexamples

open Phys.Algebra Phys.Cascade Finset
open scoped BigOperators

noncomputable section

attribute [local instance] CD.narCD CD.srCD

variable {B : Type*} [CommRing B] [StarRing B]

/-- WRONG: claiming the iterated-Leibniz binomial holds for an ARBITRARY endomorphism `D` (not
    assumed to be a Leibniz-derivation). `apply iter_leibniz_range` unifies the conclusion and leaves
    the `IsDeriv D` hypothesis, which is false in general and is left unsolved. The binomial
    expansion of the iterated map on a product holds only for a derivation. Must FAIL to compile. -/
theorem iter_leibniz_no_deriv_BOGUS (D : Module.End ℤ (CD (CD B))) (x y : CD (CD B)) (n : ℕ) :
    (D ^ n) (x * y)
      = ∑ m ∈ range (n + 1), (n.choose m) • ((D ^ m) x * (D ^ (n - m)) y) := by
  apply iter_leibniz_range

end

end Counterexamples
