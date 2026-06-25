import Phys.Foundation.ContinuumTopology
import Mathlib.Algebra.Order.CompleteField
import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Topology.Order.MonotoneConvergence

open Phys.Foundation

namespace Phys.Foundation.ContinuumQ

-- THE HARD-CORE PROBE: can a metric agreeing with the banked order topology be built cheaply?
-- ℝ's own metric is dist x y = |x-y| with a SEPARATE proof the metric topology = order topology.
-- Cut already has instTopologicalSpaceCut := Preorder.topology Cut (FIXED). A PseudoMetricSpace
-- would install its OWN topology — to avoid a diamond we must override toUniformSpace/toTopology
-- and PROVE agreement. Measure: is there machinery, or is this the genuine W1 build?

-- Q: does Mathlib derive a UniformSpace/metric from LinearOrderedField + OrderTopology directly?
-- (If yes -> cheap. If no -> hard core, child it.)
#check @MetricSpace.ofT0PseudoMetricSpace

-- Q: the order-bornology / order-uniformity route?
-- Is there `instance : UniformSpace α` from `[LinearOrderedField α] [OrderTopology α]`? Probe synth:
-- (already measured FAIL in probe_synth: no UniformSpace Cut)

-- Q: CompleteSpace requires UniformSpace first. Confirm the dependency is genuinely missing.
-- (already measured: no UniformSpace, no CompleteSpace)

-- What IS cheaply reachable (re-confirm): Archimedean + order-native convergence
example : Archimedean Cut := ConditionallyCompleteLinearOrderedField.to_archimedean
#check @tendsto_atTop_ciSup
#check @tendsto_atTop_ciInf

end Phys.Foundation.ContinuumQ
