import Phys.Algebra.ComposedFreezeoutDissolved
import Mathlib.Tactic

namespace Phys.Algebra.DressingSeamProbe

open Phys.Algebra
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.DepthWeight
open Phys.Algebra.BandEdgeList
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- (0) a single-band totalScreening reduces to bandScreen
example : totalScreening [(chargeTraceDepth, topBandRatio)]
    = bandScreen chargeTraceDepth topBandRatio := by
  unfold totalScreening; simp

-- (1) the dressed single top band at the derived weight = 602/9, NOT the banked 1582/27
example : (42 : Cut) + totalScreening [(chargeTraceDepth, topBandRatio)] / (1 - depthWeight)
    = 602 / 9 := by
  have hts : totalScreening [(chargeTraceDepth, topBandRatio)]
      = bandScreen chargeTraceDepth topBandRatio := by unfold totalScreening; simp
  rw [hts, bandScreen_topBand_exact, depthWeight_eq]
  norm_num

-- the banked exact way-point (leading κ)
example : invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27 :=
  invAlphaZero_topBand_value

-- the move is real: 602/9 ≠ 1582/27
example : (602 / 9 : Cut) ≠ 1582 / 27 := by norm_num

-- (2) dressed derivedBandList at the derived weight = 74 (banked), ≠ 190/3
example : dressedInvAlphaZero depthWeight derivedBandList = 74 := dressed_at_depthWeight
example : invAlphaZero derivedBandList = 190 / 3 := derivedBandList_assembly
example : (74 : Cut) ≠ 190 / 3 := by norm_num

-- (3) at w = 0 the dressing REPRODUCES the way-points exactly
example : dressedInvAlphaZero 0 derivedBandList = 190 / 3 := dressedInvAlphaZero_leading
example : (42 : Cut) + totalScreening [(chargeTraceDepth, topBandRatio)] / (1 - (0:Cut))
    = 1582 / 27 := by
  have hts : totalScreening [(chargeTraceDepth, topBandRatio)]
      = bandScreen chargeTraceDepth topBandRatio := by unfold totalScreening; simp
  rw [hts, bandScreen_topBand_exact]
  norm_num

-- (4) the inflation factor at the derived weight is 3/2 ≠ 1
example : (1 : Cut) / (1 - depthWeight) = 3 / 2 := by rw [depthWeight_eq]; norm_num

end

end Phys.Algebra.DressingSeamProbe
