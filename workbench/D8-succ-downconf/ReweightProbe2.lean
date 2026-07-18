import Phys.Algebra.LeadingComposedAssembly
import Mathlib.Tactic

namespace ReweightProbe2

open Phys.Algebra
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.FreezeoutComposition
open Phys.Algebra.HadronicLevelWeights
open Phys.Algebra.AssembledBracket
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.BandEdgeList
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

def reweightedFreezeout (wb wc wl rb rc rl : Cut) : Cut :=
  kappaLeading * wb * cutLog rb + kappaLeading * wc * cutLog rc + kappaLeading * wl * cutLog rl

theorem census_reweight_is_banked (rb rc rl : Cut) :
    reweightedFreezeout (11/3) (10/3) 2 rb rc rl
      = totalScreening (freezeoutTail rb rc rl) := by
  unfold reweightedFreezeout
  rw [freezeout_closed]

-- re-export the banked composed_bounded (freeze-out is not the dominant summand)
theorem freezeout_not_dominant (rb rc rl R : Cut) (hR : 1 < R)
    (hb : 1 < rb) (hc : 1 < rc) (hl : 1 < rl)
    (hbR : rb ≤ R) (hcR : rc ≤ R) (hlR : rl ≤ R) :
    invAlphaZero (completeFreezeoutList rb rc rl chargeTraceDepth)
      ≤ 32019546505738 / 471238898037 + kappaLeading * 9 * cutLog R :=
  composed_bounded rb rc rl R hR hb hc hl hbR hcR hlR

theorem occupancy_ne_census_total :
    ((Nat.card ↥(levelOccupancy 1) : ℕ) : Cut)
      ≠ censusBottomBand + censusCharmBand + censusLightBand := by
  rw [floorOccupancy_eq_sixteen, freezeout_total_census]; norm_num

end

end ReweightProbe2
