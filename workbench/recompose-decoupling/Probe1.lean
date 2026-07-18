import Phys.Algebra.SubBandCompletion
import Mathlib.Tactic

namespace Phys.Algebra.RecomposeProbe

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- coloured (quark) slice of the charge census, doubled over chirality: 2·(cCT2+cCT1) = 10/3
def colouredCensus : Cut := ((2 * (colouredCensusTerm 2 + colouredCensusTerm 1) : ℚ) : Cut)

theorem colouredCensus_val : colouredCensus = 10 / 3 := by
  unfold colouredCensus
  rw [colouredCensusTerm_two, colouredCensusTerm_one]; push_cast; norm_num

-- lepton (colour-singlet) census forced by census conservation: chargeTraceDepth − colouredCensus
def leptonCensus : Cut := chargeTraceDepth - colouredCensus

theorem leptonCensus_val : leptonCensus = 2 := by
  unfold leptonCensus
  rw [colouredCensus_val, chargeTraceDepth_eq]; norm_num

-- the conservation split, grounded in the banked census_generation_is_depth
theorem census_split : chargeTraceDepth = colouredCensus + leptonCensus := by
  unfold leptonCensus; ring

-- THE REMOVAL: the decoupled coloured content removed from the lepton tail
theorem decoupling_removal :
    totalScreening (leptonTail chargeTraceDepth) - totalScreening (leptonTail leptonCensus)
      = bandScreen colouredCensus (mass0 / mass1) := by
  rw [leptonTail_screen_telescope, leptonTail_screen_telescope]
  unfold bandScreen
  rw [census_split]; ring

theorem removal_pos : 0 < bandScreen colouredCensus (mass0 / mass1) := by
  apply bandScreen_pos _ m01_gt_one
  rw [colouredCensus_val]; norm_num

-- census-conserving endpoint sits strictly BELOW the additive (full-census) one
theorem conserving_below_additive :
    invAlphaZero (completeBandList leptonCensus)
      < invAlphaZero (completeBandList chargeTraceDepth) := by
  rw [endpoint_closed, endpoint_closed]
  have h : bandScreen chargeTraceDepth (mass0/mass1) - bandScreen leptonCensus (mass0/mass1)
      = bandScreen colouredCensus (mass0/mass1) := by
    unfold bandScreen; rw [census_split]; ring
  have hp := removal_pos
  linarith [h, hp]

-- way-points reproduce free on the census-conserving tower
theorem conserving_confWaypoint_free :
    invAlphaZero (completeBandList leptonCensus)
      = 190 / 3 + totalScreening (leptonTail leptonCensus) :=
  confWaypoint_in_complete leptonCensus

end

end Phys.Algebra.RecomposeProbe
