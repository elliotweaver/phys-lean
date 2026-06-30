/-
  Counterexamples.OctonionJordanFrameWeightWrongValueCostume — N212 anti-vacuity (C244).
  ===========================================================================
  W8 ANTI-VACUITY. The N212 node banks a genuinely-NEW, genuinely-DIFFERENT joint on the
  exceptional Jordan algebra J3(O) = the 3x3 Hermitian octonionic matrices over O Q = CD (H Q):
  the FORCED WEIGHT GRADING of the diagonal idempotent frame. The three diagonal unit
  idempotents E0 = diagonal ![1,0,0], E1 = diagonal ![0,1,0], E2 = diagonal ![0,0,1] form a
  complete orthogonal frame, and the off-diagonal (0,1)-slot Xz a 0 0 is a simultaneous
  eigenvector of the frame's Jordan-multiplication operators A -> jb E_k A with eigenvalue
  pattern (1,1,0):
        jb E0 (Xz a 0 0) = Xz a 0 0,  jb E1 (Xz a 0 0) = Xz a 0 0,  jb E2 (Xz a 0 0) = 0.
  Under the diagonal Cartan Dg t0 t1 t2 = diag(t0,t1,t2) the (0,1)-slot carries the FORCED
  weight (a linear functional of the Cartan parameters):
        jb (Dg t0 t1 t2) (Xz a 0 0) = (t0 + t1) . (Xz a 0 0).

  THE GENUINE VALUE. Under the explicit Cartan diag(2,3,0), the (0,1)-slot weight is genuinely
        2 + 3 = 5     (slot01_weight_witness, read off the (0,1) entry of the graded slot),
  a genuine value (= 5) — the SUM functional t0 + t1, distinguished from a product 6, from
  t0 = 2, from t1 = 3, and from max = 3.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the weight is not the sum t0+t1 / the slot
  is not a forced eigenvector / the frame does not grade the off-diagonal / the weight grading is
  vacuous): that this value equals (212 : Q). Rewriting the banked witness shows the bogus claim
  reduces to the false numeric 5 = 212 in Q. The kernel cannot close it; the costume BITES (lean
  leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the Cayley-Dickson double O Q =
  CD (H Q), the (0,1) entry of jb (Dg 2 3 0) (Xz 1 0 0), in its re.re.re coordinate, equals 5,
  so claiming it is 212 is genuinely FALSE (5 /= 212).

  DISTINCT from the banked battery (... C242 = 210, C243 = 211): the pair (212, 5) is fresh
  (LHS 212 distinct from every prior left-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanFrameWeight

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ Phys.Cascade

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the (0,1)-slot weight under the explicit Cartan `diag(2,3,0)` equals `5`
    (`slot01_weight_witness`, the forced weight `t0 + t1 = 2 + 3`). -/
theorem slot01_weight_true :
    ((jb (Dg 2 3 0) (Xz (1 : O ℚ) 0 0)) 0 1).re.re.re = 5 :=
  slot01_weight_witness

/-- BOGUS: claims the weight is `212`. It GENUINELY equals `5` (`slot01_weight_true`). The WRONG
    claim (the weight is not the sum `t0+t1` / the slot is not a forced eigenvector / the frame
    does not grade the off-diagonal) reduces — through the banked value — to the false numeric
    `5 = 212`, so this must NOT compile. -/
theorem slot01_weight_wrong_BOGUS :
    ((jb (Dg 2 3 0) (Xz (1 : O ℚ) 0 0)) 0 1).re.re.re = (212 : ℚ) := by
  rw [slot01_weight_true]
  -- ⊢ (5 : ℚ) = 212  (FALSE — the costume bites)

end Counterexamples
