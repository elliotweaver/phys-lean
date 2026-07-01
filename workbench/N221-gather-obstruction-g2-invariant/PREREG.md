# N221 PREREG — THE GLUING-OBSTRUCTION COCYCLE IS g₂-EQUIVARIANT; ITS CALIBRATION FORMS ARE g₂-INVARIANT

**Node:** N221 (t_511b7b54), single-flight chain tail after N220.
**Arc:** the owner-directed GATHER frontier, under the ⛔ TEMPORARY OVERNIGHT PRIORITY LOCK
(docs/ROADMAP.md ##TEMPORARY OVERNIGHT PRIORITY LOCK — chain STAYS on the gather; hypercharge /
Freudenthal / Peirce / isospin / gauge-completion FORBIDDEN even if lighter). This front is a
LOCK-NAMED gather direction: "the obstruction's cocycle/irreducibility structure … the
calibration-form N209/N210 shape of the associator."

## THE FRONT (frozen before production)

N219 identified the inter-world gluing obstruction with the banked octonion associator
(`gluingDefect a b = [a,b,·]` on `O ℚ`); N220 determined its Hochschild-cohomological structure
(3-cocycle / exact / End-2-cochain-nonclosed / Jacobiator = 6·). THIS node determines the
obstruction cocycle's **SYMMETRY**: it is EQUIVARIANT under the banked derivation Lie algebra
`Der(O ℚ) = g₂` (N16–N207, the carrier of the whole gauge arc), and consequently the two banked
CALIBRATION FORMS built on it — the associative 3-form `φ = assoc3` (N209) and the coassociative
4-form `ψ = coassoc4 = ⟨[x,y,z],·⟩` (N210) — are g₂-INVARIANT (their total infinitesimal
variation vanishes).

This is the STILL-DEEPER cut: N218T said WHICH worlds glue; N219 said the obstruction IS the
associator; N220 said WHAT KIND of cocycle; **N221 says the obstruction cocycle carries EXACTLY
the exceptional symmetry `g₂ = Der(O)`** — the same `g₂` the gauge arc (colour SU(3) N42,
isospin SU(2) N187, the branching N189–N192) is built inside is the infinitesimal automorphism
algebra of the gather obstruction. The gather obstruction and the gauge carrier are ONE object:
the obstruction to local→global gluing is a `g₂`-equivariant cocycle, and the calibrations that
recognize `g₂` are invariant under it. One cause — the octonion non-associativity — is both the
gluing obstruction (N219) AND the calibration structure whose stabilizer is `g₂` (N209/N210);
this node proves they are the SAME `g₂`-representation-theoretic object.

## THE DECLS (frozen)

Production file: `Phys/Algebra/TowerGatherObstructionInvariant.lean`

Generic backbone (over `CD (CD B)`, formal Leibniz identities):
1. `assoc_deriv_equivariant` — for `D : Module.End ℤ (CD (CD B))` with `IsDeriv D`,
   `D (assoc x y z) = assoc (D x) y z + assoc x (D y) z + assoc x y (D z)` (Leibniz twice).

Headlines on the banked octonion rung `O ℚ` (the magnitude theorems — TYPE mentions the banked
tower objects `O ℚ`, `assoc`, `gluingDefect`, `assoc3`, `coassoc4`, `IsDerivQ`, `D0E`, per the
FREE-FLOATING-ABSTRACTION rail):
2. `assoc_derivQ_equivariant_O` — ★ the associator (= gluing-obstruction cocycle) is
   `Der(O ℚ)`-EQUIVARIANT: for `IsDerivQ D`,
   `D [x,y,z] = [Dx,y,z] + [x,Dy,z] + [x,y,Dz]`.
3. `gluingDefect_derivQ_equivariant_O` — ★ the same on the N219 obstruction map `gluingDefect`
   (definitional tie): `D (gluingDefect a b x) = gluingDefect (Da) b x + … + gluingDefect a b (Dx)`.
4. `coassoc4_derivQ_invariant` — ★★★ THE HEADLINE: the coassociative calibration 4-form
   `ψ = ⟨[x,y,z],w⟩` (N210) is `g₂`-INVARIANT — total infinitesimal variation vanishes:
   `coassoc4 (Dx) y z w + coassoc4 x (Dy) z w + coassoc4 x y (Dz) w + coassoc4 x y z (Dw) = 0`.
   (Equivariance of the first three slots + `gFormQ_skew` on the fourth.)
5. `assoc3_derivQ_invariant` — ★★ the associative calibration 3-form `φ = ⟨x, y×z⟩` (N209) is
   `g₂`-INVARIANT: `assoc3 (Dx) y z + assoc3 x (Dy) z + assoc3 x y (Dz) = 0`
   (N207 `octCross_deriv_leibniz` cross-equivariance + `gFormQ_skew`).
6. `assoc_equivariant_at_D0E` — the equivariance at the concrete banked nullbasis derivation
   `D0E` (N16), a genuine instance.
7. W8 non-vacuity `obstruction_invariance_nonvacuous` — `∃ x y z, assoc x y z ≠ 0` (banked
   `assoc_nonvanishing`); the equivariance/invariance is not the trivial `0 = 0`.
8. Capstone `obstruction_g2_invariance_structure` — bundles the equivariance of the obstruction
   cocycle + the invariance of BOTH calibration forms + non-vacuity, on `O ℚ`.

## W9 MEASURE-FIRST VERDICT (frozen — measured BEFORE production)

A LIGHT node. Probes measured clean, exit 0:
- probe1 (assoc_derivQ_equivariant_O + gluingDefect equivariance + coassoc4 invariance +
  D0E instance): **8.3s**, exit 0 (only unused-simp-arg warnings — will trim `sub_mul`/`mul_sub`).
- probe2 (assoc3 3-form invariance): **7.8s**, exit 0.
- witness coordinate: banked `assoc_witness_coord = 2` (`.im.im.im`), reused for the costume.

Every obligation is Leibniz-applied-twice (`map_sub`/`hD`/`add_mul`/`mul_add`/`abel`) + banked
`gFormQ_skew` / `octCross_deriv_leibniz` / `gForm_add_left/right`. NO coordinate `ring` on a
degree-4 expansion, NO W9 risk, NO maxHeartbeats raise. KILL = 90s/obligation (never approached).
No cross-type term-mode delegation (the N220 W9 subtlety) — each `O ℚ` headline proved directly by
tactic. If any obligation unexpectedly balloons: MEASURE the smallest sub-obligation, decompose,
never grind.

## IMPORTS (frozen — banked objects only, no new content)

`Phys.Algebra.OctonionCoassociative4Form` (N210 coassoc4 + assoc + gForm + assoc_witness_coord),
`Phys.Algebra.OctonionCrossProductDerivation` (N207 octCross_deriv_leibniz + IsDerivQ + D0E),
`Phys.Algebra.TowerGatherObstruction` (N219 gluingDefect + o_gluingDefect_eq_assoc).
(N207 transitively brings `gFormQ_skew`, `derivationLieQ`, `assoc3`, `octCross`, the derived tower.)
Ground = derived ℚ; OBJECTS = banked `O ℚ` / `assoc` / `gluingDefect` / `assoc3` / `coassoc4` /
`IsDerivQ` / `D0E`. NO Mathlib ℝ/ℂ as content; nothing posited; no bridge.

## STANDARD (to be applied at completion)
- UNBROKEN: imports only banked N207/N210/N219 + transitively N5b/N16–N26/N206. Every object
  derived; g₂-equivariance is pure Leibniz + banked skew-adjointness. Nothing posited.
- COMPLETE: foundations-only target `[propext, Classical.choice, Quot.sound]`; no sorry/axiom/
  native_decide; no maxHeartbeats raise; independent re-audit vs the built olean.
- PHYSICS-WORDS-REMOVABLE: delete "world/gather/glue/obstruction/cocycle/calibration/gauge/g₂" →
  over derived ℚ and `O ℚ = CD (H ℚ)`, for the associator `assoc x y z = (xy)z − x(yz)` and every
  ℚ-linear Leibniz endomorphism `D` (`D(xy)=Dx·y+x·Dy`): `D(assoc x y z) = Σ assoc(…D…)`, and the
  scalar forms `gForm x (octCross y z)` and `gForm (assoc x y z) w` have vanishing total
  `D`-variation. No theorem statement needs a physics word.
- FREE-FLOATING check: the generic backbone `assoc_deriv_equivariant` is a formal Leibniz identity
  (like a ring identity); ALL headlines + capstone are stated ON `O ℚ` referencing banked
  `assoc`/`gluingDefect`/`assoc3`/`coassoc4`/`IsDerivQ`/`D0E` — the magnitude theorems are literally
  ABOUT the banked tower objects and the banked g₂=Der(O).
- NOT a re-pin: N207 banked octCross g₂-invariance; N209/N210 banked the forms + their alternation;
  N219/N220 banked the obstruction + its cohomology. NONE banked the g₂-EQUIVARIANCE of the
  obstruction cocycle itself, nor the g₂-INVARIANCE of the calibration forms — a NEW characterization
  connecting the gather-obstruction arc (N218T–N220) to the gauge carrier g₂ (N16–N207) as one
  g₂-representation object.

## COSTUME C253 (plan)
`Counterexamples/TowerGatherObstructionInvariantWrongValueCostume.lean`: the obstruction cocycle
coordinate at the cascade's non-associating witness triple genuinely equals `2`
(`assoc_witness_coord`, so the g₂-equivariant cocycle is a NONZERO cochain — the invariance is not
vacuous). A bogus claim that the obstruction is g₂-trivial / the calibration invariance is vacuous /
the cocycle vanishes forces `2 = 253` in ℚ. Signature `2 = 253` (dash-free, RHS 253 fresh vs the
banked battery). Minimal simp set (only the banked-value rewrite) to avoid technical-noise D5 fail.
