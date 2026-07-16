import Phys.Algebra.AssembledBracket
import Phys.Algebra.InvCutPiBracket

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Algebra Phys.Algebra.AssembledBracket
open Phys.Algebra.EndpointAssembly Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

-- MEASURE 2: cutLog UPPER to 41/5 via m01_hi <= partialExp (41/5) 14.
theorem probe_cutLog_hi : cutLog (mass0 / mass1) ≤ 41 / 5 := by
  have hpos : (0 : Cut) < mass0 / mass1 :=
    lt_of_lt_of_le (by norm_num : (0 : Cut) < 1000000000 / 288575) m01_bracket_lo
  have hmono : cutLog (mass0 / mass1) ≤ cutLog ((1000000000 : Cut) / 286902) :=
    cutLog_mono hpos m01_bracket_hi
  have hbnd : cutLog ((1000000000 : Cut) / 286902) ≤ 41 / 5 := by
    apply cutLog_le_certified ((1000000000 : Cut) / 286902) (41/5) 14 (by norm_num) (by norm_num)
    show (1000000000 : Cut) / 286902 ≤ partialExp (41/5) 14
    unfold partialExp expTermC
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

end
end ContinuumQ
end Phys.Foundation
