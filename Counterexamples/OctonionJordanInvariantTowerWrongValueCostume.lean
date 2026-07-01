/-
  Counterexamples.OctonionJordanInvariantTowerWrongValueCostume — N216 anti-vacuity (C248).
  ===========================================================================
  W8 ANTI-VACUITY. The N216 node banks a genuinely-NEW MIDDLE invariant on the exceptional
  Jordan algebra J3(O) = the 3x3 Hermitian octonionic matrices over O Q = CD (H Q): the
  QUADRATIC SPUR (the second elementary-symmetric invariant / trace of the adjugate)
      jS d0 d1 d2 a b c = (d0*d1 + d0*d2 + d1*d2) - |a|^2 - |b|^2 - |c|^2,
  the missing middle rung of the invariant tower between the N214 linear trace and the N215
  cubic norm, together with the generic characteristic / minimal polynomial whose three
  coefficients ARE the three invariants.

  THE GENUINE VALUE. The quadratic spur of the Hermitian matrix with diagonal (2,2,2) and a
  single off-diagonal generator a = 1 at the (0,1)-slot is genuinely

      11    (jS_witness = (2*2 + 2*2 + 2*2) - |1|^2 = 12 - 1 = 11),

  a value strictly BELOW the diagonal second-symmetric 12 — the quadratic spur genuinely depends
  on the off-diagonal, it is NOT the trivial diagonal second-elementary-symmetric function.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the quadratic spur ignores the off-diagonal /
  is just the bare diagonal 12 / the middle invariant is degenerate): that this value equals
  (216 : Q). Rewriting the banked witness shows the bogus claim reduces to the false numeric
  11 = 216 in Q. The kernel cannot close it; the costume BITES (lean leaves the unsolved false
  goal, exit 1).

  The bite is name-independent: delete every comment and for the Cayley-Dickson double O Q =
  CD (H Q), the value jS 2 2 2 1 0 0 equals 11, so claiming it is 216 is genuinely FALSE
  (11 /= 216).

  DISTINCT from the banked battery (... C246 = 214, C247 = 215): the pair (216, 11) is fresh
  (RHS 216 distinct from every prior left-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanInvariantTower

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ Phys.Cascade

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the quadratic spur of the diagonal-(2,2,2) Hermitian matrix with a single off-diagonal
    generator `a = 1` at the `(0,1)`-slot equals `11` (`jS_witness`, `12 - 1 = 11`). -/
theorem spur_offdiag_true : jS 2 2 2 1 0 0 = 11 := jS_witness

/-- BOGUS: claims the quadratic spur is `216`. It GENUINELY equals `11` (`spur_offdiag_true`).
    The WRONG claim (the quadratic spur ignores the off-diagonal / is just the bare diagonal
    second-symmetric / the middle invariant is degenerate) reduces — through the banked value —
    to the false numeric `11 = 216`, so this must NOT compile. -/
theorem spur_offdiag_wrong_BOGUS : jS 2 2 2 1 0 0 = (216 : ℚ) := by
  rw [spur_offdiag_true]
  -- ⊢ (11 : ℚ) = 216  (FALSE — the costume bites)

end Counterexamples
