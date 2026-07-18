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

-- general: any list all of whose census entries are 0 screens nothing
theorem totalScreening_frozen (bands : List (Cut × Cut))
    (hz : ∀ p ∈ bands, p.1 = 0) : totalScreening bands = 0 := by
  unfold totalScreening
  apply List.sum_eq_zero
  intro x hx
  rw [List.mem_map] at hx
  obtain ⟨p, hp, rfl⟩ := hx
  rw [hz p hp]; unfold bandScreen; ring

-- a mapped frozen tail satisfies the hypothesis
theorem frozen_tail_all_zero (rs : List Cut) :
    ∀ p ∈ rs.map (fun r => (frozenCensus, r)), p.1 = 0 := by
  intro p hp
  rw [List.mem_map] at hp
  obtain ⟨r, _, rfl⟩ := hp
  exact frozenCensus_zero

-- FREEZE: appending the frozen tail leaves the endpoint unchanged
theorem endpoint_is_frozen (rb rc rl d : Cut) (rs : List Cut) :
    invAlphaZero (completeFreezeoutList rb rc rl d ++ rs.map (fun r => (frozenCensus, r)))
      = invAlphaZero (completeFreezeoutList rb rc rl d) := by
  rw [invAlphaZero_append, totalScreening_frozen _ (frozen_tail_all_zero rs), add_zero]

-- TOOTH: an ACTIVE band (census leptonCensus>0, ratio>1) strictly increases invAlphaZero
theorem active_band_moves (list : List (Cut × Cut)) (r : Cut) (hr : 1 < r) :
    invAlphaZero list < invAlphaZero (list ++ [(leptonCensus, r)]) := by
  rw [invAlphaZero_append]
  have hpos : 0 < totalScreening [(leptonCensus, r)] := by
    unfold totalScreening
    simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero]
    apply bandScreen_pos _ hr
    rw [leptonCensus_val]; norm_num
  linarith

theorem frozen_below_active : frozenCensus < leptonCensus := by
  rw [frozenCensus_zero, leptonCensus_val]; norm_num

end
