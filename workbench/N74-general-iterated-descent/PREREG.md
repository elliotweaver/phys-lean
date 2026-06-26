# N74 PREREG — frozen GO/NO-GO + KILL before compute

## The node (specified against what the chain ACTUALLY produced — ROADMAP §N74 frontier)
N73 banked the FIRST CLOSED MULTI-STEP DEFLATION DESCENT but only at a FIXED CONCRETE RANK:
the single inductive step `deflateC_specOpN_zeroOn` (peel one more index off the partially-
deflated `specOpN (zeroOn S l) u`, growing the peeled-index Finset S), the terminal state
`specOpN_zeroOn_univ` (peeling ALL indices yields 0 — but stated as a COEFFICIENT identity,
not as the RESULT of actually iterating the deflation operator), and the CONCRETE 3-step
`txMix_full_descent` (the genuine 10-dim-mixing witness driven to 0 by hand, three nested
`deflateC` calls). What N73 did NOT assemble: the GENERAL iterated descent — a SINGLE theorem
at ARBITRARY rank n stating that ITERATING the actual deflation peel over all n indices,
starting from the FULL operator `specOpN l u`, reaches the zero operator. That assembly is
ROADMAP §N74 priority (ii): "the general induction on n over the now-closed descent assembling
the full existence once the seed is in hand (an n-step Finset-indexed descent terminating at
specOpN_zeroOn_univ, the deflateC_specOpN_zeroOn skeleton iterated)".

## MEASURE FIRST (W9) — priority order from the ticket
- (i) seed eigenpair EXTRACTION at general dimension (characteristic-cubic root over Cut) —
  HEAVY group-manifold: needs a cubic-root existence over Cut (no Mathlib analogue), genuine
  W1 sub-node. NOT this node.
- (ii) ★ the general iterated descent over deflateC at arbitrary rank n — PURE Finset/List
  induction over the BANKED single step `deflateC_specOpN_zeroOn` (N73). No cubic root, no
  group-manifold machinery, no new analysis. THIS NODE.
- (iii)/(iv) reachability / global polar — downstream of the seed. NOT this node.

## GO / NO-GO
GO: bank, over the derived ℝ Cut + the terminal algebra O Cut, the GENERAL iterated deflation
descent — define `deflateList l u g ks` (fold the peel `deflateC g (l k) (u k)` over a list of
indices ks), prove the general induction
  `deflateList l u (specOpN (zeroOn S l) u) ks = specOpN (zeroOn (S ∪ ks.toFinset) l) u`
for `ks.Nodup` with every `k ∈ ks` disjoint from S, and SPECIALIZE to S = ∅, ks = `List.finRange n`
to get the HEADLINE
  `deflateList l u (specOpN l u) (List.finRange n) = 0`   (GENERAL rank n)
plus the concrete subsumption recovering `txMix_full_descent` as the n=3 instance (W8 non-vacuity).
Each decl foundations-only [propext, Classical.choice, Quot.sound]; gate D0–D6 green; costume
C105 bites a WRONG iterated-descent claim with a false numeric DISTINCT from C84..C104 (C104=25=11).

NO-GO / W1 DISSOLUTION: if the general iterated descent genuinely resists after measure+reframe,
bank the immediately-bankable sub-piece and child the remainder. (Not expected — it is pure
Finset/List bookkeeping over the banked N73 step.)

## KILL (classifies a fight as INSTRUMENT failure, not theory)
- Per-obligation compile KILL: 30s. Any single theorem/probe exceeding 30s wall = INSTRUMENT
  wall (W9): MEASURE the smallest sub-obligation, DECOMPOSE, NEVER inflate maxHeartbeats / never
  monolithic brute. The whole engine here is `Finset.sum`/`List.foldl` bookkeeping over banked
  lemmas — same cost class as N68–N73 (each compiled <15s). If a piece blows past 30s the route
  is wrong; reframe, do not grind.
- No `native_decide`, no `sorry`, no `axiom`, no inflated `maxHeartbeats`.

## ANTI-TIMEOUT (W9)
Scratch probe in isolation FIRST (cp to Phys/<probe>.lean, `lake env lean`, grep full errors).
The instant the probe compiles clean → productionize into a NEW file under Phys/Algebra/
(LorentzContinuumDescentIter.lean) + wire (Phys.lean + AxiomAudit import AT END + #print axioms)
+ commit BEFORE chasing polish. Gate in BACKGROUND. Child next node + complete with turns to spare.

## STANDARD check (applied before commit)
- UNBROKEN: every object from banked N63 projC / N68 specOpN / N70 deflateC+deflateC_specOpN /
  N73 deflateC_specOpN_zeroOn+zeroOn+specOpN_zero + Finset/List standard Mathlib machinery on the
  DERIVED objects; no new posit.
- COMPLETE: every decl audited foundations-only against the built olean + gate D6.
- PHYSICS-WORDS-REMOVABLE: delete "deflation/peel/descent/eigen*/spectral/rank/dimension/
  termination/induction/seed" → pure math about `deflateList`/`specOpN`/`zeroOn`/`deflateC`/Cut.
