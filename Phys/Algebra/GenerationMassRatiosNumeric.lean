/-
# N340 — SEEDED ANALYTIC-COMPLETION D2: THE LEPTON MASS RATIOS AS ACTUAL NUMBERS OF THE DERIVED ℝ

Owner-authorized analytic-completion seed (docs/SEED_ANALYTIC_COMPLETION.md), target **D2** — the
directed successor of N339 (D1). N309/T6 forced the whole generation spectrum to the cubic
`t³ − σ₁t² + σ₂t − σ₃` with `σ₁ = 6M²` (Koide, phase-independent) and the phase entering the
coefficients only through `e₃` (whose shape is `cos(3δ_B) = cos(2/3)`). But the INDIVIDUAL generation
masses are Born squares of the cycle amplitudes
`aₖ = M·(1 + √2·cos(δ_B + 2πk/3))` (N307, the ℤ₃-Fourier cycle form), which need the INDIVIDUAL cycle
phase `δ_B = 2/9`. In the banked rational-conic realization (N307 §1) with `p = cos δ_B`,
`r = √3·sin δ_B`, `A = √2·M`, conic `3p² + r² = 3`, the three amplitudes are
`a₀ = M(1 + √2·p)`, `a₁ = M(1 − √2·(p+r)/2)`, `a₂ = M(1 − √2·(p−r)/2)`.

★ WHAT THIS NODE DOES. It EVALUATES those forced amplitudes at the DERIVED phase over the derived ℝ
`Cut`, using the banked numeral `cutCos (2/9)` (N339/N340, `cutCos_two_ninths_bracket`), the banked
`√2 = cutSqrt 2` (N57), and `r = cutSqrt (3 − 3p²)` from the conic (NO separate sine numeral needed —
the sine enters ONLY through the conic). It then reads off the two independent dimensionless mass
RATIOS as EXPLICIT two-sided RATIONAL bounds over `Cut`:

  * `m₁/m₂ ∈ [483/100000, 485/100000]`   (the lightest/middle ratio; PDG e:μ ≈ 0.00484 — prose)
  * `m₂/m₀ ∈ [594/10000, 595/10000]`     (the middle/heaviest ratio; PDG μ:τ ≈ 0.0595 — prose)

and the exact banked Koide total `Σmₖ = 6M²` lifted to `Cut`. The ratios FALL OUT of the forced
amplitudes evaluated at the banked numeral — NO decimal is posited (seed G1), NO empirical number
enters any proof (seed G2); the comparison to PDG is REMOVABLE PROSE only.

★ WHY FORCED, NOT ASSERTED (seed G1/G4). The phase `δ_B = 2/9` is DERIVED (N308, holonomy =
statistics), `Q = 2/3` is DERIVED (N307), `cutCos (2/9)` is EXTRACTED from the banked series (N340),
`√2 = cutSqrt 2` is the banked root, and `r` is forced by the conic. The amplitudes are the banked
cycle form; the ratios are their Born-square quotients. Zero free shape parameters; `M` is the one
dimensionful anchor (seed G3). The RATIOS are theorem-exact / forced. The ABSOLUTE masses would be
`ratio × Arc-B ladder scale` (LADDER-grade, NOT identity-grade) — not built here.

★ THE ONE-CAUSE / W9 ROUTE. The direct ratio `nlinarith` on `a₁ ≈ 0.04` (a small difference) is
ill-conditioned and blows past the heartbeat ceiling — an INSTRUMENT signal (W9), not a theory
failure. The theory-native route: the amplitudes are LINEAR in `(p, r, w)`. Bound each amplitude
tightly by linear arithmetic on the banked brackets (each bracket its OWN banked lemma, own budget),
square by monotonicity, and the ratio reduces to a pure rational `norm_num` cross-multiplication. One
engine (the order on `Cut`), decomposed into bounded steps.

PHYSICS-WORDS-REMOVABLE (STANDARD §2, seed G5). Delete "mass" / "lepton" / "generation" / "Koide":
over the derived `Cut`, with `p = cutCos(2/9)`, `w = cutSqrt 2`, `r = cutSqrt(3 − 3p²)` and the linear
forms `b₀ = 1 + w·p`, `b₁ = 1 − w·(p+r)/2`, `b₂ = 1 − w·(p−r)/2`, one has `b₁²/b₂² ∈ [483/1e5, 485/1e5]`
and `b₂²/b₀² ∈ [594/1e4, 595/1e4]`, and `b₀² + b₁² + b₂² = 6` (the conic identity). No name is
load-bearing.

FREE-FLOATING check (SOUL rail). Every theorem's TYPE mentions the banked `cutCos`/`cutSqrt`/`Cut`
objects; the amplitudes are the banked cycle form at the DERIVED phase, not a generic vector. Grounded
on the tower.

Foundations-only (seed G6): no posited axiom, no sorry, no native_decide, no maxHeartbeats-raise, no
bridge; no empirical number; the ground field is the BANKED derived ℝ `Cut`, the banked `cutCos`
numeral, and the banked `cutSqrt` — NO Mathlib `Real`/`Real.cos` as content.
-/
import Phys.Algebra.LorentzContinuumSqrt
import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

namespace Phys.Algebra
namespace GenerationMassRatios

open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## §0 — the derived phase data over `Cut` (from the banked numerals). -/

/-- The cosine of the derived cycle phase `δ_B = 2/9`, over the derived ℝ (banked N340). -/
def pB : Cut := cutCos (2 / 9 : Cut)

/-- The derived `√2` (banked N57 `cutSqrt`), the cycle amplitude scale `A/M`. -/
def wB : Cut := cutSqrt 2

/-- The sine direction of the cycle phase, forced by the conic `3p² + r² = 3` as `r = √(3 − 3p²)`
    (no separate sine numeral needed — the sine enters only through the conic). -/
def rB : Cut := cutSqrt (3 - 3 * pB * pB)

/-- The three cycle amplitudes at the derived phase, normalized (`M = 1`):
    `b₀ = 1 + w·p`, `b₁ = 1 − w·(p+r)/2`, `b₂ = 1 − w·(p−r)/2` (banked N307 form). -/
def b0 : Cut := 1 + wB * pB
def b1 : Cut := 1 - wB * (pB + rB) / 2
def b2 : Cut := 1 - wB * (pB - rB) / 2

/-! ## §1 — brackets on the derived phase data (each its own banked lemma; W9 budget isolation). -/

/-- `p = cutCos(2/9) ∈ [975410/1e6, 975411/1e6]` (banked N340). -/
theorem pB_lo : (975410 : Cut) / 1000000 ≤ pB := cutCos_two_ninths_bracket.1
theorem pB_hi : pB ≤ (975411 : Cut) / 1000000 := cutCos_two_ninths_bracket.2
theorem pB_pos : (0 : Cut) < pB := cutCos_two_ninths_pos

/-- `w = √2 ∈ [1414213/1e6, 1414214/1e6]` (from `w·w = 2`, `w ≥ 0`). -/
theorem wB_ww : wB * wB = 2 := cutSqrt_sq (by norm_num)
theorem wB_nonneg : (0 : Cut) ≤ wB := cutSqrt_nonneg 2
theorem wB_lo : (1414213 : Cut) / 1000000 ≤ wB := by nlinarith [wB_ww, wB_nonneg]
theorem wB_hi : wB ≤ (1414214 : Cut) / 1000000 := by nlinarith [wB_ww, wB_nonneg]

/-- `3 − 3p² ≥ 0`, so the conic sine root exists. -/
theorem conic_nonneg : (0 : Cut) ≤ 3 - 3 * pB * pB := by
  have hp2hi : pB * pB ≤ (975411 : Cut) / 1000000 * (975411 / 1000000) :=
    mul_le_mul pB_hi pB_hi (le_of_lt pB_pos) (by norm_num)
  nlinarith [hp2hi]

/-- `r·r = 3 − 3p²` (the conic identity, `r ≥ 0` branch). -/
theorem rB_rr : rB * rB = 3 - 3 * pB * pB := cutSqrt_sq conic_nonneg
theorem rB_nonneg : (0 : Cut) ≤ rB := cutSqrt_nonneg _

/-- `r = √(3 − 3p²) ∈ [381732/1e6, 381742/1e6]` (from the `p`-bracket + the conic). -/
theorem rB_lo : (381732 : Cut) / 1000000 ≤ rB := by
  have hp2hi : pB * pB ≤ (975411 : Cut) / 1000000 * (975411 / 1000000) :=
    mul_le_mul pB_hi pB_hi (le_of_lt pB_pos) (by norm_num)
  nlinarith [rB_rr, rB_nonneg, hp2hi]
theorem rB_hi : rB ≤ (381742 : Cut) / 1000000 := by
  have hp2lo : (975410 : Cut) / 1000000 * (975410 / 1000000) ≤ pB * pB :=
    mul_le_mul pB_lo pB_lo (by norm_num) (le_of_lt (by linarith [pB_lo]))
  nlinarith [rB_rr, rB_nonneg, hp2lo]

/-! ## §2 — the product brackets `w·p`, `w·r` (le_trans; never norm_num a variable term). -/

theorem wp_lo : (137943 : Cut) / 100000 ≤ wB * pB :=
  le_trans (by norm_num) (mul_le_mul wB_lo pB_lo (by norm_num) (le_of_lt (by linarith [wB_lo])))
theorem wp_hi : wB * pB ≤ (137944 : Cut) / 100000 :=
  le_trans (mul_le_mul wB_hi pB_hi (le_of_lt pB_pos) (by norm_num)) (by norm_num)
theorem wr_lo : (53984 : Cut) / 100000 ≤ wB * rB :=
  le_trans (by norm_num)
    (mul_le_mul wB_lo rB_lo (by norm_num) (le_of_lt (by linarith [wB_lo])))
theorem wr_hi : wB * rB ≤ (53987 : Cut) / 100000 := by
  have hrpos : (0 : Cut) < rB := by linarith [rB_lo]
  exact le_trans (mul_le_mul wB_hi rB_hi (le_of_lt hrpos) (by norm_num)) (by norm_num)

/-! ## §3 — the amplitude brackets (linarith on the ring-expanded linear forms). -/

theorem b0_lo : (237943 : Cut) / 100000 ≤ b0 := by unfold b0; linarith [wp_lo]
theorem b0_hi : b0 ≤ (237944 : Cut) / 100000 := by unfold b0; linarith [wp_hi]
theorem b0_pos : (0 : Cut) < b0 := by have := b0_lo; linarith

theorem b1_lo : (4034 : Cut) / 100000 ≤ b1 := by
  unfold b1; have he : (1:Cut) - wB*(pB+rB)/2 = 1 - (wB*pB + wB*rB)/2 := by ring
  rw [he]; linarith [wp_hi, wr_hi]
theorem b1_hi : b1 ≤ (40365 : Cut) / 1000000 := by
  unfold b1; have he : (1:Cut) - wB*(pB+rB)/2 = 1 - (wB*pB + wB*rB)/2 := by ring
  rw [he]; linarith [wp_lo, wr_lo]
theorem b1_pos : (0 : Cut) < b1 := by have := b1_lo; linarith

theorem b2_lo : (5802 : Cut) / 10000 ≤ b2 := by
  unfold b2; have he : (1:Cut) - wB*(pB-rB)/2 = 1 - (wB*pB - wB*rB)/2 := by ring
  rw [he]; linarith [wp_hi, wr_lo]
theorem b2_hi : b2 ≤ (58022 : Cut) / 100000 := by
  unfold b2; have he : (1:Cut) - wB*(pB-rB)/2 = 1 - (wB*pB - wB*rB)/2 := by ring
  rw [he]; linarith [wp_lo, wr_hi]
theorem b2_pos : (0 : Cut) < b2 := by have := b2_lo; linarith

/-! ## §4 — the mass brackets (Born squares) via square-monotonicity. -/

/-- The generation masses (normalized, `M = 1`): the Born squares `mₖ = bₖ²` (the trunk `Born =
    self-overlap`). -/
def mass0 : Cut := b0 ^ 2
def mass1 : Cut := b1 ^ 2
def mass2 : Cut := b2 ^ 2

theorem mass0_lo : (237943 : Cut) / 100000 * (237943 / 100000) ≤ mass0 := by
  have := mul_le_mul b0_lo b0_lo (by norm_num) (le_of_lt b0_pos); unfold mass0; nlinarith [this]
theorem mass0_hi : mass0 ≤ (237944 : Cut) / 100000 * (237944 / 100000) := by
  have := mul_le_mul b0_hi b0_hi (le_of_lt b0_pos) (by norm_num); unfold mass0; nlinarith [this]
theorem mass1_lo : (4034 : Cut) / 100000 * (4034 / 100000) ≤ mass1 := by
  have := mul_le_mul b1_lo b1_lo (by norm_num) (le_of_lt b1_pos); unfold mass1; nlinarith [this]
theorem mass1_hi : mass1 ≤ (40365 : Cut) / 1000000 * (40365 / 1000000) := by
  have := mul_le_mul b1_hi b1_hi (le_of_lt b1_pos) (by norm_num); unfold mass1; nlinarith [this]
theorem mass2_lo : (5802 : Cut) / 10000 * (5802 / 10000) ≤ mass2 := by
  have := mul_le_mul b2_lo b2_lo (by norm_num) (le_of_lt b2_pos); unfold mass2; nlinarith [this]
theorem mass2_hi : mass2 ≤ (58022 : Cut) / 100000 * (58022 / 100000) := by
  have := mul_le_mul b2_hi b2_hi (le_of_lt b2_pos) (by norm_num); unfold mass2; nlinarith [this]

theorem mass1_pos : (0 : Cut) < mass1 := by have := mass1_lo; nlinarith [this]
theorem mass2_pos : (0 : Cut) < mass2 := by have := mass2_lo; nlinarith [this]
theorem mass0_pos : (0 : Cut) < mass0 := by have := mass0_lo; nlinarith [this]

/-! ## §5 — ★★ THE TWO FORCED MASS RATIOS as explicit two-sided rational bounds over the derived ℝ. -/

/-- ★★ THE LIGHTEST/MIDDLE RATIO `m₁/m₂ ∈ [483/100000, 485/100000]` — the electron-to-muon mass ratio
    read off the forced cycle amplitudes at the derived phase `δ_B = 2/9` over the derived ℝ. The
    bracket FALLS OUT of the banked `cutCos(2/9)` numeral; no decimal posited. (PDG e:μ ≈ 0.00484 is
    REMOVABLE PROSE, in no proof.) -/
theorem massRatio_1_2 :
    (483 : Cut) / 100000 * mass2 ≤ mass1 ∧ mass1 ≤ (485 : Cut) / 100000 * mass2 := by
  refine ⟨?_, ?_⟩
  · nlinarith [mass1_lo, mass2_hi]
  · nlinarith [mass1_hi, mass2_lo]

/-- ★★ THE MIDDLE/HEAVIEST RATIO `m₂/m₀ ∈ [594/10000, 595/10000]` — the muon-to-tau mass ratio read
    off the forced cycle amplitudes at the derived phase over the derived ℝ. The bracket FALLS OUT of
    the banked `cutCos(2/9)` numeral; no decimal posited. (PDG μ:τ ≈ 0.0595 is REMOVABLE PROSE.) -/
theorem massRatio_2_0 :
    (594 : Cut) / 10000 * mass0 ≤ mass2 ∧ mass2 ≤ (595 : Cut) / 10000 * mass0 := by
  refine ⟨?_, ?_⟩
  · nlinarith [mass2_lo, mass0_hi]
  · nlinarith [mass2_hi, mass0_lo]

/-! ## §6 — the exact Koide total `Σmₖ = 6` (normalized), the conic identity, lifted to `Cut`. -/

/-- The exact Koide total (mass-level Koide `σ₁`, banked N309 `sigma1_mass`): the sum of the three
    normalized Born-square masses is exactly `6` (`= 6M²` at `M = 1`), phase-INDEPENDENT, from the
    conic `3p² + r² = 3` and the balance `w² = 2`. Proved over the derived ℝ directly from the conic
    identity `r·r = 3 − 3p²` and `w·w = 2` — the `δ`-invariant self=other balance. -/
theorem koide_total : mass0 + mass1 + mass2 = 6 := by
  unfold mass0 mass1 mass2 b0 b1 b2
  have hww : wB * wB = 2 := wB_ww
  have hrr : rB * rB = 3 - 3 * pB * pB := rB_rr
  nlinarith [hww, hrr]

/-! ## §7 — non-vacuity (W8): the ratios are genuine positive numbers, the spectrum non-degenerate. -/

/-- NON-VACUITY: the three masses are pairwise DISTINCT (a genuine 3-generation spectrum, not a
    collapsed/degenerate one) — `m₁ < m₂ < m₀`, witnessed by the disjoint mass brackets. -/
theorem mass_distinct_1_2 : mass1 < mass2 := by
  have h1 := mass1_hi; have h2 := mass2_lo; nlinarith [h1, h2]
theorem mass_distinct_2_0 : mass2 < mass0 := by
  have h1 := mass2_hi; have h2 := mass0_lo; nlinarith [h1, h2]

/-- NON-VACUITY: the ratio is a genuine positive number strictly inside `(0,1)` (the middle mass is a
    real fraction of the heaviest, not `0` or equal). -/
theorem massRatio_2_0_nontrivial : (0 : Cut) < mass2 / mass0 ∧ mass2 / mass0 < 1 := by
  refine ⟨div_pos mass2_pos mass0_pos, ?_⟩
  rw [div_lt_one mass0_pos]; exact mass_distinct_2_0

/-! ## §8 — the capstone. -/

/-- ★★★ THE CAPSTONE — the generation mass RATIOS as ACTUAL NUMBERS of the derived ℝ (seed D2).

    Over the derived ℝ `Cut`, at the DERIVED cycle phase `δ_B = 2/9` (N308) with `Q = 2/3` (N307),
    evaluating the banked ℤ₃-Fourier cycle amplitudes (N307) with `p = cutCos(2/9)` (N340 numeral),
    `w = √2 = cutSqrt 2` (N57), and `r = √(3 − 3p²)` from the conic: the two independent dimensionless
    generation mass RATIOS are the explicit two-sided rational brackets `m₁/m₂ ∈ [483/1e5, 485/1e5]`
    (`massRatio_1_2`) and `m₂/m₀ ∈ [594/1e4, 595/1e4]` (`massRatio_2_0`), the Koide total is exactly
    `Σmₖ = 6` (`koide_total`, the mass-level Koide `σ₁ = 6M²` at `M = 1`), and the spectrum is
    non-degenerate `m₁ < m₂ < m₀` (`mass_distinct_*`). ZERO free shape parameters (`Q` and `δ_B` both
    derived); the ratios FALL OUT of the banked `cutCos(2/9)` numeral — no decimal posited, no
    empirical number in any proof. Comparison to the measured `e:μ:τ` is removable prose. -/
theorem generation_mass_ratios_numeric :
    ((483 : Cut) / 100000 * mass2 ≤ mass1 ∧ mass1 ≤ (485 : Cut) / 100000 * mass2)
    ∧ ((594 : Cut) / 10000 * mass0 ≤ mass2 ∧ mass2 ≤ (595 : Cut) / 10000 * mass0)
    ∧ (mass0 + mass1 + mass2 = 6)
    ∧ (mass1 < mass2 ∧ mass2 < mass0)
    ∧ ((0 : Cut) < mass2 / mass0 ∧ mass2 / mass0 < 1) :=
  ⟨massRatio_1_2, massRatio_2_0, koide_total, ⟨mass_distinct_1_2, mass_distinct_2_0⟩,
   massRatio_2_0_nontrivial⟩

end

end GenerationMassRatios
end Phys.Algebra
