/-
  Counterexamples.DerivationLowerBoundWrongCountCostume — N19 costume (REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the N19 lower bound: the Leibniz-derivation ℚ-submodule
  of the terminal algebra has dimension AT LEAST 14 (`finrank_derivationQ_ge_14`),
  exhibited by 14 explicit linearly-independent derivations. The garbage claim:
  the dimension is at most 13 — i.e. FEWER than the 14 exhibited independent
  derivations, a WRONG (too-small) count.

  This is the anti-vacuity teeth (docs/RUNBOOK.md W8) the ticket demands EXPLICITLY:
  "the new costume MUST bite on a WRONG dimension." A lower bound that silently
  over-counted (claimed 14 independent derivations when a ℚ-linear dependence hid
  among them) would be caught by `Dvec_linearIndependent`; a bound that under-counts
  the real algebra is caught here. Combining the bogus `≤ 13` with the banked
  `14 ≤ finrank` forces `14 ≤ 13`, which `omega` refutes. The kernel must REJECT it.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Algebra.DerivationLowerBound

namespace Counterexamples

open Phys.Algebra

/-- WRONG: claiming the derivation algebra has dimension at most 13. False — the
    14 explicit independent derivations force `14 ≤ finrank` (`finrank_derivationQ_ge_14`),
    so `finrank ≤ 13` would give `14 ≤ 13`. Must FAIL. -/
theorem finrank_derivationQ_BOGUS_le_13 : Module.finrank ℚ derivationQ ≤ 13 := by
  have h := finrank_derivationQ_ge_14
  omega

end Counterexamples
