/-
  Counterexamples.OctonionJordanSharpPolarWrongValueCostume — N217 anti-vacuity (C249).
  ===========================================================================
  W8 ANTI-VACUITY. The N217 node banks THE FIRST POLARIZATION OF THE CUBIC NORM on the
  exceptional Jordan algebra J3(O) = the 3x3 Hermitian octonionic matrices over O Q = CD (H Q):
  the first polar `jNpolar` (the Freudenthal sharp trace-pairing) and the cubic polarization
  identity `jN (A + s*B) = jN A + s*jNpolar A B + s^2*jNpolar B A + s^3*jN B` — the sharp map
  forced as the linear coefficient of the derived cubic norm's own polarization.

  THE GENUINE VALUE. The first polar of the PURE off-diagonal cores `Xz 1 1 1` against
  `Xz 1 1 1` (all diagonal parameters zero) is genuinely

      6    (jNpolar_cross_witness = 2*(reQ 1 + reQ 1 + reQ 1) = 2*3 = 6),

  the pure mixed trilinear cross-pairing. A naive "the polar is just the cofactor-diagonal
  pairing" reading (all diagonal parameters zero would then give 0) MISSES this off-diagonal
  cross content — the genuine value is 6, NOT 0. The polar carries real off-diagonal content.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the first polar ignores the off-diagonal
  cross-term / is just the cofactor-diagonal pairing / the sharp trace-pairing is degenerate):
  that this value equals (217 : Q). Rewriting the banked witness shows the bogus claim reduces
  to the false numeric 6 = 217 in Q. The kernel cannot close it; the costume BITES (lean leaves
  the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the Cayley-Dickson double O Q =
  CD (H Q), the value jNpolar 0 0 0 1 1 1 0 0 0 1 1 1 equals 6, so claiming it is 217 is
  genuinely FALSE (6 /= 217).

  DISTINCT from the banked battery (... C247 = 215, C248 = 216): the pair (217, 6) is fresh
  (RHS 217 distinct from every prior left-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanSharpPolar

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ Phys.Cascade

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the first polar of the pure off-diagonal cores `Xz 1 1 1` against `Xz 1 1 1` equals
    `6` (`jNpolar_cross_witness`, the pure trilinear cross-pairing `2*3 = 6`). -/
theorem polar_cross_true : jNpolar 0 0 0 1 1 1 0 0 0 1 1 1 = 6 := jNpolar_cross_witness

/-- BOGUS: claims the first polar cross-pairing is `217`. It GENUINELY equals `6`
    (`polar_cross_true`). The WRONG claim (the polar ignores the off-diagonal cross-term / is
    just the cofactor-diagonal pairing / the sharp trace-pairing is degenerate) reduces —
    through the banked value — to the false numeric `6 = 217`, so this must NOT compile. -/
theorem polar_cross_wrong_BOGUS : jNpolar 0 0 0 1 1 1 0 0 0 1 1 1 = (217 : ℚ) := by
  rw [polar_cross_true]
  -- ⊢ (6 : ℚ) = 217  (FALSE — the costume bites)

end Counterexamples
