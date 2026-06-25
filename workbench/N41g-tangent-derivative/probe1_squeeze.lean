import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Order.Basic

namespace Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- PROBE 1: the SQUEEZE over OrderTopology Cut, no Metric.
-- Goal: if Tendsto u l (𝓝 0) and ∀ᶠ t in l, |h t| ≤ u t, then Tendsto h l (𝓝 0).
example (l : Filter Cut) (h u : Cut → Cut)
    (hu : Tendsto u l (𝓝 0)) (hb : ∀ᶠ t in l, |h t| ≤ u t) :
    Tendsto h l (𝓝 0) := by
  have hneg : Tendsto (fun t => -u t) l (𝓝 0) := by
    simpa using hu.neg
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le' hneg hu ?_ ?_
  · filter_upwards [hb] with t ht
    have := abs_le.mp ht
    linarith [this.1]
  · filter_upwards [hb] with t ht
    have := abs_le.mp ht
    linarith [this.2]

-- PROBE 2: abs of tsum ≤ tsum of abs over Cut.
example (f : ℕ → Cut) (hf : Summable f) : |∑' n, f n| ≤ ∑' n, |f n| := by
  exact?

end
end Phys.Foundation.ContinuumQ
