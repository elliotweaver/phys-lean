/-
  Counterexamples.OctonionJordanTraceFormWrongValueCostume — N214 anti-vacuity (C246).
  ===========================================================================
  W8 ANTI-VACUITY. The N214 node banks a genuinely-NEW, genuinely-DIFFERENT structure on the
  exceptional Jordan algebra J3(O) = the 3x3 Hermitian octonionic matrices over O Q = CD (H Q):
  the LINEAR TRACE FUNCTIONAL and the BILINEAR TRACE FORM (the Cartan-Killing metric)
  jTraceForm A B = trace (jb A B), whose value on the diagonal Cartan is the FORCED EUCLIDEAN
  METRIC jTraceForm (Dg s0 s1 s2) (Dg t0 t1 t2) = ocR (2*(s0*t0 + s1*t1 + s2*t2)), and — the
  headline — the N213 trace-zero charge hyperplane realized as the trace-form-orthogonal
  complement of the FORCED identity direction 1 = Dg 1 1 1 = E0+E1+E2.

  THE GENUINE VALUE. The Cartan metric coordinate of the pair (Dg 1 2 3, Dg 1 1 1), read in its
  re.re.re coordinate, is genuinely

      12     (traceform_metric_witness = 2*(1*1 + 2*1 + 3*1) = 2*6 = 12),

  a genuine nonzero value — the forced Euclidean metric is non-degenerate, not the trivial 0.

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the trace form is not the forced metric /
  does not pair the identity to twice the trace / the charge hyperplane is not the orthogonal
  complement of the identity / the metric is degenerate): that this value equals (214 : Q).
  Rewriting the banked witness shows the bogus claim reduces to the false numeric 12 = 214 in Q.
  The kernel cannot close it; the costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for the Cayley-Dickson double O Q =
  CD (H Q), the re.re.re coordinate of jTraceForm (Dg 1 2 3) (Dg 1 1 1) equals 12, so claiming it
  is 214 is genuinely FALSE (12 /= 214).

  DISTINCT from the banked battery (... C244 = 212, C245 = 213): the pair (214, 12) is fresh
  (RHS 214 distinct from every prior left-hand value).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.OctonionJordanTraceForm

namespace Counterexamples

open Phys.Algebra Phys.Algebra.HJ Phys.Cascade

attribute [local instance] CD.narCD CD.srCD

/-- TRUE: the Cartan-metric coordinate of `(Dg 1 2 3, Dg 1 1 1)` equals `12`
    (`traceform_metric_witness`, the forced Euclidean metric `2*(1+2+3) = 12`). -/
theorem traceform_metric_true :
    (jTraceForm (Dg 1 2 3) (Dg 1 1 1)).re.re.re = 12 :=
  traceform_metric_witness

/-- BOGUS: claims the metric coordinate is `214`. It GENUINELY equals `12`
    (`traceform_metric_true`). The WRONG claim (the trace form is not the forced metric / the
    charge hyperplane is not the orthogonal complement of the identity) reduces — through the
    banked value — to the false numeric `12 = 214`, so this must NOT compile. -/
theorem traceform_metric_wrong_BOGUS :
    (jTraceForm (Dg 1 2 3) (Dg 1 1 1)).re.re.re = (214 : ℚ) := by
  rw [traceform_metric_true]
  -- ⊢ (12 : ℚ) = 214  (FALSE — the costume bites)

end Counterexamples
