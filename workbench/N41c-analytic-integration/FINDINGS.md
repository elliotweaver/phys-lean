# N41c — FINDINGS (run 175)

## DECISION: W3/W9 DECOMPOSED. Banked the analytic Cauchy-product integration; childed summability.

## MEASUREMENTS (all probes ≤ 16s wall, KILL=60s never approached)
- probe1/2/3: the smul-centrality bundle `SmulCompat` lifts up the cascade
  (`smulCompat_cd`) from the base `smulCompat_dbl_cut`. CLEAN (~7s each). NON-associativity
  no obstruction (the bundle is about the bilinear product, not reassociation).
- probe_module / probe5b: `Module Cut (Dbl/H/O Cut)` builds by transfer (mirroring cdModuleQ),
  and CRITICALLY the module-smul is DEFEQ to `CD.instSMul` (the action `oCut_continuousSMul` is
  stated over) — `example (c x) : (c•x) = CD.instSMul.smul c x := rfl` passes. NO diamond.
- probe4/probe6: ★★ THE GENUINE ANALYTIC CORE ELABORATES — `expO_term_antidiag` (per-n rewrite
  combining N41a iter_leibniz_antidiag + smul-centrality + C(n,k)/n!=1/(k!l!)) AND the conditional
  Cauchy-product `expO_mul_of_summable` (via `tsum_mul_tsum_eq_tsum_sum_antidiagonal` over the
  banked N41b oCut_t3Space/oCut_completeSpace/oCut_isTopologicalSemiring) BOTH compile clean (~10s).
  This is the headline: the literal `O Cut` product-preservation, modulo summability.
- The Cauchy product `Summable.tsum_mul_tsum_eq_tsum_sum_antidiagonal` requires:
  Summable f, Summable g, Summable (product family), [T3Space][NonUnitalNonAssocSemiring]
  [IsTopologicalSemiring] — all the topological hyps are banked N41b; the three Summable hyps
  are the genuine remaining analytic core.

## THE GENUINE HARD CORE (childed N41d): UNCONDITIONAL SUMMABILITY of the vector exp series.
- `Summable (fun n => (1/n!)•(Dⁿ x))` in `O Cut` fundamentally needs the operator-norm majorant
  (N38 opNorm_pow_le) transported to `O Cut` — which requires a Cut-side coordinatization
  `O Cut ≃ₗ[Cut] (Fin 8 → Cut)` + the matrix representation of D. ONLY the ℚ-side `coordO` is
  banked (DerivationAutCompact.lean); the Cut-side is NOT. probe_summ confirmed a naive
  componentwise reduction needs its own embedding lemma (CD.toProd additive embedding → summable
  iff componentwise summable). This is substantial — a dedicated node.
- Once summability is unconditional, `expO_mul_of_summable` discharges to the UNCONDITIONAL
  product-preservation, and the bijection (inverse expO(-D)) + d/dt exp(tD)|₀=D follow on the
  SAME coordinatization. So N41d = the Cut-side coordinatization + summability + the unconditional
  automorphism + derivative.

## BANKED THIS RUN (Phys/Algebra/DerivationOExp.lean, 14 decls, foundations-only):
SmulCompat + smulCompat_{cd,dbl_cut,oCut}; dblModuleCut/cdModuleCut/instModuleCut{H,O};
expO; expO_zero; ★expO_term_antidiag; ★★expO_mul_of_summable; expO_term_antidiag_one (n=1
collapses to the Leibniz law — the derivative seed, non-vacuity W8); isDeriv_witness_exists.
Costume C65 (DerivationOExpNoDerivCostume) bites ⊢ IsDeriv D.
