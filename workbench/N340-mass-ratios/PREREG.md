# N340 — PREREG: SEEDED ANALYTIC-COMPLETION D2 (THE LEPTON MASS RATIOS AS ACTUAL NUMBERS)

## DIRECTED SINGLE SUCCESSOR of N339 (arc-D D1). Chain tail. Seed 3 (SEED_ANALYTIC_COMPLETION) §D2.

## SELECT — theory-native FIRST (fresh worker; ran SELECT before STEP 0)

**What the theory says here.** N309/T6 forced the whole generation spectrum to the cubic
`t³ − σ₁t² + σ₂t − σ₃` with `σ₁=6M²` (Koide, phase-independent) and `σ₂,σ₃` set by the single phase
through `e₃`. The *cubic coefficients* depend on the phase only through `cos(3δ_B)=cos(2/3)` (N339).
BUT the *individual* masses `m_k = a_k²` are Born squares of the cycle amplitudes
`a_k = M(1+√2·cos(δ_B+2πk/3))` (N307 §1), which need the INDIVIDUAL angle `δ_B=2/9` — i.e.
`p=cos(2/9)` and the sine direction. In the banked rational-conic realization (N307) `p=cos δ`,
`r=√3·sin δ`, `A=√2 M`, conic `3p²+r²=3`, and the three amplitudes are
`a₀=M+A·p, a₁=M−A(p+r)/2, a₂=M−A(p−r)/2`. So D2 needs ONE new numeral `cutCos(2/9)`; the sine
enters ONLY through `r=√(3−3p²)` (the conic) — NO separate sin numeral. `√2` is `cutSqrt 2` (banked).

**Honest D2 deliverable.** The two independent dimensionless mass RATIOS as two-sided RATIONAL
bounds over the derived ℝ `Cut`, evaluating the banked cycle form at the DERIVED phase:
- `m₁/m₂ ∈ [0.00483, 0.00485]`  (= m_e/m_μ; PDG 0.00484 — REMOVABLE PROSE)
- `m₂/m₀ ∈ [0.0594, 0.0595]`   (= m_μ/m_τ; PDG 0.0595 — REMOVABLE PROSE)
plus `Σm_k = 6M²` (the banked exact Koide σ₁, lifted to Cut) as the third relation, and the amplitude
brackets themselves. RATIOS are theorem-exact/forced (zero free shape params: Q=2/3 & δ_B=2/9 both
derived); M is the single dimensionful anchor. NOT identity-grade for absolute masses (= ratios ×
Arc-B ladder scale).

## ANTI-BULLSHIT LAW (run honestly, in writing)
- **Real theorem, non-vacuous?** YES — explicit two-sided rational brackets on m₁/m₂ and m₂/m₀ over
  Cut, FALLING OUT of the banked cutCos(2/9) numeral + the forced amplitudes. No decimal posited.
- **Standard temptation named:** `Real.cos(2/9)` + Mathlib. REJECTED (⚠ UNEARNED-IMPORT): ground field
  is banked derived ℝ `Cut`, banked `cutCos`/`cosTermC`/`cutSqrt`. Mathlib tsum/geometric = machinery.
- **Words-removable (G5):** delete mass/lepton/Koide — theorems stand as: for the banked vector with
  entries a_k over Cut at p=cutCos(2/9), r=cutSqrt(3−3p²), w=cutSqrt 2, the ratios a₁²/a₂², a₂²/a₀²
  lie in explicit rational intervals. No name load-bearing.
- **Free-floating rail:** every production theorem's TYPE mentions the banked `cutCos`/`cutSqrt`/`Cut`
  and the banked amplitude form. Grounded on the tower, not generic.
- **Is this fitting?** NO. The brackets are WIDE (2-decimal ratio precision), derived from the forced
  cutCos(2/9) bound; I am NOT chasing residuals to zero. The comparison to PDG is prose only.

## W9 — the instrument-cost decomposition (MEASURED before production)
The monolithic ratio nlinarith (a1≈0.04, ill-conditioned small difference) TIMES OUT (measured:
>800k hb). Theory-native fix: the amplitudes are LINEAR in (p,r,w) →
1. product brackets `w·p`, `w·r` via `le_trans (mul_le_mul …) (by norm_num)` (NEVER norm_num a
   variable term) — MEASURED cheap (~2s each).
2. amplitude brackets b1,b2,a0 via `linarith` on the ring-expanded `1−(wp±wr)/2` — MEASURED cheap.
3. square-monotone via `mul_le_mul` + `nlinarith [this]` (abstract atoms) — MEASURED ~3s.
4. ratio via `nlinarith [hb1sq, hb2sq]` — MEASURED cheap.
Each amplitude/ratio lemma is its OWN top-level declaration (own heartbeat budget; olean paid once).
NO single decl accumulates enough Cut-division tactic calls to hit the ceiling. Default maxHeartbeats.

## BRACKETS (all rigorously verified, workbench/N340-mass-ratios/*.py)
- cutCos(2/9): head3 = ∑_{i<3} cosTermC(2/9) = 19199/19683; base |term3| = 4/23914845;
  ratio ≤ 1/1134; geo tail ≤ 56/334512585 ⟹ cos(2/9) ∈ [975410/1e6, 975411/1e6]. (√2·... etc.)
- w=cutSqrt 2 ∈ [1414213/1e6, 1414214/1e6] (since 1414213²<2e12<1414214²).
- r=cutSqrt(3−3p²) ∈ [381732/1e6, 381742/1e6] (from p-box; conic).
- w·p ∈ [137943/1e5, 137944/1e5]; w·r ∈ [53984/1e5, 53987/1e5].
- b1=1−w(p+r)/2 ∈ [4034/1e5, 40365/1e6]; b2=1−w(p−r)/2 ∈ [5802/1e4, 58022/1e5]; a0=1+wp ∈ [237943/1e5, 237944/1e5].
- Ratio checks (norm_num): b1lo²≥0.00483·b2hi²; b1hi²≤0.00485·b2lo²; b2lo²≥0.0594·a0hi²; b2hi²≤0.0595·a0lo².

## FILES
1. EXTEND `Phys/Foundation/ContinuumTrigEval.lean` — add cutCos(2/9) numeral block (mirror the
   cutCos(2/3) template exactly, split index 3, ratio 1/1134): cutCos_two_ninths_head,
   cos_tn_tail_termbound, cos_tn_geo_value, cutCos_two_ninths_split, cos_tn_tail_upper/_lower,
   cutCos_two_ninths_bounds (★★), cutCos_two_ninths_bracket (★ 975410/1e6..975411/1e6),
   cutCos_two_ninths_pos.
2. NEW leaf `Phys/Algebra/GenerationMassRatiosNumeric.lean` (ns Phys.Algebra.HJ or Foundation) —
   lift the cycle amplitudes to Cut at the derived phase; amplitude-bracket lemmas; the two ratio
   theorems + Σm=6M² lifted; non-vacuity.
3. Costume C365: a WRONG ratio (e.g. m₁/m₂ pinned to wrong 2-decimal, or ×1000 flag) fails to compile.
4. Wire Phys.lean, Audits/AxiomAudit.lean (append prints), scripts/costume_manifest.tsv (C365 row).

## GUARDS
G1 no asserted value (ratios fall out of banked cutCos numeral + forced amplitudes). G2 no empirical
number (PDG = removable prose). G3 dimensionless (ratios pure; M the anchor). G4 derived not posited.
G5 words-removable. G6 foundations-only ⊆ {propext,Classical.choice,Quot.sound}, no
sorry/axiom/native_decide/maxHeartbeats-raise. ⚠ ℝ-VIGILANCE: banked cutCos/cutSqrt/Cut only, NO
Real.cos/Mathlib-ℝ as content. W8: C365 bites. W9: measured; each lemma own budget.

## HONEST GRADE
The dimensionless RATIOS m_e:m_μ:m_τ are theorem-exact/forced (Q=2/3 and δ_B=2/9 both derived, zero
free shape params). The ABSOLUTE masses = ratios × Arc-B ladder scale (LADDER-grade, inception flag)
— NOT identity-grade. Say "ratios forced; absolute scale = G-anchored ladder". Do NOT chase residuals.

## SUCCESSOR (ONE-SUCCESSOR RAIL)
If D2 completes cleanly: directed child toward SEED_ANALYTIC_COMPLETION D3 (the coupling's scale
reading toward α≈1/137). Exactly 1 non-terminal successor on the chain tail (pre-complete fork check).
