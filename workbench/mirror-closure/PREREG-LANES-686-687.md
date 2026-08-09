# PREREG — LANES B2/C2 (referee item 7: rung identification) — FROZEN before dispatch
Date: 2026-08-08. Head at freeze: cddf1802. N-numbers: N686 (lane B2), N687 (lane C2).
C-numbers: C686/C687. Workers NEVER mint numbers.

## THE ONTOLOGY RULE FOR THIS ARC (read carefully — it defines "identification")
Math = physics here. "Identifying" a derived object as a physical threshold does NOT
mean bridging a category divide — it means proving the object EXHIBITS THE RELATIONAL
SIGNATURE the field attributes to that scale: it is pinned by its RELATIONS to the
other derived objects (the same numerator, the same census, the same generator, the
derived spatial dimension), and those relations are UNIQUE to it among the grammar's
candidates. Every theorem must be a RELATION between banked objects or a UNIQUENESS
over a candidate range — never a naming.

## LANE B2 — N686 EwRungRelationalSignature (electroweak threshold n=9)
Banked facts to grep and consume (verify names/namespaces first):
  ewClosureRatio := cutExp(−rungExponent(finrank ℚ spaceSub))   [ScaleTowerLadder]
  rungExponent n := criticalPhaseNumerator / n                   [ScaleTowerNumeratorLock:115]
  criticalPhaseNumerator := azimuthalTurn * channelCount (= 2π·42) [same file :93]
  channelCount := 1/α* with channelCount_eq : = 42               [same file :80-83]
  finrank ℚ spaceSub = 9 (grep ArcPConsolidation / SpacetimeSignature for the banked
  finrank theorem — 'P1', 'wrap count', spaceSub_finrank or similar)
  topBandRatio := ewClosureRatio⁻¹ [FineStructureZeroMomentum:271]
  derivedBandList entry (chargeTraceDepth, topBandRatio)         [BandEdgeList:242]
  kappaLeading = meridianFlux cutPi / azimuthalTurn              [FineStructureLoopNormalization]
TARGET THEOREMS (the relational signature):
  (R1) ewRung_dim_is_space : rungExponent (Module.finrank ℚ spaceSub) = 28 * cutPi / 3
       stated THROUGH the finrank (consume the banked finrank-9 theorem + rungExponent def)
       — the EW rung's exponent is a RELATION between the 84π grammar and the DERIVED
       spatial dimension, not a chosen n.
  (R2) ewRung_shares_alpha_numerator :
       rungExponent (Module.finrank ℚ spaceSub) * (Module.finrank ℚ spaceSub : Cut)
         = azimuthalTurn * channelCount
       — the SAME 2π (κ's denominator) and the SAME 42 (1/α*) that run the α landing
       constitute the rung's numerator: the threshold is tied to the coupling by
       construction, over the object azimuthalTurn (do NOT unfold 2π/42 to numerals
       on the right side; keep the OBJECTS).
  (R3) ewBand_screens_mirror_census :
       the band the rung bounds carries EXACTLY the mirror's census —
       (chargeTraceDepth, topBandRatio) ∈ derivedBandList (List.mem, decide/simp)
       AND bandScreen chargeTraceDepth topBandRatio = kappaLeading * chargeTraceDepth
         * cutLog topBandRatio (definitional unfold — states the band screens the same
       16/3 census object the mirror term inserts, through the same κ generator).
  (R4) ewRung_unique_in_grammar : the RELATIONAL PIN — among n ∈ range up to (say) 100,
       rungExponent n = 28*cutPi/3 ↔ n = 9. Route: rungExponent n = 84π/n; equality iff
       84/n = 28/3 iff n = 9; needs cutPi ≠ 0 (cutPi_pos). Use object-level algebra;
       ∀ n : ℕ, n ≠ 0 → ... is fine (n=0 degenerate: rungExponent 0 = div-by-zero
       convention — handle with n ≠ 0 hypothesis).
  (R5 bonus, only if cheap) suppression ordering: ewClosureRatio < 1 already banked
       (ewClosureRatio_lt_one) — restate the hierarchy relation with the confinement
       rung if lane C's objects are importable (they are NOT — different lane; SKIP
       any cross-lane import; state only what this lane's imports give).
KILL: if the banked finrank-9 theorem does not exist as a named theorem (only inside
a conjunction), extract what exists and report; do NOT re-prove finrank from scratch
if it costs > 20 min — consume the conjunction's projection.
DELIVERABLE: workbench/wt-B/ScratchN686.lean, ZERO errors via the standard recipe.

## LANE C2 — N687 ConfRungRelationalSignature (confinement threshold n=7)
Banked facts to grep and consume (verify first):
  rungExponent_at_imO [ScaleTowerNumeratorLock:130] — grep its exact statement; the
  n=7 rung is finrank ℚ imO (imaginary octonions) with rungExponent = 12·cutPi
  confBundle := confinementScaleRatio * topBandRatio [QuarkHadronTower:83]
  confBandRatio := confBundle⁻¹ [BandEdgeList:202]
  derivedBandList entry (chargeTraceDepth, confBandRatio)
  derivedBandList_assembly : invAlphaZero derivedBandList = 190/3 [BandEdgeList]
  the census triples live on Fin 7 (GatherCoherenceCensus — the SAME im𝕆 the rung
  dimension counts; grep how imO/Fin 7 relate: octonionImaginaryBasis, finrank imO = 7)
TARGET THEOREMS (the relational signature):
  (S1) confRung_dim_is_imO : rungExponent (Module.finrank ℚ (imaginary-octonion space))
       = 12 * cutPi, stated THROUGH the banked finrank-7 (grep for finrank_imO or the
       rungExponent_at_imO statement itself — consume, don't re-prove).
  (S2) confRung_shares_alpha_numerator : same shape as lane B's R2 at n = 7:
       rungExponent (finrank imO) * (finrank imO : Cut) = azimuthalTurn * channelCount.
  (S3) confRung_counts_census_carrier : the rung dimension IS the census carrier's
       dimension — the coherence census (N585) enumerates triples on Fin 7 =
       the imaginary-octonion frame the rung counts. Concretely: finrank ℚ imO = 7 ∧
       (assocTriples ++ antiTriples).length = 210 = 7*6*5 (consume census_length; the
       tie: 210 = (finrank imO)·(finrank imO − 1)·(finrank imO − 2) as a Cut/ℕ identity).
  (S4) confRung_unique_in_grammar : rungExponent n = 12*cutPi ↔ n = 7 (n ≠ 0), same
       route as lane B's R4.
  (S5) conf_waypoint_relation : restate derivedBandList_assembly = 190/3 THROUGH
       invAlphaConf (invAlphaConf_is_assembly — consume it; the waypoint the two rungs
       jointly produce). Trivial consume is fine — the point is the RELATION appears
       in this module's dependency graph.
KILL: if the imO finrank theorem is hard to locate, grep SpacetimeSignature /
OctonionTopology / DerivationSkew for 'finrank' 'imO' 'Fin 7'; if genuinely absent as
a theorem, state S1 through rungExponent_at_imO's own hypotheses and report.
DELIVERABLE: workbench/wt-C/ScratchN687.lean, ZERO errors via the standard recipe.

## SHARED RULES — identical to PREREG-LANES-682-684.md §SHARED WORKER RULES (read that
file, same directory). Same compile recipe, same forbidden list (no lake, no wiring
files, no sorry/admit/axiom, no D3 vocabulary, no cross-lane imports, no git ops).
Worktrees are at head cddf1802 (contains N674–N685; all banked modules importable).
DONE = zero-error compile + 5-line summary (theorems, consumed banked names, blocks).
