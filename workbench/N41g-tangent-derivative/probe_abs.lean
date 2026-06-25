import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Topology.Order.Basic

namespace Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- abs continuity over OrderTopology Cut (no Metric)
example : Continuous (fun t : Cut => |t|) := by
  exact?

-- tendsto abs to 0
example : Tendsto (fun t : Cut => |t|) (𝓝 0) (𝓝 0) := by
  have : Continuous (fun t : Cut => |t|) := continuous_abs
  simpa using this.tendsto 0

end
end Phys.Foundation.ContinuumQ
