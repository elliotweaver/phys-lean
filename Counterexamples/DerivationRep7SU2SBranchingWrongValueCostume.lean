/-
  Counterexamples.DerivationRep7SU2SBranchingWrongValueCostume — N193 anti-vacuity (C225).
  ===========================================================================
  W8 ANTI-VACUITY. The N193 node banks the su(2)_S action on the `7` (`ImO`, N22) — the
  difference family `secondSU2 P = innerDeriv P - leftImDeriv P` (N191) — and the JOINT
  so(4) bigrading `7 = (3,1) (+) (2,2)`. The genuinely NEW content vs N192 is that su(2)_S acts
  on the new plane `kappaO` by RIGHT multiplication `R_P : b -> -(b.P)` (where su(2)_T acts by
  LEFT multiplication `L_Q : b -> Q.b`), so on the diagonal singlet `e4 = kappaO 1` the two
  so(4) factors act as EXACT NEGATIVES: `secondSU2 hI (kappaO 1) = kappaO(-(1.hI)) = -kappaO hI`
  while `leftImDeriv hI (kappaO 1) = +kappaO hI`.

  THE GENUINE VALUE. The deep coordinate of the su(2)_S-moved singlet `-kappaO hI` is
  `(secondSU2 hI (kappaO 1)).im.re.im = -1` (`secondSU2_singlet_coord`) — the EXACT NEGATIVE of
  N192's `singlet_moved_coord` (`+1`), witnessing that su(2)_S acts by the RIGHT-regular action
  (a genuinely THIRD distinct intertwiner family, not a duplicate of su(2)_T's LEFT action nor
  the diagonal's adjoint; and not a vacuous all-annihilate).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: su(2)_S acts like su(2)_T by LEFT mult / the
  bigrading is a mechanical intersection / su(2)_S annihilates the singlet like su(2)_T does the
  old line / the exact-negative cancellation is fake): that this coordinate equals `(193 : Q)`.
  The banked value is exactly `-1` (`secondSU2_singlet_coord`), so the claim reduces to the false
  numeric `193 = -1` in Q. The kernel cannot close it; the costume BITES (lean leaves the unsolved
  false goal, exit 1).

  The bite is name-independent: delete "colour / isospin / su(2) / so(4) / singlet / adjoint /
  branching / bigrading / diagonal / gauge" and for the Cayley-Dickson double `O Q = CD (H Q)`
  the difference map `<a,b> -> innerDeriv hI <a,b> - <0, hI.b>` sends `<0,1> = kappaO 1` to
  `<0, -(1.hI)> = -kappaO hI`, whose deep coordinate reads `-1` — so claiming `193` is genuinely
  FALSE (`193 /= -1` in Q).

  DISTINCT from the banked battery (... C222 `3 = 190`, C223 `2 = 191`, C224 `1 = 192`): pair
  `(193, -1)` is fresh (RHS `193` distinct from every prior right-hand value).
-/
import Phys.Algebra.DerivationRep7SU2SBranching

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the deep coordinate of the su(2)_S-moved singlet `secondSU2 hI (kappaO 1) = -kappaO hI`
    is `-1` (the exact negative of N192's `+1`). -/
theorem suS_moves_singlet_coord_true :
    (secondSU2 (hI : H ℚ) (kappaO 1)).im.re.im = -1 :=
  secondSU2_singlet_coord

/-- BOGUS: claims the witness coordinate `193 = (secondSU2 hI (kappaO 1)).im.re.im`. It GENUINELY
    equals `-1` (`suS_moves_singlet_coord_true`). The WRONG claim (su(2)_S acts like su(2)_T by
    LEFT mult / the bigrading is a mechanical intersection / su(2)_S annihilates the singlet / the
    exact-negative cancellation is fake) reduces to the false numeric `(193 : ℚ) = -1`, so this
    must NOT compile. -/
theorem suS_moves_singlet_wrong_BOGUS :
    (193 : ℚ) = (secondSU2 (hI : H ℚ) (kappaO 1)).im.re.im := by
  rw [suS_moves_singlet_coord_true]

end Counterexamples
