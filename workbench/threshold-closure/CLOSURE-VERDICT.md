# CLOSURE-VERDICT — Phase A recon (THRESHOLD CLOSURE campaign)
Status: PHASE A COMPLETE. Head ead20e91. Frozen prereg: PREREG.md (read in full first).
Discipline: Q1–Q4 verdicts in §3 were frozen BEFORE the §4 check was run. No endpoint
arithmetic appears anywhere in this report. 137.036 appears in NO inference (K3 clean).

---

## 1. THE ENGINE, EXTRACTED FROM THE FIVE BANKED INSTANCES

### 1.1 The mirror insertion (MirrorSelfInsertionLaw, N586/N589/N679)
Banked: `insertionBlock a = chargeTraceDepth · kappaLeading · a²` (census × κ × α²);
`mirrorInsertion a = depthWeight · insertionBlock a`; `insertion_coefficient_forced`
assembles the coefficient `w·(16/3)·κ = (16/9)·κ` from banked theorems
(`depthWeight_eq`, w = 1/3); `residual_is_insertion_closure` and `root_selfref_shape`
show the fixed-point residual IS the unary law `D = κ₀ + w·D`
(`dressedOverlap_selfref`) closed on the endpoint. Teeth: `w_slot_bites`,
`census_slot_bites` (wrong weight or wrong census breaks the root).
**Template extracted:** a self-reference the bare sum MISSES is FORCED into the total
EXACTLY ONCE, with content = the census of the missed object (here the full
`chargeTraceDepth = 16/3`), weight = the derived re-entry cost of the mechanism (one
`w` per insertion), anchored AT THE LOCUS OF THE MISS (the endpoint, order α²).

### 1.2 The obstruction (GatherCoherenceCensus → MirrorFixedPoint, N585/N681)
Banked: `obstructionTerm = (3/5)·kappaLeading` (`census_mean` proved −3/5);
`F0 = recomposedEndpointDressed − obstructionTerm`. The gather's failure to see
itself coherently enters the total ONCE, weight 1, subtracted.
**Template confirmed:** second independent instance of miss → one forced closure
term, content = census of the missed coherence, entered at the gather level (the
locus of the miss), with a mechanism-derived coefficient (here 1).

### 1.3 The gluing-defect lane (TowerGatherObstruction L88 / Cocycle / BarMonad / PhysicalState L134,141)
Banked, read fully:
- `gluingDefect a b : x ↦ (a·b)·x − a·(b·x)` (TowerGatherObstruction L~92); on `O ℚ`
  it IS the associator (`o_gluingDefect_eq_assoc`, `gluingDefect_is_assoc_O`).
- `worlds_glue_iff_gluingDefect_zero`: gluing ⟺ the explicit obstruction vanishes.
- `gluesGlobally_iff_defect` / `gluesGlobally_iff_barDefect`
  (TowerGatherPhysicalState): a state is a GLOBAL SECTION iff its defect vanishes
  against every other chart — the local-vs-global machinery, formal and banked.
- Cocycle identities (`teich_cocycle_O`, `gluingDefect_2coboundary_O`,
  `jacobiator_eq_six_gluingDefect_O`): the defect is a genuine cocycle-level object;
  `gluing_cocycle_nonzero_O` gives non-vacuity.
- BarMonad: `barMultDefect = gluingDefect` (`barMultDefect_eq_gluingDefect`); the
  defect is the μ-comparison of the gather monad; T-algebras = global sections.
**Assessment for the seam reading:** the banked machinery has EXACTLY the right
SHAPE — local charts, a composite-vs-composed defect, global section ⟺ defect
vanishes, defect as cocycle. But it is banked ON THE CAYLEY–DICKSON TOWER (worlds =
left multiplications `L_a`), NOT on the descent's scale-line cover. Instantiating it
with spans-as-charts / thresholds-as-overlaps requires building a NEW presheaf-style
structure on the descent (charts = active-span census assignments, restriction =
decoupling, defect = census mismatch on overlaps) and proving the banked defect
axioms hold there. Nothing banked does this. What the machinery FORCES if
instantiated: the global section exists iff the per-seam defects are supplied as a
closure cocycle — i.e. Q1's existence would become a gluesGlobally_iff-style theorem.

### 1.4 The removal frame (DecouplingCensusRemoval L192 `decoupling_removal`) — the actual algebra
Read in full. The banked identity is
`totalScreening (leptonTail chargeTraceDepth) − totalScreening (leptonTail leptonCensus)
 = bandScreen colouredCensus (mass0/mass1)`,
proved from `leptonTail_screen_telescope` + linearity of `bandScreen` in census +
`census_split`. **The decisive finding:** the removal strips the decoupled coloured
census from the descent's FORWARD state (the lepton-tail band BELOW the edge) ONLY.
The accumulated screening from above the edge REMAINS in the total:
`conserving_confWaypoint_free` and `conserving_ewWaypoint_free` prove the two HIGH
bands are untouched (`190/3` and `1582/27` stay exact partial sums) — "the
correction is ENTIRELY below confinement." So the local-state vs global-ledger
distinction IS ALREADY IN THE BANKED ALGEBRA: the chart (forward state) forgets the
flavour; the ledger (total screening already accrued above the edge) keeps it.
**K1's trigger condition ("the removal frame's algebra genuinely deletes accumulated
screening") is FALSE. K1 is NOT triggered by the removal frame.**

### 1.5 The per-edge deltas (PerEdgeCensusRederived) — exact banked statements
- `overcount_bottom` (L210): `censusBottomBand − censusActiveBottomSpan
   = colouredCensusTerm 1` — i.e. `11/3 − 10/3 = 1/3` (bottom, down-type, level 1).
- `overcount_charm` (L216): `censusCharmBand − censusActiveCharmSpan
   = colouredCensusTerm 2` — i.e. `10/3 − 2 = 4/3` (charm, up-type, level 2).
- `overcount_light` (L222): `censusLightBand − censusActiveLightSpan
   = colouredCensusTerm 1` — i.e. `2 − 5/3 = 1/3` (strange, down-type, level 1).
Each span's over-count is the census term of the flavour decoupled at that span's
UPPER edge. Also banked: `active_step_charm`, `active_step_strange` (staircase steps
= one frozen flavour each — census conservation across seams intact).

### 1.6 The common mechanism (the engine, stated once)
Across 1.1 and 1.2 (and structurally 1.3): when a level's own structure produces a
SELF-LOOK-BACK the local computation cannot contain (a MISS), the fold does not
delete the missed content — it forces a CLOSURE term into the GLOBAL total, exactly
once, with (content = the census of the missed object, weight = the mechanism's
derived re-entry coefficient, anchor = the locus of the miss). The local object is
a chart section; local + closure = the global section; the difference is a gluing
defect (1.3's formal object). 1.4 shows the descent's banked algebra already
separates chart (forward state) from ledger (accumulated total).

---

## 2. WHAT THE ENGINE DOES AT A DECOUPLING SEAM (derivation sketch, every step pinned or flagged)

Setup (all banked): the descent crosses edge `m_f`; above it flavour `f` is active,
below it the forward state carries the reduced census (`decoupling_removal`,
X3's active-content rule as re-derived in PerEdgeCensusRederived §counting).

- **Step S1 (the seam is a MISS).** Below `m_f` the local chart's census no longer
  contains `f`; but `f`'s screening accrued above `m_f` remains in the total ledger.
  PINNED: `decoupling_removal` (forward-state removal only) +
  `conserving_confWaypoint_free`/`conserving_ewWaypoint_free` (ledger untouched).
  This is the engine's MISS precondition, present in banked algebra.
- **Step S2 (a miss is never clean deletion — a closure is forced).** The engine's
  two banked instances (1.1, 1.2) both force a one-time closure at their miss. But
  NO banked theorem instantiates this at a threshold: the unary law is banked on the
  endpoint seed only; the gluingDefect machinery is banked on the CD tower only.
  **NEW-DERIVATION-NEEDED (the load-bearing step):** the SEAM LAW — instantiate the
  gluing machinery on the descent's cover (spans as charts, thresholds as overlaps)
  and prove the local sections glue to a global section iff a closure cocycle is
  added at each seam (a `gluesGlobally_iff_defect` analogue for the scale line).
- **Step S3 (content of the closure).** Engine rule: content = census of the missed
  object. The missed object at seam `m_f` is flavour `f`; its census is
  `colouredCensusTerm (level f)`. PINNED for the identification of the missed object:
  `decoupling_removal` (what is removed is exactly the coloured census) and
  `active_step_charm`/`active_step_strange` (each seam step = exactly one flavour's
  census term). **NEW-DERIVATION-NEEDED** for the transport of the content rule from
  the endpoint/gather instances to the seam (it is a template inference, not a
  banked theorem).
- **Step S4 (anchor).** In both banked instances the closure enters at the locus of
  the miss (mirror: the endpoint where the look re-enters; obstruction: the gather
  level). The miss at a seam is located in the span BELOW the edge (that is where
  the local look no longer sees `f`). Engine ⟹ the closure screens on the span
  below `m_f` — i.e. it multiplies THAT span's log. PINNED (weakly) to the locus
  pattern of 1.1/1.2; **NEW-DERIVATION-NEEDED** as a theorem (a locality lemma:
  closure attaches at the defect's overlap, which the cocycle formulation of S2
  would supply automatically — in a cocycle the defect lives ON the overlap).
- **Step S5 (weight).** Candidates per prereg: 1, w, 1/(1−w). The mechanism of
  re-entry decides: the mirror's w is the cost of the look re-entering through the
  depth (one w per insertion); the obstruction's 1 is direct entry at the gather.
  At a seam the closure enters as a CENSUS term in a band, and the banked
  `bandScreen c r = κ·c·cutLog r` is LINEAR in the census with unit coefficient —
  no re-entry through the depth is involved, so the engine's own instances suggest
  direct entry: weight 1, pinned to `bandScreen` linearity IF the closure enters as
  a band census term. **NEW-DERIVATION-NEEDED:** that the closure enters as a band
  census term (rather than through a w-weighted re-entry) — this is a consequence
  of S2's cocycle form (the defect is census-valued on the overlap) and must be
  proved with it.

---

## 3. Q1–Q4 VERDICTS (FROZEN — before any check against N574's deltas)

- **Q1 EXISTENCE:** SUPPORTED-BY-TEMPLATE, NOT YET FORCED. The miss precondition is
  banked (S1: forward-state removal + intact ledger — K1's deletion scenario is
  provably false), and the local/global gluing machinery exists with the right
  shape (1.3), but no banked theorem forces a closure AT A THRESHOLD.
  Status: NEW-DERIVATION-NEEDED (the seam law, S2).
- **Q2 CONTENT:** the decoupled flavour's `colouredCensusTerm (level f)` — forced by
  the engine's content rule (content = census of the missed object) with the missed
  object pinned by `decoupling_removal` + the staircase steps; the rule's transport
  to the seam is NEW-DERIVATION-NEEDED (S3).
- **Q3 ANCHOR:** the span BELOW the decoupled edge (the span whose UPPER end is
  `m_f`) — its log multiplies the closure. Pinned to the miss-locus pattern of both
  banked instances; theorem form NEW-DERIVATION-NEEDED (S4, delivered free by the
  cocycle formulation since defects live on overlaps).
- **Q4 WEIGHT:** 1 (unit coefficient) — pinned to `bandScreen` census-linearity
  CONDITIONAL on the closure entering as a band census term; that conditional is
  NEW-DERIVATION-NEEDED (S5). Explicitly NOT w and NOT 1/(1−w) under the sketch:
  no depth re-entry is involved at a seam. (No endpoint arithmetic used to select.)

VERDICTS FROZEN HERE. Only now is §4 computed.

## 4. THE CHECK AGAINST N574'S DELTAS (run after §3 was frozen)

The frozen sketch predicts, per seam: closure content `colouredCensusTerm(level f)`,
on the span below `m_f`, coefficient 1 — i.e. old span weight = active census +
1·(just-decoupled flavour's census term).

| Seam (upper edge) | decoupled f (level) | predicted closure | banked delta (theorem) | match |
|---|---|---|---|---|
| bottom span (m_c,m_b), edge m_b | bottom (down, 1) | cCT 1 = 1/3 | `overcount_bottom` = cCT 1 = 1/3 | ✓ |
| charm span (m_s,m_c), edge m_c | charm (up, 2) | cCT 2 = 4/3 | `overcount_charm` = cCT 2 = 4/3 | ✓ |
| light span (Λ,m_s), edge m_s | strange (down, 1) | cCT 1 = 1/3 | `overcount_light` = cCT 1 = 1/3 | ✓ |

**MATCH: 3/3, exactly, as exact rationals.** Content matches (the just-decoupled
flavour's term, including the nontrivial 4/3-vs-1/3 alternation by up/down type),
anchor matches (each delta sits on the span below its edge), weight matches (unit
coefficient — the deltas are exactly one census term, not w·term or term/(1−w)).
Under the prereg: the old composition (11/3, 10/3, 2) is the GLOBAL section
(chart + closure); the active composition (10/3, 2, 5/3) is the LOCAL sections;
their difference is the closure cocycle. K2 is NOT triggered.

## 5. VERDICT / KILL-CONDITION ASSESSMENT

- **K1: NOT triggered.** The removal frame's algebra provably does NOT delete
  accumulated screening (§1.4); a gluing-defect instantiation route exists (§1.3)
  and is well-shaped, though not yet built.
- **K2: NOT triggered.** The frozen (content × anchor × weight) matches all three
  banked deltas exactly (§4).
- **K3: clean.** No step selected by endpoint landing; the check is against exact
  banked rationals (1/3, 4/3, 1/3), never against 137.036; Q4's weight was fixed by
  `bandScreen` linearity before the check.
- **Honest status:** the reading SURVIVES Phase A and is now a well-posed
  derivation with four named gaps (S2–S5), of which S2 is load-bearing and S4/S5
  fall out of S2's cocycle form. This is NOT yet a theorem: the match in §4 is
  between a template-forced sketch and banked identities, and becomes a derivation
  only when Phase B banks the seam law.

## 6. HANDOFF TO PHASE B (priority order)

1. **THE SEAM LAW (S2 — prove FIRST, everything hangs on it):** instantiate the
   banked gluing-defect machinery on the descent's cover — spans as charts (census
   assignments), thresholds as overlaps, restriction = decoupling removal — and
   prove the `gluesGlobally_iff_defect` analogue: the local active-span sections
   glue to a global section iff the closure cocycle (one census-valued defect per
   seam) is added. Candidate form: define `seamDefect e := censusAbove e −
   censusBelow e` on each overlap and prove it equals the decoupled flavour's
   `colouredCensusTerm`, then a cocycle identity across consecutive seams
   (telescoping to `decoupling_removal`'s total).
2. S3 as a corollary (content = the defect's value, already banked as
   overcount_bottom/charm/light — re-derive as instances of the seam law, not
   observations).
3. S4/S5 from the cocycle form (defect lives on the overlap; enters `bandScreen`
   linearly, weight 1).
4. Then the gather-level composition theorem: global section = local sections +
   closure cocycle, i.e. the old (11/3, 10/3, 2) staircase DERIVED, with
   `1/α(0)` a gather-level object (Phase C's landing input).
