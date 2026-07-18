import Phys.Algebra.DepthTwoBandVaryingRunning
import Phys.Algebra.DecouplingCensusRemoval
import Mathlib.Tactic

namespace Phys.Algebra.LowTailProbe

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.DepthWeight
open Phys.Algebra.DepthTwoBandVaryingRunning
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- (1) the fold-forced low-tail second-depth screen = (3/2)·totalScreening lowTail
theorem foldForcedLowTailScreen (lowTail : List (Cut × Cut)) :
    bandVaryingScreen (withWeight depthWeight lowTail) = 3 / 2 * totalScreening lowTail := by
  rw [bandVaryingScreen_uniform depthWeight (le_of_lt depthWeight_pos) depthWeight_lt_one,
      dressedTotalScreening_factor depthWeight (le_of_lt depthWeight_pos) depthWeight_lt_one,
      depthWeight_eq]
  ring

-- (2) value re-export
theorem foldForcedWeight_value : depthWeight = 1 / 3 := depthWeight_eq

-- (3) the fold-forced weight genuinely dresses the census-conserving lepton tail
theorem foldForced_dresses_lowTail :
    bandVaryingScreen (withWeight 0 (leptonTail leptonCensus))
      < bandVaryingScreen (withWeight depthWeight (leptonTail leptonCensus)) := by
  rw [bandVaryingScreen_zeroWeights, foldForcedLowTailScreen, leptonTail_screen_telescope]
  have hpos : 0 < bandScreen leptonCensus (mass0 / mass1) := by
    apply bandScreen_pos _ m01_gt_one
    rw [leptonCensus_val]; norm_num
  linarith

-- (4) a single band's weight is a real knob (value depends on it); fold FORCES it to depthWeight
theorem perBand_knob_real (b : Cut × Cut) (hb : bandScreen b.1 b.2 ≠ 0) :
    bandVaryingScreen [(0, b)] ≠ bandVaryingScreen [(depthWeight, b)] := by
  unfold bandVaryingScreen
  simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero]
  rw [foldForcedWeight_value]
  intro h
  apply hb
  have h2 : (1 - (1 / 3 : Cut)) = 2 / 3 := by norm_num
  rw [sub_zero, div_one, h2] at h
  have hval : bandScreen b.1 b.2 / (2 / 3 : Cut) = bandScreen b.1 b.2 * (3 / 2) := by ring
  rw [hval] at h
  linarith

-- (5) the census-conserving endpoint with fold-forced low-tail weight
theorem conservingEndpoint_foldForced :
    bandVaryingInvAlphaZero
        (withWeight 0 derivedBandList ++ withWeight depthWeight (leptonTail leptonCensus))
      = 190 / 3 + 3 / 2 * totalScreening (leptonTail leptonCensus) := by
  rw [highBands_preserved, foldForcedLowTailScreen]

-- (6) closed real of Cut via telescoping
theorem conservingEndpoint_closed :
    bandVaryingInvAlphaZero
        (withWeight 0 derivedBandList ++ withWeight depthWeight (leptonTail leptonCensus))
      = 190 / 3 + 3 / 2 * bandScreen leptonCensus (mass0 / mass1) := by
  rw [conservingEndpoint_foldForced, leptonTail_screen_telescope]

-- (7) bites: strictly above the confinement way-point
theorem conservingEndpoint_gt_waypoint :
    (190 / 3 : Cut)
      < bandVaryingInvAlphaZero
          (withWeight 0 derivedBandList ++ withWeight depthWeight (leptonTail leptonCensus)) := by
  rw [conservingEndpoint_closed]
  have hpos : 0 < bandScreen leptonCensus (mass0 / mass1) := by
    apply bandScreen_pos _ m01_gt_one
    rw [leptonCensus_val]; norm_num
  linarith

end

end Phys.Algebra.LowTailProbe
