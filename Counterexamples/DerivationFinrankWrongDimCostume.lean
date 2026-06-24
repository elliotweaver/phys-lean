/-
  Counterexamples.DerivationFinrankWrongDimCostume — N19 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the N19 finite-dimensionality scaffold: the terminal
  algebra `O ℚ` is an 8-dimensional ℚ-vector space (`finrank_O_eq_eight`,
  `finrank ℚ (O ℚ) = 8`), derived STRUCTURALLY through the two Cayley–Dickson
  product equivalences `2 → 4 → 8` (NO coordinate basis matrix). The garbage claim:
  the terminal algebra has dimension 7 (the dimension of its IMAGINARY subspace,
  the WRONG dimension for the whole algebra) instead of 8.

  This is the anti-vacuity teeth (docs/RUNBOOK.md W8) the ticket demands EXPLICITLY:
  "the new costume MUST bite on a WRONG dimension." A scaffold that silently
  computed the wrong finrank — 7 (forgetting the unit), or 9 — would corrupt every
  downstream bound (`1 ≤ dim_ℚ Der(O ℚ) ≤ 64` rests on `finrank End = 64 = 8²`).
  After `rw [finrank_O_eq_eight]` the claim reduces to the FALSE numeric core
  `8 = 7` over ℕ. The kernel must REJECT it.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Algebra.DerivationFinrank

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- WRONG: claiming the terminal algebra `O ℚ` is 7-dimensional over ℚ. False — it
    is 8-dimensional (`finrank_O_eq_eight`); 7 is the dimension of the imaginary
    subspace, not the whole algebra. After `rw [finrank_O_eq_eight]` this reduces
    to `8 = 7`. Must FAIL. -/
theorem finrank_O_BOGUS : Module.finrank ℚ (O ℚ) = 7 := by
  rw [finrank_O_eq_eight]

end Counterexamples
