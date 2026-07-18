/-
  Phys.Algebra.CrossCheckWeb — ARC-M M7: THE CROSS-CHECK WEB (SEED_MASSES §M7).
  =====================================================================================
  EVERY DIMENSIONLESS RATIO RECOMPUTABLE FROM THE M2–M6 BRACKETS LANDS INSIDE ITS BANKED DERIVED
  BRACKET / REPRODUCES THE BANKED EXACT WAY-POINTS — THE OVERCONSTRAINT PROOF AT NUMERAL GRADE, FREE.

  ## THE ONE REFRAMING (SEED_MASSES §"THE ONE REFRAMING", §M7)

  The Standard Model carries ~20 INDEPENDENT free parameters — each mass, scale, and coupling its own
  dial — so a numerical CONSISTENCY WEB between the charged-lepton masses, the quark masses, the
  confinement scale, and the fine-structure way-points cannot even be stated: independent dials
  overconstrain nothing. The chain DISSOLVES that independence. Every M2–M6 numeral is a READING of
  ONE derived tower (the fold → self-blindness → Born-square eigenvalues → the single scale ladder
  `cutExp(cutPi/3)`), so the readings are FORCED to agree. This module CLOSES the overconstraint web:
  each dimensionless quantity recomputed by an INDEPENDENT route lands inside its banked derived
  bracket, or reproduces a banked EXACT way-point. These cross-checks are FREE — they consume ONLY
  already-banked brackets and reproduce already-banked exact rationals; nothing new is derived.

  This is "one cause, many terminations" made NUMERICAL: the SAME derived objects
  (`mass_k`, `confBandRatio`, `topBandRatio`, `downConfBundle`, `massScale`) appear in the dimensionful
  brackets AND the dimensionless ratios AND the exact way-points, and the web of their agreements is
  a theorem the standard framework cannot even write down.

  ## THE CROSS-CHECKS (each FREE — banked brackets + banked exact way-points only)

  (CC1) THE KOIDE OVERCONSTRAINT: the three INDEPENDENTLY-bracketed relative Born-square eigenvalues
        `mass0, mass1, mass2` (N340) have digit brackets whose sum STRADDLES the EXACT Koide total
        `mass0 + mass1 + mass2 = 6` (`koide_total`, the conic `σ₁ = 6M²` at `M = 1`): the sum of the
        lower ends is `< 6` and the sum of the upper ends is `> 6`. The three independent digit
        readings mutually agree with the exact phase-independent Koide identity.
  (CC2) THE WAY-POINTS FROM THE BRACKETED EDGES: the SAME derived edges carry BOTH a certified numeric
        bracket AND an EXACT way-point — `topBandRatio ∈ [54220·1e8, 54226·1e8]` (M4) AND
        `bandScreen chargeTraceDepth topBandRatio = 448/27`; `confBandRatio ∈ [4347, 4350]` (M3/M4) AND
        `bandScreen chargeTraceDepth confBandRatio = 128/27`; plus the three scalar way-points
        `42`, `1582/27`, `190/3` over the SAME tower (M4 `waypoints_free`).
  (CC3) THE `confBandRatio` TRIPLE READING (the cross-sector spine): the SAME `v/Λ = confBandRatio`
        (a) brackets to `[4347, 4350]` (the M3/M4 scale-tower numeral), (b) screens to EXACTLY `128/27`
        (the confinement band), and (c) is the down/confinement offset factor
        `downConfBundle = mbRatioDerived · confBandRatio` (the M5 heavy/quark weld) — the scale-tower,
        coupling, and quark sectors all meet at ONE derived object.
  (CC4) THE LIGHT-PLACEMENT RATIO REPRODUCES N340: ratioing the M6 light placements makes the common
        `downConfBundle` cancel, so `lightBandDown / lightBandStrange` reproduces the banked N340
        within-sector `m_d/m_s ∈ [483/1e5, 485/1e5]` bracket — the light-sector placements are
        consistent with the flavor texture that also fixes the lepton descent.
  (CC5) THE ABSOLUTE-LEPTON RATIO WEB: the evaluated ABSOLUTE lepton masses reproduce the N340 RELATIVE
        ratios EXACTLY (the derived scale `massScale` cancels): `absMass1/absMass0 = mass1/mass0`,
        `absMass2/absMass0 = mass2/mass0` (M2 `absMass_ratios_reproduce_N340`).

  ## THE ONE-PEG LAW (SEED_MASSES §"HARD GUARDS", cited — NOT duplicated)

  Every cross-check is a pure DIMENSIONLESS statement (a bracket on a ratio to `M_oct := 1`, or an
  equality of exact rationals). The web consumes NO dimensionful input: under ANY M1 `UnitPeg` `p`,
  every cross-checked ratio is PEG-INVARIANT (`ratio_peg_invariant`: `p.human x / p.human y = x/y`),
  so the whole overconstraint web is unchanged by the choice of human unit — the single flagged peg
  never enters. NO second dimensionful input appears.

  ## PHYSICS-WORDS-REMOVABLE (STANDARD §2)

  Delete "mass / lepton / quark / Koide / confinement / scale / coupling / band / peg": pure
  mathematics survives — the sum of three certified `Cut` intervals straddling an exact rational `6`,
  certain derived `Cut` numbers carrying BOTH a two-sided bracket AND an exact screening rational, one
  derived `Cut` factoring a product, a ratio of two derived `Cut` products landing in a banked bracket,
  and two exact quotient identities. No physics word does any logical work; a physicist READS the
  overconstraint web out of the theorems.

  ## GRADE / DISCIPLINE

  THEOREM-EXACT and FREE: every cross-check is an exact two-sided rational inequality or exact identity
  of the derived `Cut`, foundations-only (`⊆ {propext, Classical.choice, Quot.sound}`), consuming ONLY
  banked M2–M6 brackets and banked exact way-points — NO new derivation, NO new crux. NO measured value
  (mass/MeV, `Λ_QCD`, `α`, PDG ratio) in any statement or proof — the empirical comparison is removable
  prose ONLY; the web is the overconstraint prediction. Ground field the DERIVED `Cut`, NOT Mathlib-ℝ.
  NO `Real.*` as content, NO kernel-compiled decisions, NO floats, NO unfinished proof, NO posited
  axiom. Import guard: NEVER `Phys/OneAxiom/*`; NO Mathlib ℝ/ℂ as load-bearing content. THE ONE-PEG LAW:
  exactly ONE flagged dimensionful convention (M1 `UnitPeg`), cited, never duplicated — and the web is
  peg-free, so no dimensionful input enters at all.

  ⚠ HONEST NOTE (SEED_MASSES §M7 "Any miss = a band's derivation is the suspect → child node"): every
  cross-check here CLOSES (lands inside its banked bracket / reproduces its exact way-point); no miss
  is found, so no suspect-band child is spawned.

  CARRIED NOTE (deferred-D7, arc-D standing debt, NOT a runway): D's ≥15-sig-digit AS-`1/α(0)` restate
  resumes AFTER the absolute-scale skeleton is complete.
-/
import Phys.Algebra.LightQuarkNumerals
import Phys.Algebra.ScaleTowerNumerals
import Phys.Algebra.UnitPeg
import Mathlib.Tactic

namespace Phys.Algebra.CrossCheckWeb

open Phys.Algebra
open Phys.Algebra.LightQuarkNumerals
open Phys.Algebra.HeavyQuarkNumerals
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.LeptonNumerals
open Phys.Algebra.AbsMass
open Phys.Algebra.ConfNumeral
open Phys.Algebra.TowerNumerals
open Phys.Algebra.BandEdgeList
open Phys.Algebra.Peg
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-! ## (1) ★ CC1 — THE KOIDE OVERCONSTRAINT: the three independent digit brackets straddle `Σ = 6`. -/

/-- ★★★ THE KOIDE OVERCONSTRAINT (CC1): the three INDEPENDENTLY-bracketed relative Born-square
    eigenvalues `mass0, mass1, mass2` (N340, each read off the forced ℤ₃-cycle amplitudes at the
    derived phase `δ_B = 2/9`) have digit brackets whose lower ends SUM to `< 6` and whose upper ends
    SUM to `> 6`, while the exact phase-independent Koide total is `mass0 + mass1 + mass2 = 6`
    (`koide_total`, the conic `σ₁ = 6M²` at `M = 1`). The three independent digit readings mutually
    agree with the exact Koide identity — the overconstraint closes. -/
theorem koide_overconstraint :
    ((237943 : Cut) / 100000 * (237943 / 100000)
        + (4034 : Cut) / 100000 * (4034 / 100000)
        + (5802 : Cut) / 10000 * (5802 / 10000)
      ≤ mass0 + mass1 + mass2)
    ∧ (mass0 + mass1 + mass2 = 6)
    ∧ (mass0 + mass1 + mass2
      ≤ (237944 : Cut) / 100000 * (237944 / 100000)
        + (40365 : Cut) / 1000000 * (40365 / 1000000)
        + (58022 : Cut) / 100000 * (58022 / 100000)) := by
  refine ⟨?_, koide_total, ?_⟩
  · linarith [mass0_lo, mass1_lo, mass2_lo]
  · linarith [mass0_hi, mass1_hi, mass2_hi]

/-- ★★ THE STRADDLE IS GENUINE (CC1 non-vacuity): the sum of the lower bracket ends is STRICTLY below
    the exact Koide total `6`, and the sum of the upper bracket ends is STRICTLY above it — the three
    independent digit brackets genuinely STRADDLE `6` (a collapsed "the brackets pin exactly 6 with no
    room / the readings miss 6" mis-reading is refuted). Sum of lo ends ≈ 5.99995 < 6 < 6.00002 ≈ sum
    of hi ends. -/
theorem koide_bracket_straddles_6 :
    ((237943 : Cut) / 100000 * (237943 / 100000)
        + (4034 : Cut) / 100000 * (4034 / 100000)
        + (5802 : Cut) / 10000 * (5802 / 10000) < 6)
    ∧ ((6 : Cut)
        < (237944 : Cut) / 100000 * (237944 / 100000)
          + (40365 : Cut) / 1000000 * (40365 / 1000000)
          + (58022 : Cut) / 100000 * (58022 / 100000)) := by
  constructor <;> norm_num

/-! ## (2) ★ CC2 — THE WAY-POINTS FROM THE BRACKETED EDGES: bracket AND exact way-point on ONE edge. -/

/-- ★★★ THE WAY-POINTS FROM THE BRACKETED EDGES (CC2): the SAME derived edges carry BOTH a certified
    numeric bracket AND an EXACT way-point, all over the ONE tower `cutExp(cutPi/3)`:
      · `topBandRatio ∈ [54220·1e8, 54226·1e8]` (M4 numeral) AND `bandScreen · topBandRatio = 448/27`;
      · `confBandRatio ∈ [4347, 4350]` (M3/M4 numeral) AND `bandScreen · confBandRatio = 128/27`;
      · the three scalar way-points `42`, `1582/27`, `190/3` over the SAME tower.
    The dimensionful skeleton and the dimensionless coupling readings share ONE derived tower — the
    numeric brackets and the exact way-points fall out TOGETHER, free. -/
theorem waypoints_from_bracketed_edges :
    (((54220 * (10 : Cut) ^ 8) ≤ topBandRatio ∧ topBandRatio ≤ 54226 * (10 : Cut) ^ 8)
      ∧ bandScreen chargeTraceDepth topBandRatio = 448 / 27)
    ∧ (((4347 : Cut) ≤ confBandRatio ∧ confBandRatio ≤ 4350)
      ∧ bandScreen chargeTraceDepth confBandRatio = 128 / 27)
    ∧ (invAlphaZero [] = 42
      ∧ invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27
      ∧ invAlphaZero derivedBandList = 190 / 3) := by
  obtain ⟨w42, wTop, wConf, w1582, w190⟩ := waypoints_free
  exact ⟨⟨topBandRatio_bracket, wTop⟩, ⟨confBandRatio_bracket, wConf⟩, ⟨w42, w1582, w190⟩⟩

/-! ## (3) ★ CC3 — THE `confBandRatio` TRIPLE READING: the cross-sector spine (one object, three roles). -/

/-- ★★★ THE `confBandRatio` TRIPLE READING (CC3): the SAME derived `v/Λ = confBandRatio`
      (a) BRACKETS to `[4347, 4350]` — the M3/M4 scale-tower numeral;
      (b) SCREENS to EXACTLY `128/27` — the confinement band (M3 `confBand_128_27_free`);
      (c) is the DOWN/CONFINEMENT OFFSET FACTOR `downConfBundle = mbRatioDerived · confBandRatio`
          — the M5 heavy/quark weld (`downConfBundle_as_mul`).
    The scale-tower sector, the coupling sector, and the quark sector ALL meet at this ONE derived
    object — the cross-sector spine of the whole dimensionful skeleton. -/
theorem confBandRatio_triple_reading :
    ((4347 : Cut) ≤ confBandRatio ∧ confBandRatio ≤ 4350)
    ∧ (bandScreen chargeTraceDepth confBandRatio = 128 / 27)
    ∧ (downConfBundle = mbRatioDerived * confBandRatio) :=
  ⟨confBandRatio_bracket, confBand_128_27_free, downConfBundle_as_mul⟩

/-! ## (4) ★ CC4 — THE LIGHT-PLACEMENT RATIO REPRODUCES N340 (the common `downConfBundle` cancels). -/

/-- ★★ THE LIGHT-PLACEMENT RATIO REPRODUCES N340 (CC4): ratioing the M6 light placements
    `lightBandDown = downConfBundle · bMass 1` and `lightBandStrange = downConfBundle · bMass 2` makes
    the common `downConfBundle` factor cancel, so `lightBandDown / lightBandStrange` reproduces the
    banked N340 within-sector `m_d/m_s ∈ [483/1e5, 485/1e5]` bracket:
    `483/1e5 · lightBandStrange ≤ lightBandDown ≤ 485/1e5 · lightBandStrange`. The M6 light-sector
    PLACEMENTS are consistent with the N340 flavor TEXTURE that also fixes the lepton descent — the
    quark placements and the shared texture agree. -/
theorem lightPlacement_ratio_reproduces_N340 :
    (483 : Cut) / 100000 * lightBandStrange ≤ lightBandDown
      ∧ lightBandDown ≤ (485 : Cut) / 100000 * lightBandStrange := by
  have hdpos : (0 : Cut) < downConfBundle := downConfBundle_pos
  have hb1 : bMass 1 = mass1 := rfl
  have hb2 : bMass 2 = mass2 := rfl
  obtain ⟨hlo, hhi⟩ := massRatio_1_2
  unfold lightBandDown lightBandStrange
  rw [hb1, hb2]
  constructor
  · nlinarith [mul_le_mul_of_nonneg_left hlo (le_of_lt hdpos)]
  · nlinarith [mul_le_mul_of_nonneg_left hhi (le_of_lt hdpos)]

/-! ## (5) ★ CC5 — THE ABSOLUTE-LEPTON RATIO WEB: the absolute masses reproduce N340 exactly. -/

/-- ★★ THE ABSOLUTE-LEPTON RATIO WEB (CC5): the evaluated ABSOLUTE lepton masses reproduce the N340
    RELATIVE ratios EXACTLY — the derived scale `massScale` cancels in the ratio, so
    `absMass1/absMass0 = mass1/mass0` and `absMass2/absMass0 = mass2/mass0` (M2
    `absMass_ratios_reproduce_N340`). The dimensionful evaluation is consistent with the dimensionless
    flavor ratios: the scale carries NO shape information, exactly as forced. -/
theorem absLepton_ratio_web :
    absMass1 / absMass0 = mass1 / mass0 ∧ absMass2 / absMass0 = mass2 / mass0 :=
  absMass_ratios_reproduce_N340

/-! ## (6) W8 TEETH — the web is non-degenerate (widths, distinct readings). -/

/-- ★ W8 (CC2 widths non-degenerate): both bracketed way-point edges have strictly positive width
    `lo < hi` — the numeric readings that pair with the exact way-points are genuine two-sided
    brackets, not collapsed points. -/
theorem waypoint_edge_widths_positive :
    (54220 * (10 : Cut) ^ 8) < 54226 * (10 : Cut) ^ 8
    ∧ (4347 : Cut) < 4350 := by
  refine ⟨by norm_num, by norm_num⟩

/-- ★ W8 (CC2 the two way-points are DISTINCT rationals): `448/27 ≠ 128/27` — the top-band and
    confinement-band screenings are genuinely different exact way-points, not one repeated value, so
    the way-point agreements carry real content on distinct edges. -/
theorem waypoints_distinct : (448 / 27 : Cut) ≠ 128 / 27 := by norm_num

/-! ## (7) ★ THE PEGGED READING — every cross-check is PEG-INVARIANT (ONE-PEG LAW). -/

/-- ★ THE PEG-INVARIANT WEB (ONE-PEG LAW): under ANY M1 unit peg `p`, every cross-checked ratio is
    UNCHANGED — the peg CANCELS in every dimensionless quotient (`ratio_peg_invariant`). Stated for the
    Koide-relevant lepton ratio `mass1/mass0` and the light-placement ratio `lightBandDown /
    lightBandStrange`: `p.human x / p.human y = x / y`. The whole overconstraint web consumes NO
    dimensionful input — the single flagged peg never enters (THE ONE-PEG LAW). -/
theorem web_peg_invariant (p : UnitPeg) :
    p.human mass1 / p.human mass0 = mass1 / mass0
    ∧ p.human lightBandDown / p.human lightBandStrange = lightBandDown / lightBandStrange :=
  ⟨ratio_peg_invariant p mass1 mass0, ratio_peg_invariant p lightBandDown lightBandStrange⟩

/-! ## (8) THE WELDED LANDING (non-hollow). -/

/-- ★★ THE M7 LANDING — the cross-check web CLOSED, welded (all FREE, from banked brackets + exact
    way-points):
    (CC1) the three independent digit brackets STRADDLE the exact Koide total `mass0+mass1+mass2 = 6`
          (sum of lo ends `< 6 <` sum of hi ends);
    (CC2) the SAME derived edges carry BOTH a numeric bracket AND an exact way-point
          (`topBandRatio` ↔ `448/27`, `confBandRatio` ↔ `128/27`, plus `42`, `1582/27`, `190/3`);
    (CC3) the `confBandRatio` triple reading — one derived object as scale-tower bracket, confinement
          band `128/27`, and the M5 down/confinement offset factor;
    (CC4) the light-placement ratio reproduces the N340 within-sector `m_d/m_s` bracket
          (`downConfBundle` cancels);
    (CC5) the absolute lepton masses reproduce the N340 relative ratios exactly (`massScale` cancels);
    (W8) the way-point edges have positive width and the two way-points are distinct;
    (ONE-PEG LAW) the whole web is peg-invariant — no dimensionful input enters.
    Statable from no single conjunct alone (non-hollow). -/
theorem crossCheckWeb_landing :
    (((237943 : Cut) / 100000 * (237943 / 100000)
        + (4034 : Cut) / 100000 * (4034 / 100000)
        + (5802 : Cut) / 10000 * (5802 / 10000)
        ≤ mass0 + mass1 + mass2)
      ∧ (mass0 + mass1 + mass2 = 6)
      ∧ (mass0 + mass1 + mass2
        ≤ (237944 : Cut) / 100000 * (237944 / 100000)
          + (40365 : Cut) / 1000000 * (40365 / 1000000)
          + (58022 : Cut) / 100000 * (58022 / 100000)))
    ∧ (((237943 : Cut) / 100000 * (237943 / 100000)
        + (4034 : Cut) / 100000 * (4034 / 100000)
        + (5802 : Cut) / 10000 * (5802 / 10000) < 6)
      ∧ ((6 : Cut)
        < (237944 : Cut) / 100000 * (237944 / 100000)
          + (40365 : Cut) / 1000000 * (40365 / 1000000)
          + (58022 : Cut) / 100000 * (58022 / 100000)))
    ∧ ((((54220 * (10 : Cut) ^ 8) ≤ topBandRatio ∧ topBandRatio ≤ 54226 * (10 : Cut) ^ 8)
          ∧ bandScreen chargeTraceDepth topBandRatio = 448 / 27)
      ∧ (((4347 : Cut) ≤ confBandRatio ∧ confBandRatio ≤ 4350)
          ∧ bandScreen chargeTraceDepth confBandRatio = 128 / 27)
      ∧ (invAlphaZero [] = 42
          ∧ invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27
          ∧ invAlphaZero derivedBandList = 190 / 3))
    ∧ (((4347 : Cut) ≤ confBandRatio ∧ confBandRatio ≤ 4350)
      ∧ (bandScreen chargeTraceDepth confBandRatio = 128 / 27)
      ∧ (downConfBundle = mbRatioDerived * confBandRatio))
    ∧ ((483 : Cut) / 100000 * lightBandStrange ≤ lightBandDown
      ∧ lightBandDown ≤ (485 : Cut) / 100000 * lightBandStrange)
    ∧ (absMass1 / absMass0 = mass1 / mass0 ∧ absMass2 / absMass0 = mass2 / mass0)
    ∧ ((54220 * (10 : Cut) ^ 8) < 54226 * (10 : Cut) ^ 8 ∧ (4347 : Cut) < 4350)
    ∧ ((448 / 27 : Cut) ≠ 128 / 27)
    ∧ (∀ p : UnitPeg,
        p.human mass1 / p.human mass0 = mass1 / mass0
        ∧ p.human lightBandDown / p.human lightBandStrange = lightBandDown / lightBandStrange) :=
  ⟨koide_overconstraint,
   koide_bracket_straddles_6,
   waypoints_from_bracketed_edges,
   confBandRatio_triple_reading,
   lightPlacement_ratio_reproduces_N340,
   absLepton_ratio_web,
   waypoint_edge_widths_positive,
   waypoints_distinct,
   web_peg_invariant⟩

end

end Phys.Algebra.CrossCheckWeb
