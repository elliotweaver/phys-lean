/-
  Counterexamples.OctonionCrossProductContractionWrongValueCostume — N208 anti-vacuity (C240).
  ===========================================================================
  W8 ANTI-VACUITY. The N208 node banks a genuinely-NEW, genuinely-DIFFERENT joint: the 7-dimensional
  cross-product CONTRACTION (vector triple-product) identity on the octonion rung O Q = CD (H Q).
  For imaginary x, y in ImO,
        octCross x (octCross x y) = (gForm x y) . x - (gForm x x) . y
  (octCross_contraction). The 7-dim analogue of x x (x x y) = <x,y> x - <x,x> y; the FULL BAC-CAB
  rule fails in seven dimensions, but this contracted (x,x,y) case survives PRECISELY because of
  LEFT ALTERNATIVITY mul_mul_left (the alternating (x,x,y) associator vanishes), a NEW connection
  N206 (the cross product) to Alternative.lean (the alternative laws). The teeth: at the orthonormal
  pair u1, u2 the double cross collapses to octCross u1 (octCross u1 u2) = -u2, whose image
  coordinate (octCross u1 (octCross u1 u2)).re.im.re is -1, nonzero (octCross_contraction_witness_coord,
  octCross_contraction_witness_ne_zero).

  THE GENUINE VALUE. (octCross u1 (octCross u1 u2)).re.im.re = -1 (octCross_contraction_witness_coord):
  the double cross reproduces the NONZERO imaginary unit -u2, so the contraction is non-vacuous.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the contraction fails / the double cross does
  not contract / the coefficient is wrong / the result is zero): that this coordinate equals
  (208 : Q). Rewriting the banked value shows the bogus claim reduces to the false numeric
  -1 = 208 in Q. The kernel cannot close it; the costume BITES (lean leaves the unsolved false
  goal, exit 1).

  The bite is name-independent: delete every comment and for the Cayley-Dickson double O Q = CD (H Q),
  the double cross octCross u1 (octCross u1 u2) equals -u2 with image coordinate -1, so claiming it
  is 208 is genuinely FALSE (-1 /= 208).

  DISTINCT from the banked battery (... C237 12 = 205, C238 1 = 206, C239 1 = 207): the pair
  (208, -1) is fresh (LHS 208 distinct from every prior left-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionCrossProductContraction

namespace Counterexamples

open Phys.Algebra Phys.Cascade

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the double cross of the orthonormal pair `(u1, u2)` reproduces `-u2`; its image
    coordinate is `(octCross u1 (octCross u1 u2)).re.im.re = -1`. -/
theorem crosscontraction_true :
    (octCross u1 (octCross u1 u2)).re.im.re = -1 := octCross_contraction_witness_coord

/-- BOGUS: claims the coordinate is `208`. It GENUINELY equals `-1` (`crosscontraction_true`). The
    WRONG claim (the contraction fails / the double cross does not contract / the result is zero /
    the coefficient is wrong) reduces — through the banked value — to the false numeric `-1 = 208`,
    so this must NOT compile. -/
theorem crosscontraction_wrong_BOGUS :
    (octCross u1 (octCross u1 u2)).re.im.re = (208 : ℚ) := by
  rw [crosscontraction_true]
  -- ⊢ (-1 : ℚ) = 208  (FALSE — the costume bites)

end Counterexamples
