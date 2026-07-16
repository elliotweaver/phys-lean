import Phys.Algebra.BandEdgeList
import Phys.Algebra.DepthTowerDescent
import Phys.Algebra.GenerationMassRatiosNumeric
import Mathlib.Tactic

namespace Z6Probe2

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.AbsMass
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

theorem absRatio_02 : absMass0 / absMass2 = mass0 / mass2 := by
  unfold absMass0 absMass2; exact mul_div_mul_left mass0 mass2 massScale_ne_zero
theorem absRatio_21 : absMass2 / absMass1 = mass2 / mass1 := by
  unfold absMass2 absMass1; exact mul_div_mul_left mass2 mass1 massScale_ne_zero
theorem mr02_pos : (0 : Cut) < mass0 / mass2 := div_pos mass0_pos mass2_pos
theorem mr21_pos : (0 : Cut) < mass2 / mass1 := div_pos mass2_pos mass1_pos

def leptonTail : List (Cut × Cut) :=
  [(chargeTraceDepth, absMass0 / absMass2), (chargeTraceDepth, absMass2 / absMass1)]

theorem telescope :
    totalScreening leptonTail = bandScreen chargeTraceDepth (mass0 / mass1) := by
  unfold leptonTail totalScreening
  simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero]
  rw [absRatio_02, absRatio_21]
  unfold bandScreen
  have hlog : cutLog (mass0 / mass2) + cutLog (mass2 / mass1) = cutLog (mass0 / mass1) := by
    rw [← cutLog_mul mr02_pos mr21_pos]; congr 1
    have h1 : mass1 ≠ 0 := ne_of_gt mass1_pos
    have h2 : mass2 ≠ 0 := ne_of_gt mass2_pos
    field_simp
  have hr : kappaLeading * chargeTraceDepth * cutLog (mass0/mass2)
          + kappaLeading * chargeTraceDepth * cutLog (mass2/mass1)
          = kappaLeading * chargeTraceDepth * (cutLog (mass0/mass2) + cutLog (mass2/mass1)) := by
    ring
  rw [hr, hlog]

def completeBandList : List (Cut × Cut) := derivedBandList ++ leptonTail

-- (D) THE ENDPOINT CLOSED FORM
theorem endpoint_closed :
    invAlphaZero completeBandList = 190 / 3 + bandScreen chargeTraceDepth (mass0 / mass1) := by
  unfold completeBandList
  rw [confWaypoint_free leptonTail, telescope]

-- mass0/mass1 > 1
theorem m01_gt_one : (1 : Cut) < mass0 / mass1 := by
  rw [one_lt_div mass1_pos]
  exact lt_trans mass_distinct_1_2 mass_distinct_2_0

-- (H) THE ENDPOINT GENUINELY SCREENS ABOVE 190/3
theorem endpoint_gt_conf : (190 : Cut) / 3 < invAlphaZero completeBandList := by
  rw [endpoint_closed]
  have : 0 < bandScreen chargeTraceDepth (mass0 / mass1) :=
    bandScreen_pos chargeTraceDepth_pos m01_gt_one
  linarith

-- (E) FREE WAY-POINTS: 1582/27 and 190/3 as partial sums of completeBandList
theorem ewWaypoint_in_complete :
    invAlphaZero completeBandList
      = 1582 / 27 + totalScreening ((chargeTraceDepth, confBandRatio) :: leptonTail) := by
  unfold completeBandList derivedBandList
  -- derivedBandList = [top, conf]; complete = top :: conf :: leptonTail
  rw [show ([(chargeTraceDepth, topBandRatio), (chargeTraceDepth, confBandRatio)] ++ leptonTail)
        = [(chargeTraceDepth, topBandRatio)] ++ ((chargeTraceDepth, confBandRatio) :: leptonTail)
        from rfl]
  rw [ewWaypoint_free]

theorem confWaypoint_in_complete :
    invAlphaZero completeBandList = 190 / 3 + totalScreening leptonTail := by
  unfold completeBandList
  rw [confWaypoint_free]

-- (G) THE DRESSED (X5 depth tower) ENDPOINT over the complete list
theorem dressed_endpoint_closed (w : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) :
    dressedInvAlphaZero w completeBandList
      = 42 + totalScreening completeBandList / (1 - w) :=
  dressedInvAlphaZero_closed w hw0 hw1 completeBandList

-- dressed at w=0 recovers the endpoint
theorem dressed_endpoint_leading :
    dressedInvAlphaZero 0 completeBandList = invAlphaZero completeBandList := by
  rw [dressed_endpoint_closed 0 (le_refl 0) (by norm_num), invAlphaZero_closed]
  norm_num

end
end Z6Probe2
