import Phys.Algebra.PerChannelRecombination
import Phys.Algebra.AssembledBracket
import Phys.Algebra.NarrowedBracket12
import Phys.Foundation.ContinuumBracket
import Mathlib.Tactic

namespace Phys.Algebra.D7Probe3

open Phys.Algebra
open Phys.Algebra.AssembledBracket
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.CensusCompletenessClosure
open Phys.Algebra.RecomposedRunningEndpoint
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.FreezeoutEdgeNumerals
open Phys.Algebra.PerChannelRecomb
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- sharpened cutLog(m01) (from Probe1)
theorem cutLog_m01_ge_8 : (8 : Cut) ≤ cutLog (mass0 / mass1) := by
  have hlo_pos : (0 : Cut) < 1000000000 / 288575 := by norm_num
  have h8 : (8 : Cut) ≤ cutLog (1000000000 / 288575) := by
    apply cutLog_ge_certified (1000000000 / 288575) 8 11 (by norm_num) (by norm_num)
    show partialExp 8 11 + expRemBound 8 11 ≤ 1000000000 / 288575
    unfold partialExp expTermC expRemBound
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  have hmono : cutLog ((1000000000 : Cut) / 288575) ≤ cutLog (mass0 / mass1) :=
    cutLog_mono hlo_pos m01_bracket_lo
  linarith

theorem cutLog_m01_le_82 : cutLog (mass0 / mass1) ≤ 82 / 10 := by
  have hpos : (0 : Cut) < mass0 / mass1 :=
    lt_of_lt_of_le (by norm_num : (0 : Cut) < 1000000000 / 288575) m01_bracket_lo
  have hmono : cutLog (mass0 / mass1) ≤ cutLog ((1000000000 : Cut) / 286902) :=
    cutLog_mono hpos m01_bracket_hi
  have hbnd : cutLog ((1000000000 : Cut) / 286902) ≤ 82 / 10 := by
    apply cutLog_le_certified ((1000000000 : Cut) / 286902) (82/10) 14 (by norm_num) (by norm_num)
    show (1000000000 : Cut) / 286902 ≤ partialExp (82/10) 14
    unfold partialExp expTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

-- normal form of the recomposed endpoint
theorem recomposedEndpoint_normalform :
    recomposedEndpoint
      = 2425/18 + kappaLeading * (2 * cutLog (mass0 / mass1)
        + (7/3) * cutLog mbRatioDerived + (11/3) * cutLog (bMass 0) - (5/3) * cutLog (bMass 2)) := by
  rw [recomposedEndpoint_closed]
  unfold bandScreen
  rw [leptonCensus_val]
  ring

-- kappa bracket from ext6
theorem kappa_bracket :
    (1250000000 / 3926990817 : Cut) / 3 ≤ kappaLeading
      ∧ kappaLeading ≤ (50000000000 / 157079632679 : Cut) / 3 := by
  obtain ⟨hlo, hhi⟩ := inv_cutPi_bracket_ext6
  have hk : kappaLeading = (1 / cutPi) / 3 := by
    rw [kappaLeading_eq, div_div, mul_comm]
  rw [hk]
  constructor
  · linarith
  · linarith

end

end Phys.Algebra.D7Probe3
