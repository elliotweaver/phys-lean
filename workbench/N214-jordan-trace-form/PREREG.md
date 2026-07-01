# N214 — PREREG (frozen BEFORE finalize; GO/NO-GO + KILL)

## Front chosen (MEASURE-FIRST, W9)
Front (b)+(a-prereq) FUSED: **THE LINEAR TRACE FORM + THE BILINEAR TRACE FORM (Cartan–Killing metric) on J₃(O)**,
and — the genuinely-new RELATIONAL headline — **N213's trace-zero charge hyperplane realized as the
trace-form-orthogonal complement of the FORCED identity direction `1 = E0+E1+E2`.**

This is the next EXPLICIT rung of the named hypercharge ascent (RUNBOOK W1 repeated-deferral signal),
citing §N213-superseded frontier front (b) [the linear trace form as the forced grading functional
whose kernel IS the charge plane] and front (a) [the charge functional as a forced trace-pairing —
this node supplies its PREREQUISITE forced inner-product structure].

## Why genuinely-NEW (not a re-pin / not vacuous — W8)
- N213 banked the weight DIAGRAM (how Dg grades the off-diagonal core Xz) + the weight-SUM constraint
  (sum = 2·trace) + the trace-zero COLLAPSE. It did NOT bank the trace FUNCTIONAL itself, and never
  built a BILINEAR FORM on the algebra.
- This node builds a DIFFERENT object: the symmetric bilinear TRACE FORM `T(A,B) = trace(A·B + B·A)`
  (the Cartan–Killing metric), never previously banked. Its FORCED values on the diagonal Cartan
  (`T(Dg s,Dg t) = ocR(2·Σ sᵢtᵢ)` — the Euclidean metric) and on the frame (`T(Eᵢ,Eⱼ) = 2δᵢⱼ` — the
  forced orthonormal frame) are new relational content.
- ★ THE HEADLINE (jTF_one_Dg_zero_iff): the charge hyperplane N213 (`t0+t1+t2=0`) is EXACTLY the
  trace-form-orthogonal complement of the FORCED identity `1 = Dg 1 1 1 = E0+E1+E2` (frame_sum, banked):
  `T(1, Dg t) = 0 ↔ t0+t1+t2 = 0`. This is the forced structural fact — NOT a posit — that identifies
  the charge plane intrinsically via the trace-form metric. It supplies front (a)'s required
  "Cartan–Killing pairing" as a FORCED direction.

## THE HONEST ASCENT VERDICT (repeated-deferral rule, RUNBOOK W1)
This node does NOT yet posit a specific hypercharge Y. It banks the FORCED metric + the forced
identity-orthogonal-complement = charge plane. To pin a SPECIFIC Y direction WITHIN the 2-plane still
needs a SECOND forced direction (a forced isospin T₃ inside the plane, whose trace-form-orthogonal
complement is Y). That forced isospin direction inside J₃(O)'s Cartan is NOT yet banked — it is the
NEXT rung. N214's handoff NAMES this explicitly (child N215 = the forced isospin direction inside the
charge plane / OR a genuinely different joint), so the front is advanced honestly, no 12th silent defer,
no posited normalization.

## GO / NO-GO
GO: all lemmas compile clean foundations-only [propext, Classical.choice, Quot.sound], NO coordinate
ring (structural reframe through Matrix.diagonal_mul_diagonal + trace_diagonal + ocR ring-hom
ocR_mul/ocR_add + the banked N5/N213 objects), costume C246 bites `= 214`, no name collisions.
NO-GO → block: if the trace form needs an octonion-coordinate ring (W9), or if the charge-plane
headline needs a posited normalization (THE ONE LAW), reframe or child a route-finding node.

## MEASURED (probes, before finalize)
- probe1 (jTr, jTr_Dg, jTr_Xz, jTraceForm, jTraceForm_symm): clean foundations-only ~7s.
- probe2 (jTF_Dg_Dg — the Cartan metric): clean foundations-only.
- probe3 (Du{0,1,2}_eq_Dg, jTF_Du0_Du0=ocR 2, jTF_Du0_Du1=0): clean foundations-only.
- probe4 (Dg_one, jTF_one_Dg, jTF_one_Dg_zero_iff — the charge-plane headline): clean foundations-only.
NO coordinate ring anywhere; all structural. KILL = 120s / 400000 heartbeats per obligation
(never approached; every probe first/second pass ~7–10s).

## Decls (production Phys/Algebra/OctonionJordanTraceForm.lean, namespace Phys.Algebra.HJ)
jTr, jTr_Dg, jTr_Xz, jTraceForm, jTraceForm_symm, ocR_one, ocR_reQ, Du0_eq_Dg, Du1_eq_Dg, Du2_eq_Dg,
jTF_Dg_Dg, jTF_Du0_Du0, jTF_Du0_Du1, Dg_one, jTF_one_Dg, jTF_one_Dg_zero_iff,
traceform_metric_witness (teeth), traceform_metric_witness_ne (teeth ≠).

## Costume C246
`= 214`: the Cartan metric coordinate `(jTraceForm (Dg 1 2 3) (Dg 1 1 1)).re.re.re` GENUINELY equals
`2·(1+2+3) = 12` (traceform_metric_witness); the WRONG claim it is `214` (the trace form is not the
forced metric / does not pair the identity to twice the trace / the charge plane is not the
orthogonal complement) forces `12 = 214` in ℚ. DISTINCT pair from the battery (LHS 214 fresh).
