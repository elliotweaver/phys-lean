/-
  Counterexamples.DerivationIdentityCostume — N6 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the LEIBNIZ-DERIVATION predicate (N6): claiming the IDENTITY
  endomorphism `1 : Module.End ℤ (O ℚ)` is a Leibniz-derivation of the terminal algebra.

  `Phys.Algebra.IsDeriv` requires `D (x·y) = D x · y + x · D y`. For `D = id` this reads
  `x·y = x·y + x·y`, i.e. `x·y = 2·(x·y)` — forcing `x·y = 0` for ALL x, y, which is FALSE
  on `O ℚ` (e.g. `1 · 1 = 1 ≠ 0`). The identity is NOT a derivation: a derivation lowers no
  degree but the identity doubles the product. If this ever COMPILED, the Leibniz predicate
  would be vacuous — exactly the over-claim the battery exists to catch (docs/RUNBOOK.md W8).

  After unfolding `IsDeriv` and applying at `x = y = 1`, the goal reduces to a FALSE numeric
  core over the cascade ground ring `ℚ` (`1 = 1 + 1`, i.e. `1 = 2`). The kernel must REJECT it.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Algebra.Derivation

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- WRONG: claiming the identity is a Leibniz-derivation of `O ℚ`. False — Leibniz for `id`
    reads `x·y = id x · y + x · id y = x·y + x·y`, forcing the product to equal its own double
    (hence to vanish) for ALL `x, y`, which is false on `O ℚ`. Must FAIL. -/
theorem identity_isDeriv_BOGUS : IsDeriv (1 : Module.End ℤ (O ℚ)) := by
  intro x y
  simp only [Module.End.one_apply]

end Counterexamples
