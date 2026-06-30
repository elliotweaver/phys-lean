/-
  Counterexamples.DerivationSO4TwoSU2WrongValueCostume — N191 anti-vacuity (C223).
  ===========================================================================
  W8 ANTI-VACUITY. The N191 node banks TWO COMMUTING `su(2)`'s inside `g2 = Der(O Q)` —
  the `so(4) = su(2)_S x su(2)_T` whose DIAGONAL is the embedded weak-isospin `su(2)` (N187).
  Beyond the inner derivations `innerDeriv P` (which act on BOTH coordinate slots of
  `O Q = CD (H Q) = <H,H>`), the second family `leftImDeriv Q : <a,b> -> <0, Q.b>` (for
  imaginary `Q`) is a Leibniz-derivation; the two families bracket-close and MUTUALLY COMMUTE
  (`secondSU2_commutes_leftImDeriv`), with the inner derivation their sum. The `su(2)_T`
  factor is a GENUINE NON-ABELIAN copy: `[leftImDeriv hI, leftImDeriv hJ] = 2.leftImDeriv hK`
  (`leftImDeriv_struct_ij`), so it is NOT the zero family and the `so(4)` is real.

  THE GENUINE VALUE. The `su(2)_T` structure-constant coordinate recovered from
  `[leftImDeriv hI, leftImDeriv hJ] <0,1> = leftImDeriv (hI.hJ - hJ.hI) <0,1> = <0, 2.hK>` is
  exactly `(...).im.im.im = 2` (`leftImDeriv_struct_ij_coord`) — the `2` of the so(3) bracket
  `2.leftImDeriv hK`, GENUINELY nonzero, witnessing that the second `su(2)` closes non-trivially.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading of the second factor — the second family is
  fake / the T-factor does not close / a wrong structure constant / a vacuous "everything
  commutes" degeneracy): that this coordinate equals `(191 : Q)`. The banked value is exactly
  `2` (`leftImDeriv_struct_ij_coord`), so the claim reduces to the false numeric `2 = 191` in Q.
  The kernel cannot close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete "colour / isospin / su(2) / so(4) / g2 / diagonal /
  gauge / commuting" and for the Cayley-Dickson double `O Q = CD (H Q)` the second-slot map
  `<a,b> -> <0, hI.b>` and `<a,b> -> <0, hJ.b>` have commutator the second-slot map of
  `hI.hJ - hJ.hI = 2.hK`, whose value at `<0,1>` reads deep coordinate `2` — so claiming `191`
  is genuinely FALSE (`2 /= 191` in Q).

  DISTINCT from the banked battery (... C220 `2 = 188`, C221 `1 = 189`, C222 `3 = 190`):
  pair `(2, 191)` is fresh (RHS differs from C216's `2 = 184` and C220's `2 = 188`).
-/
import Phys.Algebra.DerivationSO4TwoSU2

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the `su(2)_T` structure-constant witness coordinate is `2`. -/
theorem so4_secondFactor_coord_true :
    (⁅leftImDeriv (hI : H ℚ), leftImDeriv hJ⁆ (⟨0, 1⟩ : O ℚ)).im.im.im = 2 :=
  leftImDeriv_struct_ij_coord

/-- BOGUS: claims the witness coordinate is `(191 : ℚ)`. It GENUINELY equals `2`
    (`so4_secondFactor_coord_true`). The WRONG claim (the second `su(2)` is fake / the T-factor
    does not close / a wrong constant / a vacuous all-commute degeneracy) reduces to the false
    numeric `(2 : ℚ) = 191`, so this must NOT compile. -/
theorem so4_secondFactor_wrong_BOGUS :
    (⁅leftImDeriv (hI : H ℚ), leftImDeriv hJ⁆ (⟨0, 1⟩ : O ℚ)).im.im.im = (191 : ℚ) := by
  rw [so4_secondFactor_coord_true]

end Counterexamples
