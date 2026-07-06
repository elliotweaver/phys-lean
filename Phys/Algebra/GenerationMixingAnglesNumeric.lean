/-
# N343 — SEEDED ANALYTIC-COMPLETION D5: THE CKM/PMNS MIXING ANGLES AS ACTUAL NUMBERS OF THE DERIVED ℝ

Owner-authorized analytic-completion seed (docs/SEED_ANALYTIC_COMPLETION.md), target **D5** — the
directed successor of N342 (D4). N311/N312 (seed T8) forced the ENTIRE mixing structure ℚ-exactly:
each adjacency block of the tridiagonal mass-coupling matrix `massMat` is the rank-1 **Born outer
product** `bornBlock aᵢ aⱼ = (aᵢ,aⱼ)ᵀ(aᵢ,aⱼ)` of the banked amplitude direction (N307 `genVec`),
because `Born = self-overlap` (the trunk); its RATIONAL eigenvector is the amplitude direction
`(aᵢ,aⱼ)` with eigenvalue `mᵢ+mⱼ` (`bornBlock_eigvec_amp`); and the Gatto–Sartori–Tonin relation is
ℚ-exact, `tan²θᵢⱼ = mᵢ/mⱼ` (`gst_tan_sq_01/12`).

★ WHAT THIS NODE DOES. It reads the leading two-generation mixing angle in the NATURAL (Born)
measure and EVALUATES it at the banked N340 mass numerals over the derived ℝ `Cut`.

★ THE THEORY-NATIVE HEART — THE ARCTAN DISSOLVES THROUGH BORN = SELF-OVERLAP. The mixing probability
is `sin²θ = tan²θ/(1+tan²θ)`. Substituting the banked GST `tan²θᵢⱼ = mᵢ/mⱼ` collapses it to the
elegant forced form
      `sin²θᵢⱼ = mᵢ / (mᵢ + mⱼ)`  — the mixing probability is the Born-weight of the LIGHTER
generation in the adjacent pair. This is NOT algebraic luck: `mᵢ/(mᵢ+mⱼ) = aᵢ²/(aᵢ²+aⱼ²)` is EXACTLY
the normalized component weight of the rank-1 **Born eigenvector** `(aᵢ,aⱼ)` (N312 `bornBlock_eigvec_amp`,
the amplitude direction). The mixing amplitude SQUARED IS the self-overlap share of the light
amplitude in the two-generation frame. So the natural measure `sin²θ` needs NO arctan, NO √, NO ℝ
transcendental — it is a rational function of the banked masses, evaluatable over `Cut` at the N340
numerals. (The angle in radians/degrees — the arctan — remains a removable-prose reading; the
FORCED, derived object is the Born weight `sin²θ`.)

★ THE FORCED NUMBERS (over `Cut`, at the banked N340 masses `mass0/1/2` = evaluated forced amplitudes
at the derived phase δ_B = 2/9):
  * `sin²θ₁₂ = m₁/(m₁+m₂) ∈ [481/1e5, 482/1e5]`  (≈ 0.00481; lightest↔middle, the Cabibbo-genre angle)
  * `sin²θ₂₃ = m₂/(m₂+m₀) ∈ [561/1e4, 562/1e4]`  (≈ 0.0561;  middle↔heaviest)
  * `sin²θ₁₃ = m₁/(m₁+m₀) ∈ [287/1e6, 288/1e6]`  (≈ 0.000287; lightest↔heaviest, the far corner)
The brackets FALL OUT of the banked `cutCos(2/9)`-derived masses; NO decimal is posited (seed G1), NO
empirical number enters any proof (seed G2); the comparison to the measured mixing angles is
REMOVABLE PROSE only.

⚠ HONEST GRADE (seed §D5 + SEED_FLAVOR HONEST-STATUS caveat). The mixing angles are LEADING-ORDER
(~few-%), NOT theorem-exact. What is FORCED: the FORM `sin²θ = m_light/(m_light+m_heavy)` (the Born
weight, exact) and the numeric brackets, from the banked masses with ZERO continuous knobs. The
residual against the measured mixing angles is the leading-order gap; NO residual is chased (that
would be fitting — the seed's explicit STOP). Landing the mixing structure to leading order with no
free parameter is the honest result.

PHYSICS-WORDS-REMOVABLE (STANDARD §2, seed G5). Delete "mixing" / "angle" / "CKM" / "PMNS" /
"Cabibbo" / "generation" / "mass": over the derived `Cut`, `sinSqMix ms ml = ms/(ms+ml)`,
`cosSqMix ms ml = ml/(ms+ml)`, `sinSqMix ms ml + cosSqMix ms ml = 1`, `sinSqMix (aᵢ²) (aⱼ²) =
aᵢ²/(aᵢ²+aⱼ²)`, and the three brackets are pure order facts about `mass0/1/2 : Cut`. No name is
load-bearing.

FREE-FLOATING check (SOUL rail). The generic `sinSqMix`/`cosSqMix` are the MEASURE-CONVERSION
machinery (exactly as N319's `oneCouplingMixing r = 1/(1+r)`), immediately INSTANTIATED to the banked
`mass0/1/2` (N340, over `Cut`) in the numeric brackets and the capstone; the Born-weight grounding
`sinSqMix (aᵢ²) (aⱼ²) = aᵢ²/(aᵢ²+aⱼ²)` ties `sinSqMix` to the N312 rank-1 Born eigenvector component
weight. Every numeric theorem's TYPE mentions the banked derived mass objects. Grounded on the tower.

Foundations-only (seed G6): no posited axiom, no sorry, no kernel-trust bypass, no heartbeat
inflation, no bridge; no empirical number; the ground field is the BANKED derived ℝ `Cut`, the banked
N340 mass numerals — NO Mathlib `Real`/`Real.arcsin` as content (the natural measure `sin²θ` is the
rational Born weight; no transcendental needed).
-/
import Phys.Algebra.GenerationMassRatiosNumeric
import Phys.Algebra.OctonionJordanGenerationMixingOverlap
import Mathlib.Tactic

namespace Phys.Algebra
namespace GenerationMixingAngles

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.GenerationMassRatios

noncomputable section

/-! ## §0 — the leading mixing probability in the natural (Born) measure.

The measure-conversion machinery (the mixing analog of N319's `oneCouplingMixing r = 1/(1+r)`),
generic over an ordered field, INSTANTIATED to the banked masses in §2–§3. -/

/-- The leading two-generation mixing PROBABILITY in the natural (Born) measure, between an adjacent
    pair with lighter mass `ms` and heavier `ml`: `sin²θ = ms/(ms+ml)` — the Born-weight of the
    lighter generation in the pair (the arctan-free natural measure). -/
def sinSqMix {F : Type*} [Field F] (ms ml : F) : F := ms / (ms + ml)

/-- The complementary (aligned) weight `cos²θ = ml/(ms+ml)`. -/
def cosSqMix {F : Type*} [Field F] (ms ml : F) : F := ml / (ms + ml)

/-- ★ THE GATTO–SARTORI–TONIN TIE: `sin²θ = tan²θ/(1+tan²θ)` with the banked GST `tan²θ = ms/ml`
    (N311 `gst_tan_sq_*`). The natural-measure mixing probability is exactly the standard
    `tan²/(1+tan²)` conversion applied to the forced mass ratio — the arctan is not needed. -/
theorem sinSqMix_gst {F : Type*} [Field F] (ms ml : F) (hml : ml ≠ 0) (hsum : ms + ml ≠ 0) :
    sinSqMix ms ml = (ms / ml) / (1 + ms / ml) := by
  have hone : (1 : F) + ms / ml ≠ 0 := by
    have h : (1 : F) + ms / ml = (ml + ms) / ml := by field_simp
    rw [h, add_comm ml ms]; exact div_ne_zero hsum hml
  unfold sinSqMix
  rw [div_eq_div_iff hsum hone]
  field_simp
  ring

/-- ★ THE BORN-CLOSURE (orthonormality `sin²θ + cos²θ = 1`): the mixing probability and its
    complement sum to one — the unitarity of the two-generation overlap, ties the banked
    `cabibbo_mixing_orthonormal` (N312). -/
theorem sinSq_add_cosSq {F : Type*} [Field F] (ms ml : F) (hsum : ms + ml ≠ 0) :
    sinSqMix ms ml + cosSqMix ms ml = 1 := by
  unfold sinSqMix cosSqMix
  field_simp

/-- ★★ THE BORN-WEIGHT GROUNDING — the mixing probability at Born-square masses `ms = aᵢ²`,
    `ml = aⱼ²` IS the normalized component weight `aᵢ²/(aᵢ²+aⱼ²)` of the rank-1 **Born eigenvector**
    `(aᵢ, aⱼ)` (N312 `bornBlock_eigvec_amp`, the amplitude direction with eigenvalue `mᵢ+mⱼ`). The
    mixing amplitude squared is the self-overlap share of the light amplitude — `Born = self-overlap`
    delivering the mixing angle directly. -/
theorem sinSqMix_born {F : Type*} [Field F] (ai aj : F) :
    sinSqMix (ai ^ 2) (aj ^ 2) = ai ^ 2 / (ai ^ 2 + aj ^ 2) := rfl

/-! ## §1 — non-degeneracy of the denominators over `Cut` (the banked masses are positive). -/

theorem sum12_pos : (0 : Cut) < mass1 + mass2 := by have := mass1_pos; have := mass2_pos; linarith
theorem sum23_pos : (0 : Cut) < mass2 + mass0 := by have := mass2_pos; have := mass0_pos; linarith
theorem sum13_pos : (0 : Cut) < mass1 + mass0 := by have := mass1_pos; have := mass0_pos; linarith

/-! ## §2 — ★★ THE THREE FORCED MIXING PROBABILITIES as explicit two-sided rational brackets over ℝ. -/

/-- ★★ THE LIGHTEST↔MIDDLE MIXING (the Cabibbo-genre angle) `sin²θ₁₂ = m₁/(m₁+m₂) ∈ [481/1e5, 482/1e5]`
    (≈ 0.00481). The bracket FALLS OUT of the banked N340 masses; no decimal posited. (The measured
    Cabibbo-genre mixing is REMOVABLE PROSE, in no proof.) -/
theorem sinSq12_lo : (481 : Cut) / 100000 ≤ sinSqMix mass1 mass2 := by
  unfold sinSqMix
  rw [le_div_iff₀ sum12_pos]
  nlinarith [mass1_lo, mass2_hi, mass1_pos, mass2_pos]
theorem sinSq12_hi : sinSqMix mass1 mass2 ≤ (482 : Cut) / 100000 := by
  unfold sinSqMix
  rw [div_le_iff₀ sum12_pos]
  nlinarith [mass1_hi, mass2_lo, mass1_pos, mass2_pos]

/-- ★★ THE MIDDLE↔HEAVIEST MIXING `sin²θ₂₃ = m₂/(m₂+m₀) ∈ [561/1e4, 562/1e4]` (≈ 0.0561). The
    bracket FALLS OUT of the banked N340 masses; no decimal posited. -/
theorem sinSq23_lo : (561 : Cut) / 10000 ≤ sinSqMix mass2 mass0 := by
  unfold sinSqMix
  rw [le_div_iff₀ sum23_pos]
  nlinarith [mass2_lo, mass0_hi, mass2_pos, mass0_pos]
theorem sinSq23_hi : sinSqMix mass2 mass0 ≤ (562 : Cut) / 10000 := by
  unfold sinSqMix
  rw [div_le_iff₀ sum23_pos]
  nlinarith [mass2_hi, mass0_lo, mass2_pos, mass0_pos]

/-- ★★ THE LIGHTEST↔HEAVIEST MIXING (the far corner) `sin²θ₁₃ = m₁/(m₁+m₀) ∈ [287/1e6, 288/1e6]`
    (≈ 0.000287). The smallest of the three — the corner-suppressed mixing, from the banked masses. -/
theorem sinSq13_lo : (287 : Cut) / 1000000 ≤ sinSqMix mass1 mass0 := by
  unfold sinSqMix
  rw [le_div_iff₀ sum13_pos]
  nlinarith [mass1_lo, mass0_hi, mass1_pos, mass0_pos]
theorem sinSq13_hi : sinSqMix mass1 mass0 ≤ (288 : Cut) / 1000000 := by
  unfold sinSqMix
  rw [div_le_iff₀ sum13_pos]
  nlinarith [mass1_hi, mass0_lo, mass1_pos, mass0_pos]

/-! ## §3 — non-vacuity (W8): a genuine 3-angle hierarchy, each a real fraction in (0,1). -/

/-- NON-VACUITY: `sin²θ₁₂` is a genuine number strictly in `(0,1)` — a real mixing, not `0` (no
    mixing) nor `1` (maximal). -/
theorem sinSq12_mem : (0 : Cut) < sinSqMix mass1 mass2 ∧ sinSqMix mass1 mass2 < 1 := by
  refine ⟨?_, ?_⟩
  · unfold sinSqMix; exact div_pos mass1_pos sum12_pos
  · unfold sinSqMix; rw [div_lt_one sum12_pos]; have := mass2_pos; linarith

/-- ★ NON-VACUITY: the THREE mixing probabilities form a genuine HIERARCHY
    `sin²θ₁₃ < sin²θ₁₂ < sin²θ₂₃` — the far-corner mixing is smallest, the adjacent-heavy largest;
    three distinct nonzero angles, not a degenerate collapse. Witnessed by the disjoint brackets. -/
theorem sinSq_hierarchy :
    sinSqMix mass1 mass0 < sinSqMix mass1 mass2 ∧ sinSqMix mass1 mass2 < sinSqMix mass2 mass0 := by
  refine ⟨?_, ?_⟩
  · have h1 := sinSq13_hi; have h2 := sinSq12_lo; linarith
  · have h1 := sinSq12_hi; have h2 := sinSq23_lo; linarith

/-! ## §4 — the capstone. -/

/-- ★★★ THE CAPSTONE — the leading CKM/PMNS mixing angles as ACTUAL NUMBERS of the derived ℝ (seed D5).

    Over the derived ℝ `Cut`, at the banked N340 masses `mass0/1/2` (the forced ℤ₃-Fourier cycle
    amplitudes evaluated at the derived phase δ_B = 2/9, N307/N340): the leading two-generation mixing
    PROBABILITY in the natural (Born) measure is the arctan-free forced form `sin²θᵢⱼ = mᵢ/(mᵢ+mⱼ)`,
    which — because `mᵢ/(mᵢ+mⱼ) = aᵢ²/(aᵢ²+aⱼ²)` — IS the normalized component weight of the rank-1
    **Born eigenvector** `(aᵢ,aⱼ)` (N312 `bornBlock_eigvec_amp`), `Born = self-overlap` delivering
    the mixing angle directly (`sinSqMix_born`; the GST tie `sinSqMix_gst`; the Born-closure
    orthonormality `sinSq_add_cosSq`). The three mixing probabilities are the explicit two-sided
    rational brackets `sin²θ₁₂ ∈ [481/1e5, 482/1e5]` (`sinSq12_*`), `sin²θ₂₃ ∈ [561/1e4, 562/1e4]`
    (`sinSq23_*`), `sin²θ₁₃ ∈ [287/1e6, 288/1e6]` (`sinSq13_*`), each FALLING OUT of the banked
    `cutCos(2/9)`-derived masses with ZERO free continuous parameters, forming a genuine hierarchy
    `sin²θ₁₃ < sin²θ₁₂ < sin²θ₂₃` (`sinSq_hierarchy`), each a real fraction in `(0,1)`
    (`sinSq12_mem`). No decimal posited, no empirical number in any proof; comparison to the measured
    CKM/PMNS angles is removable prose.

    ⚠ LEADING-ORDER (seed §D5 + SEED_FLAVOR caveat): the mixing angles land at leading order
    (~few-%), NOT theorem-exact. The FORM (the Born weight) and the brackets are FORCED with no free
    parameter; the residual against the measured angles is the leading-order gap, NOT chased. -/
theorem generation_mixing_angles_numeric :
    -- the natural-measure Born-weight form + its structural identities (grounded on N311/N312)
    (∀ (ai aj : Cut), sinSqMix (ai ^ 2) (aj ^ 2) = ai ^ 2 / (ai ^ 2 + aj ^ 2))
    ∧ (∀ (ms ml : Cut), ml ≠ 0 → ms + ml ≠ 0 → sinSqMix ms ml = (ms / ml) / (1 + ms / ml))
    ∧ (∀ (ms ml : Cut), ms + ml ≠ 0 → sinSqMix ms ml + cosSqMix ms ml = 1)
    -- ★★ the three forced mixing probabilities over the derived ℝ at the banked masses
    ∧ ((481 : Cut) / 100000 ≤ sinSqMix mass1 mass2 ∧ sinSqMix mass1 mass2 ≤ (482 : Cut) / 100000)
    ∧ ((561 : Cut) / 10000 ≤ sinSqMix mass2 mass0 ∧ sinSqMix mass2 mass0 ≤ (562 : Cut) / 10000)
    ∧ ((287 : Cut) / 1000000 ≤ sinSqMix mass1 mass0 ∧ sinSqMix mass1 mass0 ≤ (288 : Cut) / 1000000)
    -- non-vacuity: the hierarchy and a real fraction in (0,1)
    ∧ (sinSqMix mass1 mass0 < sinSqMix mass1 mass2 ∧ sinSqMix mass1 mass2 < sinSqMix mass2 mass0)
    ∧ ((0 : Cut) < sinSqMix mass1 mass2 ∧ sinSqMix mass1 mass2 < 1) :=
  ⟨sinSqMix_born, sinSqMix_gst, sinSq_add_cosSq,
   ⟨sinSq12_lo, sinSq12_hi⟩, ⟨sinSq23_lo, sinSq23_hi⟩, ⟨sinSq13_lo, sinSq13_hi⟩,
   sinSq_hierarchy, sinSq12_mem⟩

end

end GenerationMixingAngles
end Phys.Algebra
