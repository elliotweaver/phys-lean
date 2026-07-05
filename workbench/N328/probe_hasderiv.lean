import Phys.Foundation.ContinuumTrigPi
import Phys.Foundation.ContinuumScalarDeriv
namespace Phys.Foundation.ContinuumQ
-- Does Cut support HasDerivAt? (needs NormedField / NormedSpace ℝ). Likely NOT.
-- Check instances:
#synth Field Cut
#synth TopologicalSpace Cut
-- The trunk-native derivative is a bare difference-quotient Tendsto (like ContinuumScalarDeriv).
-- Confirm the difference-quotient limit shape compiles:
example (x : Cut) :
    Tendsto (fun h : Cut => h⁻¹ * (cutSin (x + h) - cutSin x)) (𝓝[≠] (0:Cut)) (𝓝 (cutCos x)) := by
  sorry
end Phys.Foundation.ContinuumQ
