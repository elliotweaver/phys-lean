import Phys.Algebra.CensusCompletenessClosure
open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.SubBandCompletion
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.CensusCompletenessClosure
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

example : ladderChargeTrace 2 ≠ 16/3 := ladderChargeTrace_two_ne
example : ladderChargeTrace (Module.finrank ℚ Uhol) = 16/3 := generation_charge_trace
example {d r : Cut} (hd : 0 < d) (hr : 1 < r) : 0 < bandScreen d r := bandScreen_pos hd hr
example : leptonCensus = 2 := leptonCensus_val
example (d : Cut) : invAlphaZero (completeBandList d) = 190/3 + bandScreen d (mass0/mass1) := endpoint_closed d
