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

def frozenCensus : Cut := ((bandCensus [] : ℚ) : Cut)
theorem frozenCensus_zero : frozenCensus = 0 := by
  unfold frozenCensus
  have : bandCensus [] = 0 := by unfold bandCensus; simp
  rw [this]; push_cast; rfl

theorem endpoint_is_frozen (rb rc rl d : Cut) (rs : List Cut) :
    invAlphaZero (completeFreezeoutList rb rc rl d ++ rs.map (fun r => (frozenCensus, r)))
      = invAlphaZero (completeFreezeoutList rb rc rl d) := by
  rw [invAlphaZero_append]
  have hz : totalScreening (rs.map (fun r => (frozenCensus, r))) = 0 := by
    unfold totalScreening
    apply List.sum_eq_zero
    intro x hx
    rw [List.mem_map] at hx
    obtain ⟨r, _, rfl⟩ := hx
    rw [frozenCensus_zero]; unfold bandScreen; ring
  rw [hz, add_zero]

end
