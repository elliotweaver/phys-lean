# PREREG — N### (arc-Q Q10): THE ARC-Q CONSOLIDATION + THE ARC-R HANDOFF

## SELECT (theory-native FIRST)

Directed single successor of N443 (arc-Q Q9 → arc-Q Q10, SEED_OWED_FACES §Q10). This is the LAST
arc-Q node: consolidation + the arc-R handoff. NO new physics.

### S2 — what the theory itself says comes next (GOAL + REFRAMING lenses)

Arc Q was the BOUNDARY SWEEP — nine famous facts the subject-organized arcs A–P left between them.
The theory's own claim (the MOAT, priority 3: "physics = obstruction structure of self-reference")
predicts these nine are NOT nine independent facts but a small number of the fold's own structures
read in different costumes. The consolidation's non-hollow content is exactly to EXHIBIT that: the
nine faces collapse onto TWO fold structures.

  SPINE A — THE ONE ASSOCIATOR (non-associativity of `O ℚ`, the cascade stop N2):
    · Q1 parity  = the chirality block `¬(L_a ∘ R_b = R_b ∘ L_a)` ⟺ `AssocLocusNonempty`
      (banked `parity_mirror_is_fifth_face`)
    · Q7 dimension = `¬ CoherentArena (CD (H ℚ))` ⟺ `SectorConfines (O ℚ)` ⟺ `AssocLocusNonempty`
      (banked `nonarena_iff_confines` + `confinement_is_obstruction`)
    · I confinement = `SectorConfines (O ℚ)` ⟺ `AssocLocusNonempty` (banked `confinement_is_obstruction`)
    ★ NEW cross-tie never co-stated: **Q1 parity block ⟺ Q7 non-arena** — one associator, two arc-Q
    costumes, proven equivalent (`parity_block_iff_nonarena`). This is the marquee fifth-face weld.

  SPINE B — THE ONE DOUBLED FIBRE (`finrank Cut StateFibre = 2`, Born self-overlap, N391):
    · Q3 Tsirelson ceiling `2√2`: `tsirelsonBound² = 8 = 4·2` — the √2 is the doubled-fibre grammar
      (banked `tsirelsonBound_sq`, `fibre_finrank`)
    · Q9 emergent flux quantum: `2 · emergentPairFlux = azimuthalTurn` (banked `pair_doubles_flux`)
    ★ NEW cross-tie never co-stated: **Tsirelson ceiling AND emergent flux quantum both ride the SAME
    banked fibre dimension 2** (`tsirelson_flux_share_fibre_dim`). The doubled fold caps nonlocality
    (Q3) and halves the flux (Q9) — one number, two arc-Q faces.

  The remaining faces are readings of these same fold structures via the gather/involutions:
    · Q4 CPT = triple involution returns the fold to itself (`cpt_composite_returns`)
    · Q5 radiation = the gather's irreversibility (`radGather_not_injective`, C6-forbidden un-gather)
    · Q2 Λ = fourth power of the seesaw unit (self-overlap iterated); Q6 geodesic = conservation-forced;
      Q8 registry = the exposed neck. These carry hypotheses; named in docstring (honest, not fabricated).

### S3 — reconcile with arc: ALIGNED. Q10 = the boundary sweep's summary + arc-R handoff. The theory's
"one cause, many terminations" is exactly what the two spines exhibit. Follow the arc.

### S4 — ANTI-BULLSHIT GATE
  · fold-causal: both spines trace to the fold — Spine A to the cascade-stop associator (N2, the
    fold's own doubling failure), Spine B to the doubled binary fibre (N391, self-blindness).
  · dissolution: standard physics treats parity-violation, the Tsirelson bound, dimension-4, the flux
    quantum as FOUR unrelated empirical facts; the theory DISSOLVES them into two fold structures. The
    Q1⟺Q7 and Q3&Q9 equivalences are genuinely new (never co-stated in the field OR in the chain).
  · words-removable: delete "parity/dimension/Tsirelson/flux/CPT/radiation" — pure statements about the
    associator locus of `O ℚ`, the finrank of `StateFibre`, involution composites, and gather injectivity.
  · name-the-temptation: the standard-math temptation is a HOLLOW-AND (bare ∧ of the nine capstones).
    REFUSED — the capstone's load-bearing content is the two NEW cross-tie equivalences, not a restatement.
  · honesty: Q2/Q6/Q8 hypothesis-carrying capstones are docstring-named, not fabricated into the type;
    QT1–QT3 are NAMED as doc-candidate gaps (NOT banked as Lean modules), never claimed banked.

## PLAN
Module `Phys/Algebra/ArcQConsolidation.lean`, ns `Phys.Algebra.ArcQConsolidation`.
New content (non-hollow):
  1. `parity_block_iff_nonarena`  (Spine A, Q1⟺Q7 — the marquee fifth-face weld)
  2. `associator_spine_three_arcQ_faces` (I ∧ Q1 ∧ Q7 all ⟺ AssocLocusNonempty)
  3. `tsirelson_flux_share_fibre_dim` (Spine B, Q3 & Q9 ride finrank StateFibre = 2)
  4. `arcQ_consolidation` (capstone — bundles both spines + representative Q3/Q4/Q5 faces)
Costume C469 (next Cid after C468): bites 1 = 469, tied to arcQ_consolidation.

## GUARDS
G1 no asserted values; G2 no empirical number (measured values REMOVABLE PROSE); G3 derived not posited;
G4 words-removable; G5 foundations-only ⊆ {propext,Classical.choice,Quot.sound}. ℝ-vigilance: Cut only.
W8: C469. W4.5: derive exactly Q10 (consolidation), NOT new arc-Q physics.

## KILL / COST BUDGET
All conjuncts are `Iff.trans`/`rw`/banked-citation — LIGHT. Probe must compile <30s. If any spine
cross-tie needs >2 tactic variants on a trivial closing step → switch tactic family (do not grind).
Production olean expected <60s (consolidation, no brute).
