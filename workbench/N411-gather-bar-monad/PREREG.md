# N411 PREREG — THE GATHER AS THE BAR/MONAD STRUCTURE ON THE BANKED TOWER (arc-N N1)

**Node:** N411 (t_cbac0e39), single-flight chain tail after N410. Arc N (SEED_GATHER_TELOS §N1) — the CAPSTONE arc, the physics TELOS. Theorem-route for the STRUCTURE.

## THE FRONT (frozen before production)

The gather is the fold's look-back assembled into a monad-with-controlled-obstruction over the banked tower — the concrete bar/nerve structure, NOT an abstract `CategoryTheory.Monad` (that is the FREE-FLOATING trap: no physics words to delete, floats free of the banked objects). Every headline's TYPE is ABOUT the banked `worldMap`/`gluingDefect`/`assoc`/`O ℚ`/`Dbl ℚ`/`H ℚ`.

The look-back is the banked `worldMap : A → (A → A)`, `a ↦ L_a` (N218T) — the fold-generated inner world. The ambient totalizer is the strict endomorphism monoid `(A → A, ∘, id)`. The GATHER-AS-MONAD reading:
- **η (the unit / the miss's re-entry):** `worldMap 1 = id` — the trivial standpoint opens the identity world (the coherent unit).
- **faithfulness:** `worldMap` is injective (evaluate at 1) — the look-back loses nothing.
- **μ (the gather / world-composition) and its obstruction:** the μ-comparison `barMultDefect a b := worldMap (a·b) − worldMap a ∘ worldMap b` measures the failure of `worldMap` to be a strict monoid morphism. It IS the banked N219 obstruction (`barMultDefect = gluingDefect`), and on `O ℚ` it IS the banked associator.
- **THE UNIT SECTOR IS OBSTRUCTION-FREE:** `barMultDefect 1 a = barMultDefect a 1 = 0` — the miss's re-entry never obstructs; the gather only fails between two genuine standpoints.
- **THE SOLE-OBSTRUCTION (pentagon/Teichmüller coherence, the theory-native cut):** the obstruction is a CLOSED 3-cocycle (banked `teich_cocycle_O`, `δ(assoc) = 0`) — the higher (pentagon) coherence holds identically, so there is EXACTLY ONE obstruction to the gather being a strict monad, and it is the banked associator. Standard homological algebra says "the bar construction of a non-associative algebra fails to be simplicial" (a defect); the theory says the gather is a monad with a single controlled obstruction whose vanishing IS a physics termination (confinement, N385).
- **THE SMOOTH/NO-PHYSICS RUNGS:** `Dbl ℚ`, `H ℚ` are STRICT (`barMultDefect = 0`) — the trivial (associative) case gathers with no obstruction = smooth = no physics (the seed's "one-probe case = no obstruction ⟺ no physics", made concrete on the associative rungs).
- **W8 non-vacuity:** `O ℚ` is GENUINELY OBSTRUCTED (`∃ a b, barMultDefect a b ≠ 0`, banked `assoc_nonvanishing`).

## THE DECLS (frozen)

Production file: `Phys/Algebra/TowerGatherBarMonad.lean` (ns `Phys.Algebra`).

Generic backbone (formal, over `MulOneClass`/`NonAssocRing`):
1. `worldMap_one` — `worldMap (1:A) = id` (η unit coherence).
2. `worldMap_faithful` — `worldMap` injective (evaluate at 1).
3. `barMultDefect` (def) — `a b ↦ (x ↦ worldMap (a*b) x − (worldMap a ∘ worldMap b) x)`, the μ-comparison.
4. `barMultDefect_eq_gluingDefect` — the μ-defect IS the banked N219 obstruction (definitional).
5. `barMultDefect_unit_left` / `barMultDefect_unit_right` — the unit sector is obstruction-free.

Headlines on the banked rungs (TYPE mentions banked objects — FREE-FLOATING rail):
6. `o_worldMap_one`, `o_worldMap_faithful` — η unit + faithfulness on `O ℚ`.
7. `o_barMultDefect_eq_assoc` — ★ the O-rung μ-defect IS the banked associator (N219 tie).
8. `dbl_barStrict`, `h_barStrict` — ★ the associative rungs are STRICT (smooth, no obstruction / no physics).
9. `o_bar_obstructed` — ★ `O ℚ` genuinely obstructed (W8, banked `assoc_nonvanishing`).
10. `o_bar_sole_obstruction` — ★★ the O-rung obstruction is a CLOSED 3-cocycle (banked `teich_cocycle_O`): the higher pentagon coherence holds, so the associator is the SOLE obstruction. (Re-expressed on `barMultDefect`/`gluingDefect` via `gluingDefect_is_assoc_O`.)
11. `o_bar_obstruction_is_confinement` — ★ the O-rung gather obstruction is EXACTLY the confinement obstruction (banked N385 `o_confines_from_cascade_stop` / `confines_iff_not_assoc`): the sole gather obstruction is a physics termination.
12. Capstone `gather_bar_monad_structure` — bundles η unit + faithfulness + μ-defect = associator + unit-sector-free + smooth associative rungs + genuinely-obstructed O-rung + sole-obstruction(closed cocycle), on the banked objects.

## W9 MEASURE-FIRST VERDICT

A LIGHT node — every obligation is `funext x; simp only [...]` (unit/composition rewrites) or a direct cite of a banked theorem (`o_gluingDefect_eq_assoc`, `dbl/h_gluingDefect_zero`, `teich_cocycle_O`, `confines_iff_not_assoc`, `assoc_nonvanishing`). NO coordinate `ring`/`decide`, NO maxHeartbeats raise. Probe measured in `workbench/N411-gather-bar-monad/probes/probe1.lean` (points 1–9). KILL = 90s/obligation; if any balloons, MEASURE the smallest sub-obligation and decompose — never grind.

## IMPORTS (frozen — banked objects only)

`Phys.Cascade.Sedenion`, `Phys.Algebra.Alternative` (assoc, assoc_nonvanishing), `Phys.Algebra.TowerGatherObstruction` (gluingDefect, o_gluingDefect_eq_assoc, dbl/h_gluingDefect_zero, o_gluingDefect_ne_zero, gluingDefect_is_assoc_O via TowerGatherCocycle), `Phys.Algebra.TowerGatherCoherence` (worldMap, WorldsGlue), `Phys.Algebra.TowerGatherCocycle` (teich_cocycle_O), `Phys.Algebra.ConfinementCriterion` (confines_iff_not_assoc, o_confines_from_cascade_stop). Ground = derived ℚ; OBJECTS = banked tower + banked gather. NO Mathlib ℝ/ℂ as content; nothing posited; no bridge.

## STANDARD (to apply at completion)
- UNBROKEN: imports only banked N218T/N219/N220/N385 + the derived tower. Every object derived; the monad structure is pure unit/composition algebra + banked citations. Nothing posited.
- COMPLETE: foundations-only `[propext, Classical.choice, Quot.sound]`; no proof-hole/axiom/native_decide; no maxHeartbeats raise; independent re-audit vs the built olean.
- PHYSICS-WORDS-REMOVABLE: delete "gather/miss/totalize/world/obstruction/monad/physics/confine" → over derived ℚ and `O ℚ = CD (H ℚ)`: the map `η = worldMap`, `a ↦ L_a`, into `(A→A,∘,id)` has `η(1)=id`, is injective, and its non-morphism defect `η(ab)−η(a)∘η(b)` equals the associator `[a,b,·]`, vanishes on a unit factor, vanishes identically on `Dbl/H ℚ`, is nonzero on `O ℚ`, and is a closed Hochschild 3-cocycle. Pure regular-representation / bar algebra; no theorem statement needs a physics word.
- FREE-FLOATING check: generic backbone (`worldMap_one`, `worldMap_faithful`, `barMultDefect_eq_gluingDefect`, unit-sector) are formal unit/composition identities (like ring identities); ALL headlines + capstone are stated ON the banked `O ℚ`/`Dbl ℚ`/`H ℚ` referencing banked `worldMap`/`gluingDefect`/`assoc`/`teich_cocycle_O` — the magnitude theorems are literally ABOUT the banked objects. NO abstract `CategoryTheory.Monad` over an arbitrary carrier.
- HOLLOW-AND BAN: the capstone is NOT a bare ∧ of banked capstones — it banks NEW structure (η unit coherence `worldMap_one`, faithfulness, the μ-defect object `barMultDefect` + its unit-sector-freeness, the sole-obstruction reading tying `teich_cocycle` to the monad's higher coherence, the confinement identification). N218T/N219/N220/N385 are cited as ingredients, not re-proved.
- NOT a re-pin: N218T banked WHICH worlds glue; N219 the obstruction map; N220 its cohomology; N385 confinement. NONE banked the MONAD/BAR reading (η unit + faithfulness + μ-comparison-defect + unit-sector-obstruction-free + sole-obstruction-via-closed-cocycle + smooth-associative-rungs = no-physics) — the architectural synthesis that identifies the gather AS the bar/monad structure with a single controlled obstruction. This is the seed's N1 anchor.

## COSTUME C436 (plan)
`Counterexamples/TowerGatherBarMonadVacuityCostume.lean`: the gather's μ-obstruction on `O ℚ` is GENUINELY NONZERO (banked `assoc_nonvanishing` via `o_bar_obstructed`), so the monad is genuinely NON-strict / genuinely obstructed. A bogus claim that the gather is a STRICT monad on `O ℚ` (obstruction vanishes / no physics on the octonion rung / the bar construction is smooth there) reduces — through the genuine obstruction — to the false numeric `1 = 436` in ℕ. Flag `cFlag := 1`, `min 436 cFlag = 1` TRUE, `min 436 cFlag = 436` BOGUS. Signature `1 = 436` (dash-free, RHS 436 fresh). Minimal simp set.
