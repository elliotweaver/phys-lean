import Phys.Foundation.ContinuumTopology
import Phys.Algebra.DerivationAutCompactTopo

open Phys.Foundation Phys.Algebra

namespace Phys.Foundation.ContinuumQ

-- What analytic typeclasses does the derived ℝ already carry / can synth find?
-- Each #synth either succeeds (instance reachable) or errors (gap). Bounded, no proofs.

-- KNOWN banked:
#synth ConditionallyCompleteLinearOrder Cut
#synth TopologicalSpace Cut
#synth OrderTopology Cut
#synth LinearOrderedField Cut

-- THE QUESTIONS (likely gaps):
-- Archimedean? (the C6 eternal-approach property — trunk-native, NOT yet banked on Cut)
#synth Archimedean Cut

-- Uniform / metric / complete?
#synth UniformSpace Cut
#synth MetricSpace Cut
#synth PseudoMetricSpace Cut
#synth CompleteSpace Cut

-- The "this field IS ℝ" structure:
#synth ConditionallyCompleteLinearOrderedField Cut

end Phys.Foundation.ContinuumQ
