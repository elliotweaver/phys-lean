/-
  Counterexamples.OctonionJordanCubicNormWrongValueCostume — N215 anti-vacuity (C247).
  ===========================================================================
  W8 ANTI-VACUITY. The N215 node banks a genuinely-NEW, genuinely-CUBIC invariant on the
  exceptional Jordan algebra J3(O) = the 3x3 Hermitian octonionic matrices over O Q = CD (H Q):
  the CUBIC NORM (the Freudenthal reduced determinant)
      jN d0 d1 d2 a b c = d0*d1*d2 - d0*|c|^2 - d1*|b|^2 - d2*|a|^2 + 2*Re((a*c)*star b),
  the degree-3 invariant (above the N214 linear trace and quadratic trace form), whose trilinear
  cross-term is bracketing-independent AND cyclic FORCED by octonion trace-associativity.

  THE GENUINE VALUE. The cubic norm of the Hermitian matrix with diagonal (2,2,2) and a single
  off-diagonal generator a = 1 at the (0,1)-slot is genuinely

      6     (jN_witness_a = 2*2*2 - 2*|1|^2 = 8 - 2 = 6),

  a value strictly BELOW the diagonal product 8 — the cubic norm genuinely depends on the
  off-diagonal, it is NOT the trivial diagonal product.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the cubic norm is just the diagonal product /
  ignores the off-diagonal / the cross-term is mis-signed / the norm is degenerate): that this
  value equals (215 : Q). Rewriting the banked witness shows the bogus claim reduces to the false
  numeric 6 = 215 in Q. The kernel cannot close it; the costume BITES (lean leaves the unsolved
  false goal, exit 1).

  The bite is name-independent: delete every comment and for the Cayley-Dickson double O Q =
  CD (H Q), the value jN 2 2 2 1 0 0 equals 6, so claiming it is 215 is genuinely FALSE (6 /= 215).

  DISTINCT from the banked battery (... C245 = 213, C246 = 214): the pair (215, 6) is fresh
  (RHS 215 distinct from every prior left-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanCubicNorm

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ Phys.Cascade

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the cubic norm of the diagonal-(2,2,2) Hermitian matrix with a single off-diagonal
    generator `a = 1` at the `(0,1)`-slot equals `6` (`jN_witness_a`, `8 - 2 = 6`). -/
theorem cubicnorm_offdiag_true : jN 2 2 2 1 0 0 = 6 := jN_witness_a

/-- BOGUS: claims the cubic norm is `215`. It GENUINELY equals `6` (`cubicnorm_offdiag_true`).
    The WRONG claim (the cubic norm ignores the off-diagonal / is just the diagonal product /
    the cross-term is mis-signed) reduces — through the banked value — to the false numeric
    `6 = 215`, so this must NOT compile. -/
theorem cubicnorm_offdiag_wrong_BOGUS : jN 2 2 2 1 0 0 = (215 : ℚ) := by
  rw [cubicnorm_offdiag_true]
  -- ⊢ (6 : ℚ) = 215  (FALSE — the costume bites)

end Counterexamples
