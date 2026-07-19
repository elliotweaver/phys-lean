# PREREG — t_374df70b — AB-INITIO RE-DERIVATION OF THE PER-EDGE FREEZE-OUT CENSUS WEIGHTS

## OWNER DIRECTIVE (comment 549, decision B)
Dressing FIXED at forced 3/2; base exact. Manager's exact-rational audit localizes the defect to C —
the FREEZE-OUT STAIRCASE CENSUS WEIGHTS (per-edge census on L_mb/L_b0/L_b2 in ComposedFreezeoutDissolved),
"COUNTING CLAIMS ... banked mid-frame-turmoil and never independently re-derived." TASK: RE-DERIVE the
per-edge census weights AB INITIO from the banked census/decoupling structure — for each derived edge COUNT
which banked content is active/decoupled and what census its log carries in the census-conserving descent.
NO-FIT absolute: counting, never solving-for-137.036; weights land where counting lands them.

## WHAT THE BANKED CODE DOES (SubBandCompletion.freezeoutTail / FreezeoutComposition.freezeout_closed)
freezeoutTail rb rc rl = [(censusBottomBand=11/3, rb), (censusCharmBand=10/3, rc), (censusLightBand=2, rl)]
totalScreening = κ·(11/3)·cutLog rb + κ·(10/3)·cutLog rc + κ·2·cutLog rl.

The edges are RATIOS = band SPANS (FreezeoutEdgeCrossSectorReduction):
  rb = edgeBottom = m_b/m_c  → span (m_c, m_b)
  rc = edgeCharm  = m_c/m_s  → span (m_s, m_c)
  rl = edgeLight  = m_s/Λ    → span (Λ,   m_s)

## THE AB-INITIO COUNTING (X3's OWN rule, evaluated on the derived spans)
X3 (FineStructureCensusBands) DEFINES: "at a given resolution scale only the flavours whose band edge lies
below the scale are active/resolved; the census content of a band is the coloured occupation sub-census over
those ACTIVE flavours." The census constant across a span [lo,hi] with no interior threshold = active content
throughout = flavours with edge < lo (equivalently, active at every μ in the open span). Evaluating on the
three derived spans:
  span (m_c,m_b): active {u,d,s,c}  = bandCensus[2,1,1,2]  = 10/3   (b DECOUPLED below m_b — NOT 11/3)
  span (m_s,m_c): active {u,d,s}    = bandCensus[2,1,1]    = 2      (c DECOUPLED below m_c — NOT 10/3)
  span (Λ,m_s):   active {u,d}      = bandCensus[2,1]      = 5/3    (s DECOUPLED below m_s — NOT 2)

## THE DEFECT (a genuine off-by-one, name-matched not physics-matched)
The banked code paired edgeBottom (span below m_b, active 10/3) with censusBottomBand=11/3 — the R-ratio
plateau of the region ABOVE m_b, where b is active. cutLog(m_b/m_c) measures running across (m_c,m_b) where
b has DECOUPLED, so the census must be 10/3, not 11/3. Each banked weight is the census resolved AT the span's
UPPER edge (pre-decoupling), one band too high. Corrected per-edge weights: (10/3, 2, 5/3).

## ANTI-BULLSHIT GATE (mechanical, in writing)
1. ARROW FORCED?  YES. "Active across a span = X3's active-content rule on the derived edges." The census on
   κ·census·cutLog(ratio) is, for the HIGH bands, exactly the content active across the span (topBand/confBand
   both carry 16/3 = full content, no decoupling above v/Λ). Applying the SAME rule below the confinement
   floor forces (10/3, 2, 5/3). Not an import of standard QCD — the fold's own census rule on the fold's own
   edges.
2. WINDOW DATA-DEFINED?  NO — decisively. Corrected summand ≈ 0.9855 (banked ≈ 1.6324), so the corrected
   endpoint LANDS ~136.45, FURTHER from measured 137.036 than the banked 137.0997. A fit moves TOWARD data;
   the counting moves AWAY. This is the strongest NO-FIT proof available.
3. CONTRADICTS BANKED THEOREMS?  NO. freezeout_total_census=9 (a fact about the R-ratio PLATEAU values 11/3,
   10/3, 2) stays true; the corrected active-span censuses (total 7) are a DIFFERENT object. The freeze-out
   STEP law is PRESERVED: corrected steps 10/3−2=4/3=cct(charm), 2−5/3=1/3=cct(strange) — the same frozen
   census terms as banked; only the absolute staircase level shifts down one. Way-points 1582/27, 190/3
   (above the tail) are untouched (confWaypoint_free holds for any lower extension).
4. WORDS-REMOVABLE?  YES. Pure ℚ/Cut: "bandCensus[2,1,1,2]=10/3 is the census active across the span whose
   ratio is edgeBottom" — a counting fact of the derived content. No physics word load-bearing.

## THE BUILD (append-only; NO modify of banked freezeoutTail — supersede by deriving the correct object)
Module: Phys/Algebra/PerEdgeCensusRederived.lean (import ComposedFreezeoutDissolved).
(1) censusActive{Bottom,Charm,Light}Span := bandCensus of active-content lists = 10/3, 2, 5/3 (X3 values).
(2) AB-INITIO counting theorems: each active-span census = bandCensus of resolved content; the step law
    preserved (steps = frozen census terms); the banked over-count = the just-frozen flavour's census term
    per edge (11/3=10/3+cct1, 10/3=2+cct2, 2=5/3+cct1).
(3) freezeoutTailActive rb rc rl + freezeoutActive_closed = κ·(10/3)cutLog rb + κ·2·cutLog rc + κ·(5/3)cutLog rl.
(4) The corrected GEM: κ·(5/3)·(8π/3) = 40/27 (π cancels, same mechanism as banked 16/9).
(5) freezeoutActive_summand_dissolved at pinned edges = 40/27 + κ·[3·L_mb + 10/3·L_b0 − 5/3·L_b2].
(6) composed_endpoint_active_determined (welded through composed_at_pinnedS_closed + joinContent=0).
(7) TEETH: corrected total 7 ≠ banked 9; step law preserved; the correction DECREASES the summand
    (moves endpoint away from measured — NO-FIT proof); corrected tail genuinely differs from banked.
(8) Capstone.

## GRADE
THEOREM-EXACT: all counting identities, the corrected dissolved form, the recomposed endpoint (exact Cut
identities, foundations-only). Measured 137.036, the ~136.45 corrected numeric, ~0.9855 summand = REMOVABLE
PROSE; no empirical number in any proof.

## SUCCESSOR (ONE): re-attest + re-narrow the CORRECTED composed endpoint toward D7 ≥15-sig-digit restate.
Note: the corrected endpoint moves further from measured — this is a NEW certified defect report per the
owner exactness standard (exact-or-unfinished); the hunt for the true composition structure continues in the
successor. This node's job (ab-initio census re-derivation + corrected recomposition) is discharged.
