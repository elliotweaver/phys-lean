# N81 FINDINGS — measurement results (route a, trunk-native)

## MEASURED FEASIBLE (all compile clean, warm ~8-11s each), foundations expected clean:
1. `Cut[i] := AdjoinRoot (cutQuad 0 1)` is a FIELD — from N80 `cut_monic_quad_irreducible_of_negDisc`
   via `Fact (Irreducible (cutQuad 0 1))` + `AdjoinRoot.instField`.  [PROBE PASS]
2. `cI ^ 2 = -1` (the adjoined root squares to −1).  [PROBE PASS, via `eval₂_root`]
3. `Module.finrank Cut Cut[i] = 2` (degree-2 extension).  [PROBE PASS, via `powerBasis.finrank` + `powerBasis_dim` + `cutQuad_natDegree`]
4. Gaussian SURJECTIVITY: every `z : Cut[i]` is `ofC a + ofC b * cI` for `a,b : Cut`.
   [PROBE PASS, via `mk_surjective` + `%ₘ` + `eq_X_add_C_of_natDegree_le_one`]
5. `gauss_isSquare`: every Gaussian element `ofC a + ofC b * cI` IS A SQUARE in `Cut[i]`.
   [PROBE PASS — the trunk-native Artin–Schreier degree-2 core, riding N57 `cutSqrt`:
    p = cutSqrt((|z|+a)/2), q = b/(2p) general case; pure-negative-real fallback `i·cutSqrt(-a)`]
6. `CharZero Cut[i]` via `charZero_of_injective_algebraMap` (Cut is CharZero) ⟹ `NeZero (2:Cut[i])`.
   [PROBE PASS]
7. ⟹ FULL: every element of `Cut[i]` is a square (`Cuti_isSquare`, from 4+5).
8. ⟹ every monic/general quadratic over `Cut[i]` has a root (`exists_quadratic_eq_zero` + 6 + 7):
   the DEGREE-2 CLOSURE of `Cut[i]` (the "no degree-2 obstruction" half of Artin–Schreier).

## MEASURED W1-HARD (Mathlib genuinely lacks — childed):
- `IsAlgClosed Cut[i]` itself: requires the Artin–Schreier Galois/Sylow argument (Galois group
  of any finite extension is a 2-group, killed by the squares + odd-degree-root). `grep Sylow
  FieldTheory/` → NOTHING. No `of_squares_and_odd_roots`-style shortcut. MULTI-NODE BUILD.
- Hence the even-dim real-eigenvalue SEED, the full existence, the global polar/KAK assembly,
  connectedness, reverse surjectivity, Spin(9)→SO(9) exhaustion: all childed.

## N81 SCOPE DECISION (W3 decompose):
BANK the complete trunk-native degree-2 Artin–Schreier input:
`Cut[i]` Field + `i²=-1` + `finrank=2` + Gaussian surjectivity + every element a square +
degree-2 closure (every quadratic has a root). CHILD the Sylow alg-closure → even-seed →
full existence → global assembly.
