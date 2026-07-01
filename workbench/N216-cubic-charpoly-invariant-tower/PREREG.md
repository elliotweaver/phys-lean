# N216 — PREREG (frozen GO/NO-GO + KILL before compute)

## The chosen front (measure-first, W9; look WIDEST, W4.5)

Front **(a)** of the §N215-superseded frontier: **THE CUBIC NORM'S RELATION TO THE TRACE /
LINEAR INVARIANTS via the GENERIC CHARACTERISTIC (minimal) POLYNOMIAL, and the MIDDLE
(quadratic-spur / second-elementary-symmetric) INVARIANT that completes the invariant tower.**

N214 banked the LINEAR invariant (`jTr = e₁`) and the bilinear Cartan–Killing metric.
N215 banked the CUBIC invariant (`jN = e₃`, the reduced determinant). The invariant tower
`e₁ → e₂ → e₃` is MISSING its middle rung `e₂` — the quadratic spur — AND the structural
fact that ties the three together: the generic characteristic polynomial whose coefficients
ARE the invariants. This node banks:

- `jS d0 d1 d2 a b c := (d0*d1 + d0*d2 + d1*d2) − gForm a a − gForm b b − gForm c c` — the
  ℚ-valued **quadratic spur** (the second elementary symmetric invariant / trace of the
  adjugate), the MISSING middle rung. The off-diagonal enters NEGATIVELY (`−Σ|·|²`), exactly
  as it does in `jN` — this is the genuinely-new, non-mechanical content.
- `jS_diag : jS d0 d1 d2 0 0 0 = d0*d1 + d0*d2 + d1*d2` (= e₂ of the three eigenvalues).
- `jS_one : jS 1 1 1 0 0 0 = 3`; `jS_frame0 : jS 1 0 0 0 0 0 = 0` (a rank-1 idempotent has σ₂ = 0).
- ⭐⭐⭐ THE HEADLINE `jN_shift` — the GENERIC MINIMAL POLYNOMIAL coefficient identity, for
  the FULL Hermitian matrix (off-diagonal essential):
    `jN (d0+t) (d1+t) (d2+t) a b c = t^3 + (d0+d1+d2)*t^2 + jS d0 d1 d2 a b c * t + jN d0 d1 d2 a b c`.
  (`A + t·1` shifts only the diagonal; the off-diagonal `a,b,c` are carried scalars. The
  linear-in-`t` coefficient is EXACTLY `jS` WITH its off-diagonal `−Σ|·|²` — the shift FORCES
  the middle invariant.)
- ⭐⭐⭐ THE HEADLINE `jN_charpoly` — the CHARACTERISTIC POLYNOMIAL `det(λ·1 − A)` for the FULL
  Hermitian matrix:
    `jN (λ−d0) (λ−d1) (λ−d2) (−a) (−b) (−c) = λ^3 − (d0+d1+d2)*λ^2 + jS·λ − jN`.
  The three invariants are the coefficients of the generic characteristic polynomial; the
  eigenvalues `d0,d1,d2` are its roots on the Cartan. (Needs `gForm (−v) (−v) = gForm v v` and
  the sign of the negated cross term `reQ (((−a)·(−c))·star (−b)) = −reQ ((a·c)·star b)`.)
- Helpers: `gForm_neg_neg (v) : gForm (-v) (-v) = gForm v v`.
- W8 teeth: `jS_witness : jS 2 2 2 1 0 0 = 11` (off-diagonal genuinely lowers σ₂ from 12);
  `jN_charpoly_witness` (a checkable numeric of the full char poly at a specific λ and matrix);
  a `_ne`.

## Why this is genuinely-NEW, non-vacuous, forward (W8, W4.5)

- NOT a re-pin: `jS` (the middle invariant) is UNBANKED (grep `jS`/`quadraticSpur`/`jSpur`
  free). N214 = e₁ + the bilinear form; N215 = e₃. This is the missing e₂ + the tower relation.
- NOT a mechanical consequence of `jN_diag`+`jTr_Dg`: the char-poly / shift identities involve
  the FULL matrix with off-diagonal `a,b,c` ESSENTIAL — the middle coefficient is `jS` WITH its
  `−Σ|·|²` off-diagonal term, which the diagonal facts do not see. The diagonal char poly alone
  WOULD be a juxtaposition (rejected); the off-diagonal makes it genuine.
- NOT trivial-from-associativity: `jN_charpoly` reproduces `jN`'s trilinear cross-term
  `2·reQ((a·c)·star b)` (well-defined by N215's trace-associativity) as the constant coefficient.
- The generic minimal/characteristic polynomial is THE defining structural feature of a cubic
  (Freudenthal) Jordan algebra — it is the tool from which the sharp/adjoint and the forced
  sub-structures are built. A genuine forward step of the ascent, not lateral gold-plating.

## Honest ascent verdict on front (b) (the forced isospin) — NOT this node

(b) THE FORCED ISOSPIN `T₃` inside the trace-zero plane still risks a POSIT (which S₃-equivalent
idempotent-difference is "the" isospin axis). This node does NOT force it; it banks the
completed invariant tower + the char poly (a prerequisite structural object a forced isospin
split must respect — the cubic norm's Cartan-invariance is expressed BY the char poly). The
child + frontier will NAME the missing fact for (b) honestly (no 12th silent defer).

## THE ONE LAW reframe (instrument, not theory)

`jN`/`jS` are ℚ-polynomial forms in `{dᵢ, gForm··, reQ(...)}` treated as ATOMS; `A + t·1` and
`λ·1 − A` touch only the diagonal, so the identities are pure ℚ-polynomial identities closed by
`ring` after `unfold` (+ 3 `gForm_neg_neg` and one cross-sign rewrite for `jN_charpoly`). NO
octonion coordinate ring — the N214/N215 precedent.

## GO / NO-GO
- GO if: probe compiles `jS`, `jS_diag`, `jS_one`, `jN_shift`, `jN_charpoly` clean,
  foundations-only `[propext, Classical.choice, Quot.sound]`, NO octonion coordinate ring,
  under default heartbeats.
- NO-GO / reframe if: `ring` fails to close `jN_shift`/`jN_charpoly` (would signal a wrong
  coefficient — re-derive by hand, NOT inflate heartbeats), or the neg-handling in `jN_charpoly`
  is heavy → bank `jN_shift` (the clean `A+t·1` form) as the primary headline and child/defer the
  `det(λ−A)` form. A too-easy AND vacuous result → look WIDER.

## KILL (W9 compile-cost budget)
- Per-lemma probe KILL = 60s / default heartbeats (200000). Any single obligation exceeding
  that = instrument wall → STOP, do NOT inflate, decompose/reframe. (Expected: all `unfold;ring`,
  seconds — same class as N214/N215.)
- Whole-module olean build KILL = 90s. Full Phys build is the usual ~4k jobs.

## Costume (W8, next id C248)
C248 `= 216`: `jS 2 2 2 1 0 0` GENUINELY = 11 (`jS_witness`); the WRONG claim (jS ignores the
off-diagonal / jS is the bare σ₂ 12 / the middle invariant is degenerate) forces `11 = 216` in
ℚ, rejected at the math field. PASS_SIGNATURE ERE matches `= 216`. Pair (216, 11) fresh, LHS
distinct from every prior left-hand value (… C246=214, C247=215).
