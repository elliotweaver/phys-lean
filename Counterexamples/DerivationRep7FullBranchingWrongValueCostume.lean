/-
  Counterexamples.DerivationRep7FullBranchingWrongValueCostume — N190 anti-vacuity (C222).
  ===========================================================================
  W8 ANTI-VACUITY. The N190 node banks THE FULL ISOSPIN BRANCHING OF THE `7`:
  `7 = 1 (+) 3 (+) 3` under the embedded weak-isospin `su(2)` (N187). The imaginary subspace
  `ImO` (finrank `7`, N22) is the internal sup of three `su(2)`-invariant pieces — the OLD
  adjoint `3 = iotaO(ImH)`, the singlet `1 = Q.e4`, the NEW adjoint `3 = kappaO(ImH)`
  (`fullBranching_sup_eq_ImO`) — with dimensions `3 + 1 + 3 = 7` (`branching_dim_sum`). The
  OLD adjoint piece has finrank exactly `3` (`finrank_iotaImH`: `iotaO` injective on the
  3-dimensional `ImH`).

  THE GENUINE VALUE. The OLD adjoint summand `iotaO(ImH)` has `finrank Q = 3`
  (`finrank_iotaImH`) — a GENUINE 3-dimensional invariant subspace of the `7`, not a vacuous
  or trivial piece. This is the content that makes the branching `1 (+) 3 (+) 3` (and NOT, say,
  `1 (+) 2 (+) 2 (+) 2` or a vacuous split) — the two `3`'s are real adjoint copies.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading of the branching — the complement of the
  singlet is NOT two adjoint 3's / the OLD piece has the wrong dimension / the decomposition
  is vacuous): that this finrank equals `(190 : nat)`. The banked value is exactly `3`
  (`finrank_iotaImH`), so the claim reduces to the false numeric `3 = 190` in nat. The kernel
  cannot close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete "colour / isospin / 7 / g2 / su(2) / singlet / adjoint /
  branching / rep / gauge" and the image of the imaginary base subspace `ImH` (finrank 3) under
  the injective coordinate embedding `a -> <a,0>` GENUINELY has `finrank 3`, so claiming `190`
  is genuinely FALSE (`3 /= 190` in nat).

  DISTINCT from the banked battery (... C219 `4 = 187`, C220 `2 = 188`, C221 `1 = 189`):
  value `3 = 190` (a fresh LHS,RHS pair).
-/
import Phys.Algebra.DerivationRep7FullBranching

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the OLD adjoint summand `iotaO(ImH)` of the branching has dimension `3`. -/
theorem fullBranching_old3_dim_true :
    Module.finrank ℚ (Submodule.map iotaO ImH) = 3 := finrank_iotaImH

/-- BOGUS: claims the OLD adjoint summand has dimension `(190 : ℕ)`. It GENUINELY has
    dimension `3` (`fullBranching_old3_dim_true`). The WRONG claim (the complement of the
    singlet is not two adjoint 3's / the piece has the wrong dimension / a vacuous split)
    reduces to the false numeric `(3 : ℕ) = 190`, so this must NOT compile. -/
theorem fullBranching_wrong_old3_BOGUS :
    Module.finrank ℚ (Submodule.map iotaO ImH) = (190 : ℕ) := by
  rw [fullBranching_old3_dim_true]

end Counterexamples
