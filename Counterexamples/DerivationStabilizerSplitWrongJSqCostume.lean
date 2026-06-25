/-
  Counterexamples.DerivationStabilizerSplitWrongJSqCostume — N42c costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N42c BRANCHING `7 = 3 ⊕ 3̄ ⊕ 1` of `Im(𝕆)` under the complex
  structure `J = L_{u1}` (left-multiplication by the banked square-root of `−1`). N42c banks
  `JO_sq : J ∘ J = −id` — the COMPLEX STRUCTURE that splits the 6-dim complement `V` into the
  conjugate pair `3 ⊕ 3̄`. The SIGN is LOAD-BEARING: `J² = −id` is what makes `J` a complex
  structure (a square root of `−1`), forcing the `±i`-eigenspace / conjugate-triplet split. If
  instead `J² = +id` (an involution), `J` would have real `±1`-eigenspaces, NO complex structure,
  and the 7 would stay real-decomposed with no `3 ⊕ 3̄` — the branching would collapse.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that `J ∘ J = +id` (the
  involution reading — no complex structure, no `3 ⊕ 3̄`) rather than `−id`. This is FALSE:
  `JO_sq` proves `J ∘ J = −LinearMap.id`, and `−LinearMap.id ≠ LinearMap.id` on the nontrivial
  space `O ℚ`. The costume tries to supply `JO_sq` (`= −id`) where a proof of `= id` is demanded;
  the type mismatch (`−LinearMap.id` vs `LinearMap.id`) makes it FAIL to compile — the guard
  against a complex structure misread as a real involution (which would destroy the `3 ⊕ 3̄`).

  This costume DIRECTLY exercises the NEW N42c content: it uses `JO_sq` (the banked complex-
  structure theorem). Deleting `Phys/Algebra/DerivationStabilizerSplit.lean` removes the `JO_sq`
  the costume references, so it would fail with a DIFFERENT (unknown-identifier) error and the
  PASS_SIGNATURE below would not match.
-/
import Phys.Algebra.DerivationStabilizerSplit

namespace Counterexamples

open Phys.Cascade Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- WRONG: claiming the complex structure squares to `+id` (a real involution, no `3 ⊕ 3̄`)
    rather than the derived `−id` (a genuine complex structure). Supplying the banked `JO_sq`
    (`= −LinearMap.id`) forces a `−LinearMap.id ≠ LinearMap.id` type mismatch. Must FAIL to
    compile. -/
theorem JO_sq_eq_id_BOGUS : JO.comp JO = LinearMap.id := JO_sq

end Counterexamples
