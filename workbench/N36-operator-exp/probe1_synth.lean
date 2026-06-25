import Phys.Foundation.ContinuumArchimedean
import Mathlib.Topology.MetricSpace.Basic
import Mathlib.Topology.Order.MonotoneConvergence
import Mathlib.Topology.MetricSpace.Pseudo.Defs

open Phys.Foundation
open scoped Topology

namespace Phys.Foundation.ContinuumQ

-- RE-MEASURE with the FULL N35 stack (Archimedean now banked, which was NOT
-- present when N35 probe_synth ran). Does anything new synthesize?

#synth Archimedean Cut                         -- banked N35
#synth ConditionallyCompleteLinearOrder Cut    -- N33
#synth LinearOrderedField Cut                   -- banked
#synth OrderTopology Cut                        -- N34

-- The key question for the metric build: what does Mathlib offer to turn a
-- LinearOrderedField + OrderTopology + Archimedean into a metric/uniform space?
-- ℝ's instance is hand-built in Mathlib.Topology.MetricSpace via abs.

-- Does a UniformSpace synth now?
-- #synth UniformSpace Cut
-- #synth PseudoMetricSpace Cut

-- Look for the bridge lemma: PseudoMetricSpace.replaceTopology and the
-- ordered-field metric. Check what's available.
#check @PseudoMetricSpace.replaceTopology
#check @PseudoMetricSpace.replaceUniformity
#check @AbsoluteValue.abs   -- the abs as an absolute value

end Phys.Foundation.ContinuumQ
