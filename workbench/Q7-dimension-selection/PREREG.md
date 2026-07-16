# PREREG — N### (arc-Q Q7): WHY (1,3) — THE DIMENSION-SELECTION THEOREM

## TARGET (SEED_OWED_FACES §Q7)
O4 (N419) derived the CONTAINMENT (1,3) ⊂ (1,9). Q7 derives the SELECTION: the physical
spacetime arena is the ℍ/ℂ level because ℍ is the LAST ASSOCIATIVE rung — transport composes
coherently (the gather glues) exactly up to ℍ, while the 𝕆 level's non-associativity is
INTERNALIZED as the gauge/matter obstruction (confinement) rather than experienced as spatial
extent. Nothing is compactified; "the extra dimensions" ARE the obstruction content. DERIVE the
selection; do NOT posit 4D.

## THE THEORY-NATIVE CONTENT (not a bare ∧)
The banked objects ALREADY carry the selection, uncombined:
- `SectorGlobalGather A := ∀ a b, WorldsGlue a b` (the fold's look-back gather η=worldMap glues
  everywhere = transport composes coherently) IS the arena predicate.
- `SectorConfines A := ¬ SectorGlobalGather A` — so "not an arena" and "confines (gauge/matter)"
  are LITERALLY THE SAME PROPOSITION (Iff.rfl). The one-cause tie is definitional.
- `globalGather_iff_assoc`: coherent transport ⟺ associativity.
- `dbl_worlds_glue`, `h_worlds_glue`: Dbl, H are arenas. `o_confines`: O=CD(H) is not.
- The break is the SAME `not_associative` = the SAME associator (`gluingDefect = assoc` on O).

## PLAN (module Phys/Algebra/DimensionSelection.lean, ns Phys.Algebra)
1. `CoherentArena A := SectorGlobalGather A` (arena = coherent global transport).
2. `coherentArena_iff_assoc` — the dichotomy (re-export).
3. `nonarena_iff_confines` — ★ the one-event-two-readings identity (Iff.rfl): not-arena ≡ confines.
4. `dbl_isArena`, `h_isArena` — the associative rungs ARE arenas.
5. `doubled_h_not_arena` — CD(H)=O is NOT an arena.
6. `arena_maximal_at_H` — ★ MAXIMALITY: H is an arena, its double is not (last coherent rung).
7. `excess_is_obstruction_not_extent` — ★★ THE CROSS FACT (never co-stated): the doubling that
   fails to extend the arena IS the one producing confinement, via the SAME associator, and it
   genuinely bites (∃ nonzero defect). "Extra dimensions" = obstruction content, not lost extent.
8. `physical_arena_on_coherent_rung` — the physical (1,3) embeds via the ℂ rung `Dbl ℚ`, a
   coherent-transport rung, form-isometrically (O4 weld). The experienced arena lives in the
   coherent locus; confinement lives strictly outside it.
9. capstone `dimension_selection` — bundle: dichotomy + maximality + cross fact + arena-on-coherent.

## GRADE
Theorem-route for the strict/obstructed dichotomy + maximality + one-cause cross fact (all banked
objects). Mechanism (flagged honestly) for the arena identification = welding the coherent-rung
selection to O4's (1,3) containment as "the experienced arena." NO empirical number; observed 4D is
REMOVABLE PROSE (NO-FIT).

## GUARDS
G1 no asserted values (selection DERIVED, never posited). G2 no empirical number in proof. G3
derived not posited (from associativity=transport-coherence, not "spacetime is 4D"). G4 words-
removable (delete dimension/spacetime/arena/compactified → the maximal rung on which the regular-rep
gather is a strict monoid morphism is the last associative one; its double's non-strictness is the
descent obstruction). G5 foundations-only ⊆ {propext,Classical.choice,Quot.sound}; no proof-hole/
native-decide/heartbeat-raise. ℝ-vigilance: TYPES about banked derived Dbl/H/O ℚ, ℚ ground; NEVER
Mathlib ℝ/ℂ as content. FREE-FLOATING: `CoherentArena` is generic over `[Mul A]` (it must be, to
state the dichotomy), but every load-bearing theorem INSTANTIATES it to the banked rungs Dbl/H/O ℚ.

## W9 COST — MEASURED (both probes exit 0)
probe.lean (all banked citations) EXIT 0 ~9s. probe2.lean (production-shape theorems) EXIT 0 ~16.7s.
LIGHT — every proof is a term-mode re-export of banked lemmas + Iff.rfl. KILL: if any obligation
exceeds ~60s, decompose; none did. Production expected < 20s cold.

## W8 non-vacuity: next Cid after C465 = C466. Costume ties cFlag to the maximality + cross fact.
## ONE-SUCCESSOR: after Q7, directed successor = Q8 (the prediction registry).
