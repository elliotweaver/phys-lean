import Phys.Algebra.CensusCompletenessClosure
open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.CensusCompletenessClosure
open Phys.Foundation Phys.Foundation.ContinuumQ

-- (1) finrank_Uhol reachable transitively? (the cap-forced generation count = 3)
example : Module.finrank ℚ Uhol = 3 := finrank_Uhol
-- (1b) the count as a finite cardinality
example : Fintype.card (Fin (Module.finrank ℚ Uhol)) = 3 := by rw [Fintype.card_fin, finrank_Uhol]
-- (2) census value banked
example : chargeTraceDepth = 16/3 := chargeTraceDepth_eq
-- (3) termination primitive: a zero-census band contributes zero screening
example (r : Cut) : bandScreen 0 r = 0 := by unfold bandScreen; ring
-- (4) empty tower sits at the ceiling
example : invAlphaZero [] = 42 := invAlphaZero_nil
-- (5) the banked exhaustive partition
example : chargeTraceDepth = ((freezeoutStaircaseCensus : ℚ) : Cut) + leptonCensus := census_completeness_closure
-- (6) totalScreening_append reachable
example (a b : List (Cut × Cut)) : totalScreening (a ++ b) = totalScreening a + totalScreening b := totalScreening_append a b
