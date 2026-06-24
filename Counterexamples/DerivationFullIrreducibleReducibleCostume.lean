/-
  Counterexamples.DerivationFullIrreducibleReducibleCostume — N28 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N28 full-irreducibility pin. N28 banks that the faithful 7-dim
  action of `derivationLieQ` on `ImLie` is FULLY IRREDUCIBLE
  (`ImLie_isIrreducible : LieModule.IsIrreducible ℚ derivationLieQ ↥ImLie`) — the only Lie
  submodules of the 7-rep are `⊥` and `⊤`. The teeth: a proper nonzero invariant subspace `W`
  of `ImO` (any `0 < dim W < 7`) is EXCLUDED — d=1,6 by the no-1-dim-invariant fact (skew-adjoint
  of the definite Born self-overlap has no nonzero eigenvalue) plus complete reducibility, and
  d∈{2,3,4,5} by the so(n)-type dimension bound `14 ≤ C(d,2)+C(7−d,2)` (= 11,9,9,11 < 14), a
  contradiction.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the faithful 7-rep is
  REDUCIBLE, i.e. `¬ LieModule.IsIrreducible ℚ derivationLieQ ↥ImLie`. This is genuinely FALSE:
  `ImLie_isIrreducible` PROVES the rep is irreducible, so after assuming the (true) hypothesis the
  remaining goal `False` is UNPROVABLE — there is no proper invariant to exploit. A reducible
  reading would mean a proper invariant survives the so(n) count — exactly what N28 rules out. W8
  demands this bite: if the rep could be reducible, the whole g₂-fundamental-7-rep identification
  collapses.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Algebra.DerivationIrreducibleFull

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD LieAlgebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- WRONG: claiming the faithful 7-rep is REDUCIBLE (`¬ IsIrreducible`). The banked
    `ImLie_isIrreducible` proves the rep IS irreducible, so the hypothesis is true and the
    remaining goal `False` cannot be discharged. Must FAIL to compile. -/
theorem ImLie_reducible_BOGUS :
    ¬ LieModule.IsIrreducible ℚ derivationLieQ ↥ImLie := by
  intro hirr

end Counterexamples
