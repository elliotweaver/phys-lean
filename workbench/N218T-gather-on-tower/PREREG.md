# PREREG — N218T · THE GATHER ON THE TOWER (rung-by-rung inter-world gluing)

## THE ARENA (fixed by ROADMAP §HUMAN-GATED FRONTIER TURN REVISED — NOT the answer)
The derived Cayley–Dickson tower, EXACT banked types (no new build, no Mathlib number/algebra as content):
  Dbl ℚ (`Phys/Cascade/ComplexUnit.lean`) → H ℚ = CD(Dbl ℚ) (`Quaternion.lean`)
  → O ℚ = CD(H ℚ) (`Octonion.lean`) → S ℚ = CD(O ℚ) (`Sedenion.lean`).
All imports are the banked cascade modules. `*`,`star` are the banked CD product/conjugation.

## THE FAITHFUL WORLD-NOTION (DERIVED from the trunk, not posited)
A fold-generated INNER WORLD = a standpoint `a` of a rung together with THE WHOLE ALGEBRA
reorganized through it = the **left regular action** `worldMap a := (a * ·) : A → A` (the
"world standpoint `a` opens", an instance of the banked algebra AS a world — the ROADMAP's own
"a module over it / the world a standpoint opens" candidate). This is NOT an element and NOT the
interior grammar of one algebra: the objects gathered are WHOLE-WORLD TRANSFORMATIONS.

A GATHER of worlds = a family `{worldMap a}`. The INTER-WORLD GLUING question (local→global,
sheaf-like): do two distinct worlds COMPOSE consistently into the world of the composite
standpoint —
      `WorldsGlue a b  :≡  worldMap a ∘ worldMap b = worldMap (a * b)`
i.e. is the world-assignment `a ↦ worldMap a` a HOMOMORPHISM into `(End A, ∘)` (the regular
representation multiplicative). Deleting the physics metaphor ("world"/"gather") leaves the pure
statement "the left-multiplication map is multiplicative: L_a ∘ L_b = L_{ab}" — physics-words-removable.

This is NOT the rolled-back trap: the trap gathered ELEMENTS within one algebra and asked if they
associate (interior grammar). Here the gathered objects are DISTINCT whole-world maps and the
question is their INTER-world gluing/functoriality — controlled by, but stated above, the element level.

## THE REQUIRED SHAPE — RUNG-DEPENDENT (measured, probes/search.py, probe2.py; exact ℚ arithmetic)
A FOUR-LEVEL staircase, each level a DIFFERENT gluing behavior (a uniform theorem cannot express it):
  • Dbl ℚ : worlds GLUE and glue SYMMETRICALLY (commutative+associative).            [full coherence]
  • H ℚ  : worlds GLUE but NOT symmetrically (associative, non-commutative).          [order-dependent glue]
  • O ℚ  : distinct worlds do NOT glue pairwise, but a world SELF-GLUES              [self-glue only]
           (`worldMap a ∘ worldMap a = worldMap (a*a)`, left-alternativity holds; assoc lost).
  • S ℚ  : even SELF-gluing FAILS (left-alternativity lost).                          [no coherence]

WITHHELD/DISCOVERED (not posited): the coherence DEGRADES in a forced staircase as the cascade
climbs; the LAST rung where a world still coheres with itself is 𝕆 — the SAME rung where the
cascade stops (Born self-overlap law holds through 𝕆, fails at 𝕊). Self-gluing = left-alternativity
is the algebraic shadow of the Born = self-overlap composition law. The obstruction is the
associator (pairwise) / the alternativity defect (self). No mechanism posited — it answers itself
rung by rung from the banked facts.

## DERIVATION MAP (every positive = a BANKED theorem; only ONE new computation)
  Dbl glue+symm      ← Dbl ℚ CommRing (banked)                                    [mul_assoc + mul_comm]
  H glue             ← mul_assoc on H ℚ = CD(Dbl ℚ) (banked Ring; `H_associative`)
  H not symmetric    ← `not_commutative_witness` (banked, Quaternion.lean)
  O self-glue        ← `Phys.Algebra.mul_mul_left` (banked, Alternative.lean; narCD.mul ≡ raw *)
  O pair-glue fails  ← `not_associative_witness` (banked, Octonion.lean)
  S self-glue FAILS  ← NEW: `zdX*(zdX*e4) ≠ (zdX*zdX)*e4` in S ℚ (a = banked zdX, differ at .im.im.im.im: −2 vs 0)

## GO / NO-GO
GO if: (a) all four rung behaviors bank foundations-only; (b) the S self-glue-failure witness
compiles within the cost KILL; (c) the capstone conjunction distinguishes all four rungs; (d)
physics-words-removable (rename worldMap→leftAct, all statements stand as pure regular-rep algebra);
(e) #print axioms ⊆ {propext, Classical.choice, Quot.sound} vs the BUILT olean.
NO-GO / reject if: the result is uniform over rungs (wrong object), turns on indexing/loop-length
(wrong object), or uses a toy carrier / new type / Mathlib algebra as content.

## COST KILL (W9)
The only heavy obligation is the S self-glue-failure witness (16-dim CD product, like banked
`zero_divisor_prod`/`N_zdX`). BUDGET: ≤ 1,000,000 maxHeartbeats, single `simp`+`norm_num` on ONE
coordinate (`.im.im.im.im`), NOT a full `ext`. KILL: if it does not close under that within a
bounded probe, decompose to the single coordinate via `congrArg (·.im.im.im.im)`; if STILL heavy,
it is a W1 dissolution ticket — never inflate the ceiling. All positives are citations (near-zero cost).

## COSTUME (1 row)
Bite the S self-glue-failure witness: a bogus claim that S self-coheres forces the differing
coordinate `-2 = 0` (or `-2 = 217`) in ℚ, rejected at the math field.
