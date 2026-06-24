# N19 — FINDINGS (anti-circling record + the SHARPENED handoff for the child N20)

## What N19 BANKED (`Phys/Algebra/DerivationFinrank.lean`)
THE PREREQUISITE FINITE-DIMENSIONALITY SCAFFOLD — N18 FINDINGS flagged it as "the
real first blocker, a node of its own." Banked forward, foundations-only ⊆
{propext, Classical.choice, Quot.sound}, NO posited G₂:
  • `cdProdEquiv A : CD A ≃ₗ[ℚ] A × A`, `dblProdEquiv : Dbl ℚ ≃ₗ[ℚ] ℚ × ℚ` — the
    STRUCTURAL route (W9.4: structure over coordinate expansion). The CD double is
    the product of its components as a ℚ-module.
  • `instFiniteDbl/H/O` — `Module.Finite ℚ` transported along the product equivs.
  • ★★ `finrank_O_eq_eight : finrank ℚ (O ℚ) = 8` (2 → 4 → 8 through the equivs,
    NO 8×8 coordinate basis matrix — the W9 expansion avoided exactly as N17/N18
    avoided the 512×64 kernel). `finrank_End_eq_64`.
  • `qsmul_mul_left/right` — ℚ-scalar/product compatibility (componentwise).
  • `IsDerivQ` + `derivationQ : Submodule ℚ (Module.End ℚ (O ℚ))` — `Der(O ℚ)` as a
    ℚ-submodule, so `Module.finrank ℚ derivationQ` is a WELL-TYPED natural number.
  • `toEndQ` / `toEndQ_isDerivQ` / `toEndQ_mem` — the ℤ→ℚ correspondence: every N6
    `IsDeriv` (ℤ-linear) lifts to an `IsDerivQ` (ℚ-linear) via `map_rat_smul`. The
    ℚ-derivations capture ALL of N6's `Der(O ℚ)`.
  • `witnessDerivQ` (+ `_isDerivQ`/`_mem`/`_ne_zero`) — the banked NONZERO witness
    (N6) as a ℚ-derivation in `derivationQ` (anti-vacuity, W8).
  • ★ `derivationQ_ne_bot` + ★★ `finrank_derivationQ_pos : 0 < finrank ℚ derivationQ`
    and `finrank_derivationQ_le : finrank ℚ derivationQ ≤ 64`.
  ⟹ the scaffold pins the WELL-TYPED bounds `1 ≤ dim_ℚ Der(O ℚ) ≤ 64`.
Costume C38 (`DerivationFinrankWrongDimCostume`: `finrank ℚ (O ℚ) = 7` → `8 = 7`)
bites. Compiled ≈10-12s/obligation, well under the frozen 90s KILL budget; default
maxHeartbeats, NEVER inflated.

## ★ THE SHARPENED REMAINDER (childed to N20) — what is left for the EXACT count
The scaffold makes `dim_ℚ Der(O ℚ)` a well-typed number with proved bounds [1,64].
The EXACT `= 14` (the so(7)→g₂ cut 21→14) + the `≅ g₂` structure remain. The honest
decomposition, in dependency order:

  (L) LOWER bound dim ≥ 14: exhibit 14 explicit independent derivations.
      ★ RECONNAISSANCE THIS RUN (workbench/N19-g2-exact/inner_recon.py): the
      THEORY-NATIVE N6 `innerDeriv q` family (lifted inner derivations `ad_q` of the
      ASSOCIATIVE base `H ℚ`, q imaginary in H) gives ONLY 3 independent derivations
      (Der(H)=so(3), rank 3). So innerDeriv ALONE is NOT enough for 14 — the other 11
      are genuinely OCTONIONIC "outer" derivations, NOT inner-from-the-base. The
      explicit 14-element integer-sparse basis IS in nullbasis.pkl (re-verified N19:
      each nnz=4, rank 14, pivots [10,11,12,13,14,15,19,20,21,22,23,37,38,39]).
      Readable form (e_i -> coeff e_a), from dump_basis.py:
        D0: e5->-e2, e4->+e3, e3->-e4, e2->+e5      D7: e2->-e1, e1->+e2, e6->-e5, e5->+e6
        D1: e4->-e2, e5->-e3, e2->+e4, e3->+e5      D8: e7->-e1, e4->+e2, e2->-e4, e1->+e7
        D2: e3->+e2, e2->-e3, e5->-e4, e4->+e5      D9: e4->-e1, e7->-e2, e1->+e4, e2->+e7
        D3: e6->-e1, e4->-e3, e3->+e4, e1->+e6      D10: e5->+e1, e7->-e3, e1->-e5, e3->+e7
        D4: e5->+e1, e6->-e2, e1->-e5, e2->+e6      D11: e2->+e1, e1->-e2, e7->-e4, e4->+e7
        D5: e4->+e1, e6->-e3, e1->-e4, e3->+e6      D12: e3->-e1, e1->+e3, e7->-e5, e5->+e7
        D6: e3->-e1, e1->+e3, e6->-e4, e4->+e6      D13: e3->-e2, e2->+e3, e7->-e6, e6->+e7
      Each candidate is: (a) an explicit `Module.End ℚ (O ℚ)` (a sparse 8×8 ℚ-matrix,
      built componentwise on the DERIVED module — machinery, STANDARD §3), (b) a
      coordinate Leibniz identity `IsDerivQ Dk` (8×8=64 coordinate checks per matrix,
      each an `ext`+`simp`+`ring` over the banked CD product — W9 RISK: MEASURE one
      matrix first, the per-coordinate `decide`/`ring` over fully-expanded octonion
      products is the brute signature; PREFER stating Dk via `liftEnd`-like sparse
      constructions if a structural form exists), and (c) a 14×64 independence rank
      in `Module.End ℚ (O ℚ)` (the 14 are linearly independent ⟹ dim ≥ 14). The
      independence can be done via `LinearIndependent` on the explicit matrices, or by
      exhibiting 14 of the 64 coordinate-functionals that the matrix family is
      unitriangular against (pivots above).

  (U) UPPER bound dim ≤ 14: the so(7)→g₂ cut 21→14. The qualitative so(7) containment
      is COMPLETE (N16/N17/N18: skew + trace-free + Im-preserving + conj-commuting).
      so(7) on the 7-dim imaginary space has dim 21; the Leibniz law on the imaginary
      generators imposes the EXTRA constraints cutting to 14. The rep-theoretic half —
      genuinely the hardest, the literature's actual Der(𝕆)=g₂ content. W9-PRIME: a
      per-imaginary-generator constraint count, NOT a brute 512×64 kernel. A derivation
      is determined by its action on the 7 imaginary generators (deriv_one + linearity),
      each landing in the 7-dim imaginary space (deriv_reQ_zero), skew (deriv_norm_preserve)
      ⟹ ≤ 21 free params; the Leibniz law on pairs (e_i, e_j) cuts 21 → 14.

  (≅ g₂) the Lie-isomorphism: explicit bracket structure constants (from N6
      `isDeriv_bracket`) + the `≅ g₂` map. W1: Mathlib may lack a usable `g₂` — per W1
      do NOT posit/import one to "match"; the 14-dim Lie algebra with its proved bracket
      table IS the bankable object; "this 14-dim Lie algebra IS g₂" asserted without the
      structure-constant proof is a D3 bridge.

## W9 ANTI-CIRCLING — routes NOT to attempt (carried from N16/N17/N18, still binding)
- Do NOT `decide`/`ring` a 512×64 ℚ-rank in Lean; do NOT inflate maxHeartbeats. The
  brute kernel route is MEASURED DEAD (N16 FINDINGS). The EXACT count is STRUCTURAL:
  the finrank scaffold (banked N19) + explicit basis (L) + per-generator cut (U), each
  bounded + banked separately (W9.3 freeze-on-compile, W9.8 bank-as-you-go).
- The scaffold (N19) used the STRUCTURAL product-equiv route, NOT a coordinate basis
  matrix — this is the W9.4 lesson applied. The LOWER bound (L) DOES need explicit
  matrices; MEASURE one IsDerivQ coordinate check before committing to all 14, and
  prefer a structural construction (liftEnd-style) where the basis form admits it.

## Re-verified numerics (W6, THIS run): model.py / deriv_dim.py / structural.py all
exact-rational re-run clean: rank 50 / nullity 14 ⟹ dim = 14; every basis derivation
kills the unit, is skew (M = −Mᵀ ⟹ so(7)), preserves Im, commutes with star; explicit
14 integer basis rank 14. inner_recon.py: the innerDeriv-from-H family is only 3-dim
(so the 14 are NOT all inner — the lower bound needs the explicit octonionic matrices).
