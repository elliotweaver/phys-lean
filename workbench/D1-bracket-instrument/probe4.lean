import Phys.Foundation.ContinuumLog
import Mathlib.Topology.Algebra.InfiniteSum.NatInt

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- geometric partial sum ≤ (1-r)⁻¹  (the tail majorant bound)
theorem geom_partial_le (r : Cut) (hr0 : 0 ≤ r) (hr1 : r < 1) (n : ℕ) :
    ∑ i ∈ Finset.range n, r ^ i ≤ (1 - r)⁻¹ := by
  have h1r : (0:Cut) < 1 - r := by linarith
  have htel := cut_geom_telescope r n
  have hbound : (1 - r) * ∑ i ∈ Finset.range n, r ^ i ≤ 1 := by
    rw [htel]; nlinarith [pow_nonneg hr0 n]
  rw [← le_div_iff₀' h1r] at hbound
  rwa [one_div] at hbound

-- geometric tsum ≤ (1-r)⁻¹
theorem geom_tsum_le (r : Cut) (hr0 : 0 ≤ r) (hr1 : r < 1) :
    ∑' k, r ^ k ≤ (1 - r)⁻¹ :=
  le_of_tendsto' (cut_summable_geometric hr0 hr1).hasSum.tendsto_sum_nat (geom_partial_le r hr0 hr1)

end
end ContinuumQ
end Phys.Foundation
