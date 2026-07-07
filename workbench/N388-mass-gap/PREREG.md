# N388 PREREG — arc-I I4: THE MASS GAP / THE CURVATURE FLOOR

## SELECT (see kanban comment 294 for full S1–S4)
TARGET (theory-native, aligned with SEED_QCD_CONFINEMENT §I4): the colour sector has a
CURVATURE FLOOR — a nonzero minimum per-plaquette Born action — so NO flat (zero-action)
coloured connection exists. The fold-native form of the Yang–Mills mass gap. GATHER side
(extends N385/386/387 gluing-obstruction chain). The mechanism is QUANTIZATION: the fold's
re-entry generates the discrete ℕ; lattice curvatures have Born self-overlap = sum of integer
squares ⟹ nonzero ⟹ ≥ 1.

## GRADE
mechanism/theorem-route for the STRUCTURAL curvature-floor mechanism. ⚠⚠ The full
Clay/Millennium Yang–Mills mass gap (constructive QFT) is OWNER-HELD / route-not-yet-found —
NOT attempted, flagged out. No numerical gap value; no empirical number in any proof.

## DELIVERABLES (Phys/Algebra/ConfinementMassGap.lean, ns Phys.Algebra)
1. flat_iff_curvature_zero — WorldsGlue a b ↔ ∀ x, assoc a b x = 0 (flat = zero curvature).
2. bornAction_lattice_floor — nonzero integer-lattice curvature ⟹ gForm ≥ 1 (the floor).
3. coloured_witness_not_flat — the coloured witness pair does NOT glue (no flat connection).
4. gForm_witness_floor — coloured witness curvature has gForm ≥ 4 (via c₇=2), ℚ.
5. bornAction_witness_floor — ... ≥ 4 in the derived ℝ Cut.
6. singlet_flat — span{1,u1} pairs all glue (flat, massless photon sector).
7. gForm_smul_sq — gForm(s•w)=s²·gForm w (scaling law).
8. no_floor_over_continuum — action at scale 1/(n+1) = gForm w / (n+1)² (lattice load-bearing).
9. mass_gap_dichotomy — singlet flat(0) vs coloured ≥4 (capstone).
10. mass_gap_mechanism — the whole structural mechanism at once (capstone).

## COSTUME
C413 Counterexamples/ConfinementMassGapVacuityCostume.lean, bites 1=413, tied to
coloured_witness_not_flat (a "coloured sector admits a flat/zero-action connection / gap floor
is zero" mis-reading reduces to 1=413).

## W9 MEASURE-FIRST (done)
probe1 (lattice floor + witness ≥4 + cast) GREEN; probe2 (flat⟺curvature + no-flat-coloured)
GREEN; probe3b (smul coordinate reduction) GREEN. Production compiles standalone (~17s), Phys
builds (3816 jobs), 10 decls foundations-only ⊆ {propext, Classical.choice, Quot.sound}.

## GUARDS
G1 no asserted values (floor DERIVED from gForm_self_sum_sq quantization); G2 no empirical
number (glueball/Λ_QCD removable prose only); G3 derived not posited (floor from associator +
integer squares, not "assume YM has a gap"); G4 physics-words-removable (pure quantization of a
positive-definite integer quadratic form + vanishing locus of trilinear form); G5
foundations-only, derived-ℝ Cut, Mathlib as machinery only, ℤ as discreteness predicate on
already-ℚ coordinates (not a content import). W8 costume bites. FREE-FLOATING: every type
mentions banked O ℚ / assoc / gForm / bornAction / WorldsGlue / c₀..c₇ / span{1,u1} / witness.
