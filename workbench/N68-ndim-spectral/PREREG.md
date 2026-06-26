# N68 PREREG — frozen before compute

## NODE
N68: the FULL n-DIM SPECTRAL operator core. Forward frontier priority (i): escalate N67's rank-3
`specOp3` to a GENERAL rank-`n` spectral operator `specOpN` — a `Fin n`-indexed sum
`∑ i, (l i) • projC (u i)` over a mutually-EvC-orthonormal family `{u i}`, with:
  - `specOpN_apply` (the action `p ↦ ∑ i, (l i · EvC (u i) p) • u i`);
  - `specOpN_isEvCSymm` (EvC-self-adjoint for EVERY family — closure of `projC` symmetry under `•`/`+`/`∑`);
  - `specOpN_nonneg` (EvC-positive-semidefinite for `∀ i, 0 ≤ l i`);
  - `specOpN_comp` (★ the COMPOSITION law over a mutually-EvC-orthonormal family — all off-diagonal
    cross terms vanish, eigenvalues square independently: `(specOpN l u)² = specOpN (l·l) u`);
  - `specOpN_op_sqrt` (★★ the cutSqrt-per-eigenvalue spectral square root at ARBITRARY rank n).
This is the structural backbone of the full n-dim spectral existence (the diagonal `Σᵢ λᵢ Pᵢ` and its
root now hold at every finite rank, not just 1/2/3). It SUBSUMES N63 `specOp` (n=2) and N67 `specOp3`
(n=3) as the general law. Plus a CONCRETE rank-4 witness over a time/space/octonion-real/octonion-im
orthonormal 4-frame `{mixA, mixB, mixW3, mixW4}` (`mixW4 := (0,0,e2)` the octonion imaginary unit),
non-vacuously realizing `√` of a genuinely 10-dim-mixing rank-4 operator.

## DERIVES FROM (banked, no new posit)
N63 `projC`/`projC_apply`/`projC_isEvCSymm`/`projC_idem`/`projC_orth`/`projC_nonneg`/`EvC_add_left`/
`EvC_add_right`/`IsEvCSymm_add`/`IsEvCSymm_smul`; N57 `cutSqrt`/`cutSqrt_sq`/`cutSqrt_nonneg`/
`cutSqrt_unique`; N58 `EvC`/`IsEvCSymm`/`EvC_symm`/`EvC_smul_left`/`EvC_smul_right`; N60 `IsEvCOpSqrt`;
N67 `mixA`/`mixB`/`mixW3` + their orthonormality; the octonion bilinear `gFormC` (`gFormC_one`,
`gFormC_smul_left/right`, `gFormC_coordExpand`); the derived ℝ `Cut`, the terminal algebra `O Cut`.
Mathlib `Finset.sum`/`Module.End`/`LinearMap` machinery operate ON the derived objects (allowed).

## GO / NO-GO
GO if `specOpN` + the five structural lemmas + the rank-4 witness all compile foundations-only
({propext, Classical.choice, Quot.sound}), the costume bites a WRONG n-term root with a false numeric
DISTINCT from the banked battery, words-removable holds. Bank, child N69, complete.
NO-GO / W3 DECOMPOSE if the general `specOpN_comp` (the double-index orthonormality collapse) resists:
bank the rank-4 concrete witness alone (built on specOp3 + one more projection by hand), child the
general `specOpN` law. NO-GO / W1 DISSOLUTION if even that resists after reframe.

## KILL BUDGET (W9 — instrument failure, not theory)
- KILL = 30s wall per single obligation (`lake env lean` on an isolated probe). Default maxHeartbeats
  ONLY; NO inflation, NO native_decide, NO monolithic brute over expanded coords.
- The proofs are pure linear-algebra + ordered-field arithmetic over `Cut` (same engine N56–N67 used,
  all compiled ≤9s). The `Finset.sum` collapse is `Finset.sum_eq_single` / `map_sum` — bounded, not a
  coordinate blowup. If any obligation approaches 30s: STOP, it is an instrument signal — decompose
  (the per-summand lemmas are each cheap), never inflate the ceiling.
- Anti-timeout: bank-as-you-go (productionize + commit the instant the core compiles), run the gate
  D6 audit in BACKGROUND, child + complete with turns to spare. Max runtime 45min.

## COSTUME (C99, next id)
Bite a WRONG n-term spectral root: a wrong eigenvalue in the rank-4 root forces a false numeric at
that eigenblock, DISTINCT from {8=4,0=2,27=9,10=8,9=4,50=0,1=-1,25=7,9=10,9=11,16=15,1=7,25=30,25=9,
49=9,36=9}. Plan: rank-4 root with a wrong 4th eigenvalue `7` claimed for eigenvalue-block `36`
→ `7·7 = 49`... avoid 49=9. Use block value `64` with wrong root `6` → `36 = 64`. Pick a fresh pair.

## WORDS-REMOVABLE
Delete "Lorentz/boost/rotation/spectral/eigen*/diagonal/orthonormal/projection/square-root/
self-adjoint/positive-semidefinite/isometry/Spin/SO(9)/KAK/polar/Cartan/mixing/dimension/rank":
the statements stand as pure math about `EvC`/`projC`/`specOpN`/`cutSqrt`/`IsEvCOpSqrt`/`gFormC` over
the derived `Cut` and `O Cut`.
