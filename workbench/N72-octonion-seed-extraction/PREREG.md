# N72 PREREG — frozen before compute

## Node target (specified against the chain, ROADMAP §N72 FORWARD FRONTIER + ticket priority (i))

The ticket TARGET is the HEAVY group-manifold core: the FULL n-dim spectral EXISTENCE for an
ARBITRARY operator with NO given eigenbasis (characteristic-equation / fixed-point seed extraction),
the full deflation induction to general n, the GLOBAL polar/KAK assembly, CONNECTEDNESS, the GLOBAL
reverse KAK surjectivity, the full Spin(9)→SO(9) exhaustion. MEASURE-FIRST (below) confirms each of
these needs group-manifold machinery Mathlib lacks over the derived ℝ `Cut` (Lie-group integration,
topology of SO⁺(1,9), an octonionic spinor cover). This is a W1/W3 situation: bank the
immediately-bankable structural piece (ticket priority (i)) and child the global remainder.

## MEASURE FIRST (W9) — the smallest obligations, priority order

Priority (i) — THE SEED EIGENPAIR EXTRACTION from a coordinate operator GIVEN ONLY IN COORDINATE
FORM, eigenvector CONSTRUCTED from the discriminant radical, ESCALATING N65 to the octonion block.
N65's `txOp_eq_specOp_rot` constructs the (t,x)-plane eigenbasis from `R = cutSqrt(δ²+b²)`. The
ROADMAP names the lever explicitly: "extend that construction to an operator that ALSO touches the
octonion block." N69's `txMix` couples time↔octonion-real but its eigenbasis {mixA,mixB,mixW3} was a
GIVEN rational frame. THIS node: an ARBITRARY symmetric operator `toMix a b d` on the
(time, octonion-real) 2-plane, with its eigenbasis CONSTRUCTED from the discriminant radical
`R = cutSqrt(δ²+b²)` (NO fixed eigenbasis), then the constructed seed eigenpair fed through the
now-banked N71 vector eigen-equation into the now-banked N70 `deflateC` engine.

All obligations are the SAME engine as N65/N69 (`ring`/`linear_combination`/`norm_num`/`gFormC`
bilinearity over the derived `Cut`), the octonion output always a scalar multiple of `1₍O₎` handled
via `← add_smul` + `ring` on the coefficient (exactly txMix_eq_specOp3). Expected sub-20s compile.

## GO / NO-GO / KILL

- GO if: the constructed-eigenbasis seed extraction on the octonion-COUPLING operator `toMix`
  compiles foundations-only, with the deflation engine firing NON-VACUOUSLY on the CONSTRUCTED seed
  eigenpair (both general and a concrete rational witness), and a costume biting a wrong seed
  eigenvalue with a false numeric DISTINCT from C84..C102.
- NO-GO / reframe if: the octonion coupling makes an EvC computation fail to close by `ring`
  (gFormC nonlinearity) — treat `gFormC 1 v` as a single scalar variable; if that still fights,
  return to the trunk, do NOT weaken.
- KILL = 30s per obligation. Any single obligation exceeding ~30s compile is an INSTRUMENT failure
  (W9) → measure/decompose; do NOT inflate maxHeartbeats. (Not expected — pure linear algebra.)

## Deliverable theorems (production: Phys/Algebra/LorentzContinuumOctSeedExtract.lean)

1. `omixA c s := (c,0,s•1₍O₎)`, `omixB c s := (-s,0,c•1₍O₎)` — the octonion-coupling rotation pair.
2. `omixA_norm`/`omixB_norm`/`omixAB_orth` — EvC-orthonormal for `c²+s²=1` (always orthogonal).
3. `toMix a b d` — the coordinate operator coupling time↔octonion-real; `toMix_apply`.
4. `toMix_octBlock` — the genuine coupling: `toMix` maps the pure-time unit into the octonion block.
5. `specOp_omix_eq_toMix` — ★ FORWARD DECOMPOSITION over the rotation eigenbasis.
6. `specOp_eigen₁`/`specOp_eigen₂` — the rank-2 VECTOR eigen-equation (the seed the engine consumes).
7. `toMix_eq_specOp_omix` — ★★ THE CROWN: constructed eigenbasis from the discriminant radical,
   for an operator TOUCHING THE OCTONION BLOCK (the octonion-sector analogue of N65's crown).
8. `toMix_op_sqrt_gen` — ★★ the general operator square root via the constructed eigenbasis.
9. `toMix_seed_eigen` — ★★ the CONSTRUCTED seed eigenpair in vector form `toMix u₊ = λ₊•u₊`.
10. `toMix_isEvCSymm`, `toMix_deflate_kills_seed`, `toMix_deflate_image_orth` — the deflation engine
    FIRES non-vacuously on the CONSTRUCTED seed (escalating N71's GIVEN-eigenbasis firing).
11. NON-VACUITY (W8): `toMix_73_36_52_diag`, `toMix_73_36_52_witness`, concrete deflation firing.

## Costume C103

Bites a WRONG constructed-seed eigenvalue: the λ₊ eigenvalue of `toMix 73 36 52` at its constructed
`omixA (4/5)(3/5)` eigenblock is `100`; a bogus claim it is `40` reduces via the banked
`specOp_read₁` to `100 = 40` — DISTINCT from C84 8=4 … C102 9=7.

## W1 heavy remainder → child N73

The FULL n-dim spectral existence for an arbitrary operator with no given eigenbasis (the
general-dimension characteristic-equation route + the full deflation induction to general n) + the
GLOBAL polar/KAK assembly + connectedness + the GLOBAL reverse KAK surjectivity + the full
Spin(9)→SO(9) exhaustion — childed onto the chain tail.
