/-
  Phys.Algebra.ConfinementScaleNumeral — ARC-M M3: THE CONFINEMENT SCALE NUMERAL (SEED_MASSES §M3).
  =====================================================================================
  THE CONFINEMENT SCALE Λ = M·cutExp(−12π), EVALUATED AS A CERTIFIED TWO-SIDED RATIONAL BRACKET,
  WITH THE v/Λ AND M/Λ RATIOS REPRODUCED AND THE BANKED `128/27` CONFINEMENT BAND RE-EMERGING FREE.

  ## THE ONE REFRAMING (SEED_MASSES §"THE ONE REFRAMING")

  A dimensionful value like a mass scale "in MeV" is a pure number TIMES a unit convention. The chain
  already derived the confinement scale as a pure DIMENSIONLESS ratio to the arena's natural closure
  unit `M_oct := 1`:

    `confinementScaleRatio = Λ/M = cutExp(−12·cutPi)`.   (banked `confinementScaleRatio_eq`)

  This is FORCED with NO free parameter: the octonion imaginary part `ImO` is COLOUR, `dim ImO = 7`
  (N22/N329), and the ONE `84·cutPi` grammar budget quotients by that colour count to the confinement
  rung exponent `rungExponent 7 = 12·cutPi` (banked `lock_imO`: `12π · 7 = 84π`). The exponential
  suppression `cutExp(−12π)` is the Born-positive derived-ℝ exponential (N174) at that rung. This
  module AIMS arc-D's certified bracket instrument (D1) at that closed form and reads off a certified
  two-sided rational bracket for `Λ/M`, plus the two scale ratios and the banked confinement band.

  ## THE BRACKET PIPELINE (every rational kernel-checkable; no float, no kernel-compiled decision)

    (1) `cutExp(cutPi/3) ∈ [284965/1e5, 284966/1e5]`                 (banked M2 `cutExp_pi3_bracket`).
    (2) `−(12·cutPi) = −(36·(cutPi/3))`  ⇒  `cutExp(−12π) = (cutExp(cutPi/3)^36)⁻¹`
        (`cutExp_natMul` + `cutExp_mul_neg`, this module `confinementScaleRatio_as_inv_pow36`).
    (3) `confinementScaleRatio ∈ [42408/1e21, 42414/1e21]` (≈ 4.241×10⁻¹⁷)
        (the reciprocal bracket: `lo·Ehi³⁶ ≤ 1` and `1 ≤ hi·Elo³⁶`, kernel `norm_num`).
    (4) `M/Λ = confinementScaleRatio⁻¹ = cutExp(cutPi/3)^36 ∈ [23577·1e12, 23581·1e12]`
        (the exact reciprocal identity + the 36th-power bracket).
    (5) `v/Λ = confBandRatio = cutExp(8π/3) = cutExp(cutPi/3)^8 ∈ [4347, 4350]`
        (banked `confBandRatio_eq` + `cutExp_natMul` + the 8th-power bracket).
    (6) THE `128/27` CONFINEMENT BAND RE-EMERGES FREE: `bandScreen chargeTraceDepth confBandRatio =
        128/27` (banked `bandScreen_conf_exact`) — the SAME `confBandRatio = v/Λ` this module brackets,
        so the exact screening lands from the same `cutExp(cutPi/3)` pipeline, no new input.

  ## THE ONE-PEG LAW (SEED_MASSES §"HARD GUARDS", cited — NOT duplicated)

  `confinementScaleRatio = Λ/M` is a pure dimensionless ratio to `M_oct := 1`; the bracket is on THAT
  ratio. The M1 `UnitPeg` (`Phys.Algebra.Peg`) only converts to a human unit — NO second dimensionful
  input appears. `pegged_confinementScale_bracket` shows the human reading inherits the bracket by
  multiplying by the SINGLE positive peg; the `v/Λ`, `M/Λ` ratios are peg-free (M1 `ratio_peg_invariant`).

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2)

  Delete "confinement / scale / hadron / colour / electroweak / peg": pure mathematics survives — a
  certified two-sided rational inequality `lo < x < hi` for the specific derived `Cut` number
  `confinementScaleRatio`, exact reciprocal/power identities relating it to `confBandRatio`, further
  brackets, a strict ordering, non-degenerate widths, and the exact rational `bandScreen … = 128/27`.
  No physics word does any logical work; a physicist READS the confinement-scale numeral out of the
  theorems.

  ## GRADE / DISCIPLINE

  THEOREM-EXACT: certified two-sided rational inequalities and exact identities of the derived `Cut`,
  foundations-only (`⊆ {propext, Classical.choice, Quot.sound}`). NO measured `Λ_QCD`/MeV in any
  statement or proof — the comparison is removable prose ONLY; the beyond-measurement digits are the
  STANDING PREDICTION. Ground field the DERIVED `Cut`, NOT Mathlib-ℝ. NO `Real.*` as content, NO
  kernel-compiled decisions, NO floats, NO unfinished proof, NO posited axiom. Import guard: NEVER
  `Phys/OneAxiom/*`; NO Mathlib ℝ/ℂ as load-bearing content. THE ONE-PEG LAW: exactly ONE flagged
  dimensionful convention (M1 `UnitPeg`), cited, never duplicated — no second dimensionful input.

  CARRIED NOTE (deferred-D7, arc-D standing debt, NOT a runway): D's ≥15-sig-digit AS-`1/α(0)` restate
  resumes AFTER the absolute-scale skeleton is complete.
-/
import Phys.Algebra.BandEdgeList
import Phys.Algebra.LeptonMassNumerals
import Phys.Algebra.UnitPeg
import Phys.Foundation.ContinuumBracket
import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

namespace Phys.Algebra.ConfNumeral

open Phys.Algebra Phys.Algebra.LeptonNumerals Phys.Algebra.BandEdgeList Phys.Algebra.Peg
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (1) THE RECIPROCAL-POWER FORM — `confinementScaleRatio = (cutExp(cutPi/3)^36)⁻¹`. -/

/-- ★ `confinementScaleRatio = (cutExp(cutPi/3)^36)⁻¹`. The anchor exponent factors as
    `−(12·cutPi) = −(36·(cutPi/3))`, so `cutExp` of it is the reciprocal of `cutExp(cutPi/3)^36`
    (`cutExp_natMul` turns the natural multiple into a 36th power; `cutExp_mul_neg` gives the
    reciprocal). Mirrors the M2 electroweak `ewClosureRatio_as_inv_pow`. -/
theorem confinementScaleRatio_as_inv_pow36 :
    confinementScaleRatio = (cutExp (cutPi / 3) ^ 36)⁻¹ := by
  rw [confinementScaleRatio_eq]
  have hE : cutExp (36 * (cutPi / 3)) = cutExp (cutPi / 3) ^ 36 := by
    have := cutExp_natMul (cutPi / 3) 36
    simpa using this
  have harg : -(12 * cutPi) = -(36 * (cutPi / 3)) := by ring
  rw [harg]
  have hmn := cutExp_mul_neg (36 * (cutPi / 3))
  have hinv : cutExp (-(36 * (cutPi / 3))) = (cutExp (36 * (cutPi / 3)))⁻¹ :=
    eq_inv_of_mul_eq_one_left (by rw [mul_comm]; exact hmn)
  rw [hinv, hE]

/-! ## (2) ★ THE CONFINEMENT SCALE NUMERAL — `confinementScaleRatio ∈ [42408/1e21, 42414/1e21]`. -/

/-- ★★★ THE CONFINEMENT SCALE NUMERAL: `Λ/M = confinementScaleRatio ∈ [42408/1e21, 42414/1e21]`
    (≈ 4.241×10⁻¹⁷ in the arena's natural unit `M_oct := 1`). The octonion/colour `n = 7` rung
    `cutExp(−12π)` pinned via the 36th power of the small-argument exp bracket and its reciprocal
    (`lo·Ehi³⁶ ≤ 1`, `1 ≤ hi·Elo³⁶`, kernel `norm_num`). Forced from the fold with NO free parameter.
    Removable-prose reading: against the M1 peg this is the standing prediction for the QCD
    confinement scale Λ; the MeV comparison is prose. -/
theorem confinementScaleRatio_bracket :
    (42408 / (10 : Cut) ^ 21) ≤ confinementScaleRatio
      ∧ confinementScaleRatio ≤ 42414 / (10 : Cut) ^ 21 := by
  obtain ⟨hElo, hEhi⟩ := cutExp_pi3_bracket
  have hEpos : (0 : Cut) < cutExp (cutPi / 3) := cutExp_pos _
  have hEloPos : (0 : Cut) < 284965 / 100000 := by norm_num
  have hpow_pos : (0 : Cut) < cutExp (cutPi / 3) ^ 36 := pow_pos hEpos 36
  have hpow_lo : (284965 / 100000 : Cut) ^ 36 ≤ cutExp (cutPi / 3) ^ 36 :=
    pow_le_pow_left₀ (le_of_lt hEloPos) hElo 36
  have hpow_hi : cutExp (cutPi / 3) ^ 36 ≤ (284966 / 100000 : Cut) ^ 36 :=
    pow_le_pow_left₀ (le_of_lt hEpos) hEhi 36
  rw [confinementScaleRatio_as_inv_pow36, inv_eq_one_div]
  constructor
  · -- 42408/1e21 ≤ 1/E^36 ↔ 42408/1e21 · E^36 ≤ 1
    rw [le_div_iff₀ hpow_pos]
    have hkey : (42408 / (10 : Cut) ^ 21) * (284966 / 100000) ^ 36 ≤ 1 := by norm_num
    calc (42408 / (10 : Cut) ^ 21) * cutExp (cutPi / 3) ^ 36
        ≤ (42408 / (10 : Cut) ^ 21) * (284966 / 100000) ^ 36 :=
          mul_le_mul_of_nonneg_left hpow_hi (by norm_num)
      _ ≤ 1 := hkey
  · -- 1/E^36 ≤ 42414/1e21 ↔ 1 ≤ 42414/1e21 · E^36
    rw [div_le_iff₀ hpow_pos]
    have hkey : (1 : Cut) ≤ (42414 / (10 : Cut) ^ 21) * (284965 / 100000) ^ 36 := by norm_num
    calc (1 : Cut) ≤ (42414 / (10 : Cut) ^ 21) * (284965 / 100000) ^ 36 := hkey
      _ ≤ (42414 / (10 : Cut) ^ 21) * cutExp (cutPi / 3) ^ 36 :=
          mul_le_mul_of_nonneg_left hpow_lo (by norm_num)

/-- The confinement scale ratio is a genuine positive derived scale (banked). -/
theorem confinementScaleRatio_pos' : (0 : Cut) < confinementScaleRatio := confinementScaleRatio_pos

/-! ## (3) THE `M/Λ` RATIO NUMERAL — `confinementScaleRatio⁻¹ = cutExp(cutPi/3)^36 ∈ [23577·1e12, 23581·1e12]`. -/

/-- The reciprocal of the confinement-scale ratio is exactly the 36th power of the small-argument
    exponential: `M/Λ = confinementScaleRatio⁻¹ = cutExp(cutPi/3)^36 = cutExp(12π)`. -/
theorem invConfinementScaleRatio_eq_pow36 :
    confinementScaleRatio⁻¹ = cutExp (cutPi / 3) ^ 36 := by
  rw [confinementScaleRatio_as_inv_pow36, inv_inv]

/-- ★★ THE `M/Λ` NUMERAL: `M/Λ = confinementScaleRatio⁻¹ ∈ [23577·1e12, 23581·1e12]` (≈ 2.358×10¹⁶).
    The inverse confinement suppression — how many confinement scales fit in the octonion ceiling —
    pinned by the 36th-power bracket. -/
theorem invConfinementScaleRatio_bracket :
    (23577 * (10 : Cut) ^ 12) ≤ confinementScaleRatio⁻¹
      ∧ confinementScaleRatio⁻¹ ≤ 23581 * (10 : Cut) ^ 12 := by
  obtain ⟨hElo, hEhi⟩ := cutExp_pi3_bracket
  have hEpos : (0 : Cut) < cutExp (cutPi / 3) := cutExp_pos _
  have hEloPos : (0 : Cut) < 284965 / 100000 := by norm_num
  have hpow_lo : (284965 / 100000 : Cut) ^ 36 ≤ cutExp (cutPi / 3) ^ 36 :=
    pow_le_pow_left₀ (le_of_lt hEloPos) hElo 36
  have hpow_hi : cutExp (cutPi / 3) ^ 36 ≤ (284966 / 100000 : Cut) ^ 36 :=
    pow_le_pow_left₀ (le_of_lt hEpos) hEhi 36
  rw [invConfinementScaleRatio_eq_pow36]
  constructor
  · have hkey : (23577 * (10 : Cut) ^ 12) ≤ (284965 / 100000) ^ 36 := by norm_num
    exact le_trans hkey hpow_lo
  · have hkey : ((284966 / 100000 : Cut)) ^ 36 ≤ 23581 * (10 : Cut) ^ 12 := by norm_num
    exact le_trans hpow_hi hkey

/-! ## (4) THE `v/Λ` RATIO NUMERAL — `confBandRatio = cutExp(8π/3) = cutExp(cutPi/3)^8 ∈ [4347, 4350]`. -/

/-- `v/Λ = confBandRatio = cutExp(8π/3)` is the 8th power of the small-argument exponential
    (`8·(cutPi/3) = 8·cutPi/3`, `cutExp_natMul`). -/
theorem confBandRatio_eq_pow8 :
    confBandRatio = cutExp (cutPi / 3) ^ 8 := by
  rw [confBandRatio_eq]
  have hE : cutExp (8 * (cutPi / 3)) = cutExp (cutPi / 3) ^ 8 := by
    have := cutExp_natMul (cutPi / 3) 8
    simpa using this
  have harg : 8 * cutPi / 3 = 8 * (cutPi / 3) := by ring
  rw [harg, hE]

/-- ★★ THE `v/Λ` NUMERAL: `v/Λ = confBandRatio ∈ [4347, 4350]` (≈ 4348.5). The electroweak-to-
    confinement resolution band ratio, pinned by the 8th-power bracket. Reproduces the ratio of the
    two derived edges `ewEdgeScale/confEdgeScale` (banked `confBand_ratio_from_edges`). -/
theorem confBandRatio_bracket :
    (4347 : Cut) ≤ confBandRatio ∧ confBandRatio ≤ 4350 := by
  obtain ⟨hElo, hEhi⟩ := cutExp_pi3_bracket
  have hEpos : (0 : Cut) < cutExp (cutPi / 3) := cutExp_pos _
  have hEloPos : (0 : Cut) < 284965 / 100000 := by norm_num
  have hpow_lo : (284965 / 100000 : Cut) ^ 8 ≤ cutExp (cutPi / 3) ^ 8 :=
    pow_le_pow_left₀ (le_of_lt hEloPos) hElo 8
  have hpow_hi : cutExp (cutPi / 3) ^ 8 ≤ (284966 / 100000 : Cut) ^ 8 :=
    pow_le_pow_left₀ (le_of_lt hEpos) hEhi 8
  rw [confBandRatio_eq_pow8]
  constructor
  · have hkey : (4347 : Cut) ≤ (284965 / 100000) ^ 8 := by norm_num
    exact le_trans hkey hpow_lo
  · have hkey : ((284966 / 100000 : Cut)) ^ 8 ≤ 4350 := by norm_num
    exact le_trans hpow_hi hkey

/-! ## (5) THE `128/27` CONFINEMENT BAND RE-EMERGES FREE (banked, cited — the same `confBandRatio`). -/

/-- ★★★ THE `128/27` CONFINEMENT BAND, FREE: the exact `cutPi`-free rational screening
    `bandScreen chargeTraceDepth confBandRatio = 128/27` (banked `bandScreen_conf_exact`) is computed
    over the SAME `confBandRatio = v/Λ = cutExp(cutPi/3)^8` this module brackets — so the banked
    confinement band lands from the same `cutExp(cutPi/3)` pipeline, with no new input. -/
theorem confBand_128_27_free :
    bandScreen chargeTraceDepth confBandRatio = 128 / 27 := bandScreen_conf_exact

/-! ## (6) W8 TEETH — ordering, non-degenerate widths, band load-bearing (all FREE from the brackets). -/

/-- ★ W8 (scale ordering, RE-DERIVED FROM THE NUMERALS): the confinement bracket lies entirely below
    the M2 electroweak bracket, which lies entirely below the octonion ceiling `1` — the derived
    scale hierarchy `Λ < v < M` read off the numerals (`confinementScaleRatio` upper end
    `42414/1e21 = 4.2414×10⁻¹⁷` is below `ewClosureRatio` lower end `184405/1e18 = 1.844×10⁻¹³`,
    below `1`). No collapsed/degenerate scale tower. -/
theorem confinement_scale_ordered_from_brackets :
    0 < confinementScaleRatio ∧ confinementScaleRatio < ewClosureRatio ∧ ewClosureRatio < 1 := by
  obtain ⟨hClo, hChi⟩ := confinementScaleRatio_bracket
  obtain ⟨hElo, hEhi⟩ := ewClosureRatio_bracket
  refine ⟨confinementScaleRatio_pos, ?_, ewClosureRatio_lt_one⟩
  have hgap : (42414 / (10 : Cut) ^ 21) < 184405 / (10 : Cut) ^ 18 := by norm_num
  linarith

/-- ★ W8 (non-degenerate widths): each certified bracket has strictly positive width `lo < hi` — the
    numerals are genuine two-sided brackets, not collapsed points. -/
theorem confinement_widths_positive :
    (42408 / (10 : Cut) ^ 21) < 42414 / (10 : Cut) ^ 21
    ∧ (23577 * (10 : Cut) ^ 12) < 23581 * (10 : Cut) ^ 12
    ∧ (4347 : Cut) < 4350 := by
  refine ⟨by norm_num, by norm_num, by norm_num⟩

/-- ★ W8 (band load-bearing): the confinement band is the EXACT `128/27`, NOT the wrong un-normalized
    `128/9` — the `cutPi` genuinely cancels (banked `confBand_screen_ne_wrong`). -/
theorem confBand_128_27_load_bearing :
    bandScreen chargeTraceDepth confBandRatio ≠ 128 / 9 := confBand_screen_ne_wrong

/-! ## (7) THE PEGGED READING — the M1 UnitPeg carries the numeral to the human unit (ONE-PEG LAW). -/

/-- ★ THE PEGGED CONFINEMENT NUMERAL: under ANY M1 unit peg `p`, the human reading
    `p.human confinementScaleRatio` inherits the certified bracket scaled by the SINGLE positive peg
    `p.val` — NO second dimensionful input (THE ONE-PEG LAW). The dimensionless ratios `v/Λ`, `M/Λ`
    are peg-free (M1 `ratio_peg_invariant`); only the overall magnitude scales with the one peg. -/
theorem pegged_confinementScale_bracket (p : UnitPeg) :
    p.val * (42408 / (10 : Cut) ^ 21) ≤ p.human confinementScaleRatio
      ∧ p.human confinementScaleRatio ≤ p.val * (42414 / (10 : Cut) ^ 21) := by
  obtain ⟨hlo, hhi⟩ := confinementScaleRatio_bracket
  unfold UnitPeg.human
  constructor
  · exact mul_le_mul_of_nonneg_left hlo (le_of_lt p.pos)
  · exact mul_le_mul_of_nonneg_left hhi (le_of_lt p.pos)

/-! ## (8) THE WELDED LANDING (non-hollow). -/

/-- ★★ THE M3 LANDING — the confinement scale as a certified numeral, welded:
    (1) the confinement-scale numeral `confinementScaleRatio ∈ [42408/1e21, 42414/1e21]`;
    (2) the `M/Λ` ratio numeral `confinementScaleRatio⁻¹ ∈ [23577·1e12, 23581·1e12]`;
    (3) the `v/Λ` ratio numeral `confBandRatio ∈ [4347, 4350]`;
    (4) the banked `128/27` confinement band re-emerging free over the SAME `confBandRatio`;
    (5) the derived scale ordering `Λ < v < M` re-derived from the numerals (W8);
    (6) under any M1 peg the numeral scales by the one positive peg (ONE-PEG LAW).
    Statable from no single conjunct alone (non-hollow). -/
theorem confinementScaleNumeral_landing :
    ((42408 / (10 : Cut) ^ 21 ≤ confinementScaleRatio
        ∧ confinementScaleRatio ≤ 42414 / (10 : Cut) ^ 21))
    ∧ ((23577 * (10 : Cut) ^ 12 ≤ confinementScaleRatio⁻¹
        ∧ confinementScaleRatio⁻¹ ≤ 23581 * (10 : Cut) ^ 12))
    ∧ ((4347 : Cut) ≤ confBandRatio ∧ confBandRatio ≤ 4350)
    ∧ bandScreen chargeTraceDepth confBandRatio = 128 / 27
    ∧ (0 < confinementScaleRatio ∧ confinementScaleRatio < ewClosureRatio ∧ ewClosureRatio < 1)
    ∧ (∀ p : UnitPeg, p.val * (42408 / (10 : Cut) ^ 21) ≤ p.human confinementScaleRatio
        ∧ p.human confinementScaleRatio ≤ p.val * (42414 / (10 : Cut) ^ 21)) :=
  ⟨confinementScaleRatio_bracket, invConfinementScaleRatio_bracket, confBandRatio_bracket,
   confBand_128_27_free, confinement_scale_ordered_from_brackets, pegged_confinementScale_bracket⟩

end

end Phys.Algebra.ConfNumeral
