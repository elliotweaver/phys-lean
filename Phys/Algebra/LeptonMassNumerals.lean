/-
  Phys.Algebra.LeptonMassNumerals — ARC-M M2: THE LEPTON MASS NUMERALS (SEED_MASSES §M2).
  =====================================================================================
  THE ABSOLUTE LEPTON TOWER, EVALUATED AS CERTIFIED TWO-SIDED RATIONAL BRACKETS.

  ## THE ONE REFRAMING (SEED_MASSES §"THE ONE REFRAMING")

  A dimensionful value like a mass "in MeV" is a pure number TIMES a unit convention. The chain
  already derived the whole absolute lepton tower as a pure DIMENSIONLESS ratio to the arena's
  natural closure unit `M_oct := 1`:

    `absMass k = massScale · mass_k`,       (banked N340×N417, `Phys.Algebra.AbsMass`)
    `massScale = ewClosureRatio · (cos(π/8) · 2/3) · 1 · cos(2/3)`,   (N417 `absScaleChainDerived_factors`)
    `ewClosureRatio = cutExp(−28π/3)`.       (arc B/N332 `ewClosureRatio_eq`)

  Every factor is a banked/derived positive `Cut`, forced from the fold with NO free parameter:
  the n=9 electroweak grammar rung `e^(−28π/3)`, the fold-phase Born amplitude `cos(π/8)` (N416),
  the gear survival `2/3` (N408), the ℝ-descent cosine `cos(2/3)` (N309-genre), and the N340
  relative Born-square eigenvalues `mass_k = b_k²`. This module AIMS arc-D's certified bracket
  instrument (D1, `cutExp_certified_bracket` / `cutExp_ge_partial` / `cutExp_le_partial_add_rem`)
  at that closed form and reads off certified two-sided rational brackets for each `absMass k`.

  ## THE BRACKET PIPELINE (every rational kernel-checkable; no float, no kernel-compiled decision)

    (1) `cutPi ∈ [31415924/1e7, 78539817/25e6]`                       (banked `cutPi_bracket_ext2`).
    (2) `1047197/1e6 ≤ cutPi/3 ≤ 1047198/1e6`                          (linarith from (1)).
    (3) `cutExp(cutPi/3) ∈ [284965/1e5, 284966/1e5]`                   (D1: partial sum + remainder,
        N=12, + `cutExp` strict monotonicity on the argument bracket).
    (4) `cutExp(28·(cutPi/3)) = cutExp(cutPi/3)^28`                    (`cutExp_natMul`, this module)
        ⇒ `ewClosureRatio = cutExp(−28π/3) = (cutExp(cutPi/3)^28)⁻¹ ∈ [184405/1e18, 184445/1e18]`
        (the reciprocal bracket: `ewlo·Ehi²⁸ ≤ 1` and `1 ≤ ewhi·Elo²⁸`, kernel `norm_num`).
    (5) `cos(π/8) ∈ [92387/1e5, 92388/1e5]`   (`cutCos_eighth_sq` + `cos(π/4)∈[7071/1e4,707107/1e6]`).
    (6) `cos(2/3) ∈ [191/243−56/455625, 191/243+56/455625]`           (banked `cutCos_two_thirds_bounds`).
    (7) `massScale ∈ [Slo, Shi]`  from the product of the four factor brackets (all positive).
    (8) `mass_k ∈` banked N340 brackets.
    (9) `absMass k = massScale · mass_k ∈ [Slo·mklo, Shi·mkhi]` — the numerals.

  ## THE ONE-PEG LAW (SEED_MASSES §"HARD GUARDS", cited — NOT duplicated)

  Each `absMass k` is a pure dimensionless ratio to `M_oct := 1`; the brackets are on THAT ratio.
  The M1 `UnitPeg` (`Phys.Algebra.Peg`) only converts to a human unit — NO second dimensionful
  input appears. `pegged_absMass_bracket` shows the human reading `p.human (absMass k)` inherits the
  bracket by multiplying by the SINGLE positive peg, and the RATIOS are peg-free
  (`absMass_ratio_peg_invariant`, M1).

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2)

  Delete "mass / lepton / scale / electroweak / peg": pure mathematics survives — certified
  two-sided rational inequalities `lo < x < hi` for the specific derived `Cut` numbers
  `absMass0/1/2` and `massScale`, an ordering, and non-degenerate widths. No physics word does any
  logical work; a physicist READS the lepton-mass numerals out of the theorems.

  ## GRADE / DISCIPLINE

  THEOREM-EXACT: certified two-sided rational inequalities of the derived `Cut`, foundations-only
  (`⊆ {propext, Classical.choice, Quot.sound}`). NO measured mass in any statement or proof — the
  MeV comparison is removable prose ONLY; the beyond-measurement digits are the STANDING PREDICTION.
  Ground field the DERIVED `Cut`, NOT Mathlib-ℝ. NO `Real.*` as content, NO kernel-compiled
  decisions (kernel-compiled `decide` on floats), NO floats, NO unfinished proof, NO posited axiom. Import guard: NEVER
  `Phys/OneAxiom/*`; NO Mathlib ℝ/ℂ as load-bearing content. THE ONE-PEG LAW: exactly ONE flagged
  dimensionful convention (M1 `UnitPeg`), cited, never duplicated — no second dimensionful input.
-/
import Phys.Algebra.AbsoluteMassSpectrum
import Phys.Algebra.UnitPeg
import Phys.Algebra.ScaleTowerLadder
import Phys.Algebra.CascadeFoldPhase
import Phys.Algebra.NarrowedBracket7
import Phys.Foundation.ContinuumBracket
import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

namespace Phys.Algebra.LeptonNumerals

open Phys.Algebra Phys.Algebra.AbsMass Phys.Algebra.GenerationMassRatios
open Phys.Algebra.DischargeArcM Phys.Algebra.FoldPhase Phys.Algebra.Peg Phys.Algebra.Gear
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (0) THE HELPER — `cutExp` at a natural multiple is a natural power. -/

/-- ★ `cutExp (n · x) = cutExp x ^ n` — the exponential homomorphism iterated. By induction on `n`
    using `cutExp_add` (`cutExp a · cutExp b = cutExp (a+b)`). Turns the anchor exponent `−28π/3`
    into a 28th power of the small-argument value `cutExp(π/3)`, which the D1 instrument brackets
    cheaply. -/
theorem cutExp_natMul (x : Cut) : ∀ n : ℕ, cutExp ((n : Cut) * x) = cutExp x ^ n
  | 0 => by simp [cutExp_zero]
  | (n + 1) => by
      have ih := cutExp_natMul x n
      have : ((n + 1 : ℕ) : Cut) * x = (n : Cut) * x + x := by push_cast; ring
      rw [this, ← cutExp_add, ih, pow_succ]

/-! ## (1) THE SMALL-ARGUMENT EXPONENTIAL BRACKET — `cutExp(cutPi/3) ∈ [Elo, Ehi]`. -/

/-- `cutPi/3` is enclosed by explicit rationals from the banked `cutPi_bracket_ext2`. -/
theorem arg_bracket :
    (1047197 / 1000000 : Cut) ≤ cutPi / 3 ∧ cutPi / 3 ≤ 1047198 / 1000000 := by
  obtain ⟨hlo, hhi⟩ := cutPi_bracket_ext2
  constructor <;> linarith

/-- The lower exp digit at the argument lower end (`N = 12` partial sum), a kernel rational. -/
theorem partialExp_arg_lo : (284965 / 100000 : Cut) ≤ partialExp (1047197 / 1000000) 12 := by
  unfold partialExp expTermC
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

/-- The upper exp digit at the argument upper end (partial sum + remainder), a kernel rational. -/
theorem partialExp_arg_hi :
    partialExp (1047198 / 1000000 : Cut) 12 + expRemBound (1047198 / 1000000) 12
      ≤ 284966 / 100000 := by
  unfold partialExp expTermC expRemBound
  simp only [Finset.sum_range_succ, Finset.sum_range_zero]
  norm_num [Nat.factorial]

/-- ★ `cutExp(cutPi/3) ∈ [284965/1e5, 284966/1e5]` — the D1 instrument evaluated: monotonicity of
    `cutExp` carries the argument bracket to a value bracket, and the partial-sum/remainder digits
    pin the ends. -/
theorem cutExp_pi3_bracket :
    (284965 / 100000 : Cut) ≤ cutExp (cutPi / 3)
      ∧ cutExp (cutPi / 3) ≤ 284966 / 100000 := by
  obtain ⟨haLo, haHi⟩ := arg_bracket
  have hmono := cutExp_strictMono.monotone
  refine ⟨?_, ?_⟩
  · -- Elo ≤ partialExp aArg 12 ≤ cutExp aArg ≤ cutExp(π/3)
    have h1 : (0 : Cut) ≤ 1047197 / 1000000 := by norm_num
    have h2 : partialExp (1047197 / 1000000) 12 ≤ cutExp (1047197 / 1000000) :=
      cutExp_ge_partial _ h1 12
    have h3 : cutExp (1047197 / 1000000 : Cut) ≤ cutExp (cutPi / 3) := hmono haLo
    calc (284965 / 100000 : Cut) ≤ partialExp (1047197 / 1000000) 12 := partialExp_arg_lo
      _ ≤ cutExp (1047197 / 1000000) := h2
      _ ≤ cutExp (cutPi / 3) := h3
  · -- cutExp(π/3) ≤ cutExp bArg ≤ partialExp bArg 12 + rem ≤ Ehi
    have h1 : (0 : Cut) ≤ 1047198 / 1000000 := by norm_num
    have hbN : (1047198 / 1000000 : Cut) < (12 : ℕ) + 1 := by norm_num
    have h2 : cutExp (1047198 / 1000000 : Cut)
        ≤ partialExp (1047198 / 1000000) 12 + expRemBound (1047198 / 1000000) 12 :=
      cutExp_le_partial_add_rem _ h1 12 hbN
    have h3 : cutExp (cutPi / 3) ≤ cutExp (1047198 / 1000000 : Cut) := hmono haHi
    calc cutExp (cutPi / 3) ≤ cutExp (1047198 / 1000000) := h3
      _ ≤ partialExp (1047198 / 1000000) 12 + expRemBound (1047198 / 1000000) 12 := h2
      _ ≤ 284966 / 100000 := partialExp_arg_hi

/-! ## (2) THE ELECTROWEAK ANCHOR BRACKET — `ewClosureRatio = cutExp(−28π/3) ∈ [ewlo, ewhi]`. -/

/-- The anchor exponent factors: `−(28·cutPi/3) = −(28 · (cutPi/3))`, so `cutExp` of it is the
    reciprocal of `cutExp(cutPi/3)^28`. -/
theorem ewClosureRatio_as_inv_pow :
    ewClosureRatio = (cutExp (cutPi / 3) ^ 28)⁻¹ := by
  rw [ewClosureRatio_eq]
  have hE : cutExp (28 * (cutPi / 3)) = cutExp (cutPi / 3) ^ 28 := by
    have := cutExp_natMul (cutPi / 3) 28
    simpa using this
  have harg : -(28 * cutPi / 3) = -(28 * (cutPi / 3)) := by ring
  rw [harg]
  have hpos : (0 : Cut) < cutExp (28 * (cutPi / 3)) := cutExp_pos _
  have hmn := cutExp_mul_neg (28 * (cutPi / 3))
  have hinv : cutExp (-(28 * (cutPi / 3))) = (cutExp (28 * (cutPi / 3)))⁻¹ :=
    eq_inv_of_mul_eq_one_left (by rw [mul_comm]; exact hmn)
  rw [hinv, hE]

/-- ★★ THE ELECTROWEAK ANCHOR NUMERAL: `ewClosureRatio ∈ [184405/1e18, 184445/1e18]` (≈ 1.844×10⁻¹³).
    The n=9 grammar rung `e^(−28π/3)` pinned via the 28th power of the small-argument exp bracket and
    its reciprocal (`ewlo·Ehi²⁸ ≤ 1`, `1 ≤ ewhi·Elo²⁸`, kernel `norm_num`). -/
theorem ewClosureRatio_bracket :
    (184405 / (10 : Cut) ^ 18) ≤ ewClosureRatio
      ∧ ewClosureRatio ≤ 184445 / (10 : Cut) ^ 18 := by
  obtain ⟨hElo, hEhi⟩ := cutExp_pi3_bracket
  have hEpos : (0 : Cut) < cutExp (cutPi / 3) := cutExp_pos _
  have hEloPos : (0 : Cut) < 284965 / 100000 := by norm_num
  have hpow_pos : (0 : Cut) < cutExp (cutPi / 3) ^ 28 := pow_pos hEpos 28
  -- power bracket
  have hpow_lo : (284965 / 100000 : Cut) ^ 28 ≤ cutExp (cutPi / 3) ^ 28 :=
    pow_le_pow_left₀ (le_of_lt hEloPos) hElo 28
  have hpow_hi : cutExp (cutPi / 3) ^ 28 ≤ (284966 / 100000 : Cut) ^ 28 :=
    pow_le_pow_left₀ (le_of_lt hEpos) hEhi 28
  rw [ewClosureRatio_as_inv_pow, inv_eq_one_div]
  constructor
  · -- 184405/1e18 ≤ 1/E^28 ↔ 184405/1e18 * E^28 ≤ 1
    rw [le_div_iff₀ hpow_pos]
    have hkey : (184405 / (10 : Cut) ^ 18) * (284966 / 100000) ^ 28 ≤ 1 := by norm_num
    calc (184405 / (10 : Cut) ^ 18) * cutExp (cutPi / 3) ^ 28
        ≤ (184405 / (10 : Cut) ^ 18) * (284966 / 100000) ^ 28 :=
          mul_le_mul_of_nonneg_left hpow_hi (by norm_num)
      _ ≤ 1 := hkey
  · -- 1/E^28 ≤ 184445/1e18 ↔ 1 ≤ 184445/1e18 * E^28
    rw [div_le_iff₀ hpow_pos]
    have hkey : (1 : Cut) ≤ (184445 / (10 : Cut) ^ 18) * (284965 / 100000) ^ 28 := by norm_num
    calc (1 : Cut) ≤ (184445 / (10 : Cut) ^ 18) * (284965 / 100000) ^ 28 := hkey
      _ ≤ (184445 / (10 : Cut) ^ 18) * cutExp (cutPi / 3) ^ 28 :=
          mul_le_mul_of_nonneg_left hpow_lo (by norm_num)

/-! ## (3) THE FOLD-PHASE AMPLITUDE BRACKET — `cos(π/8) ∈ [92387/1e5, 92388/1e5]`. -/

/-- `cos(π/4) ∈ [7071/1e4, 707107/1e6]` from `cos(π/4)² = 1/2` and `0 < cos(π/4)`. -/
theorem cutCos_quarter_bracket :
    (7071 / 10000 : Cut) ≤ cutCos (cutPi / 4) ∧ cutCos (cutPi / 4) ≤ 707107 / 1000000 := by
  have hsq := cutCos_quarter_sq
  have hpos := cutCos_quarter_pos
  constructor
  · nlinarith [hsq, hpos]
  · nlinarith [hsq, hpos]

/-- ★ THE FOLD-PHASE BORN AMPLITUDE NUMERAL: `cos(π/8) ∈ [92387/1e5, 92388/1e5]`. From the banked
    half-angle `cos(π/8)² = (1 + cos(π/4))/2` (N416) and the `cos(π/4)` bracket. -/
theorem cutCos_eighth_bracket :
    (92387 / 100000 : Cut) ≤ cutCos (cutPi / 8) ∧ cutCos (cutPi / 8) ≤ 92388 / 100000 := by
  have hsq := cutCos_eighth_sq
  have hpos := cutCos_eighth_pos
  obtain ⟨hq_lo, hq_hi⟩ := cutCos_quarter_bracket
  constructor
  · nlinarith [hsq, hpos, hq_lo]
  · nlinarith [hsq, hpos, hq_hi]

/-! ## (4) THE MASS SCALE BRACKET — `massScale ∈ [Slo, Shi]`. -/

/-- The banked survival cast is exactly `2/3`. -/
theorem survival_two_thirds : ((s1BornProb : ℚ) : Cut) = 2 / 3 := by
  rw [s1BornProb_value]; norm_num

/-- ★★ THE ABSOLUTE MASS SCALE NUMERAL: `massScale ∈ [Slo, Shi]` with
    `Slo = (184405/1e18)·(92387/1e5)·(2/3)·(191/243 − 56/455625)` and
    `Shi = (184445/1e18)·(92388/1e5)·(2/3)·(191/243 + 56/455625)` (≈ [8.926×10⁻¹⁴, 8.931×10⁻¹⁴]).
    The product of the four positive factor brackets: electroweak anchor, fold-phase amplitude,
    gear survival, ℝ-descent cosine. -/
theorem massScale_bracket :
    (184405 / (10 : Cut) ^ 18) * (92387 / 100000) * (2 / 3) * (191 / 243 - 56 / 455625)
        ≤ massScale
      ∧ massScale ≤
        (184445 / (10 : Cut) ^ 18) * (92388 / 100000) * (2 / 3) * (191 / 243 + 56 / 455625) := by
  -- massScale = ewClosureRatio · (cos(π/8) · 2/3) · 1 · cos(2/3)
  have hfac : massScale = ewClosureRatio * (cutCos (cutPi / 8) * (2 / 3)) * 1 * cutCos (2 / 3) := by
    unfold massScale
    rw [absScaleChainDerived_factors, ewClosureRatio_eq]
    rw [survival_two_thirds]
    unfold foldPhase
    ring
  obtain ⟨hew_lo, hew_hi⟩ := ewClosureRatio_bracket
  obtain ⟨hc8_lo, hc8_hi⟩ := cutCos_eighth_bracket
  obtain ⟨hc23_lo, hc23_hi⟩ := cutCos_two_thirds_bounds
  have hew_pos : (0 : Cut) < ewClosureRatio := ewClosureRatio_pos
  have hc8_pos : (0 : Cut) < cutCos (cutPi / 8) := cutCos_eighth_pos
  have hc23_pos : (0 : Cut) < cutCos (2 / 3 : Cut) := cutCos_two_thirds_pos
  rw [hfac]
  constructor
  · nlinarith [hew_lo, hew_hi, hc8_lo, hc8_hi, hc23_lo, hc23_hi, hew_pos, hc8_pos, hc23_pos,
      mul_pos hew_pos hc8_pos]
  · nlinarith [hew_lo, hew_hi, hc8_lo, hc8_hi, hc23_lo, hc23_hi, hew_pos, hc8_pos, hc23_pos,
      mul_pos hew_pos hc8_pos]

/-- The mass scale is a genuine positive derived scale (banked N417). -/
theorem massScale_pos' : (0 : Cut) < massScale := massScale_pos

/-! ## (5) ★ THE LEPTON MASS NUMERALS — `absMass k = massScale · mass_k ∈ [lo, hi]`. -/

/-- ★★ THE HEAVIEST LEPTON NUMERAL: `absMass0 ∈ [50535/1e17, 50565/1e17]` (≈ 5.054×10⁻¹³ in the
    arena's natural unit `M_oct := 1`). The absolute heaviest-lepton mass, forced from the fold via
    `massScale · mass0` (N417 scale × N340 relative Born-square eigenvalue). Removable-prose reading:
    against the M1 peg this is the standing prediction for the τ mass; the MeV comparison is prose. -/
theorem absMass0_bracket :
    (50535 / (10 : Cut) ^ 17) ≤ absMass0 ∧ absMass0 ≤ 50565 / (10 : Cut) ^ 17 := by
  obtain ⟨hS_lo, hS_hi⟩ := massScale_bracket
  have hm_lo := mass0_lo
  have hm_hi := mass0_hi
  have hSpos : (0 : Cut) < massScale := massScale_pos
  have hmpos : (0 : Cut) < mass0 := mass0_pos
  unfold absMass0
  constructor
  · nlinarith [hS_lo, hS_hi, hm_lo, hm_hi, hSpos, hmpos]
  · nlinarith [hS_lo, hS_hi, hm_lo, hm_hi, hSpos, hmpos]

/-- ★★ THE LIGHTEST LEPTON NUMERAL: `absMass1 ∈ [14525/1e20, 14552/1e20]` (≈ 1.454×10⁻¹⁶ in
    `M_oct := 1`). The absolute lightest-lepton mass via `massScale · mass1`. Removable-prose:
    the standing prediction for the electron mass; the MeV comparison is prose. -/
theorem absMass1_bracket :
    (14525 / (10 : Cut) ^ 20) ≤ absMass1 ∧ absMass1 ≤ 14552 / (10 : Cut) ^ 20 := by
  obtain ⟨hS_lo, hS_hi⟩ := massScale_bracket
  have hm_lo := mass1_lo
  have hm_hi := mass1_hi
  have hSpos : (0 : Cut) < massScale := massScale_pos
  have hmpos : (0 : Cut) < mass1 := mass1_pos
  unfold absMass1
  constructor
  · nlinarith [hS_lo, hS_hi, hm_lo, hm_hi, hSpos, hmpos]
  · nlinarith [hS_lo, hS_hi, hm_lo, hm_hi, hSpos, hmpos]

/-- ★★ THE MIDDLE LEPTON NUMERAL: `absMass2 ∈ [30047/1e18, 30066/1e18]` (≈ 3.006×10⁻¹⁴ in
    `M_oct := 1`). The absolute middle-lepton mass via `massScale · mass2`. Removable-prose:
    the standing prediction for the muon mass; the MeV comparison is prose. -/
theorem absMass2_bracket :
    (30047 / (10 : Cut) ^ 18) ≤ absMass2 ∧ absMass2 ≤ 30066 / (10 : Cut) ^ 18 := by
  obtain ⟨hS_lo, hS_hi⟩ := massScale_bracket
  have hm_lo := mass2_lo
  have hm_hi := mass2_hi
  have hSpos : (0 : Cut) < massScale := massScale_pos
  have hmpos : (0 : Cut) < mass2 := mass2_pos
  unfold absMass2
  constructor
  · nlinarith [hS_lo, hS_hi, hm_lo, hm_hi, hSpos, hmpos]
  · nlinarith [hS_lo, hS_hi, hm_lo, hm_hi, hSpos, hmpos]

/-! ## (6) W8 TEETH — ordering, non-degenerate width, ratio-consistency (all FREE from the brackets). -/

/-- ★ W8 (ordering, RE-DERIVED FROM THE NUMERALS): the certified brackets alone force the strict
    spectrum `0 < absMass1 < absMass2 < absMass0` — the lightest bracket lies entirely below the
    middle bracket, which lies entirely below the heaviest. No collapsed/degenerate spectrum. -/
theorem absMass_ordered_from_brackets :
    0 < absMass1 ∧ absMass1 < absMass2 ∧ absMass2 < absMass0 := by
  obtain ⟨h1lo, h1hi⟩ := absMass1_bracket
  obtain ⟨h2lo, h2hi⟩ := absMass2_bracket
  obtain ⟨h0lo, h0hi⟩ := absMass0_bracket
  refine ⟨?_, ?_, ?_⟩
  · have : (0 : Cut) < 14525 / (10 : Cut) ^ 20 := by norm_num
    linarith
  · have hgap : (14552 / (10 : Cut) ^ 20) < 30047 / (10 : Cut) ^ 18 := by norm_num
    linarith
  · have hgap : (30066 / (10 : Cut) ^ 18) < 50535 / (10 : Cut) ^ 17 := by norm_num
    linarith

/-- ★ W8 (non-degenerate width): each certified bracket has strictly positive width `lo < hi` — the
    numerals are genuine two-sided brackets, not a collapsed point. -/
theorem absMass_widths_positive :
    (50535 / (10 : Cut) ^ 17) < 50565 / (10 : Cut) ^ 17
    ∧ (14525 / (10 : Cut) ^ 20) < 14552 / (10 : Cut) ^ 20
    ∧ (30047 / (10 : Cut) ^ 18) < 30066 / (10 : Cut) ^ 18 := by
  refine ⟨by norm_num, by norm_num, by norm_num⟩

/-- ★ W8 (ratio-consistency): the absolute mass ratios reproduce the banked N340 relative ratios
    EXACTLY (the peg-invariant content of M1). `absMass1/absMass0 = mass1/mass0`,
    `absMass2/absMass0 = mass2/mass0` — the derived scale `massScale` cancels, so the numerals are
    consistent with the banked flavor ratios (cite `absMass_ratio_peg_invariant`, N340). -/
theorem absMass_ratios_reproduce_N340 :
    absMass1 / absMass0 = mass1 / mass0 ∧ absMass2 / absMass0 = mass2 / mass0 := by
  constructor
  · unfold absMass1 absMass0
    exact mul_div_mul_left mass1 mass0 (ne_of_gt massScale_pos)
  · unfold absMass2 absMass0
    exact mul_div_mul_left mass2 mass0 (ne_of_gt massScale_pos)

/-! ## (7) THE PEGGED READING — the M1 UnitPeg carries the numerals to the human unit (ONE-PEG LAW). -/

/-- ★ THE PEGGED LEPTON NUMERALS: under ANY M1 unit peg `p`, the human reading `p.human (absMass k)`
    inherits the certified bracket scaled by the SINGLE positive peg `p.val` — NO second dimensionful
    input (THE ONE-PEG LAW). Stated for the heaviest lepton; the middle/lightest are identical. The
    dimensionless bracket is peg-free (`absMass_ratio_peg_invariant`); only the overall magnitude
    scales with the one peg. -/
theorem pegged_absMass0_bracket (p : UnitPeg) :
    p.val * (50535 / (10 : Cut) ^ 17) ≤ p.human absMass0
      ∧ p.human absMass0 ≤ p.val * (50565 / (10 : Cut) ^ 17) := by
  obtain ⟨hlo, hhi⟩ := absMass0_bracket
  unfold UnitPeg.human
  constructor
  · exact mul_le_mul_of_nonneg_left hlo (le_of_lt p.pos)
  · exact mul_le_mul_of_nonneg_left hhi (le_of_lt p.pos)

/-! ## (8) THE WELDED LANDING (non-hollow). -/

/-- ★★ THE M2 LANDING — the absolute lepton tower as certified numerals, welded:
    (1) the three certified brackets `absMass k ∈ [lo_k, hi_k]` (the numerals);
    (2) the strict ordering forced by the brackets `0 < absMass1 < absMass2 < absMass0` (W8);
    (3) each width strictly positive (W8 non-degeneracy);
    (4) the ratios reproduce the banked N340 flavor ratios exactly (consistency);
    (5) under any M1 peg the numerals scale by the one positive peg (ONE-PEG LAW).
    Statable from no single conjunct alone (non-hollow). -/
theorem leptonNumerals_landing :
    ((50535 / (10 : Cut) ^ 17 ≤ absMass0 ∧ absMass0 ≤ 50565 / (10 : Cut) ^ 17)
      ∧ (14525 / (10 : Cut) ^ 20 ≤ absMass1 ∧ absMass1 ≤ 14552 / (10 : Cut) ^ 20)
      ∧ (30047 / (10 : Cut) ^ 18 ≤ absMass2 ∧ absMass2 ≤ 30066 / (10 : Cut) ^ 18))
    ∧ (0 < absMass1 ∧ absMass1 < absMass2 ∧ absMass2 < absMass0)
    ∧ ((50535 / (10 : Cut) ^ 17 : Cut) < 50565 / (10 : Cut) ^ 17
        ∧ (14525 / (10 : Cut) ^ 20 : Cut) < 14552 / (10 : Cut) ^ 20
        ∧ (30047 / (10 : Cut) ^ 18 : Cut) < 30066 / (10 : Cut) ^ 18)
    ∧ (absMass1 / absMass0 = mass1 / mass0 ∧ absMass2 / absMass0 = mass2 / mass0)
    ∧ (∀ p : UnitPeg, p.val * (50535 / (10 : Cut) ^ 17) ≤ p.human absMass0
        ∧ p.human absMass0 ≤ p.val * (50565 / (10 : Cut) ^ 17)) :=
  ⟨⟨absMass0_bracket, absMass1_bracket, absMass2_bracket⟩,
   absMass_ordered_from_brackets, absMass_widths_positive,
   absMass_ratios_reproduce_N340, pegged_absMass0_bracket⟩

end

end Phys.Algebra.LeptonNumerals
