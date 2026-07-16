import Phys.Algebra.AssembledBracket
import Phys.Algebra.InvCutPiBracket

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Algebra Phys.Algebra.AssembledBracket
open Phys.Algebra.EndpointAssembly Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

-- cutLog LOWER to 163/20=8.15 via partialExp(163/20,16)+rem <= m01_lo (1e9/288575).
theorem probe_cutLog_lo815 : (163 / 20 : Cut) ≤ cutLog (mass0 / mass1) := by
  have hmono : cutLog ((1000000000 : Cut) / 288575) ≤ cutLog (mass0 / mass1) := by
    apply cutLog_mono (by norm_num)
    have := m01_bracket_lo; linarith
  have hge : (163 / 20 : Cut) ≤ cutLog ((1000000000 : Cut) / 288575) := by
    apply cutLog_ge_certified ((1000000000 : Cut) / 288575) (163 / 20) 16 (by norm_num) (by norm_num)
    show partialExp (163 / 20) 16 + expRemBound (163 / 20) 16 ≤ (1000000000 : Cut) / 288575
    unfold partialExp expTermC expRemBound
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

-- cutLog UPPER to 8157/1000=8.157 via m01_hi (1e9/286902) <= partialExp(8157/1000,20).
theorem probe_cutLog_hi8157 : cutLog (mass0 / mass1) ≤ 8157 / 1000 := by
  have hpos : (0 : Cut) < mass0 / mass1 :=
    lt_of_lt_of_le (by norm_num : (0 : Cut) < 1000000000 / 288575) m01_bracket_lo
  have hmono : cutLog (mass0 / mass1) ≤ cutLog ((1000000000 : Cut) / 286902) :=
    cutLog_mono hpos m01_bracket_hi
  have hbnd : cutLog ((1000000000 : Cut) / 286902) ≤ 8157 / 1000 := by
    apply cutLog_le_certified ((1000000000 : Cut) / 286902) (8157 / 1000) 20 (by norm_num) (by norm_num)
    show (1000000000 : Cut) / 286902 ≤ partialExp (8157 / 1000) 20
    unfold partialExp expTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

end
end ContinuumQ
end Phys.Foundation
