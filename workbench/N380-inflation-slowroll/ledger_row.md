
## N380 — arc-H H2 (candidate-class): INFLATION SLOW-ROLL n_s = 1 − 2/N, r = 8/(c²N²) DERIVED from the FORCED plateau potential

**Node:** N380 | **Arc:** SEED_COSMOLOGY_COMPLETION §H2 (directed successor of N379) | **Commit:** (see git) | **Costume:** C405 (bites 1=405)

**What it banks** (Phys/Algebra/CosmoInflationSlowRoll.lean, ns Phys.Algebra, 16 audited decls over the derived ℝ Cut): the inflation slow-roll observables DERIVED from the C6-FORCED plateau potential (N364) `V=(1−cutExp(−cφ))²`, using the banked N370 derivatives (V′,V″) and the N379 antiderivative (the e-fold count).
- `slowRollEps`/`slowRollEta` (ε=½(V′/V)², η=V″/V geometric invariants of the banked potential) + `slowRollEps_eq` (ε=2c²u²/(1−u)²), `slowRollEta_eq` (η=(−2c²u+4c²u²)/(1−u)²), u:=cutExp(−cφ) [theorem].
- `foldPotentialSecondDerivVal_hasDerivAt` (V″ IS d/dφ V′, grounded via N370), `one_sub_u_ne` (φ>0 ⇒ gap open).
- `efoldCount` (N=∫₀^φ V/V′ = (cutExp(cφ)−1)/(2c) − φ/(2c) via N379 expScaleAntideriv) + ★ `efoldCount_hasDerivAt` (FTC: dN/dφ=V/V′ — GROUNDS "N is the e-fold count") [theorem].
- `efoldLead` (N_lead=cutExp(cφ)/(2c²)) + ★ `efoldLead_suppression` (2c²u·N_lead=1), `efoldLead_uform` (N_lead=1/(2c²u)) [theorem].
- `nsRead`=1+2η−6ε, `rRead`=16ε (the slow-roll DICTIONARY — NAMED IDENTIFICATION, flagged).
- ★★ `nsRead_efold_exact` ((n_s−1)·N_lead = −2(1+u)/(1−u)²), ★★ `rRead_efold_exact` (r·c²N_lead² = 8/(1−u)²) [theorem, exact Cut-arithmetic].
- ★★ `nsRead_eq_nsPlateau_mul_corr` (n_s−1 = (nsPlateau N_lead−1)·corrNs u), ★★ `rRead_eq_rPlateau_mul_corr` (r = rPlateau c N_lead·corrR u) — factor EXACTLY through the banked N364 relations, corrNs u=(1+u)/(1−u)², corrR u=1/(1−u)² [theorem].
- ★ `corrNs_zero`/`corrR_zero` (corrections =1 at attractor u→0, the NEVER-attained asymptote = C6) → n_s=1−2/N, r=8/(c²N²) EXACTLY at the attractor.
- ★★★ `inflation_slowroll_derived` capstone bundle.
- W8: `corrNs_half` (corrNs(1/2)=6), `corrNs_nonconstant` (6≠1) — the relations are ATTRACTOR LIMITS not exact-everywhere; C405 bites 1=405.

**Grade:** CANDIDATE-CLASS (SEED §H2). Plateau CLASS forced (theorem N364); ε,η,N DERIVED (theorem); n_s=1−2/N, r=8/(c²N²) DERIVED as the u→0 attractor limits (via corrections→1) MODULO the FLAGGED slow-roll dictionary (n_s=1+2η−6ε, r=16ε — the power spectrum / perturbation theory is not banked; like T8 mixing / N364 plateau=C6). Turns the N364 candidate DEFINITIONS into derived attractor relations. NO FIT: measured n_s≈0.965, r are removable prose only (G2), appear in NO proof.

**Standard applied:** UNBROKEN (every object back to the fold: cutExp N174, V/V′/V″ N364/N370, expScaleAntideriv N379; nothing posited but the fold + the flagged dictionary). COMPLETE (16 audited decls ⊆ {propext,Classical.choice,Quot.sound}; no sorry/native/heartbeat-raise). PHYSICS-WORDS-REMOVABLE (delete inflation/slow-roll/spectral/tensor/e-fold/attractor → pure Cut-arithmetic on the map (1−cutExp(−cφ))²: ratios, tsum-integral derivative, exact identities, corrections =1 at u=0 and 6 at u=1/2). NOT free-floating (all types cite the banked Cut + plateauApproachPot/foldPotentialDeriv/expScaleAntideriv/nsPlateau/rPlateau). ℝ-vigilance: banked derived Cut only; NO Mathlib Real/Real.exp/interval-integral as content.

**Successor:** ONE directed child → arc-H H3 (baryogenesis η_B, SEED_COSMOLOGY_COMPLETION §H3).
