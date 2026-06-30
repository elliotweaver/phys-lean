/-
  Counterexamples.OctonionCrossProductDerivationWrongValueCostume — N207 anti-vacuity (C239).
  ===========================================================================
  W8 ANTI-VACUITY. The N207 node banks a genuinely-NEW, genuinely-DIFFERENT joint: the
  DERIVATION-INVARIANCE of the 7-dimensional CROSS PRODUCT on the octonion rung O Q = CD (H Q).
  Every Leibniz derivation D of the octonion product (the elements of derivationLieQ = Der(O Q) = g2,
  N16-N21) is also a derivation of the cross product octCross (N206):
        D (octCross x y) = octCross (D x) y + octCross x (D y)
  (octCross_deriv_leibniz; Lie-algebra form derivationLieQ_octCross_leibniz). This connects the
  two faces of the exceptional structure (the product and the vector product) to ONE symmetry
  algebra g2. The teeth: at the banked nullbasis derivation D0E and units u1, u2 the cross product
  octCross u1 u2 (the next imaginary unit) is genuinely MOVED — its image coordinate
  (D0E (octCross u1 u2)).im.re.re is -1, nonzero (octCross_deriv_witness_coord,
  octCross_deriv_witness_ne_zero).

  THE GENUINE VALUE. (D0E (octCross u1 u2)).im.re.re = -1 (octCross_deriv_witness_coord): the
  witnessing coordinate of the derivation acting on the cross product is -1, so the derivation
  genuinely moves the cross product (the invariance is non-vacuous, the action non-trivial).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the derivation fixes the cross product / the
  action is trivial / the invariance is vacuous / the coordinate is not -1): that this coordinate
  equals (207 : Q). Rewriting the banked value shows the bogus claim reduces to the false numeric
  -1 = 207 in Q. The kernel cannot close it; the costume BITES (lean leaves the unsolved false
  goal, exit 1).

  The bite is name-independent: delete every comment and for the Cayley-Dickson double O Q = CD (H Q),
  the nullbasis endomorphism D0E applied to octCross u1 u2 has image coordinate -1, so claiming it
  is 207 is genuinely FALSE (-1 /= 207).

  DISTINCT from the banked battery (... C236 16 = 204, C237 12 = 205, C238 1 = 206): the pair
  (207, -1) is fresh (LHS 207 distinct from every prior left-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionCrossProductDerivation

namespace Counterexamples

open Phys.Algebra Phys.Cascade

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the derivation `D0E` genuinely moves the cross product `octCross u1 u2`; its image
    coordinate is `(D0E (octCross u1 u2)).im.re.re = -1`. -/
theorem crossderiv_true :
    (D0E (octCross u1 u2)).im.re.re = -1 := octCross_deriv_witness_coord

/-- BOGUS: claims the coordinate is `207`. It GENUINELY equals `-1` (`crossderiv_true`). The WRONG
    claim (the derivation fixes the cross product / the action is trivial / the invariance is
    vacuous) reduces — through the banked value — to the false numeric `-1 = 207`, so this must
    NOT compile. -/
theorem crossderiv_wrong_BOGUS :
    (D0E (octCross u1 u2)).im.re.re = (207 : ℚ) := by
  rw [crossderiv_true]
  -- ⊢ (-1 : ℚ) = 207  (FALSE — the costume bites)

end Counterexamples
