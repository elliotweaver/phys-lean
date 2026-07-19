/-
  Phys.Algebra.EdgeLogArgAudit — AUDIT THE EDGE-LOG ARGUMENTS AB INITIO (the LAST un-audited layer
  after the base N575). N576.

  The dissolved freeze-out summand is `40/27 + kappaLeading * [3 * L_mb + (10/3) * L_b0 - (5/3) * L_b2]`
  (active-span, N574 `freezeoutActive_summand_dissolved`), with L_mb = cutLog mbRatioDerived,
  L_b0 = cutLog (bMass 0), L_b2 = cutLog (bMass 2), and the light edge carrying `downConfBundle`.
  This module traces each cutLog ARGUMENT to its banked pinning and adjudicates, by AB-INITIO COUNTING
  (the same method as N574/N575, never solving-for-137.036), the double-count question the parent
  (N575) surfaced.

  THE THREE FINDINGS (all THEOREM-level facts of the derived real `Cut`):

  (1) THE NORM ARGUMENTS CONFIRM EXACTLY. `mbRatioDerived` IS the cross-sector heaviest ratio
      `sectorMass Md 0 / sectorMass Mu 0 = (Md/Mu)^2` under the up/down leg `hud` (the shape numeral
      `bMass 0` cancels, banked `crossSector_heaviest_ratio`) — `mbRatio_is_heaviest_cross_ratio`. The
      bottom and charm edge logs pin from `hud` ALONE and carry NO confinement rung:
      `cutLog (edgeBottom) = L_mb + L_b0 - L_b2` (`bottom_log_no_rung`),
      `cutLog (edgeCharm) = - L_mb` (`charm_log_no_rung`). No scale/inversion is mis-assigned.

  (2) THE CONFINEMENT RUNG ENTERS THE EDGE-LOGS SOLELY VIA THE LIGHT EDGE, SOLELY VIA `huc`. The light
      edge log is `cutLog (edgeLight) = L_mb + 8*cutPi/3 + L_b2` (`light_log_carries_rung`), and that
      identity REQUIRES the extra hypothesis `huc : (Mu/Mlam)^2 = 1/confBundle` — the confinement-sector
      top-anchor identification, a candidate (owner arc-M/O2 scale-identification genre; it enters
      `edgeLight_pinned` only as an explicit HYPOTHESIS, never as an equality proved of `Cut`). The rung
      is `8*cutPi/3` ISOLATED from the shape logs (`rung_isolated_in_light`); the bottom/charm logs are
      rung-free (their difference from the pure shape combination is `0`, `bottom_charm_rung_free`).

  (3) THE LIGHT-EDGE RUNG EQUALS THE CONFINEMENT-BAND RUNG VALUE, OVER OVERLAPPING CENSUS. The light
      edge's rung is EXACTLY the confinement-band rung: `8*cutPi/3 = cutLog confBandRatio`
      (`light_rung_is_confBand_rung`). The band screens the FULL charge census at that rung:
      `bandScreen chargeTraceDepth confBandRatio = 128/27` (banked `bandScreen_conf_exact`,
      `confBand_full_census`). The light census is a STRICT SUBSET of that full census, which itself
      partitions across the descent: `censusActiveLightSpan (5/3) < colouredCensus (10/3) <
      chargeTraceDepth (16/3)` (`light_census_strict_subset`) and `chargeTraceDepth = colouredCensus +
      leptonCensus` (`census_partition`, banked `census_split`). The light gem on that same rung is
      `kappaLeading * censusActiveLightSpan * (8*cutPi/3) = 40/27` (`gem_on_rung`).

  THE VERDICT (packaged in `edgeLogArgAudit_landing`). The two THEOREM-level norm arguments confirm
  exactly and are rung-free. The confinement rung enters the freeze-out edge-logs ONLY through the
  light edge, and ONLY through the candidate top-anchor `huc`. That rung is the SAME value the band
  screens at the full census `16/3`, and the light census `5/3` is a strict subset of it over that same
  value. So AB-INITIO COUNTING is consistent with BOTH readings simultaneously — (i) the light rung is a
  genuine independent relation (down sector to the confinement scale), (ii) it re-screens content the
  band already carried at census `16/3` over the same rung value. The discriminator between (i) and (ii)
  is precisely the candidate top-anchor identification `huc` — an owner-gated scale-identification, NOT
  a counting question the kernel can force. Per the confirmed-exactly branch of the task, the layer's
  theorem-level content confirms and the double-count reading escalates to the owner.

  NO-FIT: the measured value `137.035999...` is removable prose; no empirical number appears in any
  statement or proof; nothing bends toward it. The counting lands where the fold's census structure
  puts it.

  WORDS-REMOVABLE: delete every physics word (edge/rung/confinement/census/band/light/charm/bottom/
  top-anchor/mass) and what remains is pure arithmetic of the derived real `Cut`: three cutLog
  identities of the pinned edge values (two depending on `hud`, one depending on `hud` and `huc`), the
  equality of a scalar with `cutLog confBandRatio`, a screening equal to `128/27`, a strict chain
  `5/3 < 10/3 < 16/3` with a sum decomposition, and a product equal to `40/27`. No name is load-bearing.

  Foundations-only; derived real `Cut` only (never Mathlib Real as content); no floats.
-/
import Phys.Algebra.BaseNormalFormAudit

namespace Phys.Algebra.EdgeLogArgAudit

open Phys.Algebra
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.PerEdgeCensusRederived
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.BandEdgeList
open Phys.Algebra.BaseNormalFormAudit
open Phys.Foundation Phys.Foundation.ContinuumQ

/-! ## (1) THE NORM ARGUMENTS CONFIRM EXACTLY (theorem-level, on the up/down leg `hud` alone). -/

/-- `mbRatioDerived` IS the cross-sector heaviest ratio: under the up/down leg `hud`,
    `sectorMass Md 0 / sectorMass Mu 0 = mbRatioDerived`. The shape numeral `bMass 0` cancels in the
    heaviest-to-heaviest cross-sector ratio (banked `crossSector_heaviest_ratio`), so the ratio is the
    pure relative sector scale `(Md/Mu)^2`, identified with `mbRatioDerived` by `hud`. No scale or
    inversion is mis-assigned. -/
theorem mbRatio_is_heaviest_cross_ratio (Mu Md : Cut) (hu : Mu ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived) :
    sectorMass Md 0 / sectorMass Mu 0 = mbRatioDerived := by
  rw [crossSector_heaviest_ratio Mu Md hu, hud]

/-- THE BOTTOM EDGE LOG PINS FROM `hud` ALONE AND CARRIES NO CONFINEMENT RUNG:
    `cutLog (edgeBottom Mu Md) = cutLog mbRatioDerived + cutLog (bMass 0) - cutLog (bMass 2)`. -/
theorem bottom_log_no_rung (Mu Md : Cut) (hu : Mu ≠ 0) (hd : Md ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived) :
    cutLog (edgeBottom Mu Md)
      = cutLog mbRatioDerived + cutLog (bMass 0) - cutLog (bMass 2) := by
  rw [edgeBottom_pinned Mu Md hu hd hud,
      cutLog_mul mbRatioDerived_pos (div_pos bMass0_pos bMass2_pos),
      cutLog_div_pos bMass0_pos bMass2_pos]
  ring

/-- THE CHARM EDGE LOG PINS FROM `hud` ALONE AND CARRIES NO CONFINEMENT RUNG:
    `cutLog (edgeCharm Mu Md) = - cutLog mbRatioDerived`. -/
theorem charm_log_no_rung (Mu Md : Cut) (hu : Mu ≠ 0) (hd : Md ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived) :
    cutLog (edgeCharm Mu Md) = - cutLog mbRatioDerived := by
  rw [edgeCharm_pinned Mu Md hu hd hud, cutLog_inv_pos mbRatioDerived_pos]

/-! ## (2) THE CONFINEMENT RUNG ENTERS SOLELY VIA THE LIGHT EDGE, SOLELY VIA `huc`. -/

/-- THE LIGHT EDGE LOG CARRIES THE CONFINEMENT RUNG — AND REQUIRES `huc`:
    `cutLog (edgeLight Md (Mlam^2)) = cutLog mbRatioDerived + 8*cutPi/3 + cutLog (bMass 2)`, where the
    `8*cutPi/3` enters through `downConfBundle = mbRatioDerived / confBundle` and the pinning
    `edgeLight_pinned` REQUIRES the candidate top-anchor hypothesis `huc : (Mu/Mlam)^2 = 1/confBundle`. -/
theorem light_log_carries_rung (Mu Md Mlam : Cut) (hu : Mu ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived)
    (huc : (Mu / Mlam) ^ 2 = 1 / confBundle) :
    cutLog (edgeLight Md (Mlam ^ 2))
      = cutLog mbRatioDerived + 8 * cutPi / 3 + cutLog (bMass 2) := by
  rw [edgeLight_pinned Mu Md Mlam hu hl hud huc,
      cutLog_mul downConfBundle_pos bMass2_pos, cutLog_downConfBundle]

/-- THE RUNG IS ISOLATED IN THE LIGHT EDGE: subtracting the pure shape combination from the light log
    leaves EXACTLY the confinement rung `8*cutPi/3`. -/
theorem rung_isolated_in_light (Mu Md Mlam : Cut) (hu : Mu ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived)
    (huc : (Mu / Mlam) ^ 2 = 1 / confBundle) :
    cutLog (edgeLight Md (Mlam ^ 2)) - (cutLog mbRatioDerived + cutLog (bMass 2))
      = 8 * cutPi / 3 := by
  rw [light_log_carries_rung Mu Md Mlam hu hl hud huc]; ring

/-- THE BOTTOM/CHARM LOGS ARE RUNG-FREE: each equals its pure shape combination exactly (difference
    `0`), so neither the bottom nor the charm edge carries the confinement rung. -/
theorem bottom_charm_rung_free (Mu Md : Cut) (hu : Mu ≠ 0) (hd : Md ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived) :
    (cutLog (edgeBottom Mu Md)
        - (cutLog mbRatioDerived + cutLog (bMass 0) - cutLog (bMass 2)) = 0)
    ∧ (cutLog (edgeCharm Mu Md) - (- cutLog mbRatioDerived) = 0) := by
  refine ⟨?_, ?_⟩
  · rw [bottom_log_no_rung Mu Md hu hd hud]; ring
  · rw [charm_log_no_rung Mu Md hu hd hud]; ring

/-! ## (3) THE LIGHT-EDGE RUNG EQUALS THE CONFINEMENT-BAND RUNG, OVER OVERLAPPING CENSUS. -/

/-- THE LIGHT-EDGE RUNG IS THE CONFINEMENT-BAND RUNG VALUE: `8*cutPi/3 = cutLog confBandRatio`
    (banked `confRung_val`). The value the light edge carries is precisely the value the band screens. -/
theorem light_rung_is_confBand_rung : (8 * cutPi / 3 : Cut) = cutLog confBandRatio :=
  confRung_val.symm

/-- THE BAND SCREENS THE FULL CHARGE CENSUS AT THAT RUNG: `bandScreen chargeTraceDepth confBandRatio =
    128/27` (banked `bandScreen_conf_exact`). -/
theorem confBand_full_census : bandScreen chargeTraceDepth confBandRatio = 128 / 27 :=
  bandScreen_conf_exact

/-- THE LIGHT CENSUS IS A STRICT SUBSET OF THE BAND'S FULL CENSUS:
    `censusActiveLightSpan (5/3) < colouredCensus (10/3) < chargeTraceDepth (16/3)`. -/
theorem light_census_strict_subset :
    censusActiveLightSpan < colouredCensus ∧ colouredCensus < chargeTraceDepth := by
  refine ⟨?_, ?_⟩
  · rw [censusActiveLightSpan_val, colouredCensus_val]; norm_num
  · rw [colouredCensus_val, chargeTraceDepth_eq]; norm_num

/-- THE FULL CENSUS PARTITIONS ACROSS THE DESCENT: `chargeTraceDepth = colouredCensus + leptonCensus`
    (banked `census_split`, `16/3 = 10/3 + 2`). -/
theorem census_partition : chargeTraceDepth = colouredCensus + leptonCensus :=
  census_split

/-- THE LIGHT GEM ON THAT SAME RUNG: `kappaLeading * censusActiveLightSpan * (8*cutPi/3) = 40/27`
    (banked `gem_active` at the active-span census `5/3`). -/
theorem gem_on_rung :
    kappaLeading * censusActiveLightSpan * (8 * cutPi / 3) = 40 / 27 := by
  rw [censusActiveLightSpan_val]; exact gem_active

/-! ## (W8) NON-VACUITY WITH TEETH. -/

/-- W8 — THE RUNG GENUINELY BITES: `0 < 8*cutPi/3`. The confinement rung the light edge carries is a
    genuine positive quantity, not a degenerate zero. -/
theorem rung_pos : (0 : Cut) < 8 * cutPi / 3 := by
  have := cutPi_pos; positivity

/-- W8 — THE CENSUS NESTING IS STRICT: `5/3 < 10/3 < 16/3`, so the light census is genuinely a proper
    subset of the band's full census. A WRONG "the light census equals the full census" reading is
    refuted. -/
theorem census_gap_nonzero : censusActiveLightSpan ≠ chargeTraceDepth := by
  have h := light_census_strict_subset
  have hlt : censusActiveLightSpan < chargeTraceDepth := lt_trans h.1 h.2
  exact ne_of_lt hlt

/-- W8 — THE LIGHT AND BOTTOM EDGES ARE GENUINELY DIFFERENT ON THE RUNG: the light log minus the pure
    shape combination is `8*cutPi/3 ≠ 0`, whereas the bottom log minus its shape combination is `0`.
    The rung is carried by the light edge and NOT the bottom edge — a real asymmetry. -/
theorem light_bottom_rung_asymmetry (Mu Md Mlam : Cut) (hu : Mu ≠ 0) (hd : Md ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived)
    (huc : (Mu / Mlam) ^ 2 = 1 / confBundle) :
    (cutLog (edgeLight Md (Mlam ^ 2)) - (cutLog mbRatioDerived + cutLog (bMass 2)) ≠ 0)
    ∧ (cutLog (edgeBottom Mu Md)
        - (cutLog mbRatioDerived + cutLog (bMass 0) - cutLog (bMass 2)) = 0) := by
  refine ⟨?_, (bottom_charm_rung_free Mu Md hu hd hud).1⟩
  rw [rung_isolated_in_light Mu Md Mlam hu hl hud huc]
  exact ne_of_gt rung_pos

/-! ## THE LANDING — the verdict, packaged. -/

/-- ★★★ THE EDGE-LOG ARGUMENT AUDIT LANDING. Packaging the three findings:

    (1) the norm arguments confirm exactly, rung-free, on `hud` alone (bottom and charm logs);
    (2) the confinement rung enters the freeze-out edge-logs SOLELY via the light edge, SOLELY via the
        candidate top-anchor `huc` (the light log carries `8*cutPi/3`);
    (3) that rung is EXACTLY the value the band screens at the full census `16/3` (`128/27`), and the
        light census `5/3` is a STRICT SUBSET of that full census (`5/3 < 10/3 < 16/3`), the full census
        partitioning as `16/3 = 10/3 + 2` and the light gem on that rung being `40/27`.

    So ab-initio counting confirms the theorem-level content and is consistent with BOTH the
    independent-rung and the double-count reading — the discriminator is the owner-gated candidate
    top-anchor `huc`, not a fact the kernel forces. -/
theorem edgeLogArgAudit_landing (Mu Md Mlam : Cut)
    (hu : Mu ≠ 0) (hd : Md ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived)
    (huc : (Mu / Mlam) ^ 2 = 1 / confBundle) :
    (cutLog (edgeBottom Mu Md)
        = cutLog mbRatioDerived + cutLog (bMass 0) - cutLog (bMass 2))
    ∧ (cutLog (edgeCharm Mu Md) = - cutLog mbRatioDerived)
    ∧ (cutLog (edgeLight Md (Mlam ^ 2))
        = cutLog mbRatioDerived + 8 * cutPi / 3 + cutLog (bMass 2))
    ∧ ((8 * cutPi / 3 : Cut) = cutLog confBandRatio)
    ∧ (bandScreen chargeTraceDepth confBandRatio = 128 / 27)
    ∧ (censusActiveLightSpan < colouredCensus ∧ colouredCensus < chargeTraceDepth)
    ∧ (chargeTraceDepth = colouredCensus + leptonCensus)
    ∧ (kappaLeading * censusActiveLightSpan * (8 * cutPi / 3) = 40 / 27) :=
  ⟨bottom_log_no_rung Mu Md hu hd hud,
   charm_log_no_rung Mu Md hu hd hud,
   light_log_carries_rung Mu Md Mlam hu hl hud huc,
   light_rung_is_confBand_rung,
   confBand_full_census,
   light_census_strict_subset,
   census_partition,
   gem_on_rung⟩

end Phys.Algebra.EdgeLogArgAudit
