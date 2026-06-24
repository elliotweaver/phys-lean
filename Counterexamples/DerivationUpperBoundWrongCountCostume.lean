/-
  Counterexamples.DerivationUpperBoundWrongCountCostume — N20 costume (REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the N20 upper bound: the Leibniz-derivation ℚ-submodule
  of the terminal algebra `O ℚ` has dimension EXACTLY 14 (`finrank_derivationQ_eq_14`),
  the upper half (`finrank_derivationQ_le_14`, the so(7)→g₂ cut 21→14) closing the
  count against the banked lower bound. The garbage claim: the dimension is 15 —
  i.e. MORE than the proved upper bound, a WRONG (too-large) count.

  This is the anti-vacuity teeth (docs/RUNBOOK.md W8) the ticket demands EXPLICITLY:
  "the new costume MUST bite on a WRONG count: claiming `dim = 15` ... must FAIL to
  compile." A node that silently failed to prove the genuine 21→14 cut (and left the
  dimension free up to 64) would NOT refute `= 15`. Combining the bogus `= 15` with
  the banked upper bound `finrank_derivationQ_le_14` forces `15 ≤ 14`, which `omega`
  refutes. The kernel must REJECT it.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Algebra.DerivationUpperBound

namespace Counterexamples

open Phys.Algebra

/-- WRONG: claiming the derivation algebra has dimension 15. False — the so(7)→g₂
    cut `finrank_derivationQ_le_14` forces `finrank ≤ 14`, so `finrank = 15` would
    give `15 ≤ 14`. Must FAIL. -/
theorem finrank_derivationQ_BOGUS_eq_15 : Module.finrank ℚ derivationQ = 15 := by
  have h := finrank_derivationQ_le_14
  omega

end Counterexamples
