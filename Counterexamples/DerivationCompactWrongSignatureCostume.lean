/-
  Counterexamples.DerivationCompactWrongSignatureCostume — N24 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N24 compact-signature pin. N24 banks that the defining trace
  form `B(D,E) = tr_{O ℚ}(D∘E)` of the 14-dim derivation Lie algebra `derivationLieQ` is
  NEGATIVE-DEFINITE — the compact signature — hence NONDEGENERATE (`traceForm_nondegenerate`).
  The anti-vacuity teeth: the banked NONZERO witness `witnessLieQ` has STRICTLY NEGATIVE
  self trace-form, `B(w,w) < 0` (`traceForm_witness_neg`). A nonzero element with negative
  self-form is NOT in the radical — that is exactly what makes nondegeneracy non-vacuous.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the trace form is NOT
  negative on the nonzero witness — i.e. `0 ≤ B(w,w)` (the wrong, indefinite/positive
  signature, the reading a DEGENERATE or non-compact trace form would have, with the
  witness in the radical when `B(w,w) = 0`). This is FALSE: `traceForm_witness_neg` proves
  `B(w,w) < 0`. The proof below reduces the bogus `0 ≤ B(w,w)` against the banked strict
  negativity and is left with the false numeric core (`B(w,w) < 0` together with the claim
  `0 ≤ B(w,w)` is contradictory) — `nlinarith`/`linarith` from the banked `< 0` cannot
  prove `0 ≤ B(w,w)`, so the kernel cannot close. A non-negative-definite (indefinite or
  degenerate) reading of the trace form would destroy the compact-form / Cartan-criterion
  pinning; W8 demands this bite.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Algebra.DerivationCompact

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- WRONG: claiming the defining trace form is NON-NEGATIVE on the nonzero witness — i.e.
    `0 ≤ B(w,w)` (the indefinite / degenerate / non-compact signature). False: the banked
    `traceForm_witness_neg` proves `B(w,w) < 0` strictly. Trying to discharge `0 ≤ B(w,w)`
    from the strict-negativity hypothesis leaves the unsatisfiable core `0 ≤ B(w,w)` with
    `B(w,w) < 0` in context; `linarith` cannot close it. Must FAIL. -/
theorem traceForm_witness_nonneg_BOGUS :
    0 ≤ LieModule.traceForm ℚ derivationLieQ (O ℚ) witnessLieQ witnessLieQ := by
  have hneg := traceForm_witness_neg
  linarith [hneg]

end Counterexamples
