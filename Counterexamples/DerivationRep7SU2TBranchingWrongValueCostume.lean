/-
  Counterexamples.DerivationRep7SU2TBranchingWrongValueCostume — N192 anti-vacuity (C224).
  ===========================================================================
  W8 ANTI-VACUITY. The N192 node banks the branching of the `7` (`ImO`, N22) under the
  SECOND-SLOT family `su(2)_T = <leftImDeriv hI/J/K>` (N191): `7 = 3.1 (+) 4`, DISTINCT from
  N190's diagonal `1 (+) 3 (+) 3`, with the SINGLET<->ADJOINT ROLE SWAP. The crux of the swap
  is that `su(2)_T` MOVES the vector `e4 = <0,1> = kappaO 1` that the DIAGONAL `su(2)` FIXES
  (N189): `leftImDeriv hI (kappaO 1) = kappaO (hI . 1) = kappaO hI`, a GENUINELY nonzero vector.

  THE GENUINE VALUE. The deep coordinate of the moved singlet `kappaO hI` is
  `(leftImDeriv hI (kappaO 1)).im.re.im = hI.re.im = (Dbl.J).im = 1` (`singlet_moved_coord`) —
  GENUINELY nonzero, witnessing that `su(2)_T` does NOT fix `e4` (the role swap is real, not a
  vacuous all-annihilate or a re-statement of N190's diagonal action).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: `su(2)_T` also fixes `e4` like the diagonal
  / the branching re-states N190 / `leftImDeriv` is zero on the second slot / the role swap is
  fake): that this coordinate equals `(192 : Q)`. The banked value is exactly `1`
  (`singlet_moved_coord`), so the claim reduces to the false numeric `1 = 192` in Q. The kernel
  cannot close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete "colour / isospin / su(2) / so(4) / singlet / adjoint /
  branching / diagonal / gauge" and for the Cayley-Dickson double `O Q = CD (H Q)` the
  second-slot map `<a,b> -> <0, hI.b>` sends `<0,1> = kappaO 1` to `<0, hI.1> = kappaO hI`,
  whose deep coordinate reads `1` — so claiming `192` is genuinely FALSE (`1 /= 192` in Q).

  DISTINCT from the banked battery (... C221 `1 = 189`, C222 `3 = 190`, C223 `2 = 191`): pair
  `(1, 192)` is fresh (RHS `192` distinct from every prior right-hand value).
-/
import Phys.Algebra.DerivationRep7SU2TBranching

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the deep coordinate of the moved singlet `leftImDeriv hI (kappaO 1) = kappaO hI` is `1`. -/
theorem suT_moves_singlet_coord_true :
    (leftImDeriv (hI : H ℚ) (kappaO 1)).im.re.im = 1 :=
  singlet_moved_coord

/-- BOGUS: claims the witness coordinate is `(192 : ℚ)`. It GENUINELY equals `1`
    (`suT_moves_singlet_coord_true`). The WRONG claim (`su(2)_T` fixes `e4` like the diagonal /
    the branching re-states N190 / `leftImDeriv` is zero on the second slot / the role swap is
    fake) reduces to the false numeric `(1 : ℚ) = 192`, so this must NOT compile. -/
theorem suT_moves_singlet_wrong_BOGUS :
    (leftImDeriv (hI : H ℚ) (kappaO 1)).im.re.im = (192 : ℚ) := by
  rw [suT_moves_singlet_coord_true]

end Counterexamples
