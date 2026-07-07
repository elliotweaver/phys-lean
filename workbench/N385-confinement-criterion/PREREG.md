# N385 — arc-I I1: the confinement criterion (theorem-route)

## TARGET (SELECTed theory-native, SEED_QCD_CONFINEMENT §I1)
DERIVE: a cascade sector CONFINES iff its algebra is NON-ASSOCIATIVE.
- Dbl ℚ (level 1, associative) does NOT confine.
- H ℚ (level 2, associative) does NOT confine.
- O ℚ (level 3, non-associative) DOES confine.
The mechanism is the sheafification/descent obstruction: a global section (a global
"world") requires all local worlds to glue, `L_a∘L_b = L_{a·b}` (the banked `WorldsGlue`),
which holds iff the sector is associative. On O ℚ the obstruction IS the banked octonion
associator (`o_gluingDefect_eq_assoc`), nonzero (`o_worlds_not_glue`) ⟹ confined.

## LAUNCH PLATFORM (banked, verified live)
- N219 `TowerGatherObstruction.lean`: `gluingDefect a b : x ↦ (a·b)·x − a·(b·x)`;
  `worlds_glue_iff_gluingDefect_zero`; `o_gluingDefect_eq_assoc` (= banked `assoc`);
  `dbl/h_gluingDefect_zero`; `o_gluingDefect_ne_zero`.
- N218T `TowerGatherCoherence.lean`: `WorldsGlue a b := worldMap a ∘ worldMap b = worldMap (a·b)`;
  `dbl_worlds_glue`, `h_worlds_glue`, `o_worlds_not_glue` (∃ a b, ¬WorldsGlue), `o_world_self_glue`.
- `Phys.Cascade.not_associative : ¬ SectorAssoc (O ℚ)`; `Phys.Algebra.assoc`.
- Instances: O ℚ = CD (H ℚ) uses local `CD.narCD`/`CD.srCD` (NonAssocRing) — attribute [local instance].

## DEFINITIONS (theory-native)
- `SectorGlobalGather A := ∀ a b : A, WorldsGlue a b`   (all local worlds glue → global section exists)
- `SectorConfines A := ¬ SectorGlobalGather A`          (no global section = confined)
- `SectorAssoc A := ∀ a b c, (a*b)*c = a*(b*c)`

## THEOREMS (all probed EXIT 0, foundations-only)
- `globalGather_iff_assoc` : SectorGlobalGather A ↔ SectorAssoc A
- ★ `confines_iff_not_assoc` : SectorConfines A ↔ ¬ SectorAssoc A  (THE CRITERION, generic)
- `dbl_not_confines`, `h_not_confines`, `o_confines`               (the three concrete rungs)
- J-I1 `o_confinement_obstruction_eq_associator` : gluingDefect a b = assoc a b (on O ℚ)
- `o_confines_from_cascade_stop` : SectorConfines (O ℚ)  via not_associative (ONE CAUSE)
- ★★ `confinement_staircase` : the four-clause bundle

## COSTUME (W8, C410)
A "an associative sector also confines" mis-reading must fail. Flag iFlag=1 tied to
`dbl_not_confines`/associative-rung-glues; bogus claim reduces to `1 = 410`.

## DISCIPLINE
- G1-G5: criterion DERIVED (not "SU(3) confines"); no empirical number (Λ_QCD/938 MeV = removable prose);
  physics-words-removable (delete confine/colour/quark/hadron → pure gluing/associativity statement);
  foundations-only ⊆ {propext, Classical.choice, Quot.sound}.
- ℝ-vigilance/free-floating: the theorems are ABOUT the banked concrete rungs Dbl ℚ / H ℚ / O ℚ and the
  banked associator — the generic `confines_iff_not_assoc` is INSTANTIATED at O ℚ (`o_confines_from_cascade_stop`,
  `confinement_staircase`), so the result is grounded on the tower, not floating over an arbitrary carrier.
- W4.5 sufficiency: derive I1 criterion only; I2 (singlets sheafify → hadrons) is the successor.

## COST
All decls are cheap (funext + congrFun + simp + banked-lemma citations). No heavy compile. W9 clear.
