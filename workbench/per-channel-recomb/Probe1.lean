import Phys.Algebra.RecomposedRunningEndpoint
import Phys.Algebra.CensusCompletenessClosure
import Phys.Algebra.ComposedFreezeoutDissolved
import Phys.Algebra.FreezeoutEdgeNumerals
import Mathlib.Tactic

/-! PROBE 1 — can these four banked chain heads coexist in ONE import DAG?
    Just check we can reference the key banked lemmas from each. -/

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- from RecomposedRunningEndpoint
example : Phys.Algebra.RecomposedRunningEndpoint.recomposedInvAlphaEM [(chargeTraceDepth, topBandRatio)] = 6923 / 54 :=
  Phys.Algebra.RecomposedRunningEndpoint.recomposed_EW_waypoint

example : (6923 / 54 : Cut) + bandScreen chargeTraceDepth confBandRatio = 7179 / 54 :=
  Phys.Algebra.RecomposedRunningEndpoint.recomposed_conf_waypoint

-- from DecouplingCensusRemoval (via CensusCompletenessClosure)
example : Phys.Algebra.DecouplingCensusRemoval.leptonCensus = 2 :=
  Phys.Algebra.DecouplingCensusRemoval.leptonCensus_val

-- from CensusCompletenessClosure
example : chargeTraceDepth = ((Phys.Algebra.CensusCompletenessClosure.freezeoutStaircaseCensus : ℚ) : Cut)
    + Phys.Algebra.DecouplingCensusRemoval.leptonCensus :=
  Phys.Algebra.CensusCompletenessClosure.census_completeness_closure

-- from ComposedFreezeoutDissolved (freeze-out summand dissolved to determined closed form)
example :
    kappaLeading * (11 / 3) * cutLog (Phys.Algebra.FreezeoutEdgeCrossSectorReduction.bMass 0) = -- placeholder shape check
    kappaLeading * (11 / 3) * cutLog (Phys.Algebra.FreezeoutEdgeCrossSectorReduction.bMass 0) := rfl

-- lepton tail telescoping at census-conserving census
example : totalScreening (leptonTail Phys.Algebra.DecouplingCensusRemoval.leptonCensus)
    = bandScreen Phys.Algebra.DecouplingCensusRemoval.leptonCensus (mass0 / mass1) :=
  leptonTail_screen_telescope _

end
