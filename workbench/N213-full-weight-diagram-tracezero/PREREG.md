# N213 PREREG — THE FULL WEIGHT DIAGRAM of the diagonal Cartan frame on J₃(O)
#          + the TRACE-ZERO charge hyperplane where charge is a forced eigenvalue.
# (frozen GO/NO-GO + KILL before compute)

## FRONT CHOSEN (of the §N212-superseded frontier): (a) — the ASSEMBLED weight diagram of
## ALL THREE off-diagonal slots + the trace-zero structure. This is the DIRECT next step of
## the named hypercharge ascent (RUNBOOK W1 repeated-deferral signal): N212 banked the SINGLE
## (0,1)-slot weight t0+t1; N213 assembles ALL THREE simultaneously and derives the trace-zero
## hyperplane where an independent (charge) direction becomes a FORCED eigenvalue WITHOUT a posit.

## MEASURE-FIRST VERDICT (must be settled BEFORE any production commit):
##  - front (a): GENUINELY-NEW relational content? The DANGER (ticket W8): re-running jb_Dg_Xz on a
##    relabelled slot is a MECHANICAL consequence = a third copy of N212's single-slot lemma → REJECT.
##    The GENUINE new content is (i) the SIMULTANEOUS action on the full Xz a b c giving the three
##    slot weights (t0+t1),(t0+t2),(t1+t2) IN ONE STATEMENT (the weight DIAGRAM as a single map,
##    not three separate copies), AND (ii) the TRACE-ZERO structural relation: on the hyperplane
##    t0+t1+t2=0 the three slot weights become (-t2),(-t1),(-t0) — each slot weight equals MINUS the
##    complementary Cartan coordinate, so the rank-2 trace-zero Cartan is exactly the 2-parameter
##    charge space, and the sum of the three weights = 2·(trace). THIS relation (weights ↔ trace,
##    the trace-zero collapse) is NOT in N212 and NOT a mechanical relabel.
##  - fronts (b) cubic/determinant, (c) Freudenthal: deferred (heavier; MEASURE only if (a) fails).

## GO (commit) iff:
##   G1. The GENERIC weight action `jb (Dg t0 t1 t2) (Xz a b c) = Xz ((t0+t1)•a) ((t0+t2)•b) ((t1+t2)•c)`
##       compiles CLEAN, foundations-only [propext, Classical.choice, Quot.sound]. (THE weight diagram.)
##   G2. The trace-zero specialization `t0+t1+t2=0 ⟹ jb (Dg t0 t1 t2)(Xz a b c) = Xz ((-t2)•a)((-t1)•b)((-t0)•c)`
##       compiles CLEAN (the forced charge-space collapse — the genuine NEW relational content).
##   G3. W8 costume C245 (a WRONG numeric DISTINCT from the banked battery, e.g. `= 213`) BITES.
##   G4. STANDARD: unbroken (only banked N5/N212 objects + derived ℚ + O ℚ = CD(H ℚ)), complete,
##       physics-words-removable, NON-VACUOUS (not a re-pin of N212's single slot; the diagram +
##       trace-zero relation is genuine new content).

## NO-GO (block / look wider):
##   - If G1 is a mechanical `Xz a 0 0`-relabel with NO assembled statement and NO trace-zero content
##     → it is a re-pin of N212 (W8). Look WIDER (front b/c/d).
##   - If the direct matrix proof of G1 blows up (star-entry / qMod smul mismatch on the full Xz a b c),
##     REFRAME through the trunk (Dg_eq_smul + jb bilinearity + per-slot frame lemmas + Xz linearity),
##     the N212 structural route. NO monolithic coordinate ring (W9 crime scene).

## KILL (instrument-wall tripwire): 120s / 400000 heartbeats per obligation. If any single obligation
## exceeds it, STOP — measure/decompose/reframe (W9), do NOT inflate maxHeartbeats and wait.

## ROUTE (measured, to be confirmed by probe1):
##   Ingredient frame lemmas (per-slot, full Xz):
##     jb Du0 (Xz a b c) = Xz a b 0   (E0 keeps slots touching index 0: (0,1),(0,2); kills (1,2))
##     jb Du1 (Xz a b c) = Xz a 0 c   (E1 keeps (0,1),(1,2); kills (0,2))
##     jb Du2 (Xz a b c) = Xz 0 b c   (E2 keeps (0,2),(1,2); kills (0,1))
##   Xz-linearity (build or reuse): t•Xz a b c = Xz (t•a)(t•b)(t•c);  Xz a b c + Xz p q r = Xz (a+p)(b+q)(c+r)
##   Generic: Dg_eq_smul + jb_add_left + jb_smul_left(×3) + the three frame lemmas + Xz-linearity → collect.
##   (Route A alternative: direct Matrix.ext on the full Xz a b c — MEASURE which is cheaper.)

## COSTUME C245: bite the ASSEMBLED-diagram/trace-zero content (NOT the single (0,1)-slot of N212).
##   Candidate: the (1,2)-slot (c-slot) weight under a trace-zero Cartan diag(2,3,-5): weight t1+t2 = 3+(-5) = -2,
##   read at entry (1,2) with c=1 → GENUINELY -2; wrong claim = 213 forces -2 = 213 in ℚ. PASS_SIGNATURE ERE `= 213`.
##   (DISTINCT pair (213,-2); RHS 213 distinct from every prior left/right value in the battery.)
