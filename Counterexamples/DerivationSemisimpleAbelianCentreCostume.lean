/-
  Counterexamples.DerivationSemisimpleAbelianCentreCostume — N25 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N25 semisimplicity pin. N25 banks that the 14-dim derivation Lie
  algebra `derivationLieQ` is SEMISIMPLE (`derivationLieQ_semisimple`), via the trivial centre
  (`derivationLieQ_center_eq_bot`: `center = ⊥`) and the no-abelian-atoms clause
  (`derivationLieQ_no_abelian_atom`). A semisimple Lie algebra has TRIVIAL centre and is NOT
  abelian — the structural opposite of having a top centre.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the centre is EVERYTHING,
  `LieAlgebra.center ℚ derivationLieQ = ⊤` — i.e. the algebra is abelian (every element central),
  the reading a SOLVABLE/abelian (non-semisimple) algebra would have. This is FALSE: the banked
  `derivationLieQ_center_eq_bot` proves `center = ⊥`, and `derivationLieQ_top_ne_bot` proves
  `⊤ ≠ ⊥`. Rewriting the bogus goal `center = ⊤` through the banked `center = ⊥` leaves the
  unsatisfiable core `(⊥ : LieIdeal ℚ derivationLieQ) = ⊤`, which no tactic can close (a
  nontrivial Lie algebra has `⊥ ≠ ⊤`). An abelian-centre (non-semisimple) reading of
  `derivationLieQ` would destroy the semisimplicity / compact-form pinning; W8 demands this bite.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Algebra.DerivationCompact

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- WRONG: claiming the centre of `derivationLieQ` is the whole algebra — `center = ⊤` (the
    abelian / non-semisimple reading). False: the banked `derivationLieQ_center_eq_bot` proves
    `center = ⊥`; rewriting the goal through it leaves the unsatisfiable `⊥ = ⊤` for a
    nontrivial Lie algebra (`derivationLieQ_top_ne_bot`). Must FAIL. -/
theorem center_eq_top_BOGUS :
    LieAlgebra.center ℚ derivationLieQ = ⊤ := by
  rw [derivationLieQ_center_eq_bot]

end Counterexamples
