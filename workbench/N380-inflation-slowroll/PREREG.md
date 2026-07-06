# N380 — arc-H H2: inflation slow-roll n_s = 1 − 2/N, r = 8/(c²N²) DERIVED from the forced plateau potential

## SELECT (docs/NODE_SELECTION.md, theory-native FIRST, anti-bullshit S4 gate)

Directed successor of N379 per SEED_COSMOLOGY_COMPLETION §H2. Ticket target: turn the N364
candidate-grade DEFINITIONS `nsPlateau N = 1−2/N`, `rPlateau c N = 8/(c²N²)` into DERIVED relations
from the banked plateau potential's slow-roll structure, using the N370 derivatives (V′, V″) and the
N379 antiderivative (the e-fold count N = ∫ V/V′).

### Theory-native reading (FIRST, before framing)
The plateau potential V(φ)=(1−cutExp(−cφ))² is FORCED (N364) — the eternal approach (C6): a coherence
asymptote (V<1) NEVER attained (self-blindness, no fixed point). The slow-roll observables are read off
the FORCED potential's OWN geometric invariants:
  ε = ½(V′/V)²   (steepness — the log-derivative squared)
  η = V″/V       (curvature ratio)
  N = ∫ V/V′ dφ  (accumulated slow-roll e-folds — the N379 antiderivative)
No tuning: the potential is not chosen to fit n_s/r; it is the fold's own eternal approach, and the
attractor relations fall out of its geometry.

### The computation (verified by hand, exact)
Let u := cutExp(−cφ) (u>0 always; u<1 for φ>0; u→0 as φ→∞ — the attractor, NEVER attained = C6).
  V = (1−u)²,  V′ = 2c·u·(1−u)  (N370),  V″ = −2c²u + 4c²u²  (N370).
  ε = 2c²u²/(1−u)²,   η = 2c²u(2u−1)/(1−u)².
  e-fold count (FTC, N379):  N(φ) = (cutExp(cφ)−1)/(2c²) − φ/(2c),  d/dφ N = V/V′ = (cutExp(cφ)−1)/(2c). ✓
  Leading e-fold term (attractor, φ→∞):  N_lead = cutExp(cφ)/(2c²) = 1/(2c²u).  So 2c²u·N_lead = 1.
  Dictionary (slow-roll → observables, standard perturbation theory): n_s = 1+2η−6ε, r = 16ε.
EXACT identities (theorem-grade, pure Cut-arithmetic on the banked potential):
  (n_s − 1)·N_lead = −2·(1+u)/(1−u)²                    [→ −2 as u→0]
  r·(c²·N_lead²)   = 8/(1−u)²                            [→ 8  as u→0]
Tie to N364:
  n_s − 1 = (nsPlateau N_lead − 1)·corrNs(u),  corrNs(u)=(1+u)/(1−u)²,  corrNs 0 = 1.
  r       =  rPlateau c N_lead ·corrR(u),       corrR(u)=1/(1−u)²,       corrR 0 = 1.
At the attractor (u=0, never attained): n_s = 1−2/N, r = 8/(c²N²) EXACTLY. Off-attractor: explicit,
non-trivial correction (corrNs(1/2)=6≠1 — W8 teeth).

### ANTI-BULLSHIT S4 gate (honest, in writing)
- Fold→node forced? YES: V forced by C6 (N364); V′,V″ banked (N370); N is genuinely the N379
  antiderivative of V/V′ (FTC theorem, not a chosen symbol). The exact identities are pure algebra on
  banked objects.
- Standard version + what the theory DOES: standard inflation POSITS V and TUNES it to fit n_s,r. The
  theory does not tune — V is forced, and the attractor relations are read off its geometry. What the
  field calls a fit, the theory reads off the trunk.
- Delete physics words: ε=½(V′/V)², η=V″/V, N=∫V/V′ are geometric invariants of the banked map V;
  nsRead/rRead are defined LINEAR COMBINATIONS; the exact identities are Cut-arithmetic facts. NO physics
  word is load-bearing in any THEOREM. PASS.
- Standard temptation named: importing the slow-roll dictionary n_s=1+2η−6ε, r=16ε as if it were derived.
  It is NOT derived in-chain (perturbation theory / power spectrum not banked). HONEST GRADE: the
  dictionary is a FLAGGED named-identification (candidate-grade, exactly like T8 mixing / N364 plateau=C6);
  the DERIVED theorem content is the geometric identities + the FTC e-fold count. n_s=1−2/N, r=8/(c²N²)
  are derived MODULO the flagged dictionary and are the u→0 (never-attained) attractor limits.
- Not free-floating: every statement is about the banked `plateauApproachPot`/`foldPotentialDeriv`/
  `cutExp`/`expScaleAntideriv` on the derived ℝ `Cut`. Types cite the banked objects.

GRADE: CANDIDATE-CLASS (SEED §H2). Plateau CLASS forced (theorem N364); ε,η,N derived (theorem); the
attractor relations n_s=1−2/N, r=8/(c²N²) derived MODULO the flagged slow-roll dictionary, as the u→0
attractor value; N is the leading e-fold count. Flag LOUDLY like T8. NEVER fit measured n_s≈0.965 or r
(removable prose only, G2).

## PLAN (module Phys/Algebra/CosmoInflationSlowRoll.lean, ns Phys.Algebra, ~13-15 decls)
1. helpers: cutExp arg rewrites (cutExp((-c)*φ)=u; cutExp((-(2c))*φ)=u²); u∈(0,1) for φ>0; 1−u≠0.
2. slowRollEps, slowRollEta defs + slowRollEps_eq, slowRollEta_eq (explicit u-forms) [theorem].
3. efoldCount def (N379 antiderivative) + efoldCount_hasDerivAt (FTC: d/dφ = V/V′) [theorem — grounds "N = e-fold count"].
4. efoldLead def + efoldLead_suppression (2c²u·N_lead = 1) [theorem].
5. nsRead, rRead defs (the slow-roll dictionary — FLAGGED).
6. nsRead_efold_exact ((n_s−1)·N_lead = −2(1+u)/(1−u)²) [theorem].
7. rRead_efold_exact (r·c²N_lead² = 8/(1−u)²) [theorem].
8. corrNs, corrR + nsRead_eq_nsPlateau_mul_corr, rRead_eq_rPlateau_mul_corr [theorem — tie to N364].
9. corrNs_zero, corrR_zero (attractor value 1) [theorem].
10. inflation_slowroll_derived (capstone bundle) [theorem].
11. W8: corrNs_zero ∧ corrNs_half (corrNs 0=1, corrNs(1/2)=6 — non-constant) → C405 bites 1=405.

## GUARDS
G1 no asserted values (n_s,r derived). G2 no empirical number (n_s≈0.965 removable prose only).
G3 derived not posited. G5 words-removable (checked). G6 foundations-only. ℝ-vigilance: banked Cut only,
NEVER Mathlib Real. W4.5: exactly the H2 relations, no gold-plated tendsto. W8 C405. W9: field_simp/ring
algebra — measure cutExp-arg bookkeeping in probe FIRST.

## ONE-SUCCESSOR: on land, ONE directed child → arc-H H3 (baryogenesis η_B, SEED §H3).
