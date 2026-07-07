# N382 — arc-H H4: dark energy w=−1 / de Sitter self-similarity

## SELECT (theory-native, anti-bullshit gate)

**Target chosen:** the late-time equation of state w=−1 and the time-translation
self-similarity of the de Sitter endpoint, DERIVED from the banked covariantly-constant
cosmological term Λ·g (N357, `cosmoTerm_covDeriv_zero`) and the banked derived-ℝ exponential
`cutExp` homomorphism law (N174 `cutExp_add`) + its constant logarithmic derivative (N369
`cutExp_scale_hasDerivAt`). Mechanism-grade for w=−1/self-similarity; the Λ VALUE is never
touched (out of scope, never fit).

**S2 GOAL lens.** The arc-H cosmology story reached the covariantly-constant Λ·g (N357) and
the analytic `cutExp` calculus (H1/N379). The next theory-native beat is to READ the physical
content off those banked objects: (1) what equation of state does the covariantly-constant
Λ·g carry? and (2) what is the shape of the flow it drives? The theory's own answer: the
metric SIGNATURE (the fold's timelike/spacelike miss, banked as `sigOpC` = η, +1 on time, −1
on space) forces the pressure (space-diagonal) and density (time-diagonal) of the
metric-proportional tensor Λ·g to have OPPOSITE SIGN ⟹ P = −ρ ⟹ w = −1. And the fold's own
exponential `cutExp` drives an exponential scale factor whose homomorphism law
`cutExp_add` IS the time-translation self-similarity ("always in the middle").

**S2 REFRAMING lens.** Standard cosmology POSITS the vacuum equation of state w=−1 (the
defining property of a cosmological constant), or grinds the vacuum stress-energy
T_μν = −ρ_vac g_μν. Here w=−1 DISSOLVES into a one-line reading of the signature eigenvalues
(+1 time, −1 space) on the ALREADY-covariantly-constant Λ·g. The wall the field grinds (why
is the vacuum EoS exactly −1?) is a corollary of the ONE CAUSE "the metric has opposite
time/space signs" = the fold's own (1,n) signature (N56/N90).

**GATHER vs ASCENT.** Neither pure-gather (associator cocycle) nor pure-ascent (invariant
tower) is the instrument here — this node reads off the banked METRIC/SIGNATURE track
(N56/N90/N347/N357, ascent-adjacent) for w=−1 and the ANALYTIC track (N174/N369) for
self-similarity. Both banked; the correct instrument is the metric+analytic structure.

**S4 anti-bullshit.**
1. FOLD-CAUSAL: fold → complex unit → cascade → O → indefinite (1,n) signature (N56) →
   sigOpC = the fold's time/space split → Λg = Λ•sigOpC covariantly constant (N357, from
   η²=1) → its diagonal reads P (space, −1) and ρ (time, +1) with opposite sign → w=−1.
   Separately: cutExp = the fold's Born-positive exponential; `cutExp_add` (a(t+Δ)=a(t)a(Δ))
   IS the self-similarity. Each arrow forced; no "standard dark-energy theory says …".
2. DISSOLUTION: standard = posit w=−1 / grind vacuum stress; here = read the signature. Named.
3. GOAL-WORDS-REMOVABLE: delete dark-energy/de-Sitter/Hubble/cosmological-constant → "the
   diagonal of Λ•sigOpC is (Λ, −Λ) ratio −1; cutExp(Ht) satisfies a(t+Δ)/a(t)=cutExp(HΔ)
   epoch-independently; its log-derivative is the constant H." Pure Cut/sigOpC/cutExp math.
4. TEMPTATION: the saturated step would be to compute the Λ VALUE (fitting — forbidden). My
   target derives the MECHANISM/STRUCTURE only, never the value. Explicitly refused.
5. HONESTY: genuine signature-reading + homomorphism-law reading; both real consequences of
   banked objects; ties N357 + N174/N369 together. Grade matches seed (mechanism/theorem for
   w=−1 & self-similarity; Λ value flagged out of scope, never fit).

## BANKED INGREDIENTS (verified live)
- `sigOpC : Module.End Cut STVC`, `sigOpC_apply p = (p.1, -p.2.1, -p.2.2)` (N90/MetricCondition).
- `STVC := Cut × Cut × O Cut`; `MetricEnd := Module.End Cut STVC` (WeakFieldMetric).
- `eta_mul_self : sigOpC*sigOpC = 1` (η²=1).
- N357 `cosmoTerm_covDeriv_zero (Λ k) : … ∧ ∇(Λg)=0` — Λ•sigOpC is covariantly constant.
- `cutExp : Cut → Cut`, `cutExp_add a b : cutExp a * cutExp b = cutExp (a+b)`,
  `cutExp_pos x : 0 < cutExp x`, `cutExp_zero`. (ContinuumExp, N174.)
- `cutExp_scale_hasDerivAt (a x) (ha : a≠0) : CutHasDerivAt (fun y=>cutExp(a*y)) (a*cutExp(a*x)) x`
  (N369) — the constant logarithmic derivative (the constant Hubble rate).
- `Cut` is a `Field` (division available).

## PLAN (production Phys/Algebra/CosmoDarkEnergyEquationOfState.lean, ns Phys.Algebra)
Defs:
- `cosmoStress (Λ : Cut) : MetricEnd := Λ • sigOpC`  (= the banked covariantly-constant Λ·g)
- `cosmoDensity (Λ) : Cut := ((cosmoStress Λ) (1,0,0)).1`     (time-diagonal reading)
- `cosmoPressure (Λ) : Cut := ((cosmoStress Λ) (0,1,0)).2.1`  (space-diagonal reading)
- `scaleFactor (H t : Cut) : Cut := cutExp (H * t)`

Theorems:
- `cosmoDensity_eq  : cosmoDensity Λ = Λ`
- `cosmoPressure_eq : cosmoPressure Λ = -Λ`
- ★★ `pressure_eq_neg_density : cosmoPressure Λ = - cosmoDensity Λ`  (P=−ρ, ∀Λ; the signature)
- ★★ `equationOfState_eq_neg_one : Λ ≠ 0 → cosmoPressure Λ / cosmoDensity Λ = -1`  (w=−1)
- ★ `w_neg_one_load_bearing : Λ ≠ 0 → cosmoPressure Λ ≠ cosmoDensity Λ`  (w≠+1; signature bites)
- `scaleFactor_pos : 0 < scaleFactor H t`
- ★★ `scaleFactor_self_similar : scaleFactor H (t+Δ) = scaleFactor H t * scaleFactor H Δ`
- ★★ `scaleFactor_ratio_epoch_independent : scaleFactor H (t+Δ) / scaleFactor H t = scaleFactor H Δ`
- ★ `hubble_rate_constant : H ≠ 0 → CutHasDerivAt (scaleFactor H) (H * scaleFactor H t) t`
- ★ `hubble_ratio_eq : H ≠ 0 → (H * scaleFactor H t) / scaleFactor H t = H` (constant Hubble rate,
   epoch-independent = constant event-horizon 1/H = constant Gibbons–Hawking temperature)
- ★★★ `dark_energy_de_sitter_structure` — capstone bundle (P=−ρ ∧ w=−1 ∧ epoch-indep ratio ∧
   constant log-derivative ∧ covariantly constant via N357).
- W8 non-vacuity: `deSitter_grows` — scaleFactor strictly grows for H>0, t2>t1 (not the
   constant/trivial reading); ties C407.

Costume C407 (Counterexamples/CosmoDarkEnergyEquationOfStateVacuityCostume.lean, bites 1=407):
flag = 1 = "the pressure GENUINELY differs from the density for nonzero Λ (signature flip is
real, w=−1 not w=+1)", tied by w_neg_one_load_bearing; bogus min 407 iFlag = 407 → 1=407.

## GUARDS
G1 no asserted values (w=−1 derived, Λ value never named). G2 no empirical number in proof
(Ω_Λ/Λ/w = removable prose only). G5 physics-words-removable (checked S4.3). G6 foundations-only.
ℝ-vigilance: build on banked Cut/sigOpC/cutExp; NO Mathlib Real analysis as content.
W9 cost: all reductions are simp/rfl/ring-level on banked lemmas — LIGHT; probe first.
