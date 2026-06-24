# N18 — FINDINGS (anti-circling record + the SHARPENED handoff for N19)

## What N18 BANKED (commit 2681c45, `Phys/Algebra/DerivationTraceFree.lean`)
The QUALITATIVE so(7) characterization of `Der(O ℚ)` is now COMPLETE in Lean —
all FOUR structural constraints the exact-rational numerics record for every
derivation, derived COORDINATE-FREE (the W9 512×64 monolith ENTIRELY AVOIDED):
  (1) `D 1 = 0`                            — N16 `deriv_one`.
  (2) skew (`D x · star x = x · D x`)      — N17 `deriv_norm_preserve` (⟹ Der ⊆ so(7)).
  (3) TRACE-FREE (`reQ (D x) = 0`)         — ★ N18 `deriv_reQ_zero` / `deriv_maps_im`
        (`star (D x) = − D x`: D maps O into the 7-dim imaginary subspace).
  (4) commutes with conjugation            — ★ N18 `deriv_comm_star`.
Plus the levers: `deriv_jordan_anticomm` (imaginary x: `D x·x + x·D x = 0`),
`deriv_reflect`, `deriv_re_smul_zero` (`(4 reQ Dx)•x = 0`), the scalar-on-unit
machinery `smul_one_mul`/`mul_smul_one`/`star_smul_one`. Non-vacuous on the banked
nonzero witness (`witnessDeriv_reQ_zero`/`_maps_im`/`_comm_star`). 10 theorems +
witness corollaries, foundations-only ⊆ {propext, Classical.choice, Quot.sound}.
Costume C37 (`DerivationTraceFreeCostume`) bites `⊢ 0 = 1`.

THE TRUNK REFRAME (THE ONE LAW): trace-freeness is read in the literature off the
8-coordinate skew matrix (`M = −Mᵀ ⟹ row 0 = 0`). Here: for imaginary x, skew gives
the Jordan anticommutation `{Dx, x}=0`; conjugate + sum + the trace identity (the
symmetric part `Dx + star Dx = (2 reQ Dx)•1` lands central) collapse to
`(4 reQ Dx)•x = 0`; x imaginary nonzero + the derived ℚ a field ⟹ reQ Dx = 0.
General x → its imaginary part (real part killed by `deriv_one`). NO coordinates.

## ★ THE SHARPENED REMAINDER (childed to N19) — what is left for the EXACT count
The QUALITATIVE so(7) containment is DONE. The EXACT `dim_ℚ Der(O ℚ) = 14` (the
so(7)→g₂ cut 21→14) + the `≅ g₂` structure remain. The honest decomposition of what
that now requires, in dependency order:

  PREREQUISITE INFRA (the real blocker, not yet attempted because it is a node of its
  own): a FINITE-DIMENSIONALITY scaffold on `O ℚ`. `finrank`/`Module.rank` statements
  need `O ℚ` exhibited as `FiniteDimensional ℚ (O ℚ)` with an explicit ℚ-BASIS
  (the 8 coordinate units e₀..e₇) and `Der` realized as a `Submodule ℚ (Module.End ℚ (O ℚ))`.
  N17 banked `Module ℚ (O ℚ)`; it does NOT yet give a basis / finrank=8. This is a
  bounded, coordinate-LIGHT infra node (build `Basis (Fin 8) ℚ (O ℚ)` componentwise,
  like `cdModuleQ`), MEASURE it first.

  (L) lower bound dim ≥ 14: exhibit 14 explicit independent derivations. The explicit
  14-element integer-sparse basis IS in workbench/N16-g2-dimension/nullbasis.pkl
  (re-verified N18: each nnz=4, rank 14, pivots [10,11,12,13,14,15,19,20,21,22,23,37,38,39]).
  Readable form (e_i -> coeff e_a), from `dump_basis.py`:
    D0: e5->-e2, e4->+e3, e3->-e4, e2->+e5      D7: e2->-e1, e1->+e2, e6->-e5, e5->+e6
    D1: e4->-e2, e5->-e3, e2->+e4, e3->+e5      D8: e7->-e1, e4->+e2, e2->-e4, e1->+e7
    D2: e3->+e2, e2->-e3, e5->-e4, e4->+e5      D9: e4->-e1, e7->-e2, e1->+e4, e2->+e7
    D3: e6->-e1, e4->-e3, e3->+e4, e1->+e6      D10: e5->+e1, e7->-e3, e1->-e5, e3->+e7
    D4: e5->+e1, e6->-e2, e1->-e5, e2->+e6      D11: e2->+e1, e1->-e2, e7->-e4, e4->+e7
    D5: e4->+e1, e6->-e3, e1->-e4, e3->+e6      D12: e3->-e1, e1->+e3, e7->-e5, e5->+e7
    D6: e3->-e1, e1->+e3, e6->-e4, e4->+e6      D13: e3->-e2, e2->+e3, e7->-e6, e6->+e7
  Each is a candidate `IsDeriv` (a coordinate Leibniz identity to verify per matrix) +
  a 14×64 independence rank. NOTE: the banked N6 `innerDeriv q` (inner derivations
  `ad_q` lifted) gives a THEORY-NATIVE family — reconnaissance shows the lifted
  imaginary-quaternion inner derivations land in this span; preferring `innerDeriv`
  over raw matrices keeps the lower bound forward-from-the-trunk (W1 reframe).

  (U) upper bound dim ≤ 14: the so(7)→g₂ cut 21→14. so(7) on the imaginary 7-space has
  dim 21; the Leibniz law on the imaginary generators imposes the extra constraints
  cutting to 14. This is the representation-theoretic half — genuinely the hardest, and
  the literature's actual `Der(𝕆) = g₂` content. W9-prime: a per-imaginary-generator
  constraint count, NOT a brute 512×64 kernel.

  (≅ g₂) the Lie-isomorphism: explicit bracket structure constants (from N6
  `isDeriv_bracket`) + the `≅ g₂` map. W1: Mathlib may lack a usable `g₂` — per W1 do
  NOT posit/import one to "match"; the 14-dim Lie algebra with its proved bracket table
  IS the bankable object; "this 14-dim Lie algebra IS g₂" asserted without the
  structure-constant proof is a D3 bridge.

## W9 ANTI-CIRCLING — routes NOT to attempt (carried from N16/N17, still binding)
- Do NOT `decide`/`ring` a 512×64 ℚ-rank in Lean; do NOT inflate maxHeartbeats. The
  brute kernel route is MEASURED DEAD (N16 FINDINGS). The EXACT count is STRUCTURAL:
  finrank-infra + explicit basis (L) + per-generator cut (U), each bounded + banked
  separately (W9.3 freeze-on-compile, W9.8 bank-as-you-go).
- N18 did NOT re-attempt the count — it banked the genuinely-new qualitative refinement
  (trace-free + conj-commute) that completes the so(7) picture and is forward progress,
  NOT a re-child. N19 inherits a SHARPER target (the finrank scaffold is now the named
  first sub-node, not a vague "do the rank").

## Re-verified numerics (W6, THIS run): model.py / deriv_dim.py / structural.py all
exact-rational re-run clean: rank 50 / nullity 14 ⟹ dim = 14; every basis derivation
kills the unit, is skew (M = −Mᵀ ⟹ so(7)), preserves Im, commutes with star; explicit
14 integer basis rank 14. dump_basis.py added (readable basis dump).
