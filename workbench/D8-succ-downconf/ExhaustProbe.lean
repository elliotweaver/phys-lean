import Phys.Algebra.FreezeoutReweightingBounded

namespace Phys.Algebra.LeadingCarrierExhaustedProbe

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.RecombinedEndpoint
open Phys.Algebra.PerChannelDressing
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.CasimirProjectionSelectsS
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.FreezeoutComposition
open Phys.Algebra.HadronicLevelWeights
open Phys.Algebra.JoinContent
open Phys.Algebra.JoinSplitRatioDerived
open Phys.Algebra.LeadingComposedAssembly
open Phys.Algebra.FreezeoutReweightingBounded
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-- The leading composed carrier (the way-point-consistent leading-κ composed object). -/
def leadingCarrier (Mu Md Mlam : Cut) : Cut :=
  invAlphaEM (completeBandList chargeTraceDepth)
    - projectedS * totalScreeningWith 1 (completeBandList chargeTraceDepth)
    + totalScreening (freezeoutTail (edgeBottom Mu Md) (edgeCharm Mu Md) (edgeLight Md (Mlam ^ 2)))

-- (1) leading carrier determined = re-export composed_leading_closed
example (Mu Md Mlam : Cut) (hu : Mu ≠ 0) (hd : Md ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived) (huc : (Mu / Mlam) ^ 2 = 1 / confBundle) :
    leadingCarrier Mu Md Mlam
      = 112
        + (chargeTraceDepth - projectedS) * totalScreeningWith 1 (completeBandList chargeTraceDepth)
        + (16 / 9
          + kappaLeading * ((7 / 3) * cutLog mbRatioDerived + (11 / 3) * cutLog (bMass 0)
            - (5 / 3) * cutLog (bMass 2))) := by
  unfold leadingCarrier
  exact composed_leading_closed Mu Md Mlam hu hd hl hud huc

-- (2) residual above the certified recombined endpoint = determined closed real (NEW, ring)
example (Mu Md Mlam : Cut) :
    leadingCarrier Mu Md Mlam - invAlphaEM (completeBandList chargeTraceDepth)
      = totalScreening (freezeoutTail (edgeBottom Mu Md) (edgeCharm Mu Md) (edgeLight Md (Mlam ^ 2)))
        - projectedS * totalScreeningWith 1 (completeBandList chargeTraceDepth) := by
  unfold leadingCarrier; ring

-- (3) residual freeze-out part at pinned edges = determined closed form
example (Mu Md Mlam : Cut) (hu : Mu ≠ 0) (hd : Md ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived) (huc : (Mu / Mlam) ^ 2 = 1 / confBundle) :
    totalScreening (freezeoutTail (edgeBottom Mu Md) (edgeCharm Mu Md) (edgeLight Md (Mlam ^ 2)))
      = 16 / 9
        + kappaLeading * ((7 / 3) * cutLog mbRatioDerived + (11 / 3) * cutLog (bMass 0)
          - (5 / 3) * cutLog (bMass 2)) :=
  freezeout_at_pinned_dissolved Mu Md Mlam hu hd hl hud huc

-- (4a) recombination composed
example : invAlphaEM (completeBandList chargeTraceDepth)
    = invAlphaZero (completeBandList chargeTraceDepth) + 70 := composed_endpoint

-- (4b) anti-screening derived
example : projectedS = 1 / 8 := projectedS_eq

-- (4c) join zero
example (w : Cut) : joinContent w joinSplitRatio = 0 := joinContent_at_derived_eq_zero w

-- (5) general reweighting bound (freeze-out not dominant under ANY reweighting)
example (wb wc wl rb rc rl R : Cut)
    (hwb : 0 ≤ wb) (hwc : 0 ≤ wc) (hwl : 0 ≤ wl)
    (hb : 1 < rb) (hc : 1 < rc) (hl : 1 < rl)
    (hbR : rb ≤ R) (hcR : rc ≤ R) (hlR : rl ≤ R) :
    reweightedFreezeout wb wc wl rb rc rl ≤ kappaLeading * (wb + wc + wl) * cutLog R :=
  freezeout_reweight_bounded wb wc wl rb rc rl R hwb hwc hwl hb hc hl hbR hcR hlR

-- (6a) anti-screening positive (teeth)
example : (0 : Cut) < projectedS * totalScreeningWith 1 (completeBandList chargeTraceDepth) :=
  antiscreen_positive

-- (6b) counts distinct (teeth)
example : ((Nat.card ↥(levelOccupancy 1) : ℕ) : Cut)
    ≠ censusBottomBand + censusCharmBand + censusLightBand := occupancy_ne_census_total

end

end Phys.Algebra.LeadingCarrierExhaustedProbe
