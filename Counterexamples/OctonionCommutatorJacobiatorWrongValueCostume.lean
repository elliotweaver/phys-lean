/-
  Counterexamples.OctonionCommutatorJacobiatorWrongValueCostume — N205 anti-vacuity (C237).
  ===========================================================================
  W8 ANTI-VACUITY. The N205 node banks a genuinely-NEW, genuinely-DIFFERENT joint: the terminal
  algebra's OWN commutator bracket `octBracket x y = x*y - y*x` on `O Q = CD (H Q)` is NOT a Lie
  bracket. Its Jacobiator equals SIX TIMES the alternating associator (`jacobiator_eq_six_assoc`),
  and on the cascade's non-associating witness triple it is genuinely NONZERO: the explicit
  coordinate `jacobiator_witness_coord : (jacobiator jacWx jacWy jacWz).im.im.im = 12` (= 6*2,
  six times the banked witness associator coordinate 2). So the Jacobi identity FAILS and the
  carrier's commutator is not a Lie bracket (the octonionic symmetry algebra is forced to be the
  EXTERNAL derivation algebra g2 = Der(O Q), not the carrier's own bracket).

  THE GENUINE VALUE. (jacobiator jacWx jacWy jacWz).im.im.im = 12 (jacobiator_witness_coord): the
  Jacobi defect of the witness triple, six times the octonionic associator there.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the bracket IS a Lie algebra / the Jacobiator
  vanishes / the Jacobi defect is zero / the coefficient is not 6 / the carrier's commutator is a
  Lie bracket): that this Jacobi-defect coordinate equals (205 : Q). Rewriting the banked value
  shows the bogus claim reduces to the false numeric 12 = 205 in Q. The kernel cannot close it; the
  costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the Cayley-Dickson double O Q = CD (H Q),
  the cyclic commutator sum of the non-associating triple has im.im.im coordinate 12, so claiming it
  is 205 is genuinely FALSE (12 /= 205).

  DISTINCT from the banked battery (... C234 202 = 1, C235 203 = 2, C236 16 = 204): the pair
  (205, 12) is fresh (LHS 205 and RHS 12 distinct from every recent pair).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionCommutatorJacobiator

namespace Counterexamples

open Phys.Algebra Phys.Cascade

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the Jacobi-defect coordinate of the witness triple is `12` (= six times the banked
    witness associator coordinate `2`): `(jacobiator jacWx jacWy jacWz).im.im.im = 12`. -/
theorem jac_true :
    (jacobiator jacWx jacWy jacWz).im.im.im = 12 := jacobiator_witness_coord

/-- BOGUS: claims the Jacobi-defect coordinate is `205`. It GENUINELY equals `12` (`jac_true`).
    The WRONG claim (the commutator IS a Lie bracket / the Jacobiator vanishes / the Jacobi defect
    is zero / the coefficient is not `6`) reduces — through the banked value — to the false numeric
    `12 = 205`, so this must NOT compile. -/
theorem jac_wrong_BOGUS :
    (jacobiator jacWx jacWy jacWz).im.im.im = (205 : ℚ) := by
  rw [jac_true]
  -- ⊢ (12 : ℚ) = 205  (FALSE — the costume bites)

end Counterexamples
