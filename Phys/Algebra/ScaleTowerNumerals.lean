/-
  Phys.Algebra.ScaleTowerNumerals — ARC-M M4: THE SCALE-TOWER NUMERALS (SEED_MASSES §M4).
  =====================================================================================
  THE FULL DIMENSIONFUL SKELETON — M, v, Λ AND EVERY DERIVED BAND-EDGE RATIO — AS CERTIFIED
  TWO-SIDED RATIONAL BRACKETS AGAINST THE M1 PEG, ONE PIPELINE, THE BANKED WAY-POINTS FREE.

  ## THE ONE REFRAMING (SEED_MASSES §"THE ONE REFRAMING")

  A dimensionful scale "in GeV" is a pure number TIMES a unit convention. The chain already derived
  the whole scale tower as pure DIMENSIONLESS ratios to the arena's natural closure unit `M_oct := 1`
  — and, decisively, ALL THREE EDGES AND ALL THREE BAND RATIOS ARE POWERS OF THE ONE SMALL-ARGUMENT
  EXPONENTIAL `cutExp(cutPi/3)`:

    · THE OCTONION CEILING  `octEdgeScale = M/M = 1`                        (the cascade stop, exact),
    · THE ELECTROWEAK EDGE  `ewEdgeScale  = v/M = ewClosureRatio = cutExp(−28π/3)`   (M2 bracket),
    · THE CONFINEMENT EDGE  `confEdgeScale = Λ/M = confinementScaleRatio = cutExp(−12π)` (M3 bracket),

    · `M/v = topBandRatio  = cutExp(28π/3) = cutExp(cutPi/3)^28`   (the NEW numeral this module pins),
    · `v/Λ = confBandRatio = cutExp(8π/3)  = cutExp(cutPi/3)^8`    (M3 bracket),
    · `M/Λ = confinementScaleRatio⁻¹ = cutExp(12π) = cutExp(cutPi/3)^36`   (M3 bracket).

  The exponents `28, 8, 36` are the ONE `84π` grammar budget quotiented by the derived dimensions
  (electroweak rung n=9, colour/space gap 8π/3, colour rung 12π). And they ADD:  `28 + 8 = 36`. So the
  three scales are not three independent inputs with a fine-tuning problem between them — they are ONE
  geometric ladder in `cutExp(cutPi/3)`, and the composition `(M/v)·(v/Λ) = M/Λ` is the EXACT
  exponent-addition identity `cutExp(cutPi/3)^28 · cutExp(cutPi/3)^8 = cutExp(cutPi/3)^36`. This module
  AIMS arc-D's certified bracket instrument (D1) at the last un-evaluated edge ratio `M/v` and welds the
  full skeleton, with the composition tooth and the five banked exact way-points re-emerging free.

  ## THE BRACKET PIPELINE (every rational kernel-checkable; no float, no kernel-compiled decision)

    (1) `cutExp(cutPi/3) ∈ [284965/1e5, 284966/1e5]`               (banked M2 `cutExp_pi3_bracket`).
    (2) `M/v = topBandRatio = cutExp(28π/3) = cutExp(cutPi/3)^28`   (`cutExp_natMul`, `topBandRatio_eq`).
    (3) `topBandRatio ∈ [54220·1e8, 54226·1e8]` (≈ 5.422×10¹²)      (the 28th-power bracket, `norm_num`).
    (4) THE COMPOSITION TOOTH: `topBandRatio · confBandRatio = confinementScaleRatio⁻¹`
        (`cutExp(cutPi/3)^28 · cutExp(cutPi/3)^8 = cutExp(cutPi/3)^36`, `pow_add`) — the ONE-ladder
        consistency: the M/v and v/Λ numerals compose EXACTLY to the M/Λ numeral. No new input.
    (5) THE FIVE WAY-POINTS re-emerge free over the SAME edges: `42` (`invAlphaZero_nil`), `448/27`
        (`bandScreen_topBand_exact`), `128/27` (`bandScreen_conf_exact`), `1582/27`
        (`invAlphaZero_topBand_value`), `190/3` (`derivedBandList_assembly`).

  ## THE ONE-PEG LAW (SEED_MASSES §"HARD GUARDS", cited — NOT duplicated)

  Every edge scale is a pure dimensionless ratio to `M_oct := 1`; the brackets are on THOSE ratios. The
  M1 `UnitPeg` only converts to a human unit — NO second dimensionful input appears. `pegged_edges`
  shows the human readings `p.human (M,v,Λ)` inherit the brackets by multiplying by the SINGLE positive
  peg `p.val` (M reads exactly `p.val` by `peg_fixes_Moct`); the band RATIOS are peg-free (M1
  `ratio_peg_invariant`).

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2)

  Delete "mass / scale / hierarchy / electroweak / confinement / edge / peg": pure mathematics survives
  — a certified two-sided rational inequality `lo < x < hi` for the specific derived `Cut` number
  `topBandRatio`, the exact exponent-addition identity `topBandRatio · confBandRatio =
  confinementScaleRatio⁻¹`, an ordering of derived positives, non-degenerate widths, and the banked
  exact rationals `42, 448/27, 128/27, 1582/27, 190/3`. No physics word does any logical work; a
  physicist READS the scale-tower numerals out of the theorems.

  ## GRADE / DISCIPLINE

  THEOREM-EXACT: certified two-sided rational inequalities and exact identities of the derived `Cut`,
  foundations-only (`⊆ {propext, Classical.choice, Quot.sound}`). NO measured scale (M_Planck, v, Λ_QCD,
  GeV) in any statement or proof — the comparison is removable prose ONLY; the beyond-measurement digits
  are the STANDING PREDICTION. Ground field the DERIVED `Cut`, NOT Mathlib-ℝ. NO `Real.*` as content, NO
  kernel-compiled decisions, NO floats, NO unfinished proof, NO posited axiom. Import guard: NEVER
  `Phys/OneAxiom/*`; NO Mathlib ℝ/ℂ as load-bearing content. THE ONE-PEG LAW: exactly ONE flagged
  dimensionful convention (M1 `UnitPeg`), cited, never duplicated — no second dimensionful input.

  CARRIED NOTE (deferred-D7, arc-D standing debt, NOT a runway): D's ≥15-sig-digit AS-`1/α(0)` restate
  resumes AFTER the absolute-scale skeleton is complete.
-/
import Phys.Algebra.ConfinementScaleNumeral
import Phys.Algebra.BandEdgeList
import Phys.Algebra.LeptonMassNumerals
import Phys.Algebra.UnitPeg
import Phys.Foundation.ContinuumBracket
import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

namespace Phys.Algebra.TowerNumerals

open Phys.Algebra Phys.Algebra.LeptonNumerals Phys.Algebra.ConfNumeral
open Phys.Algebra.BandEdgeList Phys.Algebra.Peg
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (1) THE `M/v` RECIPROCAL-POWER FORM — `topBandRatio = cutExp(cutPi/3)^28`. -/

/-- ★ `M/v = topBandRatio = cutExp(cutPi/3)^28`. The banked `topBandRatio_eq : topBandRatio =
    cutExp(28·cutPi/3)` and `28·cutPi/3 = 28·(cutPi/3)`, so `cutExp_natMul` turns the natural multiple
    into a 28th power of the small-argument value. Mirrors M3's `confBandRatio_eq_pow8`. -/
theorem topBandRatio_eq_pow28 : topBandRatio = cutExp (cutPi / 3) ^ 28 := by
  rw [topBandRatio_eq]
  have hE : cutExp (28 * (cutPi / 3)) = cutExp (cutPi / 3) ^ 28 := by
    have := cutExp_natMul (cutPi / 3) 28
    simpa using this
  have harg : 28 * cutPi / 3 = 28 * (cutPi / 3) := by ring
  rw [harg, hE]

/-! ## (2) ★ THE `M/v` SCALE NUMERAL — `topBandRatio ∈ [54220·1e8, 54226·1e8]`. -/

/-- ★★★ THE `M/v` NUMERAL: `M/v = topBandRatio ∈ [54220·1e8, 54226·1e8]` (≈ 5.422×10¹²). The ratio of
    the octonion ceiling to the electroweak edge, pinned via the 28th power of the small-argument exp
    bracket. The reciprocal of the M2 electroweak edge `ewClosureRatio` — the last un-evaluated
    band-edge ratio of the tower. Forced from the fold with NO free parameter. Removable-prose reading:
    against the M1 peg this is the standing prediction for the ratio of the octonion/gravitational
    ceiling to the electroweak scale; the GeV comparison is prose. -/
theorem topBandRatio_bracket :
    (54220 * (10 : Cut) ^ 8) ≤ topBandRatio ∧ topBandRatio ≤ 54226 * (10 : Cut) ^ 8 := by
  obtain ⟨hElo, hEhi⟩ := cutExp_pi3_bracket
  have hEpos : (0 : Cut) < cutExp (cutPi / 3) := cutExp_pos _
  have hEloPos : (0 : Cut) < 284965 / 100000 := by norm_num
  have hpow_lo : (284965 / 100000 : Cut) ^ 28 ≤ cutExp (cutPi / 3) ^ 28 :=
    pow_le_pow_left₀ (le_of_lt hEloPos) hElo 28
  have hpow_hi : cutExp (cutPi / 3) ^ 28 ≤ (284966 / 100000 : Cut) ^ 28 :=
    pow_le_pow_left₀ (le_of_lt hEpos) hEhi 28
  rw [topBandRatio_eq_pow28]
  constructor
  · have hkey : (54220 * (10 : Cut) ^ 8) ≤ (284965 / 100000) ^ 28 := by norm_num
    exact le_trans hkey hpow_lo
  · have hkey : ((284966 / 100000 : Cut)) ^ 28 ≤ 54226 * (10 : Cut) ^ 8 := by norm_num
    exact le_trans hpow_hi hkey

/-- `M/v = topBandRatio` is a genuine positive derived scale ratio (banked `topBandRatio_gt_one`). -/
theorem topBandRatio_pos : (0 : Cut) < topBandRatio :=
  lt_trans one_pos topBandRatio_gt_one

/-! ## (3) ★ THE COMPOSITION TOOTH — `(M/v)·(v/Λ) = M/Λ`, the ONE-ladder consistency. -/

/-- ★★★ THE COMPOSITION TOOTH: `topBandRatio · confBandRatio = confinementScaleRatio⁻¹`, i.e.
    `(M/v)·(v/Λ) = M/Λ`. Because all three ratios are powers of the SAME small-argument exponential
    (`topBandRatio = cutExp(cutPi/3)^28`, `confBandRatio = cutExp(cutPi/3)^8`,
    `confinementScaleRatio⁻¹ = cutExp(cutPi/3)^36`), the composition is the EXACT exponent-addition
    identity `cutExp(cutPi/3)^28 · cutExp(cutPi/3)^8 = cutExp(cutPi/3)^36` (`28 + 8 = 36`, `pow_add`).
    The M/v and v/Λ numerals compose EXACTLY into the M/Λ numeral — the scale tower is ONE geometric
    ladder, not three independent inputs; there is no fine-tuning DOF between the rungs. -/
theorem tower_ratio_composition :
    topBandRatio * confBandRatio = confinementScaleRatio⁻¹ := by
  rw [topBandRatio_eq_pow28, confBandRatio_eq_pow8, invConfinementScaleRatio_eq_pow36,
    ← pow_add]

/-! ## (4) THE FULL SKELETON — THE THREE EDGES PEGGED (M, v, Λ against the M1 peg). -/

/-- ★ THE OCTONION-CEILING EDGE PEGGED: `p.human octEdgeScale = p.val` — since `octEdgeScale = M/M = 1`,
    the human value of the octonion ceiling is exactly the one peg (`peg_fixes_Moct`). The tower's top
    rung IS the peg. -/
theorem pegged_octEdge (p : UnitPeg) : p.human octEdgeScale = p.val := by
  show p.human 1 = p.val
  exact peg_fixes_Moct p

/-- ★ THE ELECTROWEAK EDGE PEGGED: under any M1 peg `p`, the human value `p.human ewEdgeScale = v`
    inherits the M2 bracket scaled by the SINGLE positive peg — `[p.val·184405/1e18, p.val·184445/1e18]`.
    NO second dimensionful input (THE ONE-PEG LAW). -/
theorem pegged_ewEdge (p : UnitPeg) :
    p.val * (184405 / (10 : Cut) ^ 18) ≤ p.human ewEdgeScale
      ∧ p.human ewEdgeScale ≤ p.val * (184445 / (10 : Cut) ^ 18) := by
  obtain ⟨hlo, hhi⟩ := ewClosureRatio_bracket
  show p.val * _ ≤ p.val * ewClosureRatio ∧ p.val * ewClosureRatio ≤ p.val * _
  constructor
  · exact mul_le_mul_of_nonneg_left hlo (le_of_lt p.pos)
  · exact mul_le_mul_of_nonneg_left hhi (le_of_lt p.pos)

/-- ★ THE CONFINEMENT EDGE PEGGED: under any M1 peg `p`, the human value `p.human confEdgeScale = Λ`
    inherits the M3 bracket scaled by the SINGLE positive peg — `[p.val·42408/1e21, p.val·42414/1e21]`.
    NO second dimensionful input (THE ONE-PEG LAW). -/
theorem pegged_confEdge (p : UnitPeg) :
    p.val * (42408 / (10 : Cut) ^ 21) ≤ p.human confEdgeScale
      ∧ p.human confEdgeScale ≤ p.val * (42414 / (10 : Cut) ^ 21) := by
  obtain ⟨hlo, hhi⟩ := confinementScaleRatio_bracket
  show p.val * _ ≤ p.val * confinementScaleRatio ∧ p.val * confinementScaleRatio ≤ p.val * _
  constructor
  · exact mul_le_mul_of_nonneg_left hlo (le_of_lt p.pos)
  · exact mul_le_mul_of_nonneg_left hhi (le_of_lt p.pos)

/-! ## (5) THE THREE BAND-RATIO NUMERALS COLLECTED (M/v new, v/Λ and M/Λ from M3). -/

/-- ★★ THE THREE BAND-RATIO NUMERALS, one ladder: `M/v = topBandRatio ∈ [54220·1e8, 54226·1e8]` (this
    module), `v/Λ = confBandRatio ∈ [4347, 4350]` (M3), `M/Λ = confinementScaleRatio⁻¹ ∈ [23577·1e12,
    23581·1e12]` (M3). All three pinned by powers of the SAME `cutExp(cutPi/3)`. -/
theorem bandRatio_numerals :
    ((54220 * (10 : Cut) ^ 8) ≤ topBandRatio ∧ topBandRatio ≤ 54226 * (10 : Cut) ^ 8)
    ∧ ((4347 : Cut) ≤ confBandRatio ∧ confBandRatio ≤ 4350)
    ∧ ((23577 * (10 : Cut) ^ 12) ≤ confinementScaleRatio⁻¹
        ∧ confinementScaleRatio⁻¹ ≤ 23581 * (10 : Cut) ^ 12) :=
  ⟨topBandRatio_bracket, confBandRatio_bracket, invConfinementScaleRatio_bracket⟩

/-! ## (6) THE FIVE BANKED WAY-POINTS RE-EMERGE FREE (over the SAME derived edges). -/

/-- ★★★ THE FIVE EXACT WAY-POINTS, FREE: the octonion ceiling `42` (`invAlphaZero_nil`), the top band
    `448/27` (`bandScreen_topBand_exact`), the confinement band `128/27` (`bandScreen_conf_exact`), the
    electroweak way-point `1582/27` (`invAlphaZero_topBand_value`), and the confinement way-point `190/3`
    (`derivedBandList_assembly`) — all EXACT banked rationals of `Cut` computed over the SAME derived
    edges (`topBandRatio`, `confBandRatio`) that this module brackets. The dimensionful skeleton and the
    dimensionless coupling readings share ONE derived tower; the way-points fall out free. -/
theorem waypoints_free :
    invAlphaZero [] = 42
    ∧ bandScreen chargeTraceDepth topBandRatio = 448 / 27
    ∧ bandScreen chargeTraceDepth confBandRatio = 128 / 27
    ∧ invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27
    ∧ invAlphaZero derivedBandList = 190 / 3 :=
  ⟨invAlphaZero_nil, bandScreen_topBand_exact, bandScreen_conf_exact,
   invAlphaZero_topBand_value, derivedBandList_assembly⟩

/-! ## (7) W8 TEETH — ratio ordering, non-degenerate widths, non-trivial composition. -/

/-- ★ W8 (edge ordering): the three edge scales are strictly ordered `Λ < v < M` (banked
    `edges_ordered`) — a genuine derived scale hierarchy, not a collapsed tower. -/
theorem tower_edges_ordered : confEdgeScale < ewEdgeScale ∧ ewEdgeScale < octEdgeScale :=
  edges_ordered

/-- ★ W8 (ratio ordering, RE-DERIVED FROM THE NUMERALS): the band ratios are strictly ordered
    `M/v > v/Λ > 1` — the `M/v` bracket lies entirely above the `v/Λ` bracket (`54220·1e8 > 4350`),
    which lies entirely above `1` (`4347 > 1`). The two derived band ratios are genuinely distinct
    large numbers. -/
theorem bandRatio_ordered_from_brackets :
    1 < confBandRatio ∧ confBandRatio < topBandRatio := by
  obtain ⟨hclo, hchi⟩ := confBandRatio_bracket
  obtain ⟨htlo, hthi⟩ := topBandRatio_bracket
  constructor
  · linarith [confBandRatio_gt_one]
  · have hgap : (4350 : Cut) < 54220 * (10 : Cut) ^ 8 := by norm_num
    linarith

/-- ★ W8 (non-degenerate widths): each certified band-ratio bracket has strictly positive width
    `lo < hi` — the numerals are genuine two-sided brackets, not collapsed points. -/
theorem tower_widths_positive :
    (54220 * (10 : Cut) ^ 8) < 54226 * (10 : Cut) ^ 8
    ∧ (4347 : Cut) < 4350
    ∧ (23577 * (10 : Cut) ^ 12) < 23581 * (10 : Cut) ^ 12 := by
  refine ⟨by norm_num, by norm_num, by norm_num⟩

/-- ★ W8 (composition non-trivial): the composed ratio `topBandRatio · confBandRatio =
    confinementScaleRatio⁻¹ = M/Λ` is a genuine large scale `> 23576·1e12` (strictly below the M3
    bracket lower end `23577·1e12`), NOT a degenerate `1` — the exponent-addition ladder genuinely
    climbs `28 + 8 = 36` rungs. -/
theorem composition_nontrivial : (23576 * (10 : Cut) ^ 12) < topBandRatio * confBandRatio := by
  rw [tower_ratio_composition]
  obtain ⟨hlo, hhi⟩ := invConfinementScaleRatio_bracket
  have hgap : (23576 * (10 : Cut) ^ 12) < 23577 * (10 : Cut) ^ 12 := by norm_num
  linarith [hlo]

/-! ## (8) THE WELDED LANDING (non-hollow). -/

/-- ★★ THE M4 LANDING — the full dimensionful skeleton as certified numerals, welded:
    (1) the `M/v` scale numeral `topBandRatio ∈ [54220·1e8, 54226·1e8]` (the NEW numeral);
    (2) the composition tooth `topBandRatio · confBandRatio = confinementScaleRatio⁻¹` (the ONE-ladder
        consistency, the exponent-addition `28 + 8 = 36`);
    (3) the three edges pegged against the M1 peg (`M = p.val`, `v` and `Λ` scaled by the one peg);
    (4) the three band-ratio numerals collected (M/v new, v/Λ and M/Λ from M3);
    (5) the five banked exact way-points re-emerging free over the SAME edges;
    (6) the derived scale hierarchy `Λ < v < M` and the ratio ordering `M/v > v/Λ > 1` (W8).
    Statable from no single conjunct alone (non-hollow). -/
theorem scaleTowerNumerals_landing :
    ((54220 * (10 : Cut) ^ 8 ≤ topBandRatio ∧ topBandRatio ≤ 54226 * (10 : Cut) ^ 8))
    ∧ (topBandRatio * confBandRatio = confinementScaleRatio⁻¹)
    ∧ (∀ p : UnitPeg, p.human octEdgeScale = p.val)
    ∧ (∀ p : UnitPeg, p.val * (184405 / (10 : Cut) ^ 18) ≤ p.human ewEdgeScale
        ∧ p.human ewEdgeScale ≤ p.val * (184445 / (10 : Cut) ^ 18))
    ∧ (∀ p : UnitPeg, p.val * (42408 / (10 : Cut) ^ 21) ≤ p.human confEdgeScale
        ∧ p.human confEdgeScale ≤ p.val * (42414 / (10 : Cut) ^ 21))
    ∧ (((54220 * (10 : Cut) ^ 8) ≤ topBandRatio ∧ topBandRatio ≤ 54226 * (10 : Cut) ^ 8)
        ∧ ((4347 : Cut) ≤ confBandRatio ∧ confBandRatio ≤ 4350)
        ∧ ((23577 * (10 : Cut) ^ 12) ≤ confinementScaleRatio⁻¹
            ∧ confinementScaleRatio⁻¹ ≤ 23581 * (10 : Cut) ^ 12))
    ∧ (invAlphaZero [] = 42
        ∧ bandScreen chargeTraceDepth topBandRatio = 448 / 27
        ∧ bandScreen chargeTraceDepth confBandRatio = 128 / 27
        ∧ invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27
        ∧ invAlphaZero derivedBandList = 190 / 3)
    ∧ (confEdgeScale < ewEdgeScale ∧ ewEdgeScale < octEdgeScale)
    ∧ (1 < confBandRatio ∧ confBandRatio < topBandRatio) :=
  ⟨topBandRatio_bracket, tower_ratio_composition, pegged_octEdge, pegged_ewEdge, pegged_confEdge,
   bandRatio_numerals, waypoints_free, tower_edges_ordered, bandRatio_ordered_from_brackets⟩

end

end Phys.Algebra.TowerNumerals
