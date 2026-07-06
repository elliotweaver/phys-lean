# N379 — arc-H H1: the derived-ℝ `cutExp` ANTIDERIVATIVE (the integral side of the analytic fold)

## SELECT outcome (see kanban comment 287)
The DERIVATIVE calculus on `Cut` is ALREADY banked: N369 (`cutExp_hasDerivAt`, chain rule
`cutExp_scale_hasDerivAt`, `.add`, `cutHasDerivAt_const`) + N370 (`CutHasDerivAt.const_mul/.neg/.sub/.mul`,
plateau V/V′/V″). N328 built the FTC-integral primitive but ONLY for the sine series
(`sinAntideriv x = 1 − cutCos x`). The one integral-side object H2's e-fold count needs and is NOT
banked = the antiderivative of the fold's OWN exponential `cutExp`.

## Target (machinery/theorem grade)
File: `Phys/Algebra/ContinuumExpAntideriv.lean`, namespace `Phys.Foundation.ContinuumQ`
(mirrors N370: Algebra-layer file, ContinuumQ namespace, imports N370 for the full calculus).
Import: `Phys.Algebra.FoldPotentialCriticality` (gives cutExp, all CutHasDerivAt rules incl. const_mul).

Decls (all over the derived ℝ `Cut`, tsum-grounded like N328):
1. `expAntiderivTerm x n := x^(n+1)/((n+1)!)` — the termwise antiderivative.
2. `expAntiderivTerm_eq_expTermC_succ` : `= expTermC x (n+1)` (rfl — the term IS the next exp term).
3. `expAntiderivTerm_summable` — shift of `expTermC_summable`.
4. `expAntideriv x := ∑' n, expAntiderivTerm x n` — the accumulated Born self-overlap flux (∫₀ˣcutExp).
5. ★★ `expAntideriv_eq` : `expAntideriv x = cutExp x − 1` — FTC antiderivative-difference (head-peel
   `tsum_eq_zero_add`, `expTermC x 0 = 1`). NO integral apparatus.
6. `expAntideriv_zero` : `expAntideriv 0 = 0` (∫₀⁰ = 0).
7. ★★ `expAntideriv_hasDerivAt` : `CutHasDerivAt expAntideriv (cutExp x) x` — FTC: the accumulated flux
   differentiates BACK to the integrand (via `expAntideriv_eq` + `cutExp_hasDerivAt` + const).
8. `cutHasDerivAt_id` : `CutHasDerivAt (fun y => y) 1 x` — the identity derivative (needed for the −φ
   term of the e-fold integral; currently unbanked, cheap helper).
9. `expScaleAntideriv a x := (cutExp (a*x) − 1)/a` — the SCALED e-fold integral ∫₀ˣcutExp(a·t)dt.
10. `expScaleAntideriv_eq_base` : `= expAntideriv (a*x)/a` (ties the closed form to the tsum, a≠0).
11. ★ `expScaleAntideriv_hasDerivAt` : `CutHasDerivAt (fun y => expScaleAntideriv a y) (cutExp (a*x)) x`
    (a≠0) — the exact integrand H2 consumes (`cutExp_scale_hasDerivAt` + `.add` + `.const_mul`).
12. `expAntideriv_ftc` — capstone bundle (5,6,7).

## Non-vacuity teeth (W8, costume C404)
- `expAntideriv_pos` : `0 < expAntideriv x` for `x > 0` (cutExp x ≥ 1+x > 1, `one_add_le_cutExp`).
- ★ `expAntideriv_zero_ne_cutExp_zero` : `expAntideriv 0 ≠ cutExp 0` (0 ≠ 1) — the LOAD-BEARING tooth:
  the antiderivative VANISHES at the basepoint, distinguishing it from cutExp itself (a wrong
  "∫₀ˣcutExp = cutExp x" dropping the −1 would fail). C404 anchors on `expAntideriv 0 = 0`.

## Discipline
- ℝ-VIGILANCE: everything on the banked derived ℝ `Cut` + banked `cutExp`/`expTermC`. NO Mathlib Real
  analysis / Real.exp / interval-integral as content. Mathlib = tsum/filter MACHINERY only.
- G5 physics-words-removable: delete inflation/e-fold/slow-roll/flux → pure statements that the tsum
  `∑' n, x^(n+1)/(n+1)!` equals `E(x) − 1`, vanishes at 0, differentiates back to `E(x)`, and the scaled
  `(E(ax)−1)/a` differentiates to `E(ax)`.
- G6 foundations-only ⊆ {propext, Classical.choice, Quot.sound}; no proof-hole tactics / kernel-trust
  bypass / heartbeat-ceiling raise.
- W9 cost budget: all proofs are short tsum-reindex / calculus-rule assemblies (like N328/N370). KILL:
  if any single obligation needs a monolithic normalizer > a few sec, decompose. No heavy series proof
  here (summability is a banked shift).

## Successor (ONE): arc-H H2 — slow-roll n_s=1−2/N, r=8/(c²N²) DERIVED from the banked plateau potential
(N364) using this integral (e-fold N = ∫V/V′dφ) + the banked V′/V″ ratios (N370). Directed child.
