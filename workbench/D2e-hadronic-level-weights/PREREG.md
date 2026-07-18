# PREREG — D2e THE HADRONIC LEVEL WEIGHTS (arc-D, docs/SEED_DIGITS.md §D2e)

Ticket t_4ee825ae. Directed successor of D2d (JoinContent). ONE directed successor to hand at end.

## THE THEORY-NATIVE FRONT (chosen FIRST, anti-bullshit gated)

The seed §D2e: "the banked ℕ-spectrum carries the sector's bulk; the per-level BORN WEIGHTS (the
fold's own level occupancy, derivable from the banked Born/self-overlap machinery on the spectrum)
carry the remainder. Derive the weights as a certified bracket ... COUNT it, never import it."

FRONT: The per-level occupancy of the banked mass-gap spectrum (X4 `HadronicSpectrum`). The X4
spectrum is the value-SET `gapSpectrum = { gForm w w | IntLat w } = ℕ` — it records WHICH levels
exist but discards HOW MANY lattice configurations realize each level. That multiplicity IS the
per-level Born weight: the fold's own count of the density of states at each mass-gap level. The
field MEASURES this as resonance enhancement (the R(s) peak heights, the ~2e-10 error-bar source);
the fold COUNTS it as `#{ w : IntLat w ∧ gForm w w = n }` = r_8(n), the representation count of n as
a sum of 8 integer squares, read straight off the banked `gForm_self_sum_sq` (N24).

THE CERTIFIED BRACKET (the deliverable, per seed): the FLOOR occupancy (level 1 = the confinement
scale = the light-vector band edge, banked `gap_floor_is_one`) is derived EXACTLY = 16 = 2·dim(O ℚ)
(the 16 signed unit vectors ±eᵢ). This is a two-sided certified value (`≤ 16` AND `≥ 16` via a
bijection to `Bool × Fin 8`), tightening the D8-freezeout bound at the floor from "bounded" to a
DERIVED integer. Level 0 occupancy = 1 (the flat singlet only).

WHY THEORY-NATIVE (not the standard move, gate honestly):
- Standard QFT computes resonance enhancement / density of states by measuring R(s) or by a
  hadronic model. The fold does not measure or model it — it COUNTS lattice configurations of the
  banked associator-curvature Born form. The count `16 = 2·dim(O)` falls out of the octonion
  dimension `finrank_O_eq_eight` (N122/DerivationFinrank), NOT fitted.
- ONE CAUSE: the SAME banked Born self-overlap `gForm = Σ 8 coord²` (N24) that quantizes the
  spectrum to ℕ (X4) and fixes the floor to 1 ALSO fixes the floor DEGENERACY to 2·8 = 16. One
  form, three facts: quantization, floor value, floor multiplicity.
- WORDS-REMOVABLE: delete "hadronic/level/weight/occupancy/resonance/degeneracy" → pure statement
  that the set of integer-coordinate `w : O ℚ` with `gForm w w = 1` is in bijection with
  `Bool × Fin 8` (card 16), and with `gForm w w = 0` is the singleton `{0}`. Pure quadratic-form
  counting on the banked `gForm`/`coordO`/`IntLat` over `O ℚ`. No physics word load-bearing.
- NOT FREE-FLOATING: every TYPE cites `gForm`, `IntLat`, `gapSpectrum`, `coordO`, `O ℚ`,
  `finrank_O_eq_eight`, and the derived ℝ `Cut` for the tightened bound. Not carrier-agnostic.

## W9 / W1 DE-RISK (done — probes compiled)

- ✗ AVOID: brute `decide` over ℤ-boxes (3⁸=6561 tuples). MEASURED: 25s to even elaborate a trivial
  n=0 case + needs `noncomputable` + heavy ℤ kernel arithmetic — a W9 trap. REJECTED.
- ✓ ROUTE (compiled in Phys/Algebra/D2eProbe.lean, both probes Built): STRUCTURAL, no enumeration.
  - `signedUnit i s := coordO.symm (Pi.single i (±1))`; `gForm_signedUnit = 1` via banked
    `gForm_polar` (N24 polarization) + `Finset.sum_eq_single`. COMPILED.
  - `sumSq_eq_one_unique`: a `Fin 8 → ℤ` with `Σ mᵢ² = 1` has exactly one nonzero coord = ±1 —
    via `Finset.filter (≠0)`, `Finset.sum_le_sum` (each nonzero square ≥1), `card ≤ 1`,
    `Finset.card_eq_one`. COMPILED, no `decide`, no `interval_cases`.
- COST BUDGET: whole module ≤ ~20s incremental build (probe was 16s). KILL: if any single
  obligation needs >60s or a raised maxHeartbeats, STOP → decompose. Not expected (all lemmas are
  small Finset/omega/nlinarith).

## PLAN (production Phys/Algebra/HadronicLevelWeights.lean)

1. `levelOccupancy (n : ℕ) : Set (O ℚ) := { w | IntLat w ∧ gForm w w = n }` — the per-level Born
   occupancy set. Tie: `(levelOccupancy n).Nonempty ↔ n ∈ gapSpectrum` (banked X4).
2. `signedUnit`, `coordO_signedUnit`, `gForm_signedUnit = 1`, `signedUnit_intLat`.
3. `signedUnit` injective on `Bool × Fin 8` → `levelOccupancy 1` ⊇ 16 distinct points.
4. `sumSq_eq_one_unique` → every element of `levelOccupancy 1` IS a signedUnit → bijection
   `levelOccupancy 1 ≃ Bool × Fin 8`.
5. ★ `floorOccupancy_eq_sixteen`: `Nat.card (levelOccupancy 1) = 16` (= 2·finrank_O_eq_eight).
   The certified DERIVED floor weight.
6. `zeroOccupancy_eq_one`: `levelOccupancy 0 = {0}`, `Nat.card = 1`.
7. Tighten: the floor Born weight as a real of `Cut` = `(16 : Cut)`, and 16 = 2·(dim O) FALLS OUT
   of `finrank_O_eq_eight` — the D8-freezeout floor bound tightened to a derived integer.
8. TEETH (W8): 16 ≠ 0, 16 ≠ 1 (floor weight distinct from level-0 weight); a wrong dimension
   (e.g. 4) would give 8 ≠ 16 (the dim is load-bearing); `levelOccupancy 1` genuinely has the
   signed units and nothing else.
9. Capstone `hadronicLevelWeights_landing` — welded, non-hollow.

GRADE: THEOREM-EXACT for floor occupancy = 16, level-0 = 1, the bijection, the dim tie, teeth.
NOTE honestly: full r_8(n) for n≥2 is the classical Jacobi formula (r_8(n)=16σ₃*(n)); the FLOOR is
the load-bearing one for the D8 tightening (the light-vector band edge), derived exactly here; the
higher-level general formula is route-not-yet-found (would need Jacobi's 8-square theorem, not
banked) — carried as a named forward residual, NEVER asserted, NEVER fitted.

## DISCIPLINE
foundations-only (#print axioms ⊆ {propext,Classical.choice,Quot.sound}); no floats; no empirical
number; NO-FIT (16 falls out of dim O, not chosen by where 137.036 sits); import guard: only banked
X4/N24/N122 deps, never OneAxiom/MassGapOne. Costume C532. ONE successor (directed, D-remainder:
re-narrow the composed sum → D7 restatement). GATE-FAST background+poll, never block-wait. Add
costume + append #print axioms lines AND `import Phys.Algebra.HadronicLevelWeights` to AxiomAudit.
