/-
  Counterexamples.OctonionCrossProductWrongValueCostume — N206 anti-vacuity (C238).
  ===========================================================================
  W8 ANTI-VACUITY. The N206 node banks a genuinely-NEW, genuinely-DIFFERENT joint: the
  7-dimensional CROSS PRODUCT on the imaginary subspace Im(O Q) of the octonion rung O Q = CD (H Q).
  The cross product octCross x y = x*y + (gForm x y) • 1 = Im(x*y) is anticommutative
  (octCross_antisymm), closes in ImO (octCross_mem_ImO), and satisfies the composition-algebra
  LAGRANGE / Pythagorean norm identity
        gForm (octCross x y) (octCross x y) = gForm x x * gForm y y - (gForm x y)^2
  (octCross_lagrange). The teeth: it is genuinely NONZERO (octCross_u1_u2_ne_zero) and on the
  orthonormal pair (u1, u2) the cross-norm is exactly 1 = 1*1 - 0^2 (octCross_lagrange_u1_u2 —
  the cross product of two orthonormal imaginary units is itself a Born unit).

  THE GENUINE VALUE. gForm (octCross u1 u2) (octCross u1 u2) = 1 (octCross_lagrange_u1_u2): the
  squared Born length of the cross product of the two orthonormal imaginary units u1, u2.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the cross product is degenerate / the Lagrange
  identity fails / the cross of two orthonormal imaginary units is not itself a unit / the
  cross-norm vanishes / the vector product is trivial): that this cross-norm equals (206 : Q).
  Rewriting the banked value shows the bogus claim reduces to the false numeric 1 = 206 in Q. The
  kernel cannot close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the Cayley-Dickson double O Q = CD (H Q),
  the operation octCross on the two orthonormal imaginary generators has Born self-overlap 1, so
  claiming it is 206 is genuinely FALSE (1 /= 206).

  DISTINCT from the banked battery (... C235 203 = 2, C236 16 = 204, C237 12 = 205): the pair
  (206, 1) is fresh (LHS 206 distinct from every recent pair).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionCrossProduct

namespace Counterexamples

open Phys.Algebra Phys.Cascade

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the cross-norm of the orthonormal imaginary pair `(u1, u2)` is `1`:
    `gForm (octCross u1 u2) (octCross u1 u2) = 1`. -/
theorem cross_true :
    gForm (octCross u1 u2) (octCross u1 u2) = 1 := octCross_lagrange_u1_u2

/-- BOGUS: claims the cross-norm is `206`. It GENUINELY equals `1` (`cross_true`). The WRONG claim
    (the cross product is degenerate / the Lagrange identity fails / the cross of two orthonormal
    units is not a unit / the cross-norm vanishes) reduces — through the banked value — to the
    false numeric `1 = 206`, so this must NOT compile. -/
theorem cross_wrong_BOGUS :
    gForm (octCross u1 u2) (octCross u1 u2) = (206 : ℚ) := by
  rw [cross_true]
  -- ⊢ (1 : ℚ) = 206  (FALSE — the costume bites)

end Counterexamples
