import Phys.Algebra.AssembledBracket
import Phys.Algebra.InvCutPiBracket

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Algebra Phys.Algebra.AssembledBracket
open Phys.Algebra.EndpointAssembly Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

-- MEASURE 1: cutLog LOWER to 8 via partialExp 8 10 + rem <= m01_lo rational.
theorem probe_cutLog_lo8 : (8 : Cut) ≤ cutLog (mass0 / mass1) := by
  have hmono : cutLog ((1000000000 : Cut) / 288575) ≤ cutLog (mass0 / mass1) := by
    apply cutLog_mono (by norm_num)
    have := m01_bracket_lo; linarith
  have hge : (8 : Cut) ≤ cutLog ((1000000000 : Cut) / 288575) := by
    apply cutLog_ge_certified ((1000000000 : Cut) / 288575) 8 10 (by norm_num) (by norm_num)
    show partialExp 8 10 + expRemBound 8 10 ≤ (1000000000 : Cut) / 288575
    unfold partialExp expTermC expRemBound
    simp only [Finset.sum_range_succ, Finset.sum_range_zero]
    norm_num [Nat.factorial]
  linarith

end
end ContinuumQ
end Phys.Foundation
