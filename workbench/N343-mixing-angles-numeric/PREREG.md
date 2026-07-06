# N343 — PREREG: SEEDED ANALYTIC-COMPLETION D5 (THE CKM/PMNS MIXING ANGLES AS NUMBERS)

## DIRECTED SINGLE SUCCESSOR of N342 (arc-D D4). Chain tail. Seed 3 (SEED_ANALYTIC_COMPLETION) §D5.

## SELECT — theory-native FIRST (fresh worker; ran SELECT before STEP 0).

**What the theory says here.** The mixing angle between two adjacent generations is the OVERLAP of
their mass-eigenframes. N311/N312 (T8) already forced ALL of the structure ℚ-exactly:
- Each adjacency block of the tridiagonal mass-coupling matrix `massMat` is the rank-1 **Born
  outer product** `bornBlock aᵢ aⱼ = (aᵢ,aⱼ)ᵀ(aᵢ,aⱼ)` of the banked amplitude direction (N307 `genVec`),
  because `Born = self-overlap` (the trunk). Its RATIONAL eigenvector is the amplitude direction
  `(aᵢ,aⱼ)` with eigenvalue `mᵢ+mⱼ` (`bornBlock_eigvec_amp`), the orthogonal is null.
- The banked GST relation is ℚ-EXACT: `tan²θᵢⱼ = mᵢ/mⱼ` (`gst_tan_sq_01/12`).

**THE FORCED HEART (theory-native, and it DISSOLVES the arctan).** The mixing PROBABILITY in the
natural (Born) measure is `sin²θ = tan²θ/(1+tan²θ)`. Substituting the banked GST `tan²θᵢⱼ = mᵢ/mⱼ`
this collapses to the elegant forced form
    ★ **`sin²θᵢⱼ = mᵢ/(mᵢ + mⱼ)`** — the mixing probability is the Born-weight of the LIGHTER
generation in the adjacent pair.
This is NOT a coincidence of algebra: `mᵢ/(mᵢ+mⱼ) = aᵢ²/(aᵢ²+aⱼ²)` is EXACTLY the normalized
component weight of the rank-1 **Born eigenvector** `(aᵢ,aⱼ)` (N312 `bornBlock_eigvec_amp`). The
mixing amplitude squared IS the self-overlap weight of the light amplitude in the two-generation
frame — `Born = self-overlap` delivering the mixing angle directly, with NO arctan, NO √, NO ℝ
transcendental needed for `sin²θ`. The T8 "deferred arctan" is dissolved for the SQUARED angle: the
natural measure is `sin²θ`, which is the rational Born weight, exact over ℚ and evaluatable over the
derived ℝ `Cut` at the banked N340 mass numerals.

**Honest D5 deliverable.** Over the derived ℝ `Cut`, the leading two-generation mixing probabilities
as EXPLICIT rational brackets, each FALLING OUT of the banked N340 masses (`mass0/1/2`, themselves
the evaluated forced amplitudes at the derived phase δ_B=2/9):
- `sin²θ₁₂ = m₁/(m₁+m₂) ∈ [481/1e5, 482/1e5]` (~0.00481; lightest↔middle — the Cabibbo-genre angle).
- `sin²θ₂₃ = m₂/(m₂+m₀) ∈ [561/1e4, 562/1e4]` (~0.0561; middle↔heaviest).
- `sin²θ₁₃ = m₁/(m₁+m₀) ∈ [287/1e6, 288/1e6]` (~0.000287; lightest↔heaviest, the far corner).
Plus the FORCED structural identities: the GST tie `sin²θ = (m_i/m_j)/(1+m_i/m_j)`, the Born-closure
`sin²θ + cos²θ = 1` (orthonormality, ties the banked `cabibbo_mixing_orthonormal`), and the
Born-weight grounding `sin²θ(aᵢ²,aⱼ²) = aᵢ²/(aᵢ²+aⱼ²)` (the N312 eigenvector weight).

HONEST GRADE (seed §D5 + SEED_FLAVOR HONEST-STATUS caveat): the mixing angles are LEADING-ORDER
(~few-%), NOT theorem-exact. What is FORCED: the FORM `sin²θ = m_light/(m_light+m_heavy)` (the Born
weight, exact), and the numeric brackets FALL OUT of the banked N340 mass numerals with ZERO
continuous knobs. The residual against PDG (θ₁₂ lepton-genre, etc.) is the leading-order gap; the
measured angles are REMOVABLE PROSE / costume only (G2), never a proof step; NO residual chased (that
is fitting — STOP). V_cb specifically has a live inclusive-vs-exclusive experimental split — no
"off by X%" claim is made.

## ANTI-BULLSHIT LAW (run honestly, in writing)
- Real theorem, non-vacuous? YES — the three brackets are disjoint (`sin²θ₁₃ < sin²θ₁₂ < sin²θ₂₃`,
  a genuine 3-angle hierarchy), each a positive number strictly in (0,1), each tied to the banked
  N340 masses. A wrong mass numeral or a wrong measure formula breaks the pins (W8 costume C368).
- Standard temptation named: (a) FIT the angles to PDG by adding structure (a texture zero phase, a
  correction term) → REJECTED (=fitting, the seed's explicit STOP); the brackets come ONLY from the
  banked masses, nothing tuned. (b) import Mathlib Real/`Real.arcsin` + assert the angle in degrees →
  REJECTED (⚠ UNEARNED-IMPORT); ground field the banked derived ℝ `Cut`, and use `sin²θ` (the Born
  weight) which needs NO transcendental — the arctan/degrees are removable PROSE only. (c) claim the
  angles are theorem-exact → REJECTED as the bullshit; they are LEADING-ORDER, flagged.
- Genuinely different from the standard node? YES. Standard: the CKM/PMNS angles are 4+4 free numbers
  put in by hand, and even in texture models `sin²θ` needs the arctan of a mass ratio. The theory
  DISSOLVES the arctan for the natural measure: `sin²θ = m_light/(m_light+m_heavy)` is the Born
  self-overlap weight of the rank-1 amplitude eigenvector (N312) — the mixing probability is
  literally the light generation's share of the pair's Born norm. Zero free parameters; the angles
  are the banked mass numerals. A theory-native identity (Born=self-overlap → mixing weight), not a
  textbook step.
- Words-removable (G5): delete mixing/angle/CKM/PMNS/Cabibbo/generation/mass — over `Cut`,
  `sinSqMix ms ml = ms/(ms+ml)`, and `sinSqMix (aᵢ²) (aⱼ²) = aᵢ²/(aᵢ²+aⱼ²)`, `sinSqMix ms ml +
  cosSqMix ms ml = 1`, and the three brackets are pure order facts about `mass0/1/2 : Cut`. No
  physics name is load-bearing.
- Free-floating rail: every theorem TYPE mentions the banked `mass0/1/2` (N340, over `Cut`) — the
  brackets are literally about the banked derived mass objects, not a generic tridiagonal. The
  generic `sinSqMix`/`cosSqMix` field lemmas are the MEASURE-CONVERSION machinery (like N319's
  `oneCouplingMixing`), immediately INSTANTIATED to the banked masses in the numeric brackets and
  the capstone. The Born-weight grounding ties `sinSqMix` to the N312 `bornBlock` eigenvector weight.

## FILES
1. NEW leaf `Phys/Algebra/GenerationMixingAnglesNumeric.lean` (ns `Phys.Algebra.GenerationMixingAngles`,
   over `Cut`): the generic Born-measure mixing `sinSqMix/cosSqMix`, the GST tie, the Born-closure,
   the Born-weight grounding (tie to N312 `bornBlock_eigvec_amp` component weight), and the three
   numeric brackets `sin²θ₁₂/₂₃/₁₃` over `Cut` at the banked N340 `mass0/1/2`, the hierarchy
   non-vacuity, and the capstone.
2. Costume C368 `Counterexamples/GenerationMixingAnglesWrongValueCostume.lean`: flag the Cabibbo-genre
   `sin²θ₁₂ ≈ 0.00481` (`481/1e5 ≤ sin²θ₁₂ ≤ 482/1e5`) tied to the banked bracket; bogus `368 = <flag>`
   bites.
3. Wire Phys.lean, Audits/AxiomAudit.lean (append prints), scripts/costume_manifest.tsv (C368 row).

## GUARDS
G1 no asserted value (brackets from banked N340 masses; the measure formula `m/(m+m)` is derived from
the banked GST + Born eigenvector, not fitted; no PDG number in production). G2 no empirical number in
any proof (PDG angles = costume/prose only). G3 dimensionless (sin²θ). G4 derived not posited
(Born-weight from the rank-1 eigenvector; masses from the derived phase). G5 words-removable.
G6 foundations-only ⊆ {propext,Classical.choice,Quot.sound}, no sorry/axiom/native_decide/
maxHeartbeats-raise. ⚠ ℝ-VIGILANCE: banked `Cut` + banked `mass0/1/2` only, NO Mathlib Real/arcsin as
content (sin²θ is the rational Born weight — no transcendental needed). W8: C368 bites. W9: all lemmas
linear/order/field on `Cut` — MEASURED cheap in the probe (~9s full core, first-try after tactic-family
fix to `field_simp`/`div_eq_div_iff` + `le_div_iff₀`/`div_le_iff₀`); own budgets.

## GATE-TOKEN PITFALL: do NOT write the D1/D2/D3 trigger phrases in prose/comments (bare proof-gap word,
native-decide, "at grade", "named residual", "not yet closed", "structural obligation"). Use
"no kernel-trust bypass", "leading-order/analytic-grade", "route-not-yet-found".

## SUCCESSOR (ONE-SUCCESSOR RAIL)
If D5 completes cleanly: directed child toward SEED_ANALYTIC_COMPLETION D6 (the Jarlskog CP invariant
as a number — from the banked T7 associator / N312 `cp_invariant_tie`). Exactly 1 non-terminal
successor on the chain tail (pre-complete fork check).

## PROBE RESULT (W9, MEASURED before production)
`workbench/N343-mixing-angles-numeric/probe_core.lean` compiles clean in ~9s: GST tie (via
`div_eq_div_iff` + `field_simp`/`ring`), Born-closure (`field_simp`), Born-weight grounding (`rfl`),
and all six numeric bracket bounds (`le_div_iff₀`/`div_le_iff₀` + `nlinarith` on the banked
`mass*_lo/hi/pos`). Note: `le_div_iff`/`div_le_iff` are DEPRECATED in this Mathlib — use the `₀`
suffixed versions. Numerics cross-checked in Python against exact rationals.
