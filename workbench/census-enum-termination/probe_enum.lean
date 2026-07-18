import Phys.Algebra.CensusCompletenessClosure
open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.CensusCompletenessClosure
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- (A) the census budget IS the cap-forced count applied to the ladder trace (definitional tie)
example : chargeTraceDepth = ((ladderChargeTrace (Module.finrank ℚ Uhol) : ℚ) : Cut) := rfl

-- (A) the cap: finrank Uhol = 3 (transitively reachable)
example : Module.finrank ℚ Uhol = 3 := finrank_Uhol

-- (A tooth) a wrong count gives a wrong budget (banked)
example : chargeTraceDepth ≠ ((ladderChargeTrace 2 : ℚ) : Cut) := chargeTraceDepth_ne_wrong_colour

-- (B) enumeration exhausts the budget (banked closure)
example : chargeTraceDepth = ((freezeoutStaircaseCensus : ℚ) : Cut) + leptonCensus :=
  census_completeness_closure

-- (C) the band list is FINITE with a decidable length
example (rb rc rl d : Cut) : (completeFreezeoutList rb rc rl d).length = 7 := by
  unfold completeFreezeoutList freezeoutTail leptonTail derivedBandList
  rfl

-- (C') derivedBandList length
example : derivedBandList.length = 2 := by unfold derivedBandList; rfl
example (rb rc rl : Cut) : (freezeoutTail rb rc rl).length = 3 := by unfold freezeoutTail; rfl
example (d : Cut) : (leptonTail d).length = 2 := by unfold leptonTail; rfl

end
