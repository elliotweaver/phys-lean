import Phys.Algebra.SubBandCompletion
import Phys.Algebra.DecouplingCensusRemoval
import Mathlib.Tactic

namespace CensusClosureProbe

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-- The doubled total of the banked freeze-out removal STEPS. -/
def freezeoutStaircaseCensus : ℚ :=
  2 * ((bandCensus [2, 1, 1, 2, 1] - bandCensus [2, 1, 1, 2])
        + (bandCensus [2, 1, 1, 2] - bandCensus [2, 1, 1]))

theorem freezeoutStaircaseCensus_val : freezeoutStaircaseCensus = 10 / 3 := by
  unfold freezeoutStaircaseCensus
  rw [freezeout_step_bottom, freezeout_step_charm, colouredCensusTerm_one, colouredCensusTerm_two]
  norm_num

/-- ★ the freeze-out staircase re-supplies EXACTLY the removed coloured content. -/
theorem staircase_resupplies_removed :
    ((freezeoutStaircaseCensus : ℚ) : Cut) = colouredCensus := by
  unfold colouredCensus
  congr 1
  unfold freezeoutStaircaseCensus
  rw [freezeout_step_bottom, freezeout_step_charm]
  ring

/-- ★★ COMPLETENESS CLOSURE: 16/3 = (staircase 10/3) + (singlet 2), the partition closes. -/
theorem census_completeness_closure :
    chargeTraceDepth = ((freezeoutStaircaseCensus : ℚ) : Cut) + leptonCensus := by
  rw [staircase_resupplies_removed]
  exact census_split

/-- ★ SCREENING-LEVEL CLOSURE: the omitted screening = the staircase census-weighted screening. -/
theorem screening_completeness_closure :
    totalScreening (leptonTail chargeTraceDepth) - totalScreening (leptonTail leptonCensus)
      = bandScreen ((freezeoutStaircaseCensus : ℚ) : Cut) (mass0 / mass1) := by
  rw [decoupling_removal, ← staircase_resupplies_removed]

/-! Teeth -/

theorem staircase_ne_zero : freezeoutStaircaseCensus ≠ 0 := by
  rw [freezeoutStaircaseCensus_val]; norm_num

theorem staircase_ne_singlet :
    ((freezeoutStaircaseCensus : ℚ) : Cut) ≠ leptonCensus := by
  rw [staircase_resupplies_removed, colouredCensus_val, leptonCensus_val]; norm_num

theorem staircase_ne_full :
    ((freezeoutStaircaseCensus : ℚ) : Cut) ≠ chargeTraceDepth := by
  rw [staircase_resupplies_removed, colouredCensus_val, chargeTraceDepth_eq]; norm_num

theorem partition_no_double_count : freezeoutStaircaseCensus + 2 = 16 / 3 := by
  rw [freezeoutStaircaseCensus_val]; norm_num

-- banked re-exports (confirm they resolve)
#check @freezeout_steps_differ
#check @removal_pos
#check @leptonCensus_ne_charge

end

end CensusClosureProbe
