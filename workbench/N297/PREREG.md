# N297 — PREREG (route-finder → SELECT REFINED the handed-forward target)

## DECISION (fresh-context SELECT, anti-bullshit gate passed IN FULL — comments 225/226)
**N297 — THE DILATION/TRACELESS-SPLIT GRADING OF THE SPECTRUM-MOVING SECTOR: the
f₄-central DILATION `Lmul 1 = 2·id` (the fold's f₄-fixed direction, NO spectrum splitting)
vs the TRACE-GRADED diagonal movers (`Lmul (Dg t) 1 = Dg(2t)` splits the degenerate point),
whose genuine SPLITTING lives EXACTLY on the trace-zero Cartan hyperplane
`t0+t1+t2 = 0 = (ℚ·1)^⊥` (N214).**

The ticket's leading target (the L₀ spectrum-GRADING) ALIGNS with the theory-native beat;
I REFINE the exact deliverable to the W9-free FORCED core — the split/no-split dichotomy of
the L₀ action on the degenerate identity, graded by the linear trace — and CHILD the abstract
f₄-invariance of jTr (the full L = ℚ·1 ⊕ L₀ f₄-submodule refinement), which MEASURE-FIRST
showed is NOT cheap (see (5) below).

## MEASUREMENTS (workbench/N297/probe1.py, exact-Fraction octonion + numpy, EXIT 0)
- dim f₄ = 52 (revalidated).
- (1) DILATION f₄-CENTRAL: `max‖⁅T, Lmul 1⁆‖ = 0.0` over the f₄ basis; `Lmul 1 = 2·id` exact.
- (2) DIAGONAL SPLIT: `Lmul(Dg 1 −1 0) 1 = Dg 2 −2 0` (residual 0.0) — displacement `2·(t0,t1,t2)`.
- (3) TRACE GRADING: `jTr(Lmul(Dg t) 1) = 2·(t0+t1+t2)` exact; traceless ⟺ Σ=0.
- (4) W8: `Lmul(Dg 1 −1 0) 1` traceless (jTr=0), ‖·‖=2.83≠0, diag `(2,−2,0)` NOT a dilation.
- (5) **THE CHILD-JUSTIFICATION**: `jTr(innerMul A B M) = 0` (7e-14) HOLDS, BUT
  `innerMul A B M ≠ [[A,B],M]` for non-assoc octonion matrices (residual 113!) — so
  "derH3 kills jTr" is NOT a cheap trace-of-commutator; it is a genuine theorem needing the
  trace-form-skewness of Jordan derivations (Peirce/associativity). CHILDED.
- (6) abstract `jTr(T A) ~ 0` over the SVD f₄ basis (5.7e-15) — the childed refinement is REAL.

## DE-RISK (workbench/N297/ProbeN297.lean + ProbeN297b.lean, `$LAKE env lean`, EXIT 0 — ~8s LIGHT)
- `probe_dilation_fixed` (P1'): `⁅T, Lmul 1⁆ B = 0` for T∈derH3, Hermitian B, VIA the module
  structure — `spectrum_sector_equivariance T hT _ hB` + `derH3_kills_one T hT` (NOT the trivial
  2·id centrality; genuinely tied to the N296 intertwiner + the N295 ceiling).
- `probe_dilation_scale`: `Lmul 1 X = X + X` (pure scaling).
- `probe_trace_grading`: `jTr(Lmul (Dg t) 1) = ocR(2·(t0+t1+t2))` via `Lmul_one` + `jTr_Dg` + `ocR_add`.
- `probe_split_iff`: `jTr(Lmul (Dg t) 1) = 0 ↔ t0+t1+t2 = 0`.
- `probe_split_iff_orthogonal`: `… = 0 ↔ jTraceForm 1 (Dg t) = 0` (the N214 `jTF_one_Dg_zero_iff`
  JOINT — splitting ⟺ trace-form-orthogonal to the identity).
- `probe_split_traceless` / `probe_split_ne` (W8): `Lmul(Dg 1 −1 0) 1` traceless AND ≠ 0.
- `probe_dilation_trace`: `jTr(Lmul 1 1) = ocR 6 ≠ 0` (dilation moves along the trace direction).
All banked-lever, W9-free (NO native_decide, NO octonion coordinate ring, NO maxHeartbeats raise).

## SCOPE (banked-lever, W9-free, forward, non-vacuous)
BANK (Phys/Algebra/OctonionJordanSpectrumMovingSectorGrading.lean, ns Phys.Algebra.HJ):
1. `dilation_scale` — `Lmul 1 X = X + X` (the dilation IS pure scaling by 2).
2. `dilation_fixed` — `⁅T, Lmul 1⁆ B = 0` for T∈derH3, Hermitian B (the dilation is the
   f₄-fixed / central direction of the module, via equivariance + `derH3_kills_one`).
3. `diag_mover_split` — `Lmul (Dg t0 t1 t2) 1 = Dg t0 t1 t2 + Dg t0 t1 t2` (the diagonal mover
   displaces the degenerate identity by `2·(t0,t1,t2)`).
4. `mover_trace_grading` — `jTr (Lmul (Dg t0 t1 t2) 1) = ocR (2·(t0+t1+t2))` (the trace grading).
5. `split_iff_traceless` — `jTr (Lmul (Dg t) 1) = 0 ↔ t0+t1+t2 = 0` (splitting ⟺ trace-zero).
6. `split_iff_orthogonal` — `… = 0 ↔ jTraceForm 1 (Dg t) = 0` (the N214 JOINT: splitting ⟺
   trace-form-⊥ of the identity — the intrinsic, normalization-free characterization).
7. `dilation_moves_trace` — `jTr (Lmul 1 1) = ocR 6 ≠ 0` (the dilation moves along the trace).
8. W8: `split_traceless` (`jTr(Lmul(Dg 1 −1 0)1)=0`) + `split_ne` (`Lmul(Dg 1 −1 0)1 ≠ 0`).
9. capstone `spectrum_grading_structure` — bundles: dilation pure-scaling ∧ dilation f₄-central
   ∧ diagonal split ∧ trace grading ∧ split⟺trace-zero ∧ split⟺orthogonal ∧ dilation-moves-trace
   ∧ W8 (traceless nonzero split) ∧ `jordan_fails_H4` in the TYPE.

CHILD (the ONE successor, a directed route-finder): "derH3 kills jTr" — the abstract
f₄-invariance of the linear trace (measure (5)/(6) confirm TRUE but W9-nontrivial), which
splits L = ℚ·1 ⊕ L₀ as f₄-modules (the dilation line splits off, L₀ = traceless dim-26 the
f₄-submodule). Needs the trace-form-skewness of Jordan derivations.

NOT banked: "derH3 kills jTr" (childed); the full e₆=f₄⊕L₀ dim-78 bundled LieSubalgebra
(still childable later); the ★5 mass texture VALUE (route-not-yet-found — this grading IS the
named ascent toward it); the ★2 mixing VALUE (route-not-yet-found); "= physical Yukawa/mass
splitting" (removable prose).

## COSTUME
Next BID C326. Bites at the trace-grading / split-dichotomy non-triviality: the certificate
`(jTr (Lmul (Dg 1 (-1) 0) 1)).re.re.re = 0` (traceless split) vs the dilation
`(jTr (Lmul 1 1)).re.re.re = 6` (trace-moving) — a WRONG reading (the movers do NOT split /
the dilation is not distinguished / L₀ carries no trace grading) reduces to a false numeric.
Anchor `(jTr (Lmul 1 1)).re.re.re = 6` (via `dilation_moves_trace` + `ocR_reQ`), packaged as
`min 326 6 = 6`; the bogus `min 326 6 = 326` reduces to `6 = 326`. Pair fresh, RHS 326 distinct.

## FILE
Phys/Algebra/OctonionJordanSpectrumMovingSectorGrading.lean (ns Phys.Algebra.HJ)
