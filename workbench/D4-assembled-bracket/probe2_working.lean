import Phys.Algebra.DepthWeight
import Phys.Algebra.SubBandCompletion
import Phys.Foundation.ContinuumBracket
import Mathlib.Tactic

namespace Phys.Algebra.ProbeD4b

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DepthWeight
open Phys.Algebra.AbsMass
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-- cutLog(mass0/mass1) is positive (the flavor ratio exceeds 1). -/
theorem clog_pos : 0 < cutLog (mass0 / mass1) := cutLog_pos m01_gt_one

/-- 1/cutPi is positive. -/
theorem inv_cutPi_pos : 0 < 1 / cutPi := by positivity [cutPi_pos]

/-- The BARE endpoint expressed with κ split as (1/3)·(1/cutPi). -/
theorem endpoint_split (d : Cut) :
    invAlphaZero (completeBandList d)
      = 190/3 + (d/3) * cutLog (mass0/mass1) * (1/cutPi) := by
  rw [endpoint_expanded]
  rw [kappaLeading_eq]
  have hpi : cutPi ≠ 0 := ne_of_gt cutPi_pos
  field_simp

/-- ★ THE ASSEMBLED BRACKET for the BARE endpoint, PARAMETRIC over a rational bracket on the
    residual transcendental 1/cutPi and the (D1-concrete) cutLog content bracket. -/
theorem endpoint_assembled_bracket (d : Cut) (hd : 0 ≤ d)
    (la lb : Cut) (hla0 : 0 ≤ la) (hla : la ≤ cutLog (mass0/mass1))
      (hlb : cutLog (mass0/mass1) ≤ lb)
    (pa pb : Cut) (hpa0 : 0 ≤ pa) (hpa : pa ≤ 1/cutPi) (hpb : 1/cutPi ≤ pb) :
    (190/3 + (d/3) * la * pa) ≤ invAlphaZero (completeBandList d)
      ∧ invAlphaZero (completeBandList d) ≤ (190/3 + (d/3) * lb * pb) := by
  rw [endpoint_split]
  have hd3 : 0 ≤ d/3 := by linarith
  have hclog0 : 0 ≤ cutLog (mass0/mass1) := le_of_lt clog_pos
  have hip0 : 0 ≤ (1:Cut)/cutPi := le_of_lt inv_cutPi_pos
  constructor
  · -- lower: la·pa ≤ cutLog·(1/cutPi)
    have h1 : la * pa ≤ cutLog (mass0/mass1) * (1/cutPi) :=
      mul_le_mul hla hpa hpa0 hclog0
    have h2 : (d/3) * (la * pa) ≤ (d/3) * (cutLog (mass0/mass1) * (1/cutPi)) :=
      mul_le_mul_of_nonneg_left h1 hd3
    nlinarith [h2]
  · -- upper: cutLog·(1/cutPi) ≤ lb·pb
    have h1 : cutLog (mass0/mass1) * (1/cutPi) ≤ lb * pb :=
      mul_le_mul hlb hpb hip0 (le_trans hclog0 hlb)
    have h2 : (d/3) * (cutLog (mass0/mass1) * (1/cutPi)) ≤ (d/3) * (lb * pb) :=
      mul_le_mul_of_nonneg_left h1 hd3
    nlinarith [h2]

/-- The dressed endpoint at the derived weight over the COMPLETE list. -/
theorem dressed_endpoint_at_depthWeight (d : Cut) :
    dressedInvAlphaZero depthWeight (completeBandList d)
      = 74 + (d/2) * cutLog (mass0/mass1) * (1/cutPi) := by
  rw [dressed_endpoint_closed depthWeight d (le_of_lt depthWeight_pos) depthWeight_lt_one,
      depthWeight_eq]
  -- totalScreening(completeBandList d) = 64/3 + κ·d·cutLog(m0/m1)
  have htot : totalScreening (completeBandList d)
      = 64/3 + kappaLeading * d * cutLog (mass0/mass1) := by
    unfold completeBandList
    rw [totalScreening_append, totalScreening_derivedBandList, leptonTail_screen_telescope]
    unfold bandScreen
    ring
  rw [htot, kappaLeading_eq]
  have hpi : cutPi ≠ 0 := ne_of_gt cutPi_pos
  field_simp
  ring

end

end Phys.Algebra.ProbeD4b
