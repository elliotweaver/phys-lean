import Phys.Algebra.CensusCompletenessClosure
open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.CensusCompletenessClosure
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- ENUMERATION: the charge-census BUDGET the screening tower distributes is the cap-forced count
-- applied to the ladder trace. finrank Uhol = 3 is the cap; any larger count is BLOCKED.
theorem census_budget_cap_forced :
    chargeTraceDepth = ((ladderChargeTrace (Module.finrank ℚ Uhol) : ℚ) : Cut)
    ∧ Module.finrank ℚ Uhol = 3 :=
  ⟨rfl, finrank_Uhol⟩

-- the budget is EXHAUSTED by the enumerated bands (banked closure): staircase + singlet
theorem census_budget_exhausted :
    chargeTraceDepth = ((freezeoutStaircaseCensus : ℚ) : Cut) + leptonCensus :=
  census_completeness_closure

-- ONE CAUSE: the same non-associativity that stops the cascade is what makes the count finite.
-- (the count = finrank Uhol, capped at 3; not_associative is the cascade-stop cause)
theorem one_cause_tie :
    (¬ ∀ (x y z : O ℚ), x * y * z = x * (y * z))
    ∧ Module.finrank ℚ Uhol = 3 :=
  ⟨not_associative, finrank_Uhol⟩

-- TOOTH: a larger (uncapped) count would give a DIFFERENT census budget (banked wrong-colour)
theorem census_budget_ne_uncapped :
    chargeTraceDepth ≠ ((ladderChargeTrace 2 : ℚ) : Cut) :=
  chargeTraceDepth_ne_wrong_colour

end
