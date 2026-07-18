/-
  Phys.Algebra.HeavyQuarkNumerals — ARC-M M5: THE HEAVY QUARK SECTOR (SEED_MASSES §M5).
  =====================================================================================
  THE HEAVY-SECTOR QUARK MASS RATIOS — THE FOLD PHASE'S OWN ℍ-LEVEL BORN WEIGHT — EVALUATED AS
  CERTIFIED TWO-SIDED RATIONAL BRACKETS AGAINST THE M1 PEG, ONE PIPELINE, THE M3/M4 ANCHORS RE-USED.

  ## THE ONE REFRAMING (SEED_MASSES §"THE ONE REFRAMING")

  Standard physics treats the heavy quark masses (top, bottom, charm) as FREE Yukawa couplings — the
  single largest block of the Standard Model's undetermined parameters. The chain already derived the
  heavy cross-sector ratio as a pure DIMENSIONLESS derived `Cut`, forced from the fold with NO free
  parameter — the ℍ-level fold phase's OWN Born weight (banked, THEOREM-EXACT):

    `mbRatioDerived = (1 − q)² / (3·(1 + q))`,   `q := cutCos(cutPi/4)`,  `q² = 1/2`,  `0 < q < 1`,

  the up/down heaviest-to-heaviest cross-sector ratio `(Md/Mu)² = m_b/m_t` (N416/N417 fold phase
  `P = cutPi/8`, the third rung of the amplitude-halving cascade `J² = −1 → π/2 → π/4 → π/8`, times
  the banked self-blind survival `2/3`, N308). The reciprocal `1/mbRatioDerived` is the charm-band
  edge structure `edgeCharm` (banked `edgeCharm_pinned`). The down/confinement offset squared

    `downConfBundle = mbRatioDerived / confBundle = mbRatioDerived · confBandRatio`,   `(Md/Mλ)²`,

  divides the up/down weight by the banked confinement bundle `Λ/v = confBundle = confBandRatio⁻¹`
  (M3 `confBandRatio`). This module AIMS arc-D's certified bracket instrument (D1, via the banked
  `cutCos(cutPi/4)` bracket and the M3 `confBandRatio` bracket) at those forced closed forms and reads
  off certified two-sided rational brackets for the heavy-sector ratios — the free Yukawa dial
  DISSOLVED into a determined derived number.

  ## THE BRACKET PIPELINE (every rational kernel-checkable; no float, no kernel-compiled decision)

    (1) `q = cutCos(cutPi/4) ∈ [7071/1e4, 707107/1e6]`         (banked M2 `cutCos_quarter_bracket`).
    (2) `mbRatioDerived = (1 − q)²/(3(1 + q))` (banked `mbRatioDerived_closed`), the closed form is
        DECREASING in `q` on `(0,1)`; with `q² = 1/2` (`q_sq`) the two-sided inequality collapses to
        linear-in-`q`, so `nlinarith` pins  `mbRatioDerived ∈ [167505/1e7, 167522/1e7]` (≈ 1.675×10⁻²).
    (3) `1/mbRatioDerived ∈ [5969/100, 5971/100]` (≈ 59.70) from (2) + positivity
        (`one_div_le_one_div_of_le`) — the banked charm-band edge `edgeCharm = 1/mbRatioDerived`.
    (4) `downConfBundle = mbRatioDerived · confBandRatio` (this module `downConfBundle_as_mul`), the
        product of the (2) bracket and the M3 `confBandRatio ∈ [4347, 4350]` bracket:
        `downConfBundle ∈ [7280/100, 7288/100]` (≈ 72.83) — the down/confinement offset squared,
        the SAME `confBandRatio = v/Λ` the M3 numeral brackets (way-point re-use, no new input).

  ## THE ONE-PEG LAW (SEED_MASSES §"HARD GUARDS", cited — NOT duplicated)

  Each heavy-sector ratio is a pure dimensionless ratio to `M_oct := 1`; the brackets are on THOSE
  ratios. The M1 `UnitPeg` only converts to a human unit — NO second dimensionful input appears.
  `pegged_mbRatio_bracket` shows the human reading inherits the bracket by multiplying by the SINGLE
  positive peg; the ratios themselves are peg-free (M1 `ratio_peg_invariant`).

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2)

  Delete "quark / heavy / top / bottom / charm / mass / ratio / fold-phase / confinement / peg": pure
  mathematics survives — certified two-sided rational inequalities `lo < x < hi` for the specific
  derived `Cut` numbers `mbRatioDerived`, `1/mbRatioDerived`, `downConfBundle`, a strict ordering, and
  non-degenerate widths. No physics word does any logical work; a physicist READS the heavy-quark
  numerals out of the theorems.

  ## GRADE / DISCIPLINE

  THEOREM-EXACT: certified two-sided rational inequalities of the derived `Cut`, foundations-only
  (`⊆ {propext, Classical.choice, Quot.sound}`). The evaluated objects are the banked THEOREM-EXACT
  closed forms `mbRatioDerived` (the fold-phase Born weight), its reciprocal, and `downConfBundle`.
  ⚠ HONEST GRADE (SEED_MASSES §M5, Z3 `QuarkTexture`): the CROSS-SECTOR heavy ratios (m_b/m_t and the
  down/confinement offset) are THEOREM-EXACT closed forms and are bracketed here; the precise
  WITHIN-sector individual numerical quark ratios (top vs charm inside the up sector) remain
  route-not-yet-found (the deviated individual-sector phase on the Fano line + the ℝ-descent, Z3/N344)
  and are NOT asserted or faked here. NO measured quark mass in any statement or proof — the physical
  m_b/m_t comparison is removable prose ONLY; the beyond-measurement digits are the STANDING
  PREDICTION. Ground field the DERIVED `Cut`, NOT Mathlib-ℝ. NO `Real.*` as content, NO
  kernel-compiled decisions, NO floats, NO unfinished proof, NO posited axiom. Import guard: NEVER
  `Phys/OneAxiom/*`; NO Mathlib ℝ/ℂ as load-bearing content. THE ONE-PEG LAW: exactly ONE flagged
  dimensionful convention (M1 `UnitPeg`), cited, never duplicated — no second dimensionful input.

  CARRIED NOTE (deferred-D7, arc-D standing debt, NOT a runway): D's ≥15-sig-digit AS-`1/α(0)` restate
  resumes AFTER the absolute-scale skeleton is complete.
-/
import Phys.Algebra.DownConfinementRelativeScale
import Phys.Algebra.ConfinementScaleNumeral
import Phys.Algebra.UnitPeg
import Phys.Foundation.ContinuumBracket
import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

namespace Phys.Algebra.HeavyQuarkNumerals

open Phys.Algebra Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.DownConfinementRelativeScale Phys.Algebra.BandEdgeList
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.ConfNumeral Phys.Algebra.LeptonNumerals Phys.Algebra.Peg
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (1) THE FOLD-PHASE AMPLITUDE BRACKET — `q = cutCos(cutPi/4) ∈ [7071/1e4, 707107/1e6]`. -/

/-- `q = cutCos(cutPi/4) ∈ [7071/1e4, 707107/1e6]` — the ℍ-level Born amplitude, from the banked M2
    `cutCos_quarter_bracket` (`cos(π/4)² = 1/2`, `0 < cos(π/4)`). -/
theorem q_bracket : (7071 / 10000 : Cut) ≤ q ∧ q ≤ 707107 / 1000000 :=
  cutCos_quarter_bracket

/-! ## (2) ★ THE HEAVY CROSS-SECTOR RATIO NUMERAL — `mbRatioDerived ∈ [167505/1e7, 167522/1e7]`. -/

/-- ★★★ THE HEAVY CROSS-SECTOR RATIO NUMERAL: `m_b/m_t = (Md/Mu)² = mbRatioDerived ∈
    [167505/1e7, 167522/1e7]` (≈ 1.675×10⁻²). The up/down heaviest-to-heaviest cross-sector ratio is
    the fold phase's OWN ℍ-level Born weight `(1 − q)²/(3(1 + q))` with `q = cos(π/4)`, `q² = 1/2` —
    FORCED from the fold with NO free Yukawa parameter. Pinned by `nlinarith`: the closed form is
    decreasing in `q`, and `q² = 1/2` collapses the two-sided inequality to linear-in-`q`.
    Removable-prose reading: against the M1 peg this is the standing prediction for the bottom/top
    mass ratio; the PDG comparison is prose. -/
theorem mbRatio_bracket :
    (167505 / (10 : Cut) ^ 7) ≤ mbRatioDerived
      ∧ mbRatioDerived ≤ 167522 / (10 : Cut) ^ 7 := by
  obtain ⟨hqlo, hqhi⟩ := q_bracket
  have hq2 := q_sq
  have hqpos := q_pos
  have h3 : (0 : Cut) < 3 * (1 + q) := by linarith
  rw [mbRatioDerived_closed]
  constructor
  · rw [le_div_iff₀ h3]; nlinarith [hq2, hqhi, hqpos]
  · rw [div_le_iff₀ h3]; nlinarith [hq2, hqlo, hqpos]

/-- `mbRatioDerived` is a genuine positive derived ratio (banked `mbRatioDerived_pos`). -/
theorem mbRatio_pos : (0 : Cut) < mbRatioDerived := mbRatioDerived_pos

/-! ## (3) ★ THE RECIPROCAL (charm-band edge) NUMERAL — `1/mbRatioDerived ∈ [5969/100, 5971/100]`. -/

/-- ★★ THE RECIPROCAL NUMERAL: `1/mbRatioDerived ∈ [5969/100, 5971/100]` (≈ 59.70). This is the banked
    charm-band edge structure `edgeCharm = 1/mbRatioDerived` (`edgeCharm_pinned`): the top-over-bottom
    inverse heavy cross-ratio, pinned from the `mbRatioDerived` bracket by reciprocal-monotonicity. -/
theorem invMbRatio_bracket :
    (5969 / 100 : Cut) ≤ 1 / mbRatioDerived
      ∧ 1 / mbRatioDerived ≤ 5971 / 100 := by
  obtain ⟨hlo, hhi⟩ := mbRatio_bracket
  have hpos : (0 : Cut) < mbRatioDerived := mbRatioDerived_pos
  have hlopos : (0 : Cut) < 167505 / (10 : Cut) ^ 7 := by norm_num
  constructor
  · have h1 : 1 / (167522 / (10 : Cut) ^ 7) ≤ 1 / mbRatioDerived :=
      one_div_le_one_div_of_le hpos hhi
    have h2 : (5969 / 100 : Cut) ≤ 1 / (167522 / (10 : Cut) ^ 7) := by norm_num
    linarith
  · have h1 : 1 / mbRatioDerived ≤ 1 / (167505 / (10 : Cut) ^ 7) :=
      one_div_le_one_div_of_le hlopos hlo
    have h2 : (1 / (167505 / (10 : Cut) ^ 7) : Cut) ≤ 5971 / 100 := by norm_num
    linarith

/-! ## (4) ★ THE DOWN/CONFINEMENT OFFSET NUMERAL — `downConfBundle ∈ [7280/100, 7288/100]`. -/

/-- `downConfBundle = mbRatioDerived · confBandRatio`. The banked `downConfBundle = mbRatioDerived /
    confBundle` (N-DownConf) and `confBandRatio = confBundle⁻¹` (M3 `BandEdgeList`), so dividing by the
    confinement bundle is multiplying by the M3 band ratio — the pipeline re-uses the M3 numeral. -/
theorem downConfBundle_as_mul : downConfBundle = mbRatioDerived * confBandRatio := by
  show mbRatioDerived / confBundle = mbRatioDerived * confBandRatio
  rw [div_eq_mul_inv]
  rfl

/-- ★★★ THE DOWN/CONFINEMENT OFFSET NUMERAL: `(Md/Mλ)² = downConfBundle ∈ [7280/100, 7288/100]`
    (≈ 72.83). The up/down fold-phase Born weight `mbRatioDerived` DIVIDED by the banked confinement
    bundle `Λ/v = confBundle` — i.e. TIMES the M3 band ratio `confBandRatio = v/Λ ∈ [4347, 4350]`, the
    SAME `confBandRatio` the M3 numeral brackets. Forced from the fold with NO free parameter.
    Removable-prose reading: against the M1 peg this is the standing prediction for the down-sector to
    confinement-scale offset squared; the MeV comparison is prose. -/
theorem downConfBundle_bracket :
    (7280 / 100 : Cut) ≤ downConfBundle ∧ downConfBundle ≤ 7288 / 100 := by
  obtain ⟨hmlo, hmhi⟩ := mbRatio_bracket
  obtain ⟨hclo, hchi⟩ := confBandRatio_bracket
  have hmpos : (0 : Cut) < mbRatioDerived := mbRatioDerived_pos
  rw [downConfBundle_as_mul]
  constructor
  · have hprod : (167505 / (10 : Cut) ^ 7) * 4347 ≤ mbRatioDerived * confBandRatio :=
      mul_le_mul hmlo hclo (by norm_num) (le_of_lt hmpos)
    have hkey : (7280 / 100 : Cut) ≤ (167505 / (10 : Cut) ^ 7) * 4347 := by norm_num
    linarith
  · have hprod : mbRatioDerived * confBandRatio ≤ (167522 / (10 : Cut) ^ 7) * 4350 :=
      mul_le_mul hmhi hchi (le_of_lt (lt_of_lt_of_le (by norm_num) hclo)) (by norm_num)
    have hkey : (167522 / (10 : Cut) ^ 7) * 4350 ≤ 7288 / 100 := by norm_num
    linarith

/-! ## (5) THE THREE HEAVY-SECTOR NUMERALS COLLECTED. -/

/-- ★★ THE THREE HEAVY-SECTOR RATIO NUMERALS, one pipeline: `m_b/m_t = mbRatioDerived ∈
    [167505/1e7, 167522/1e7]` (the fold-phase Born weight), `1/mbRatioDerived ∈ [5969/100, 5971/100]`
    (the charm-band edge reciprocal), `(Md/Mλ)² = downConfBundle ∈ [7280/100, 7288/100]` (the
    down/confinement offset). All grounded on the SAME banked `q = cos(π/4)` amplitude and the M3
    `confBandRatio`. -/
theorem heavyQuark_numerals :
    ((167505 / (10 : Cut) ^ 7) ≤ mbRatioDerived ∧ mbRatioDerived ≤ 167522 / (10 : Cut) ^ 7)
    ∧ ((5969 / 100 : Cut) ≤ 1 / mbRatioDerived ∧ 1 / mbRatioDerived ≤ 5971 / 100)
    ∧ ((7280 / 100 : Cut) ≤ downConfBundle ∧ downConfBundle ≤ 7288 / 100) :=
  ⟨mbRatio_bracket, invMbRatio_bracket, downConfBundle_bracket⟩

/-! ## (6) W8 TEETH — ordering, non-degenerate widths, suppression (all FREE from the brackets). -/

/-- ★ W8 (suppression, RE-DERIVED FROM THE NUMERAL): the heavy cross-sector ratio is a genuine
    suppression `mbRatioDerived < 1` — the up/down hierarchy is real, not a collapsed `1`; the bracket
    upper end `167522/1e7 ≈ 0.0168` lies entirely below `1`. -/
theorem mbRatio_lt_one_from_bracket : mbRatioDerived < 1 := by
  obtain ⟨_, hhi⟩ := mbRatio_bracket
  have : (167522 / (10 : Cut) ^ 7) < 1 := by norm_num
  linarith

/-- ★ W8 (offset ordering, RE-DERIVED FROM THE NUMERALS): the down/confinement offset genuinely LIFTS
    the bare up/down weight — `mbRatioDerived < downConfBundle` — because dividing by `confBundle < 1`
    (multiplying by `confBandRatio > 1`) lifts it: the `mbRatioDerived` bracket lies entirely below the
    `downConfBundle` bracket (`167522/1e7 < 7280/100`). The two heavy-sector legs are genuinely
    distinct. -/
theorem offset_ordered_from_brackets : mbRatioDerived < downConfBundle := by
  obtain ⟨_, hmhi⟩ := mbRatio_bracket
  obtain ⟨hdlo, _⟩ := downConfBundle_bracket
  have hgap : (167522 / (10 : Cut) ^ 7) < 7280 / 100 := by norm_num
  linarith

/-- ★ W8 (non-degenerate widths): each certified heavy-sector bracket has strictly positive width
    `lo < hi` — the numerals are genuine two-sided brackets, not collapsed points. -/
theorem heavyQuark_widths_positive :
    (167505 / (10 : Cut) ^ 7) < 167522 / (10 : Cut) ^ 7
    ∧ (5969 / 100 : Cut) < 5971 / 100
    ∧ (7280 / 100 : Cut) < 7288 / 100 := by
  refine ⟨by norm_num, by norm_num, by norm_num⟩

/-- ★ W8 (fold-phase factor genuinely bites): the heavy ratio is strictly below the bare banked
    self-blind survival `2/3` — a WRONG "the fold-phase factor is trivial (= 1)" reading would give
    `mbRatioDerived = 2/3`; the numeral's upper end lies far below `2/3`. -/
theorem mbRatio_ne_survival_from_bracket : mbRatioDerived < 2 / 3 := by
  obtain ⟨_, hhi⟩ := mbRatio_bracket
  have : (167522 / (10 : Cut) ^ 7) < 2 / 3 := by norm_num
  linarith

/-! ## (7) THE PEGGED READING — the M1 UnitPeg carries the numeral to the human unit (ONE-PEG LAW). -/

/-- ★ THE PEGGED HEAVY-RATIO NUMERAL: under ANY M1 unit peg `p`, the human reading
    `p.human mbRatioDerived` inherits the certified bracket scaled by the SINGLE positive peg `p.val`
    — NO second dimensionful input (THE ONE-PEG LAW). The dimensionless ratio itself is peg-free
    (M1 `ratio_peg_invariant`); only the overall magnitude scales with the one peg. -/
theorem pegged_mbRatio_bracket (p : UnitPeg) :
    p.val * (167505 / (10 : Cut) ^ 7) ≤ p.human mbRatioDerived
      ∧ p.human mbRatioDerived ≤ p.val * (167522 / (10 : Cut) ^ 7) := by
  obtain ⟨hlo, hhi⟩ := mbRatio_bracket
  unfold UnitPeg.human
  constructor
  · exact mul_le_mul_of_nonneg_left hlo (le_of_lt p.pos)
  · exact mul_le_mul_of_nonneg_left hhi (le_of_lt p.pos)

/-! ## (8) THE WELDED LANDING (non-hollow). -/

/-- ★★ THE M5 LANDING — the heavy quark sector as certified numerals, welded:
    (1) the heavy cross-sector ratio numeral `mbRatioDerived ∈ [167505/1e7, 167522/1e7]` (the
        fold-phase Born weight `(1−q)²/(3(1+q))`);
    (2) the reciprocal numeral `1/mbRatioDerived ∈ [5969/100, 5971/100]` (the charm-band edge);
    (3) the down/confinement offset numeral `downConfBundle ∈ [7280/100, 7288/100]`
        (`= mbRatioDerived · confBandRatio`, the M3 band ratio re-used);
    (4) the suppression `mbRatioDerived < 1` and the offset ordering `mbRatioDerived < downConfBundle`
        re-derived from the numerals (W8);
    (5) each width strictly positive (W8 non-degeneracy);
    (6) under any M1 peg the numeral scales by the one positive peg (ONE-PEG LAW).
    Statable from no single conjunct alone (non-hollow). -/
theorem heavyQuarkNumerals_landing :
    (((167505 / (10 : Cut) ^ 7) ≤ mbRatioDerived ∧ mbRatioDerived ≤ 167522 / (10 : Cut) ^ 7)
      ∧ ((5969 / 100 : Cut) ≤ 1 / mbRatioDerived ∧ 1 / mbRatioDerived ≤ 5971 / 100)
      ∧ ((7280 / 100 : Cut) ≤ downConfBundle ∧ downConfBundle ≤ 7288 / 100))
    ∧ (mbRatioDerived < 1)
    ∧ (mbRatioDerived < downConfBundle)
    ∧ ((167505 / (10 : Cut) ^ 7 : Cut) < 167522 / (10 : Cut) ^ 7
        ∧ (5969 / 100 : Cut) < 5971 / 100
        ∧ (7280 / 100 : Cut) < 7288 / 100)
    ∧ (mbRatioDerived < 2 / 3)
    ∧ (∀ p : UnitPeg, p.val * (167505 / (10 : Cut) ^ 7) ≤ p.human mbRatioDerived
        ∧ p.human mbRatioDerived ≤ p.val * (167522 / (10 : Cut) ^ 7)) :=
  ⟨heavyQuark_numerals, mbRatio_lt_one_from_bracket, offset_ordered_from_brackets,
   heavyQuark_widths_positive, mbRatio_ne_survival_from_bracket, pegged_mbRatio_bracket⟩

end

end Phys.Algebra.HeavyQuarkNumerals
