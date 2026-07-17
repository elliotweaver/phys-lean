import Phys.Algebra.WayPointReadings
import Phys.Algebra.NarrowedBracket12
import Phys.Algebra.AssembledBracket
import Mathlib.Tactic

namespace Probe.D6

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DepthTowerDescent
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- (1) FREE INSTRUMENT-CHECK: the pipeline reproduces the exact way-points (width 0).
theorem ew_free : invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27 :=
  AssembledBracket.pipeline_ew_waypoint

theorem conf_free : invAlphaZero derivedBandList = 190 / 3 :=
  AssembledBracket.pipeline_conf_waypoint

theorem conf_free_zero : invAlphaZero (completeBandList 0) = 190 / 3 :=
  AssembledBracket.assembled_at_zero_census

theorem conf_free_dressed :
    dressedInvAlphaZero DepthWeight.depthWeight derivedBandList = 74 :=
  AssembledBracket.pipeline_conf_waypoint_dressed

-- (2) α(M_Z) certified two-sided rational bracket, evaluated FREE.
theorem alphaMZ_lo (vz : Cut) (hvz : 1 ≤ vz) :
    (1582 / 27 : Cut) ≤ WayPointReadings.invAlphaMZ vz :=
  WayPointReadings.invAlphaMZ_ge_ewpoint vz hvz

theorem alphaMZ_hi (vz zL : Cut) (hvz : 1 ≤ vz) (hzL : 1 ≤ zL)
    (hprod : vz * zL = confBandRatio) :
    WayPointReadings.invAlphaMZ vz < 32019546505738 / 471238898037 := by
  have h1 : WayPointReadings.invAlphaMZ vz < invAlphaZero (completeBandList chargeTraceDepth) :=
    WayPointReadings.endpoint_gt_invAlphaMZ vz zL (lt_of_lt_of_le zero_lt_one hvz) hzL hprod
  have h2 : invAlphaZero (completeBandList chargeTraceDepth)
      ≤ 32019546505738 / 471238898037 :=
    NarrowedBracket12.invAlphaZero_narrowed12_bracket.2
  linarith

-- (3) sin²θ_W(M_Z) evaluated FREE — exact 3/8.
theorem weinberg_free (M mz : Cut)
    (h2 : invAlpha2 isoDepth kappaLeading M mz ≠ 0) :
    (3 / 8 : Cut) ≤ sinSqRunExact isoDepth M mz ∧ sinSqRunExact isoDepth M mz ≤ 3 / 8 := by
  have h := WayPointReadings.sinSqMZ_stationary M mz h2
  exact ⟨by rw [h], by rw [h]⟩

-- (4) teeth
theorem tooth_bracket : (1582 / 27 : Cut) < 32019546505738 / 471238898037 := by norm_num

theorem tooth_screen (vz : Cut) (hvz : 1 ≤ vz) : (42 : Cut) < WayPointReadings.invAlphaMZ vz :=
  WayPointReadings.invAlphaMZ_gt_42 vz hvz

end

end Probe.D6
