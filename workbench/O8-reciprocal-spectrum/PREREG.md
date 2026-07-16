# PREREG — N423 (arc-O O8): THE {7,9,28} RECIPROCAL SPECTRUM
## the scale-tower rung / RG-eigenvalue cross-arc weld

### TARGET (theory-native, decided in SELECT S2-S4; comments 367/368)
The genuinely un-banked O8 content. The ladder `λ_n = −n/(84π)` over GENERIC n is ALREADY banked
(N377 `PathIntegral.scalingDim`, `scalingDim_lock`). N332 explicitly deferred the piece we build:
"the {7,9,28} divisors as the relevant-direction eigenvalues λ_n=−n/(84π) of the one critical
fixed point) is a B7 target — noted here as prose for the successor, NOT built."

We WELD the two arcs. `rungExponent` (arc B, N329: `84π/n`, the scale-hierarchy e-folds) and
`scalingDim` (arc G, N377: `−n/84π`, the RG eigenvalue) are RECIPROCAL readings of the ONE
shared budget `criticalPhaseNumerator = 84π = 2π·42 = 2π/α*`. They have NEVER co-occurred in a
theorem (grep-verified). The weld:

  rungExponent n · scalingDim n = −1     (for (n:Cut) ≠ 0)

evaluated at the three banked structural counts {7,9,28}, bundled with the banked universality
tie (84 = 2/α*), as the "ONE spectrum, TWO regimes" capstone.

### CENTRAL DERIVATION (the fold-causal line)
fold → self-blindness (no fixed point, N1) → Born self-overlap positivity → 𝕆 has 42=1/α* Born
channels (arc A) → phase circle closes at 2π → budget 84π = 2π·42 (N329) → ONE count n divides it
TWO ways: numerator (scale hierarchy, arc B `rungExponent n = 84π/n`) and denominator (RG
eigenvalue, arc G `scalingDim n = −n/84π`) → reciprocal → product = −1. Each arrow forced.

### DELIVERABLES (Phys/Algebra/ReciprocalSpectrum.lean, ns Phys.Algebra.ReciprocalSpectrum)
1. `rung_scaling_reciprocal (n) (hn : (n:Cut)≠0) : rungExponent n * scalingDim n = -1`  ★ the weld
2. `scalingDim_eq_neg_inv_rung (n) (hn) : scalingDim n = -1 / rungExponent n`  — reciprocal form
3. `reciprocal_at_imO : rungExponent 7 · scalingDim 7 = -1` (via finrank_ImO, count=7)
4. `reciprocal_at_spaceSub : ... = -1` (count=9)
5. `reciprocal_at_selfAdj : ... = -1` (count=28)
6. value lemmas: `scalingDim_at_imO`, `scalingDim_at_spaceSub`, `scalingDim_at_selfAdj` giving the
   three RG eigenvalues as `−n/(84·cutPi)` explicitly (the eigenvalue side of the spectrum).
7. `one_spectrum_three_counts` ★★★ CAPSTONE: the three reciprocals = −1, `criticalPhaseNumerator
   = 84·cutPi` (shared budget, N329), AND `(84:ℚ) = 2/alphaStar` (universality, N314/G2) — B + G2
   + G5 in one statement.
8. W8 non-vacuity: `reciprocal_ne_one` (product = −1 ≠ +1: the SIGN is the negative RG eigenvalue,
   not a spurious +1 collapse) + `spectrum_eigenvalues_distinct` (the three eigenvalues differ:
   scalingDim 7 ≠ scalingDim 28).

### DISCIPLINE / GUARDS (SEED_COMPLETION_SWEEP relaxes none)
- G1 no asserted value: −1, the three eigenvalues, 84π all FALL OUT of banked rungExponent/
  scalingDim/criticalPhaseNumerator; nothing premised.
- G2 no empirical number: NO measured scale/coupling in any statement or proof. NO-FIT.
- G3 DERIVED not posited: the weld is pure algebra on the two banked functions sharing the budget.
- G4 words-removable: delete scale/hierarchy/RG/eigenvalue/universality/spectrum — theorems are
  "(84π/n)·(−n/84π) = −1", "scalingDim n = −1/rungExponent n", "84 = 2/(1/42)". No name load-bearing.
- G5 foundations-only ⊆ {propext, Classical.choice, Quot.sound}; no proof-hole, no native-decide,
  no heartbeat raise.
- ℝ-VIGILANCE + NOT-FREE-FLOATING: every TYPE over the banked derived ℝ `Cut` + banked
  `rungExponent`/`scalingDim`/`criticalPhaseNumerator`/`alphaStar`/`finrank ℚ {ImO,spaceSub,selfAdj}`.
  NO Mathlib-ℝ/ℂ as content. Concrete banked objects, NOT generic.
- FLAG (ladder-grade, prose-only, never a theorem, inherited from N329/N332): WHICH face takes
  WHICH count (n=7 QCD / n=9 EW / n=28 gravity) — the class-selection stays flagged prose.
- W8 non-vacuity: next Cid after C447 = C448. Costume C448 = a "the two arcs use DIFFERENT budgets /
  product ≠ −1 / eigenvalues degenerate" mis-reading forces 1=448.
- W4.5: derive exactly O8 (the reciprocal spectrum weld), NOT O9 (Unruh/KMS).
- W9 MEASURE-FIRST: probe the weld lemma + evaluations in scratch (light — algebra on banked
  objects); production whole-file bounded. KILL = 90s/obligation.

### COMPILE-COST BUDGET / KILL
Light node (algebra on two banked derived-ℝ functions + finrank rewrites). Expected whole-file
`lake env lean` < 30s cold. KILL any single obligation at 90s → measure/decompose (W9). If a
`field_simp; ring` blows up, switch to explicit `div_mul_div_comm`/`mul_div_cancel` (tactic-family).

### ONE-SUCCESSOR RAIL
Single directed successor toward arc-O O9 (the Unruh/KMS-modular weld), per SEED §O8 → §O9.
Pre-complete fork check before kanban_complete.
