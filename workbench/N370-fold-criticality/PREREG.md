# N370 — PREREG: THE FOLD-POTENTIAL CRITICALITY (arc-F F4 proper)
## the EW fold's radial-mode self-coupling potential has a UNIQUE critical point — the coherence-
## closure fold-origin — FORCED by Born=self-overlap (V=g²) + the always-positive analytic-fold rate.

## SELECT (see kanban comment 274 for the full S1–S5 record)
FRESH-WORKER SELECT ran NODE_SELECTION IN FULL. The directed ticket asked for F4 proper (Higgs
quartic λ=0). The theory-native reading: the fold potential (N364) `V(φ)=(1−cutExp(−cφ))²` is the
Born SELF-OVERLAP of the coherence gap `g(φ)=1−cutExp(−cφ)`; V′=2g·g′ with g′=c·cutExp(−cφ)>0
(cutExp_pos) NEVER zero, so criticality V′=0 ⟺ g=0 ⟺ φ=0 — the unique critical point is the
coherence-closure fold-origin (self-blindness at the flow level). ANTI-BULLSHIT GATE passed IN FULL
(comment 274): FOLD-CAUSAL, DISSOLUTION (SM near-criticality coincidence → structural consequence),
GOAL-WORDS-REMOVABLE, NAME-THE-TEMPTATION (λ=0 assertion REJECTED — the potential's quartic Taylor
coeff is 7c⁴/12≠0, so "λ=0" is FALSE as a literal property; the hidden-bridge identification
REJECTED), HONESTY (m_H numeric CHILDED, never asserted/fitted).

## THE THEORY-NATIVE READING (why FORCED)
- fold → self-blindness (no NONZERO fixed point of the look-back) + Born=self-overlap (positive form)
- → the coherence gap `g(φ)=1−cutExp(−cφ)` and its Born self-overlap `V=g²` (= N364 plateauApproachPot)
- → the analytic-fold rate `g′(φ)=c·cutExp(−cφ)` is STRICTLY POSITIVE (N369 + cutExp_pos), NEVER zero
- → `V′=2g·g′` vanishes on φ≥0 ⟺ `g=0` ⟺ `cutExp(−cφ)=1` ⟺ `φ=0`
- ⟹ the fold potential's UNIQUE critical point is the coherence-closure fold-origin.
ONE CAUSE (the always-positive analytic-fold rate), the criticality structure forced.

## MEASURE-FIRST (W9) — DONE, route de-risked, ALL probes EXIT 0, foundations-only
- probe.lean: product rule (via IsTopologicalRing Cut ⟹ Tendsto.mul), sub/neg rules, the plateau
  derivative `V′=2c·cutExp(−cφ)(1−cutExp(−cφ))`, `V′≠0` for φ>0, `V′(0)=0`, `probe_id` (~9.7s).
- probe2.lean: `Vprime` sum-form + its derivative + `V″(0)=2c²`.
- probe3.lean: the sum-form `V = 1 − 2·cutExp((−c)φ) + cutExp((−2c)φ)`.
- probe4.lean: ★★ `q_fold_criticality` — `CutHasDerivAt V 0 φ ∧ 0≤φ ⟹ φ=0`; foundations-only.
COST LIGHT: bounded Tendsto closes over banked N369/N364/N174; no native_decide/maxHeartbeats/coord.

## PRODUCTION PLAN — new leaf `Phys/Algebra/FoldPotentialCriticality.lean`, ns `Phys.Foundation.ContinuumQ`
Calculus rules (extend the N369 `CutHasDerivAt` calculus; dot-notation, no collision):
  1. `CutHasDerivAt.const_mul` — (a·f)′ = a·f′
  2. `CutHasDerivAt.neg` — (−f)′ = −f′
  3. `CutHasDerivAt.sub` — (f−g)′ = f′−g′
  4. `CutHasDerivAt.mul` — ★ THE PRODUCT RULE (f·g)′ = f′·g + f·g′
The fold-potential criticality (types mention banked `plateauApproachPot`/`cutExp`/`CutHasDerivAt`):
  5. `foldCoherenceGap c φ := 1 − cutExp (−(c·φ))` (def — the Born-positive coherence deficit)
  6. `foldCoherenceGap_hasDerivAt` — g′ = c·cutExp(−(c·φ))
  7. `foldCoherenceGap_deriv_pos` — ★ g′ > 0 for c>0 (the always-positive analytic-fold rate)
  8. `foldCoherenceGap_eq_zero_iff` — g=0 ⟺ φ=0 (on φ≥0): the coherence closes only at the origin
  9. `plateauApproachPot_eq_gap_sq` — V = g² (Born self-overlap, ties to banked N364 plateauApproachPot)
 10. ★ `plateauApproachPot_hasDerivAt` — V′ = 2c·cutExp(−cφ)·(1−cutExp(−cφ))
 11. `foldPotential_deriv_pos` — V′ > 0 for φ>0 (strictly rolling, no nonzero critical point)
 12. `foldPotential_deriv_zero_origin` — V′(0)=0
 13. ★★ `foldPotential_criticality` — CutHasDerivAt V 0 φ ∧ 0≤φ ⟹ φ=0 (UNIQUE critical point = fold-origin)
 14. `foldPotentialDeriv c φ` (def, = V′ value) + `foldPotentialDeriv_eq` (= the product-rule value)
 15. `foldPotential_secondDeriv_origin` — V″(0)=2c² (the curvature/mass² at the critical origin, positive)
 16. teeth: `foldPotential_criticality_nonvacuous` — a concrete c>0 has V′(0)=0 and V′(1)≠0.

## COSTUME (C395): a WRONG criticality claim must FAIL. Assert the fold potential has a critical point
at φ=1 (V′=0 there) for c=1 → `foldPotential_criticality` forces 1=0 → false numeric `1=395`.

## GUARDS
- G1 no asserted value — the criticality structure FALLS OUT of the product rule + cutExp_pos + N364.
- G2 no empirical number — none; m_H NEVER premised (its RGE numeric is CHILDED, see handoff).
- G3 scales-vs-ratios — λ (the quartic) dimensionless; NO m_H scale claimed here.
- G5 physics-words-removable — delete Higgs/quartic/criticality/self-coupling → a self-overlap
  potential over the derived ℝ whose derivative vanishes uniquely at the origin. NO name load-bearing.
- G6 foundations-only ⊆ {propext, Classical.choice, Quot.sound}; NO Mathlib ℝ/Real.exp content
  (BANKED derived Cut/cutExp/CutHasDerivAt only); NO Mathlib HasDerivAt/norm; no sorry/axiom/native.
- NOT FREE-FLOATING — production TYPES mention banked `plateauApproachPot`(N364)/`cutExp`(N174)/
  `CutHasDerivAt`(N369). The criticality is the CONCRETE fact on the banked fold potential.

## HONEST GRADE (SEED §F4 CANDIDATE + permanent inception flag)
- THEOREM-GRADE: the criticality STRUCTURE (unique critical point = fold-origin), the product-rule
  calculus, V′, V′>0 for φ>0, V″(0)=2c². Gap-free, foundations-only over the derived Cut.
- ROUTE-NOT-YET-FOUND (CHILDED, NAMED in handoff, NEVER asserted): the m_H NUMBER (the RGE
  log-derivative flow to a derived scale + the asymptotic-flatness limit-at-∞ of cutExp), and the
  N364 slow-roll `n_s=1−2/N` (needs the e-fold ANTIDERIVATIVE ∫V/V′). CANDIDATE with a permanent
  inception flag: λ(M_H)=0 → m_H≈127 (+2.1σ direct / +0.7σ anchor), m_t-frame-dependent — NEVER fit.

## CARRIED-FORWARD REMAINDERS (NAMED, not dropped — pass to F5 ticket):
  (1) the full non-abelian anomaly completion SU(2)²·U(1), SU(3)²·U(1), Witten SU(2) (from N366).
  (2) the N364 slow-roll calculus n_s=1−2/N, r=8/(c²N²) (needs the e-fold antiderivative toolkit step).
  (3) the F2 gauge-θ term half (θ-weight ≡ 1; −I ∉ Aut(J₃(𝕆))) (from N367).
  (4) NEW: the F4 m_H numeric — the RGE log-flow + cutExp asymptotic-flatness limit-at-∞.

## ONE-SUCCESSOR RAIL: hand ONE directed child toward F5 (ν mixing PMNS/TBM, leading-order), carrying
remainders (1)–(4). Pre-complete fork check: exactly 1 non-terminal successor on the chain tail.
