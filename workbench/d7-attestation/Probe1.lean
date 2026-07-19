import Phys.Algebra.AssembledBracket
import Phys.Foundation.ContinuumBracket
import Mathlib.Tactic

namespace Phys.Algebra.D7Probe

open Phys.Algebra
open Phys.Algebra.AssembledBracket
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- lower: 8 ≤ cutLog(mass0/mass1)
-- via cutLog_ge_certified c=m01_lo a=8 N: 8 ≤ cutLog(m01_lo); then cutLog_mono m01_bracket_lo.
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

-- upper: cutLog(mass0/mass1) ≤ 82/10
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

end

end Phys.Algebra.D7Probe
