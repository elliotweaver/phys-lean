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

-- the below-lightest-edge census, as a Cut, is 0
def frozenCensus : Cut := ((bandCensus [] : ℚ) : Cut)

theorem frozenCensus_zero : frozenCensus = 0 := by
  unfold frozenCensus
  have : bandCensus [] = 0 := by unfold bandCensus; simp
  rw [this]; push_cast; rfl

-- a general "frozen tail": any list of bands ALL of whose census is 0 screens nothing
theorem totalScreening_frozen (bands : List (Cut × Cut))
    (hz : ∀ p ∈ bands, p.1 = 0) : totalScreening bands = 0 := by
  unfold totalScreening
  apply List.sum_eq_zero
  intro x hx
  rw [List.mem_map] at hx
  obtain ⟨p, hp, rfl⟩ := hx
  rw [hz p hp]; unfold bandScreen; ring

-- FREEZE: appending any frozen tail leaves the assembly unchanged
theorem freeze_append (list frozen : List (Cut × Cut))
    (hz : ∀ p ∈ frozen, p.1 = 0) :
    invAlphaZero (list ++ frozen) = invAlphaZero list := by
  rw [invAlphaZero_append, totalScreening_frozen frozen hz, add_zero]

-- concrete frozen band built from the empty active set
theorem frozenBand_census (r : Cut) : (frozenCensus, r).1 = 0 := by
  rw [frozenCensus_zero]

end
