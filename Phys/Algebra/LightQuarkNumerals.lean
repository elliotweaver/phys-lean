/-
  Phys.Algebra.LightQuarkNumerals — ARC-M M6: THE LIGHT QUARK SECTOR (SEED_MASSES §M6).
  =====================================================================================
  THE LIGHT-SECTOR (up/down/strange) QUARK MASS STRUCTURE — EVALUATED AS CERTIFIED TWO-SIDED RATIONAL
  BRACKETS AGAINST THE M1 PEG, ONE PIPELINE, THE M5 down/confinement offset + THE N340 TEXTURE RE-USED.
  THE HARDEST ROW ON THE BOARD (SEED_MASSES §M6, "child until done").

  ## THE ONE REFRAMING (SEED_MASSES §"THE ONE REFRAMING")

  Standard physics treats the light quark masses (up, down, strange) as FREE Yukawa couplings — the
  LEAST-constrained corner of the Standard Model ("the light quarks are hopeless"). The chain forces
  the light sector from TWO already-banked determined derived `Cut` objects, with NO free parameter:

  (A) THE WITHIN-DOWN-SECTOR LIGHT SPLITTINGS are FORCED EQUAL to the banked lepton ℝ-descent. Because
      the generation cycle phase is LINE-INDEPENDENT (`FreezeoutEdgeCrossSectorReduction`,
      `withinSector_ratio_12`/`withinSector_ratio_20`, the banked rung `phase_no_deviation`: the Fano
      generation line ASSOCIATES, so the Born-count phase is the SAME `δ_B = 2/9` on the quark line as
      on the lepton ℂ-line), the within-sector down/strange ratio `m_d/m_s = mass1/mass2 ∈
      [483/1e5, 485/1e5]` and strange/bottom `m_s/m_b = mass2/mass0 ∈ [594/1e4, 595/1e4]` are the SAME
      banked N340 numerals — ZERO free shape parameter. The light-sector within splittings are DISCHARGED
      to banked values, NOT route-not-yet-found.

  (B) THE LIGHT-BAND PLACEMENT RELATIVE TO THE CONFINEMENT FLOOR is the banked light-band freeze-out
      edge (`edgeLight_pinned`): with the confinement floor entering as a Born-square scale `lam = Mλ²`,

        `edgeLight Md (Mλ²) = downConfBundle · bMass 2`,   `downConfBundle = (Md/Mλ)² = mbRatioDerived / confBundle`,

      a DETERMINED derived `Cut` — the M5 down/confinement offset (`downConfBundle ∈ [7280/100, 7288/100]`)
      TIMES the N340 texture eigenvalue. This module AIMS arc-D's certified bracket instrument (via the
      banked `downConfBundle` bracket and the N340 mass brackets) at those forced closed forms:

        · `lightBandStrange = downConfBundle · bMass 2 ∈ [49/2, 1227/50]` (≈ 24.52) — strange placed
          relative to the confinement floor squared (the banked light-band edge value);
        · `lightBandDown   = downConfBundle · bMass 1 ∈ [118/1000, 119/1000]` (≈ 0.1185) — down placed
          relative to the confinement floor squared;
        · `1/lightBandStrange ∈ [407/10000, 409/10000]` (≈ 0.0408) — the reciprocal (floor²/strange).

  The free light-quark Yukawa dial — the SM's least-determined block — DISSOLVED into determined derived
  numbers: the within-sector shape is the banked lepton descent, the placement is the M5 offset × the
  N340 texture.

  ## THE BRACKET PIPELINE (every rational kernel-checkable; no float, no kernel-compiled decision)

    (1) `downConfBundle ∈ [7280/100, 7288/100]`                   (banked M5 `downConfBundle_bracket`).
    (2) `bMass 2 = mass2 ∈ [(5802/1e4)², (58022/1e5)²]`            (banked N340 `mass2_lo`/`mass2_hi`).
    (3) `lightBandStrange = downConfBundle · bMass 2 ∈ [49/2, 1227/50]`  — product of (1) and (2)
        (`mul_le_mul`), widened outward to clean rationals.
    (4) `bMass 1 = mass1 ∈ [(4034/1e5)², (40365/1e6)²]`            (banked N340 `mass1_lo`/`mass1_hi`).
    (5) `lightBandDown = downConfBundle · bMass 1 ∈ [118/1000, 119/1000]`  — product of (1) and (4).
    (6) `1/lightBandStrange ∈ [407/10000, 409/10000]` from (3) + positivity (`one_div_le_one_div_of_le`).
    (7) the within-sector light splittings `m_d/m_s`, `m_s/m_b` re-exported from the banked
        `withinSector_ratio_12`/`withinSector_ratio_20` at the down scale (the line-independent discharge).

  ## THE ONE-PEG LAW (SEED_MASSES §"HARD GUARDS", cited — NOT duplicated)

  Each light-sector placement/ratio is a pure dimensionless ratio to `M_oct := 1`; the brackets are on
  THOSE ratios. The M1 `UnitPeg` only converts to a human unit — NO second dimensionful input appears.
  `pegged_lightBandStrange_bracket` shows the human reading inherits the bracket by multiplying by the
  SINGLE positive peg; the ratios themselves are peg-free (M1 `ratio_peg_invariant`).

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2)

  Delete "quark / light / up / down / strange / bottom / mass / ratio / confinement / floor / peg":
  pure mathematics survives — certified two-sided rational inequalities `lo < x < hi` for the specific
  derived `Cut` numbers `downConfBundle · bMass 2`, `downConfBundle · bMass 1`, their reciprocal, the
  banked within-sector cross-ratios of `sectorMass`, a strict ordering, straddle of `1`, and
  non-degenerate widths. No physics word does any logical work; a physicist READS the light-quark
  numerals out of the theorems.

  ## GRADE / DISCIPLINE

  THEOREM-EXACT: certified two-sided rational inequalities of the derived `Cut`, foundations-only
  (`⊆ {propext, Classical.choice, Quot.sound}`). The evaluated objects are the banked THEOREM-EXACT
  determined closed forms `downConfBundle` (the M5 down/confinement offset) and `bMass 1`/`bMass 2` (the
  N340 texture eigenvalues), and the banked within-sector ratios (N340, line-independent).
  ⚠ HONEST GRADE (SEED_MASSES §M6 HIDDEN-JOINT, `FreezeoutEdgeCrossSectorReduction`/`edgeLight_pinned`):
  the within-sector light splittings are THEOREM-EXACT banked numerals (the discharge is real — the
  line-independence rung `phase_no_deviation` forces the quark within-sector shape equal to the lepton
  descent). The light-band PLACEMENT `lightBandStrange = downConfBundle · bMass 2` is a THEOREM-EXACT
  bracket of a determined derived `Cut`; its IDENTIFICATION with the physical light-band edge
  `edgeLight Md (Mλ²)` carries the two relative-scale HYPOTHESES of the banked `edgeLight_pinned`
  (`(Md/Mu)² = mbRatioDerived`, `(Mu/Mλ)² = 1/confBundle`) — re-exported here as
  `lightBandStrange_eq_edgeLight`, both premises banked/derived objects entering as hypotheses, NOT a
  bridge, NOT an asserted equality. NO measured light-quark mass in any statement or proof — the physical
  `m_u/m_d/m_s` comparison is removable prose ONLY; the beyond-measurement digits are the STANDING
  PREDICTION. Ground field the DERIVED `Cut`, NOT Mathlib-ℝ. NO `Real.*` as content, NO kernel-compiled
  decisions, NO floats, NO unfinished proof, NO posited axiom. Import guard: NEVER `Phys/OneAxiom/*`; NO
  Mathlib ℝ/ℂ as load-bearing content. THE ONE-PEG LAW: exactly ONE flagged dimensionful convention (M1
  `UnitPeg`), cited, never duplicated — no second dimensionful input.

  CARRIED NOTE (deferred-D7, arc-D standing debt, NOT a runway): D's ≥15-sig-digit AS-`1/α(0)` restate
  resumes AFTER the absolute-scale skeleton is complete.
-/
import Phys.Algebra.HeavyQuarkNumerals
import Phys.Algebra.FreezeoutEdgeCrossSectorReduction
import Phys.Algebra.UnitPeg
import Mathlib.Tactic

namespace Phys.Algebra.LightQuarkNumerals

open Phys.Algebra Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.HeavyQuarkNumerals
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.Peg
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (0) THE LIGHT-SECTOR PLACEMENTS — the M5 offset × the N340 texture eigenvalues. -/

/-- The STRANGE placement relative to the confinement floor squared: `downConfBundle · bMass 2`, the
    banked light-band freeze-out edge value (`edgeLight_pinned`). A DETERMINED derived `Cut`. -/
def lightBandStrange : Cut := downConfBundle * bMass 2

/-- The DOWN placement relative to the confinement floor squared: `downConfBundle · bMass 1`, a
    DETERMINED derived `Cut` (the N340 lightest texture eigenvalue on the same offset). -/
def lightBandDown : Cut := downConfBundle * bMass 1

/-! ## (1) ★ THE STRANGE PLACEMENT NUMERAL — `lightBandStrange ∈ [49/2, 1227/50]`. -/

/-- ★★★ THE STRANGE PLACEMENT NUMERAL: `lightBandStrange = downConfBundle · bMass 2 ∈ [49/2, 1227/50]`
    (≈ 24.52). The strange member placed relative to the confinement floor squared — the banked M5
    down/confinement offset `downConfBundle ∈ [7280/100, 7288/100]` TIMES the N340 middle texture
    eigenvalue `bMass 2 = mass2 ∈ [(5802/1e4)², (58022/1e5)²]`. FORCED from the fold with NO free Yukawa
    parameter. Removable-prose reading: against the M1 peg this is the standing prediction for the
    strange-scale-to-confinement-floor placement; the PDG comparison is prose. -/
theorem lightBandStrange_bracket :
    (49 / 2 : Cut) ≤ lightBandStrange ∧ lightBandStrange ≤ 1227 / 50 := by
  obtain ⟨hdlo, hdhi⟩ := downConfBundle_bracket
  have hm2lo := mass2_lo
  have hm2hi := mass2_hi
  have hb2 : bMass 2 = mass2 := rfl
  have hdpos : (0 : Cut) < downConfBundle := downConfBundle_pos
  unfold lightBandStrange
  rw [hb2]
  constructor
  · have hprod : (7280 / 100 : Cut) * ((5802 / 10000) * (5802 / 10000)) ≤ downConfBundle * mass2 :=
      mul_le_mul hdlo hm2lo (by norm_num) (le_of_lt hdpos)
    have hkey : (49 / 2 : Cut) ≤ (7280 / 100) * ((5802 / 10000) * (5802 / 10000)) := by norm_num
    linarith
  · have hprod : downConfBundle * mass2 ≤ (7288 / 100 : Cut) * ((58022 / 100000) * (58022 / 100000)) :=
      mul_le_mul hdhi hm2hi (by positivity) (by norm_num)
    have hkey : (7288 / 100 : Cut) * ((58022 / 100000) * (58022 / 100000)) ≤ 1227 / 50 := by norm_num
    linarith

/-- `lightBandStrange` is a genuine positive derived placement. -/
theorem lightBandStrange_pos : (0 : Cut) < lightBandStrange := by
  have := lightBandStrange_bracket.1; linarith

/-- ★★ THE IDENTIFICATION WITH THE BANKED LIGHT-BAND EDGE (re-exported, hypothesis-carrying — NOT a
    bridge). Given the parent's up/down leg (`(Md/Mu)² = mbRatioDerived`, banked) and the
    confinement-sector top-at-anchor identification (`(Mu/Mλ)² = 1/confBundle`, candidate), the banked
    `edgeLight_pinned` gives `edgeLight Md (Mλ²) = downConfBundle · bMass 2 = lightBandStrange`. So the
    bracketed determined `Cut` IS the banked light-band freeze-out edge value under the two banked
    relative-scale identifications. Both premises are banked/derived objects entering as HYPOTHESES. -/
theorem lightBandStrange_eq_edgeLight (Mu Md Mlam : Cut) (hu : Mu ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived)
    (huc : (Mu / Mlam) ^ 2 = 1 / confBundle) :
    edgeLight Md (Mlam ^ 2) = lightBandStrange :=
  edgeLight_pinned Mu Md Mlam hu hl hud huc

/-! ## (2) ★ THE DOWN PLACEMENT NUMERAL — `lightBandDown ∈ [118/1000, 119/1000]`. -/

/-- ★★★ THE DOWN PLACEMENT NUMERAL: `lightBandDown = downConfBundle · bMass 1 ∈ [118/1000, 119/1000]`
    (≈ 0.1185). The down member placed relative to the confinement floor squared — the SAME banked M5
    offset `downConfBundle` TIMES the N340 lightest texture eigenvalue `bMass 1 = mass1 ∈
    [(4034/1e5)², (40365/1e6)²]`. FORCED from the fold with NO free parameter. -/
theorem lightBandDown_bracket :
    (118 / 1000 : Cut) ≤ lightBandDown ∧ lightBandDown ≤ 119 / 1000 := by
  obtain ⟨hdlo, hdhi⟩ := downConfBundle_bracket
  have hm1lo := mass1_lo
  have hm1hi := mass1_hi
  have hb1 : bMass 1 = mass1 := rfl
  have hdpos : (0 : Cut) < downConfBundle := downConfBundle_pos
  unfold lightBandDown
  rw [hb1]
  constructor
  · have hprod : (7280 / 100 : Cut) * ((4034 / 100000) * (4034 / 100000)) ≤ downConfBundle * mass1 :=
      mul_le_mul hdlo hm1lo (by norm_num) (le_of_lt hdpos)
    have hkey : (118 / 1000 : Cut) ≤ (7280 / 100) * ((4034 / 100000) * (4034 / 100000)) := by norm_num
    linarith
  · have hprod : downConfBundle * mass1 ≤ (7288 / 100 : Cut) * ((40365 / 1000000) * (40365 / 1000000)) :=
      mul_le_mul hdhi hm1hi (by positivity) (by norm_num)
    have hkey : (7288 / 100 : Cut) * ((40365 / 1000000) * (40365 / 1000000)) ≤ 119 / 1000 := by norm_num
    linarith

/-- `lightBandDown` is a genuine positive derived placement. -/
theorem lightBandDown_pos : (0 : Cut) < lightBandDown := by
  have := lightBandDown_bracket.1; linarith

/-! ## (3) ★ THE RECIPROCAL STRANGE-PLACEMENT NUMERAL — `1/lightBandStrange ∈ [407/1e4, 409/1e4]`. -/

/-- ★★ THE RECIPROCAL NUMERAL: `1/lightBandStrange ∈ [407/10000, 409/10000]` (≈ 0.0408). The
    confinement-floor-squared relative to the strange placement, pinned from the `lightBandStrange`
    bracket by reciprocal-monotonicity (`one_div_le_one_div_of_le`). -/
theorem invLightBandStrange_bracket :
    (407 / 10000 : Cut) ≤ 1 / lightBandStrange ∧ 1 / lightBandStrange ≤ 409 / 10000 := by
  obtain ⟨hlo, hhi⟩ := lightBandStrange_bracket
  have hpos : (0 : Cut) < lightBandStrange := lightBandStrange_pos
  have hlopos : (0 : Cut) < (49 / 2 : Cut) := by norm_num
  constructor
  · have h1 : 1 / (1227 / 50 : Cut) ≤ 1 / lightBandStrange := one_div_le_one_div_of_le hpos hhi
    have h2 : (407 / 10000 : Cut) ≤ 1 / (1227 / 50 : Cut) := by norm_num
    linarith
  · have h1 : 1 / lightBandStrange ≤ 1 / (49 / 2 : Cut) := one_div_le_one_div_of_le hlopos hlo
    have h2 : (1 / (49 / 2 : Cut) : Cut) ≤ 409 / 10000 := by norm_num
    linarith

/-! ## (4) ★ THE WITHIN-SECTOR LIGHT SPLITTINGS — the banked N340 descent (line-independent). -/

/-- ★★ THE WITHIN-SECTOR DOWN/STRANGE SPLITTING (re-exported from the banked line-independence
    discharge): at ANY down-sector scale `Md ≠ 0`, `m_d/m_s = sectorMass Md 1 / sectorMass Md 2 ∈
    [483/1e5, 485/1e5]` — the SAME banked N340 lepton numeral, because the cycle phase is
    line-independent (`withinSector_ratio_12`). The light-sector within-splitting carries ZERO free
    shape. (PDG d:s ≈ 0.05 order — removable prose.) -/
theorem withinSector_down_strange (Md : Cut) (hd : Md ≠ 0) :
    (483 : Cut) / 100000 * sectorMass Md 2 ≤ sectorMass Md 1
      ∧ sectorMass Md 1 ≤ (485 : Cut) / 100000 * sectorMass Md 2 :=
  withinSector_ratio_12 Md hd

/-- ★★ THE WITHIN-SECTOR STRANGE/BOTTOM SPLITTING (re-exported): at ANY down-sector scale `Md ≠ 0`,
    `m_s/m_b = sectorMass Md 2 / sectorMass Md 0 ∈ [594/1e4, 595/1e4]` — the SAME banked N340 numeral
    (`withinSector_ratio_20`), the middle/heaviest within the down sector. -/
theorem withinSector_strange_bottom (Md : Cut) (hd : Md ≠ 0) :
    (594 : Cut) / 10000 * sectorMass Md 0 ≤ sectorMass Md 2
      ∧ sectorMass Md 2 ≤ (595 : Cut) / 10000 * sectorMass Md 0 :=
  withinSector_ratio_20 Md hd

/-! ## (5) THE LIGHT-SECTOR NUMERALS COLLECTED. -/

/-- ★★ THE LIGHT-SECTOR NUMERALS, one pipeline: the strange placement `downConfBundle · bMass 2 ∈
    [49/2, 1227/50]`, the down placement `downConfBundle · bMass 1 ∈ [118/1000, 119/1000]`, and the
    reciprocal `1/lightBandStrange ∈ [407/1e4, 409/1e4]`. All grounded on the SAME banked M5
    `downConfBundle` offset and the N340 texture eigenvalues. -/
theorem lightQuark_numerals :
    ((49 / 2 : Cut) ≤ lightBandStrange ∧ lightBandStrange ≤ 1227 / 50)
    ∧ ((118 / 1000 : Cut) ≤ lightBandDown ∧ lightBandDown ≤ 119 / 1000)
    ∧ ((407 / 10000 : Cut) ≤ 1 / lightBandStrange ∧ 1 / lightBandStrange ≤ 409 / 10000) :=
  ⟨lightBandStrange_bracket, lightBandDown_bracket, invLightBandStrange_bracket⟩

/-! ## (6) W8 TEETH — ordering, floor straddle, non-degenerate widths (all FREE from the brackets). -/

/-- ★ W8 (light-family ordering, RE-DERIVED FROM THE NUMERALS): the down placement lies strictly below
    the strange placement — `lightBandDown < lightBandStrange` — because `bMass 1 < bMass 2` (the down
    texture eigenvalue is lighter): the `lightBandDown` bracket lies entirely below the `lightBandStrange`
    bracket (`119/1000 < 49/2`). The two light-family placements are genuinely DISTINCT. -/
theorem lightBand_ordered_from_brackets : lightBandDown < lightBandStrange := by
  obtain ⟨_, hdhi⟩ := lightBandDown_bracket
  obtain ⟨hslo, _⟩ := lightBandStrange_bracket
  have hgap : (119 / 1000 : Cut) < 49 / 2 := by norm_num
  linarith

/-- ★★ W8 (the light sector STRADDLES the confinement floor, RE-DERIVED FROM THE NUMERALS): the down
    placement lies strictly BELOW the confinement floor squared (`lightBandDown < 1`, since
    `119/1000 < 1`) while the strange placement lies strictly ABOVE it (`1 < lightBandStrange`, since
    `1 < 49/2`). The confinement floor genuinely SEPARATES the two light quarks — a WRONG "both light
    quarks sit on the same side of the floor" reading is refuted. -/
theorem lightBand_straddles_floor :
    lightBandDown < 1 ∧ 1 < lightBandStrange := by
  obtain ⟨_, hdhi⟩ := lightBandDown_bracket
  obtain ⟨hslo, _⟩ := lightBandStrange_bracket
  refine ⟨?_, ?_⟩
  · have : (119 / 1000 : Cut) < 1 := by norm_num
    linarith
  · have : (1 : Cut) < 49 / 2 := by norm_num
    linarith

/-- ★ W8 (the strange placement lies strictly below the M5 down/confinement offset, RE-DERIVED): since
    `bMass 2 < 1` (the texture eigenvalue is a suppression), `lightBandStrange = downConfBundle · bMass 2
    < downConfBundle` — the `lightBandStrange` upper end `1227/50` lies entirely below the `downConfBundle`
    lower end `7280/100`. The light-band placement genuinely differs from the down/confinement offset. -/
theorem lightBandStrange_lt_downConfBundle : lightBandStrange < downConfBundle := by
  obtain ⟨_, hshi⟩ := lightBandStrange_bracket
  obtain ⟨hdlo, _⟩ := downConfBundle_bracket
  have hgap : (1227 / 50 : Cut) < 7280 / 100 := by norm_num
  linarith

/-- ★ W8 (non-degenerate widths): each certified light-sector bracket has strictly positive width
    `lo < hi` — the numerals are genuine two-sided brackets, not collapsed points. -/
theorem lightQuark_widths_positive :
    (49 / 2 : Cut) < 1227 / 50
    ∧ (118 / 1000 : Cut) < 119 / 1000
    ∧ (407 / 10000 : Cut) < 409 / 10000 := by
  refine ⟨by norm_num, by norm_num, by norm_num⟩

/-! ## (7) THE PEGGED READING — the M1 UnitPeg carries the numeral to the human unit (ONE-PEG LAW). -/

/-- ★ THE PEGGED STRANGE-PLACEMENT NUMERAL: under ANY M1 unit peg `p`, the human reading
    `p.human lightBandStrange` inherits the certified bracket scaled by the SINGLE positive peg `p.val`
    — NO second dimensionful input (THE ONE-PEG LAW). The dimensionless placement itself is peg-free
    (M1 `ratio_peg_invariant`); only the overall magnitude scales with the one peg. -/
theorem pegged_lightBandStrange_bracket (p : UnitPeg) :
    p.val * (49 / 2 : Cut) ≤ p.human lightBandStrange
      ∧ p.human lightBandStrange ≤ p.val * (1227 / 50 : Cut) := by
  obtain ⟨hlo, hhi⟩ := lightBandStrange_bracket
  unfold UnitPeg.human
  constructor
  · exact mul_le_mul_of_nonneg_left hlo (le_of_lt p.pos)
  · exact mul_le_mul_of_nonneg_left hhi (le_of_lt p.pos)

/-! ## (8) THE WELDED LANDING (non-hollow). -/

/-- ★★ THE M6 LANDING — the light quark sector as certified numerals, welded:
    (1) the strange placement numeral `lightBandStrange = downConfBundle · bMass 2 ∈ [49/2, 1227/50]`
        (the M5 offset × the N340 middle texture eigenvalue);
    (2) the down placement numeral `lightBandDown = downConfBundle · bMass 1 ∈ [118/1000, 119/1000]`;
    (3) the reciprocal numeral `1/lightBandStrange ∈ [407/1e4, 409/1e4]`;
    (4) the within-sector light splittings `m_d/m_s ∈ [483/1e5, 485/1e5]`, `m_s/m_b ∈ [594/1e4, 595/1e4]`
        at ANY down scale (the banked N340 descent, line-independent — ZERO free shape);
    (5) the light-family ordering `lightBandDown < lightBandStrange`, the floor straddle
        `lightBandDown < 1 < lightBandStrange`, and `lightBandStrange < downConfBundle` re-derived from
        the numerals (W8);
    (6) each width strictly positive (W8 non-degeneracy);
    (7) under any M1 peg the strange numeral scales by the one positive peg (ONE-PEG LAW).
    Statable from no single conjunct alone (non-hollow). -/
theorem lightQuarkNumerals_landing :
    (((49 / 2 : Cut) ≤ lightBandStrange ∧ lightBandStrange ≤ 1227 / 50)
      ∧ ((118 / 1000 : Cut) ≤ lightBandDown ∧ lightBandDown ≤ 119 / 1000)
      ∧ ((407 / 10000 : Cut) ≤ 1 / lightBandStrange ∧ 1 / lightBandStrange ≤ 409 / 10000))
    ∧ (∀ Md : Cut, Md ≠ 0 →
        ((483 : Cut) / 100000 * sectorMass Md 2 ≤ sectorMass Md 1
          ∧ sectorMass Md 1 ≤ (485 : Cut) / 100000 * sectorMass Md 2)
        ∧ ((594 : Cut) / 10000 * sectorMass Md 0 ≤ sectorMass Md 2
          ∧ sectorMass Md 2 ≤ (595 : Cut) / 10000 * sectorMass Md 0))
    ∧ (lightBandDown < lightBandStrange)
    ∧ (lightBandDown < 1 ∧ 1 < lightBandStrange)
    ∧ (lightBandStrange < downConfBundle)
    ∧ ((49 / 2 : Cut) < 1227 / 50
        ∧ (118 / 1000 : Cut) < 119 / 1000
        ∧ (407 / 10000 : Cut) < 409 / 10000)
    ∧ (∀ p : UnitPeg, p.val * (49 / 2 : Cut) ≤ p.human lightBandStrange
        ∧ p.human lightBandStrange ≤ p.val * (1227 / 50 : Cut)) :=
  ⟨lightQuark_numerals,
   fun Md hd => ⟨withinSector_down_strange Md hd, withinSector_strange_bottom Md hd⟩,
   lightBand_ordered_from_brackets,
   lightBand_straddles_floor,
   lightBandStrange_lt_downConfBundle,
   lightQuark_widths_positive,
   pegged_lightBandStrange_bracket⟩

end

end Phys.Algebra.LightQuarkNumerals
