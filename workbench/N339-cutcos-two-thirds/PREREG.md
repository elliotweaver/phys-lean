# N339 — PREREG: SEEDED ANALYTIC-COMPLETION D1 (the trig-evaluation REMAINDER: cutCos(2/3) numeral bound)

## DIRECTED SINGLE SUCCESSOR of N338 (arc-C C4). Chain tail. Seed 3 (SEED_ANALYTIC_COMPLETION) §D1.

## SELECT — theory-native FIRST (I am a fresh worker; ran the SELECT protocol before STEP 0)

**What the theory says here.** The derived cosine `cutCos` parametrizes the Born-self-overlap circle
(N323). The forced FLAVOR structure (T6 mass cubic, `OctonionJordanGenerationMassRatios.lean`) has its
phase entering the spectrum ONLY through `e₃`, whose closed form carries `4p³−3p = cos(3δ)`, and the
banked holonomy tie fixes `3δ_B = 3·(2/9) = 2/3 = T` — the cosine of the TOTAL LOOP HOLONOMY = the
fold's self-seen Born fraction. So the SINGLE analytic input the D2 lepton mass ratios need is the
NUMBER `cutCos(2/3 rad)` over the derived ℝ. Everything else in the spectrum (σ₁=6M² rational,
σ₂, σ₃ via e₃) reduces to this one transcendental.

**The honest D1 remainder (option a, confirmed by the theory).** cutSin/cutCos (N323), addition
(N324), cutPi (N325) are BANKED. The genuine remaining work (seed ⚠ HIDDEN JOINT D2) is
EVALUATION/CONVERGENCE: prove the `cutCos` series at `x=2/3` converges and BOUND it between explicit
rationals to EXTRACT the numeral. That is real analysis on `ContinuumQ.Cut` — a normal build, NOT a
wall, NOT a broader toolkit (over-scoping into several angles would fork; the cubic needs only
cos(2/3)), NOT a redirect. Scope = the single `cutCos(2/3)` two-sided rational bound + its clean
3-decimal corollary that D2 consumes.

## ANTI-BULLSHIT LAW (run honestly, in writing)

- **Real theorem, non-vacuous, not decorative?** YES. Deliverable: `191/243 − 56/455625 ≤ cutCos(2/3)
  ≤ 191/243 + 56/455625` (a tight two-sided bound with EXPLICIT rationals), proved from a geometric
  truncation-tail bound on the banked `cosTermC`/`cutCos_hasSum` series. The number FALLS OUT of the
  banked series (G1: no asserted decimal — head is the finite rational sum ∑_{i<3}, tail bounded by a
  proven geometric majorant, exactly the banked `cos2_tail_termbound`/`cos2_geo_value` pattern).
- **Standard temptation named:** `Real.cos (2/3)` + a Mathlib numeric bound. REJECTED (⚠ UNEARNED-
  IMPORT): the whole point is the derived-ℝ `cutCos` over `ContinuumQ.Cut`; the number-tower descends
  from the fold. The theorem's TYPE mentions `cutCos` and `Cut` (banked objects) — it EXTENDS the
  strand, does not fork into generic ℝ analysis.
- **Words-removable (G5):** delete "mass/angle/holonomy" — it stands as a pure two-sided rational
  bound on `cutCos (2/3 : Cut)` over the derived Cut. No name load-bearing.
- **Free-floating rail:** the production theorem's TYPE literally mentions the banked `cutCos`/`Cut`.
  Not generic over an arbitrary carrier. Grounded on the tower.

## THE ROUTE (mirror the banked N325 `cutCos_two_neg` geometric-tail template — REUSE, do not re-derive)

Numerics (workbench/N339-cutcos-two-thirds/numerics.py, mpmath+Fraction, verified):
- cos(2/3) = 0.7858872607769...
- head3 = ∑_{i<3} cosTermC(2/3) i = 1 − 2/9 + 2/243 = **191/243** ≈ 0.7860082
- geometric tail from index 3: |cosTermC(2/3)(n+3)| ≤ (4/32805)·(1/126)^n
  (ratio at n: (2/3)²/((2n+7)(2n+8)) = (4/9)/((2n+7)(2n+8)) ≤ 1/126, equality at n=0: (4/9)/56=1/126)
- ∑' majorant = (4/32805)·(126/125) = **56/455625** ≈ 0.00012291
- tight bracket: [358069/455625, 358181/455625] = [0.7858853, 0.7861311] ⊃ cos(2/3) ✓
- clean corollary: 785/1000 ≤ cutCos(2/3) ≤ 787/1000 (0.785 ≤ 0.7858853, 0.7861311 ≤ 0.787) ✓

### File: `Phys/Foundation/ContinuumTrigEval.lean` (new leaf, ns `Phys.Foundation.ContinuumQ`)
imports `ContinuumTrigPi` (brings cutCos, cosTermC, cut_geom_telescope, cut_summable_geometric,
cosTermC_summable/_abs_summable). Decls:
1. `cutCos_two_thirds_head` : `∑ i ∈ range 3, cosTermC (2/3:Cut) i = 191/243`.
2. `cos_tt_tail_termbound (n) : |cosTermC (2/3:Cut) (n+3)| ≤ (4/32805)*(1/126)^n` (induction, mirror cos2_tail_termbound).
3. `cos_tt_geo_value : (∑' n, (4/32805:Cut)*(1/126)^n) ≤ 56/455625` (mirror cos2_geo_value; exact = via telescope).
4. `cutCos_two_thirds_split : cutCos (2/3) = 191/243 + ∑' n, cosTermC (2/3) (n+3)` (sum_add_tsum_nat_add 3 + head).
5. `cos_tt_tail_upper` / `cos_tt_tail_lower` : ±(56/455625) bounds on the tail (tsum_le_tsum via |·|).
6. ★★ `cutCos_two_thirds_bounds : 191/243 − 56/455625 ≤ cutCos (2/3) ∧ cutCos (2/3) ≤ 191/243 + 56/455625`.
7. ★ `cutCos_two_thirds_bracket : (785/1000:Cut) ≤ cutCos (2/3) ∧ cutCos (2/3) ≤ 787/1000` (the numeral D2 consumes).
8. `cutCos_two_thirds_pos : 0 < cutCos (2/3)` (non-vacuity: the value is a genuine positive number, not 0/±1).

### Costume C364: `Counterexamples/ContinuumTrigEvalWrongValueCostume.lean`
flag = 78 (the ×100 truncation "cutCos(2/3) ∈ [0.78,0.79)"), Cid = 364. `boundFlag_forced`:
`(78/100:Cut) ≤ cutCos(2/3) ∧ cutCos(2/3) < 79/100` from `cutCos_two_thirds_bounds` (pins the value
to 2 decimals — a mis-derivation off by ≥0.005 breaks it). `cert_val_true : min 364 78 = 78`.
`cert_val_wrong_BOGUS : min 364 78 = 364` → reduces to `78 = 364` false. Pair (364,78) fresh.

## GUARDS
G1 no asserted value (bound falls out of banked series). G2 no empirical number (PDG mass = removable
prose). G3 dimensionless. G4 derived not posited. G5 words-removable. G6 foundations-only ⊆
{propext,Classical.choice,Quot.sound}, no sorry/axiom/native_decide/maxHeartbeats-raise. ⚠ ℝ-VIGILANCE:
BANKED cutCos/Cut only, NO Real.cos/Real.pi/Mathlib-ℝ as content. W8: C364 bites (78=364). W9: MEASURE
the induction+geo_value in a bounded probe before production; reuse the banked geometric-tail pattern.

## SUCCESSOR (ONE-SUCCESSOR RAIL): directed child toward SEED_ANALYTIC_COMPLETION D2 (the actual lepton
mass ratios m_e:m_μ:m_τ as numbers, evaluating the banked T6 cubic at 3δ_B=2/3 using this cutCos(2/3)
bound). Pre-complete fork check: kanban_list, non-terminal successors = exactly 1 on the chain tail.
