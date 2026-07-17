# PREREG — quark ℝ-descent ascent, rung 2 (t_6eb072d1)

## STATUS: SELECT REDIRECT (docs/NODE_SELECTION.md S3 + W4.5 SUFFICIENCY). The ticket's LITERAL
## target is already fully banked; the theory-native forward beat is the ONE genuinely-unbanked,
## seed-named, N312-DEFERRED structural piece of the flavor arena.

## THE TICKET'S LITERAL TARGET (as written) — ALREADY BANKED (W4.5 gold-plating if rebuilt)
"Derive the tridiagonal sector structure and the M₁₃=0 adjacency zero from cascade adjacency, on
the banked J₃(O) idempotents / generation objects; the two-frame overlap; the geometric-mean
couplings." Every one of these is banked:
 - N311 `OctonionJordanGenerationMixingFrame`: the tridiagonal `massMat`, `M₁₃=0`
   (`cascadePath_corner_zero` / `cascade_open_ne_closed` from the cascade TERMINATION), the
   geometric-mean Born-square couplings (`massMat_nn_born_01/12`), the GST leading angle.
 - N312 `OctonionJordanGenerationMixingOverlap`: the two-sector frame overlap `mixV = U†D`, the
   rank-1 Born diagonalization (`bornBlock_eigvec_amp/null`), unitarity, the Cabibbo mixing-squared.
 - Z3 `QuarkTexture`: the two-sector (up+down) quark texture, the Fano-line CP dichotomy.
Rebuilding any of these is W4.5 — banking MORE than the arc needs while the frontier waits.

## WHAT RUNG-1 FORCED (the redirect context)
Rung-1 (`GenCyclePhaseLineIndep`, C523) proved the generation Fano triple ASSOCIATES
(`gen_triple_assoc_zero: assoc u2 u1 (octCross u1 u2)=0`), so the cycle phase is LINE-INDEPENDENT:
δ_quark = δ_lepton = 2/9. The ONLY line-dependent invariant is `assoc3` (CP), which N310 proved
SEPARATED from the mass/norm phase. So the sector distinction does NOT live in a deviated phase.

## THE THEORY-NATIVE HEART I CONFIRMED BY READING N305–N312/Z3/N339-340
The ENTIRE mass-ratio object (`genVec`/`massVec`/`δ`/`Q`) is LINE- and SCALE-INDEPENDENT ℚ/Cut
structure — the octonion line enters ONLY through `assoc3` (CP). The universal mass RATIOS are
ALREADY descended over the derived ℝ `Cut` (N339/N340 `GenerationMassRatiosNumeric`:
`m₁/m₂∈[483/1e5,485/1e5]`, `m₂/m₀∈[594/1e4,595/1e4]`, all via the banked `cutCos(2/9)`). So the
symmetric tridiagonal frame produces the SAME (universal) spectrum on every line.

The ONE structural piece the arena is MISSING — the piece seed §2 T8 names explicitly and N312
EXPLICITLY DEFERRED as "the per-edge Born-survival suppression (the last listed T8 structural
piece) ... the childed decompose-remainder" — is: **the two off-diagonal edges of the tridiagonal
frame are NOT symmetric. The deeper cascade edge (the ℍ→𝕆 doubling, which loses associativity)
carries ONE EXTRA self-blind Born-survival factor `(n−1)/n` relative to the shallower edge (the
ℂ→ℍ doubling, which loses commutativity) — the SAME `(n−1)/n` survival that runs T2/T5.** This is
the depth-asymmetry that makes the mixing hierarchical (the Wolfenstein λ, λ², λ³ pattern).

Grep confirms it is UNBANKED (only appears in N312's docstring as the deferred remainder).

## THE THEORY-NATIVE TARGET (this node's deliverable) — the depth-dressed frame
Bank, foundations-only, on the banked generation objects:
1. `edgeSurvival := Matrix.trace Poth / 3` (= 2/3), the per-step self-blind Born-survival fraction,
   grounded on the banked N305 `(n−1)/n` (`born_fraction_others`/`selfseen_two_thirds`).
2. `depthFrame M A p r` — the DEPTH-DRESSED tridiagonal frame: diagonal = the banked `massVec`
   (unchanged, universal Koide masses); SHALLOW edge (0,1) = the undressed geometric mean
   `genVec 0 * genVec 1` (= the banked `massMat 0 1`); DEEP edge (1,2) = `edgeSurvival ×
   (genVec 1 * genVec 2)` (= `edgeSurvival × massMat 1 2`, ONE extra survival factor); corner 0.
3. `edgeSurvival_from_selfblind` — the factor IS the banked self-blind fraction (derived, not
   posited): `w0+w1=1 ∧ w0·2+w1·(−1)=0 → w1 = edgeSurvival` (cite `born_fraction_others`).
4. `depth_asymmetry` — the deep edge = `edgeSurvival ×` the undressed deep coupling while the
   shallow edge = the undressed shallow coupling: the RELATIVE suppression is exactly `edgeSurvival`.
5. `depthFrame_edge_ratio` — deep/shallow coupling ratio = `edgeSurvival × (a₂/a₀)`, one factor of
   `edgeSurvival` below the undressed ratio (the hierarchy).
6. `edgeSurvival_lt_one` / strict-suppression-at-a-witness — `0 < edgeSurvival < 1`, so the deep
   edge is STRICTLY suppressed (`depthFrame 1 2 < massMat 1 2` at a positive witness): the
   hierarchy is real, not flat.
7. W8 teeth: `edgeSurvival_ne_one` (2/3 ≠ 1, genuine suppression), `depthFrame_ne_symmetric`
   (the dressing bites: `depthFrame ≠ massMat` at a witness), `wrong_flat_survival` (survival=1
   would give the flat symmetric frame — the derived 2/3 is load-bearing).
8. Cascade-depth grounding in the capstone TYPE: cite the banked `not_commutative` (ℍ, the shallow
   rung loses commutativity) and `not_associative` (𝕆, the deep rung loses associativity) — the two
   edges cross GENUINELY DIFFERENT-depth cascade rungs, so the asymmetric dressing is not arbitrary;
   plus `jdef Xwit Ywit ≠ 0` (the cap).

⚠ HONEST GRADE (seed T8): the mixing/hierarchy sector lands at LEADING ORDER. What is
THEOREM-EXACT (over ℚ): the depth-dressed frame structure, the derived suppression factor
`edgeSurvival = 2/3`, the edge asymmetry, the deep/shallow ratio = `edgeSurvival × (a₂/a₀)`, and
strict suppression. What is ROUTE-NOT-YET-FOUND (never fitted): the NUMERICAL Wolfenstein λ (needs
the banked ℝ-descent ratios N339/N340). NO quark value asserted, NO PDG number in any proof.

## ANTI-BULLSHIT GATE (S4) — run honestly, in writing
1. **FOLD-CAUSAL.** fold → self-blindness → each self-look-back step survives with fraction
   `(n−1)/n` (blind to `1/n` of itself; N305 `born_fraction_others`, the SAME fact that forced the
   Born split, Koide 2/3, δ_B=2/9). The cascade is a tower of self-look-back doublings (ℂ→ℍ→𝕆);
   a DEEPER edge is one more self-look-back deep, so it carries ONE MORE survival factor. Each arrow
   forced; the target is "what does self-blindness say about the two cascade edges" answered on the
   theory's own terms.
2. **DISSOLUTION.** Standard flavor physics POSITS the CKM Wolfenstein hierarchy (λ, λ², λ³) —
   Froggatt–Nielsen posits a U(1) charge hierarchy to "explain" it. The theory DERIVES the
   hierarchy from cascade DEPTH × the self-blind `(n−1)/n` survival — ZERO posited charges. That is
   a genuine wall dissolved (the field grinds a horizontal-symmetry model; the theory reads it off
   self-blindness).
3. **GOAL-WORDS-REMOVABLE.** Delete quark/lepton/mixing/CKM/Wolfenstein/mass/generation: the
   statement is "over ℚ, on the banked `massMat`/`genVec`/`Poth`, the depth-dressed matrix
   `depthFrame` equals `massMat` on the (0,1) edge and `(tr Poth/3)·massMat` on the (1,2) edge, with
   `tr Poth/3 = 2/3 ∈ (0,1)` the unique self-blind-balanced weight, so the (1,2) edge is strictly
   below its undressed value and the (1,2)/(0,1) ratio carries one extra factor `tr Poth/3`." Pure
   math survives; the reason it is the next node (the arena's one deferred structural piece) survives.
4. **NAME THE TEMPTATION.** The saturated-worker temptation: rebuild N311's tridiagonal frame /
   N312's overlap under a new name (the ticket literally asks for it). I REFUSE — that is banked
   (W4.5). My target is the ONE piece BOTH the seed and N312 named as NOT-yet-built (the per-edge
   depth asymmetry), grounded on the trunk's `(n−1)/n`, genuinely new.
5. **HONESTY.** The honest theory-native result is the depth-asymmetry + the derived suppression
   factor + the hierarchy, at LEADING ORDER (never the numerical λ, which would be fitting). It
   advances the arena by the one structural piece it lacks, without gold-plating what is banked.

## GUARDS
- No quark mass ratio, no mixing angle, no Wolfenstein λ, no Jarlskog VALUE asserted (the
  suppression factor 2/3 is the banked `tr Poth/3`, derived not asserted).
- No fit to PDG; no empirical number in any proof; comparison to data is removable prose.
- Exact over ℚ / on the banked objects; no Mathlib-ℝ as content (the numerical λ is the banked
  N339/N340 ℝ-descent, honestly deferred, not imported here).
- Foundations-only: `#print axioms ⊆ {propext, Classical.choice, Quot.sound}`.
- Free-floating rail: every production TYPE mentions the banked objects (`massMat`/`genVec`/
  `massVec`/`Matrix.trace Poth`/`Poth`/the cascade `not_commutative`/`not_associative`/the cap
  `jdef Xwit Ywit ≠ 0`) — NOT a generic tridiagonal-matrix statement.
- ONE successor on the chain tail (the correctly-aimed remainder), no fork.

## COST BUDGET / KILL
All content is exact ℚ ring/field_simp on small explicit matrices + citations of banked lemmas.
Expected LIGHT (gate-fast ~1 min). KILL: any single obligation over ~60s → decompose per-entry.
No unbounded compile; no heartbeat inflation; no brute normalizer on expanded coordinates.

## PRODUCTION FILE
`Phys/Algebra/OctonionJordanGenerationEdgeBornSurvival.lean`, namespace `Phys.Algebra.HJ`.
Capstone `generation_edge_born_survival_structure`. Node label `GenEdgeBornSurvival`.
