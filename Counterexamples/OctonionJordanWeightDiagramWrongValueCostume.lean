/-
  Counterexamples.OctonionJordanWeightDiagramWrongValueCostume — N213 anti-vacuity (C245).
  ===========================================================================
  W8 ANTI-VACUITY. The N213 node banks a genuinely-NEW, genuinely-DIFFERENT joint on the
  exceptional Jordan algebra J3(O) = the 3x3 Hermitian octonionic matrices over O Q = CD (H Q):
  the FULL WEIGHT DIAGRAM of ALL THREE off-diagonal slots simultaneously, and the TRACE-ZERO
  CHARGE HYPERPLANE it forces. Under the diagonal Cartan Dg t0 t1 t2 = diag(t0,t1,t2),

      jb (Dg t0 t1 t2) (Xz a b c) = Xz ((t0+t1).a) ((t0+t2).b) ((t1+t2).c),

  the three off-diagonal slots carrying the weights (t0+t1),(t0+t2),(t1+t2). On the TRACE-ZERO
  hyperplane t0+t1+t2 = 0 the diagram collapses to Xz ((-t2).a)((-t1).b)((-t0).c): each slot
  weight equals MINUS the complementary Cartan coordinate — the forced 2-parameter charge space.

  THE GENUINE VALUE. Under the explicit TRACE-ZERO Cartan diag(2,3,-5) (trace 2+3-5 = 0), the
  (1,2)-slot (the c-slot, weight t1+t2 = 3+(-5)) is genuinely

      -2     (slot12_traceZero_weight_witness, read off the (1,2) entry of the graded core),

  a genuine value (= -2) — the trace-zero collapse (the (1,2)-slot carries MINUS the complementary
  coordinate t0 = 2), a DISTINCT slot / DISTINCT value from N212's (0,1)-slot witness 5.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the full diagram does not grade all three
  slots / the trace-zero collapse fails / the (1,2)-slot weight is not t1+t2 / the charge space
  is not forced / the weight grading is vacuous): that this value equals (213 : Q). Rewriting the
  banked witness shows the bogus claim reduces to the false numeric -2 = 213 in Q. The kernel
  cannot close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the Cayley-Dickson double O Q =
  CD (H Q), the (1,2) entry of jb (Dg 2 3 (-5)) (Xz 0 0 1), in its re.re.re coordinate, equals
  -2, so claiming it is 213 is genuinely FALSE (-2 /= 213).

  DISTINCT from the banked battery (... C243 = 211, C244 = 212): the pair (213, -2) is fresh
  (RHS 213 distinct from every prior left-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanWeightDiagram

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ Phys.Cascade

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the `(1,2)`-slot weight under the explicit trace-zero Cartan `diag(2,3,-5)` equals `-2`
    (`slot12_traceZero_weight_witness`, the forced weight `t1 + t2 = 3 + (-5) = -t0`). -/
theorem slot12_traceZero_weight_true :
    ((jb (Dg 2 3 (-5)) (Xz (0 : O ℚ) 0 1)) 1 2).re.re.re = -2 :=
  slot12_traceZero_weight_witness

/-- BOGUS: claims the weight is `213`. It GENUINELY equals `-2` (`slot12_traceZero_weight_true`).
    The WRONG claim (the full diagram does not grade all three slots / the trace-zero collapse
    fails / the `(1,2)`-slot weight is not `t1+t2`) reduces — through the banked value — to the
    false numeric `-2 = 213`, so this must NOT compile. -/
theorem slot12_traceZero_weight_wrong_BOGUS :
    ((jb (Dg 2 3 (-5)) (Xz (0 : O ℚ) 0 1)) 1 2).re.re.re = (213 : ℚ) := by
  rw [slot12_traceZero_weight_true]
  -- ⊢ (-2 : ℚ) = 213  (FALSE — the costume bites)

end Counterexamples
