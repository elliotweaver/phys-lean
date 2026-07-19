import Phys.Algebra.BaseNormalFormAudit

namespace Phys.Algebra.EdgeLogArgAuditProbe

open Phys.Algebra
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.PerEdgeCensusRederived
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.BandEdgeList
open Phys.Algebra.BaseNormalFormAudit
open Phys.Foundation Phys.Foundation.ContinuumQ

-- (A) bottom edge log: pins on hud ALONE, NO confinement rung
theorem probe_bottom (Mu Md : Cut) (hu : Mu ≠ 0) (hd : Md ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived) :
    cutLog (edgeBottom Mu Md)
      = cutLog mbRatioDerived + cutLog (bMass 0) - cutLog (bMass 2) := by
  rw [edgeBottom_pinned Mu Md hu hd hud,
      cutLog_mul mbRatioDerived_pos (div_pos bMass0_pos bMass2_pos),
      cutLog_div_pos bMass0_pos bMass2_pos]
  ring

-- (B) charm edge log: pins on hud ALONE, NO confinement rung
theorem probe_charm (Mu Md : Cut) (hu : Mu ≠ 0) (hd : Md ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived) :
    cutLog (edgeCharm Mu Md) = - cutLog mbRatioDerived := by
  rw [edgeCharm_pinned Mu Md hu hd hud, cutLog_inv_pos mbRatioDerived_pos]

-- (C) light edge log: REQUIRES huc (candidate), carries the confinement rung 8·cutPi/3
theorem probe_light (Mu Md Mlam : Cut) (hu : Mu ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived)
    (huc : (Mu / Mlam) ^ 2 = 1 / confBundle) :
    cutLog (edgeLight Md (Mlam ^ 2))
      = cutLog mbRatioDerived + 8 * cutPi / 3 + cutLog (bMass 2) := by
  rw [edgeLight_pinned Mu Md Mlam hu hl hud huc,
      cutLog_mul downConfBundle_pos bMass2_pos, cutLog_downConfBundle]

-- (D) the light-edge rung EQUALS the confBand rung value
theorem probe_rung_eq : (8 * cutPi / 3 : Cut) = cutLog confBandRatio := (confRung_val).symm

-- (E) census nesting: 5/3 < 10/3 < 16/3 and split
theorem probe_census :
    censusActiveLightSpan < colouredCensus
    ∧ colouredCensus < chargeTraceDepth
    ∧ chargeTraceDepth = colouredCensus + leptonCensus := by
  refine ⟨?_, ?_, census_split⟩
  · rw [censusActiveLightSpan_val, colouredCensus_val]; norm_num
  · rw [colouredCensus_val, chargeTraceDepth_eq]; norm_num

-- (F) W8: light carries rung, bottom does not
theorem probe_w8_light (Mu Md Mlam : Cut) (hu : Mu ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived)
    (huc : (Mu / Mlam) ^ 2 = 1 / confBundle) :
    cutLog (edgeLight Md (Mlam ^ 2)) - (cutLog mbRatioDerived + cutLog (bMass 2))
      = 8 * cutPi / 3 := by
  rw [probe_light Mu Md Mlam hu hl hud huc]; ring

theorem probe_w8_rung_pos : (0 : Cut) < 8 * cutPi / 3 := by
  have := cutPi_pos; positivity

end Phys.Algebra.EdgeLogArgAuditProbe
