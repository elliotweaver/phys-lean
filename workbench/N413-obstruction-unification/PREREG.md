# N413 — THE OBSTRUCTION UNIFICATION (arc-N N3, the ★ capstone joint)

**Seed:** docs/SEED_GATHER_TELOS.md target N3 (the ★ capstone joint J-N3). Directed single
successor of N412 (arc-N N2). THEOREM-route for the structure + honestly-flagged mechanism-grade
telos prose.

## TARGET
Confinement (arc I), the cascade stop (N2), curvature (arc E), and CP (arc F2) are ALL instances of
the SAME object — the octonion associator `assoc` on `O ℚ` (the banked N219/N411 gluing obstruction)
— indexed by WHERE / HOW the gather fails. DERIVE the unifying structure; each instance CITES its
banked theorem; the unification is the new content.

## PREREGISTERED CLAIMS (measured EXIT 0 in probe.lean BEFORE production)
- P1 `confinement_is_obstruction`: `SectorConfines (O ℚ) ↔ AssocLocusNonempty` (arc I, cites `confines_iff_not_assoc`).
- P2 `cascade_stop_is_obstruction`: `(¬ SectorAssoc (O ℚ)) ↔ AssocLocusNonempty` (N2, cites `not_associative`).
- P3 `curvature_is_obstruction`: `(¬ WorldsGlue a b) ↔ ∃ x, assoc a b x ≠ 0` (arc E, cites `flat_iff_curvature_zero`).
- P4 `curvature_somewhere_is_obstruction`, `assocLocus_nonempty` (cites `assoc_nonvanishing`).
- P5 `cp_real_channel_gathers`: `∀ a b c, reQ (assoc a b c) = 0` (θ̄=0, cites `reQ_mul_assoc3`).
- P6 `cp_imaginary_channel_obstructed`: `assoc3 u2 u1 (u1×u2) ≠ 0` (flavor CP, cites `assoc3_witness_ne_zero`).
- UNIFICATION: `four_terminations_one_obstruction`, `confinement_iff_curvature`, `confinement_iff_cascade_stop`.
- ONE WITNESS: `one_witness_four_faces` — a single banked triple realizes all four.
- W8: `obstruction_proper` — locus nonempty AND associator vanishes somewhere (`alt_left`); costume C438 bites `1=438`.
- CAPSTONE: `obstruction_unification`.

## GRADE
THEOREM-route for the STRUCTURE (four index iffs + four-way equiv + channel split + one-witness +
proper). MECHANISM-grade flagged prose for the "physics = where the gather fails" telos reading.
No numbers (arc N structural, G2). N4 (the axiom) NOT touched (category-error guard).

## DISCIPLINE
- FREE-FLOATING: every TYPE mentions banked `assoc`/`SectorConfines`/`SectorAssoc`/`WorldsGlue`/`reQ`
  on `O ℚ` + concrete banked witness `(ι(ιJ), ι(e₂), e₂)`. NOT a generic cocycle.
- HOLLOW-AND BAN: banks the EQUIVALENCES (four ↔ one locus) + channel split + one-witness — NOT a
  bare ∧ of the banked termination capstones.
- Foundations-only: 14/14 ⊆ {propext, Classical.choice, Quot.sound}, re-audited vs built olean (reaudit.out EXIT 0).

## VERIFICATION
- probe.lean EXIT 0 (all six ties de-risked before production).
- build.out EXIT 0 (Phys.Algebra.TowerGatherObstructionUnification, 9.4s).
- reaudit.out EXIT 0 (14/14 foundations-only vs built olean).
- costume.out EXIT 1 (bites: unsolved `1 = 438`).

## WIRING
- Phys.lean + Audits/AxiomAudit.lean (import + 14 print lines) + scripts/costume_manifest.tsv (C438).

## SUCCESSOR
ONE directed child toward SEED_GATHER_TELOS.md target N4 (self-reference is the ground — the axiom,
made explicit, IDENTIFICATION-flagged, NEVER derived-from-below).
