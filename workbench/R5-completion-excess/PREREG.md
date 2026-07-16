# PREREG — N### (arc-R R5): THE COMPLETION EXCESS

## Target (SEED_STANDPOINT §R5)
On the banked derived ℝ `Cut` with its banked Dedekind completeness (`isLUB_csSupCut`/`csSupCut`,
N33 re-expressing N7–N14 `completion_coherence_closed`): DEFINE coverage (the subfamily a family of
local sections reaches) vs presentation (the banked completion of that subfamily filling interior
gaps), and DERIVE the excess theorem: presentation STRICTLY exceeds coverage for gapped-interior
coverage (∃ presented points not covered), while gap-free coverage COINCIDES. The excess is a
DETECTOR of genuine closure.

## Objects (all over `Set Cut` — cite the banked derived ℝ, never generic)
- `presentation C := { p | ∃ T, T ⊆ C ∧ T.Nonempty ∧ BddAbove T ∧ p = sSup T }` — the banked
  completion (`sSup` on `Cut` = `csSupCut`, load-bearing via `isLUB_csSupCut`) applied to
  subfamilies.
- `GapFree C := ∀ T, T ⊆ C → T.Nonempty → BddAbove T → sSup T ∈ C` — closed under the banked
  completion.

## Theorems
1. `presentation_isLUB` — ★ CROSS-TIE: the completion operator IS the banked Dedekind completeness
   `isLUB_csSupCut` (recited). The same object that closed the continuum.
2. `coverage_subset_presentation` — coverage ⊆ presentation always.
3. `excess_nonempty_iff_not_gapFree` — ★ THE DETECTOR (marquee, non-hollow iff): a presented point
   escapes coverage ⟺ coverage is not gap-free.
4. `gapFree_presentation_eq` — gap-free ⟹ presentation = coverage (coincide).
5. `presentation_strict_of_gap` — a nonempty bounded subfamily whose banked sSup escapes ⟹ strict
   excess `C ⊂ presentation C`.
6. `sSup_Iio_eq` — the banked completeness + derived-ℝ density: `sSup (Iio a) = a` (via
   `isLUB_csSupCut` + `exists_between`). LOAD-BEARING non-vacuity powered by the banked completeness.
7. `interior_gap_excess_bites` — [W8] INTERIOR gap: punctured line `{x ≠ a}` — `a ∈ presentation`,
   `a ∉ {x ≠ a}`, and `C ⊂ presentation C`. The excess is REAL.
8. `iic_gapFree` + `gapfree_no_excess` — ★ J-R5 TEETH (the failure case, banked in the statement):
   `Iic a` is gap-free, so `presentation (Iic a) = Iic a` and NO presented point escapes. The
   inequality CAN fail, and does.
9. `completion_excess` — ★★★ CAPSTONE bundling the detector, the coincidence, the interior-gap
   strict excess, and the gap-free failure.

## Discipline
- G4 mind-words-removable: delete "standpoint/coverage/presentation/closure/inside" → pure
  cut/LUB/family-completion facts. ✓
- G5 foundations-only ⊆ {propext, Classical.choice, Quot.sound} (isolated audit EXIT 0). ✓
- ℝ-vigilance: banked derived `Cut` + banked `isLUB_csSupCut`/`csSupCut`; NO Mathlib-ℝ as content. ✓
- G7 IDENTIFICATION FIREWALL: NO identification anywhere (deferred to R8). ✓
- G2: no empirical number (arc R has none). ✓
- Non-hollow / free-floating: TYPES over `Set Cut`; the load-bearing non-vacuity (`sSup_Iio_eq`)
  invokes the ACTUAL banked completeness `isLUB_csSupCut`; the marquee is an iff, not a bare ∧. ✓
- W8: Cid C474 (after C473). Teeth: J-R5 failure case banked (gapfree_no_excess).

## Compile-cost budget / KILL
Trivial order facts; all probes EXIT 0 within seconds. KILL: none needed. No brute normalizer, no
heartbeat raise.

## ONE-SUCCESSOR RAIL
After R5 closes: ONE directed successor toward R6 (THE COMPONENT LATTICE + THE UNIQUE MAXIMAL CELL),
SEED_STANDPOINT §R6. SELECTION-ticket form (fresh worker selects theory-native first).
