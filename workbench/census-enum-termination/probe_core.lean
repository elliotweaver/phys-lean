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

-- (1) below the lightest edge: empty active flavour set has census 0
example : bandCensus [] = 0 := by unfold bandCensus; simp
example : ((bandCensus [] : ℚ) : Cut) = 0 := by
  have : bandCensus [] = 0 := by unfold bandCensus; simp
  rw [this]; push_cast; rfl

-- (2) a zero-census (below-lightest-edge) band screens nothing
example (r : Cut) : bandScreen ((bandCensus [] : ℚ) : Cut) r = 0 := by
  have h : ((bandCensus [] : ℚ) : Cut) = 0 := by
    have : bandCensus [] = 0 := by unfold bandCensus; simp
    rw [this]; push_cast; rfl
  rw [h]; unfold bandScreen; ring

-- (3) totalScreening of a list of frozen (zero-census) bands is 0
example (rs : List Cut) :
    totalScreening (rs.map (fun r => (((bandCensus [] : ℚ) : Cut), r))) = 0 := by
  have h0 : ((bandCensus [] : ℚ) : Cut) = 0 := by
    have : bandCensus [] = 0 := by unfold bandCensus; simp
    rw [this]; push_cast; rfl
  unfold totalScreening
  induction rs with
  | nil => simp
  | cons r rs ih => simp [List.map_cons, List.sum_cons, ih, bandScreen, h0]

-- (4) FREEZE: appending frozen bands leaves the assembly unchanged
example (list : List (Cut × Cut)) (rs : List Cut) :
    invAlphaZero (list ++ rs.map (fun r => (((bandCensus [] : ℚ) : Cut), r)))
      = invAlphaZero list := by
  rw [invAlphaZero_append]
  have hz : totalScreening (rs.map (fun r => (((bandCensus [] : ℚ) : Cut), r))) = 0 := by
    have h0 : ((bandCensus [] : ℚ) : Cut) = 0 := by
      have : bandCensus [] = 0 := by unfold bandCensus; simp
      rw [this]; push_cast; rfl
    unfold totalScreening
    induction rs with
    | nil => simp
    | cons r rs ih => simp [List.map_cons, List.sum_cons, ih, bandScreen, h0]
  rw [hz, add_zero]

end
