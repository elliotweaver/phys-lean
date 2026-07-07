# N407 — PREREG (arc-M M1: the winding / ladder-rung quantization)

## TARGET (theory-native, directed M1, SEED_INPUT_CLOSURE §M1)
Derive the ladder grammar's `n = 1 + 3k` quantization + the `w = −1` rung structure as an EXACT
structural fact about the banked ladder — the OFFSET-1 winding grid `1 + n_gen·ℤ`, grounded on the
banked derived generation count `finrank ℚ Uhol = 3` (N42c). The DUAL of N368's residue-0 baryon
grid `ΔB ∈ n_gen·ℤ`: the winding grid is residue-1 (anchored at the fold's self-blind ground "1",
never a generation multiple). The `w = −1` rung is the first descent below the ground.

## HONEST GRADE (LOAD-BEARING — arc M is the hardest, conditional/candidate by the key's own reckoning)
- THEOREM-grade: the quantization STRUCTURE (grid `windingRung k = 1 + (finrank Uhol)·k`, spacing =
  finrank Uhol, residue 1, non-divisibility → distinct from N368's residue-0 grid, the first-descent
  rung index w=−1). All grounded on banked `Module.finrank ℚ Uhol`.
- CANDIDATE / PERMANENT INCEPTION FLAG: the boundary VALUE-ASSIGNMENT to the w=−1 rung (the seed's
  9/4). It enters NO structural theorem. At most an isolated hard-flagged candidate arithmetic
  identity `9/4 = (finrank Uhol / finrank StateFibre)²` — "expressible via banked counts", NOT a
  forced derivation. ⚠ THE PHANTOM CAP: a clean forced absolute-scale identity DOES NOT EXIST; do
  NOT grind for a cleaner value; land the structure + flag; move on.

## GROUNDING (NOT free-floating; every headline TYPE mentions banked derived objects)
- `Module.finrank ℚ Uhol` = 3 (banked `finrank_Uhol`, N42c, DerivationStabilizerSplit) — the derived
  generation count = the winding grid spacing.
- `finrank ContinuumQ.Cut StateFibre` = 2 (banked `fibre_finrank`, N391) — used ONLY in the isolated
  candidate identity (the fibre dimension), never in a structural theorem.
- Precedent: N368 (ProtonStabilitySelectionRule) grounds a modular grid on `finrank ℚ Uhol` in the
  TYPE — same discipline; this node is its residue-1 dual.

## PLANNED DECLS (Phys/Algebra/ScaleTowerWindingQuantization.lean, ns Phys.Algebra.Winding)
1. `windingRung (k : ℤ) : ℤ := 1 + (Module.finrank ℚ Uhol : ℤ) * k`  — the OFFSET-1 grid.
2. `windingRung_eq (k) : windingRung k = 1 + 3 * k`  — via finrank_Uhol.
3. `windingRung_spacing (k) : windingRung (k+1) - windingRung k = (finrank ℚ Uhol : ℤ)` — spacing.
4. `windingRung_residue (k) : windingRung k % (finrank ℚ Uhol : ℤ) = 1`  — residue 1.
5. `windingRung_not_dvd (k) : ¬ (finrank ℚ Uhol : ℤ) ∣ windingRung k`  — never a generation multiple
   (2 ≤ finrank Uhol needed) — THE DISTINCTION FROM N368's residue-0 baryon grid.
6. `windingRung_ne_baryonGrid` — the winding grid is disjoint from N368's `n_gen·ℤ` (residue 1 vs 0):
   `windingRung k ≠ baryonShift (finrank ℚ Uhol) m` for all k,m  (cross-tie to N368).
7. `groundRung : windingRung 0 = 1`  — the self-blind ground.
8. `boundaryRungIndex : ℤ := -1`  — the w=−1 rung index (first descent below ground).
9. `windingRung_boundary : windingRung boundaryRungIndex = 1 - (finrank ℚ Uhol : ℤ)`  (= −2).
10. `boundary_is_first_descent : windingRung boundaryRungIndex < windingRung 0`
    ∧ `∀ k < 0, windingRung k ≤ windingRung boundaryRungIndex`  — w=−1 is the immediate/first descent.
11. CANDIDATE (isolated, hard-flagged): `candidate_boundary_expressible :
    (9:ℚ)/4 = ((Module.finrank ℚ Uhol : ℚ)/(finrank ContinuumQ.Cut StateFibre : ℚ))^2`.
12. W8 non-vacuity: `windingRung_spacing_ne_one` (spacing = 3 ≠ 1 — a genuine grid, not ℤ) and
    `boundaryRungIndex_ne_ground` (w=−1 ≠ ground rung).
13. Capstone `winding_quantization` bundling the structural facts (NOT the candidate value).

## COST BUDGET / KILL (W9)
All obligations are ℤ arithmetic (omega / ring / Int.emod) + one finrank rewrite + one ℚ norm_num.
LIGHT — no coordinate expansion, no heavy tactic. KILL = 90s/obligation; if any single obligation
exceeds it, STOP and reframe (should never approach). Olean expected ~10s.

## COSTUME
C432 (next after C431). Bites `1 = 432` tied to a load-bearing structural fact (the non-divisibility
/ residue-1 distinguishing the winding grid from N368's baryon grid). A WRONG reading (winding grid =
baryon grid / residue 0 / spacing 1) reduces through the banked value to the false `1 = 432`.

## GUARDS
G1 no asserted value (9/4 isolated candidate, never premised, never fit). G2 no empirical number
(m_e/z0 = removable prose only; NO-FIT loudest). G3 derived not posited (grid from finrank Uhol).
G4 words-removable (delete mass/scale/electron/winding → pure ℤ/finrank grid arithmetic). G5
foundations-only ⊆ {propext,Classical.choice,Quot.sound}, no sorry/axiom/native_decide/heartbeat
raise. ℝ-vigilance: ℤ + finrank machinery on derived objects; ℚ only in the isolated candidate; NO
Mathlib-Real as content. W4.5: exactly M1 (the quantization structure), NOT M2/M3.
