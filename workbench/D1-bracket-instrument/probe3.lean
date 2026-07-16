import Phys.Foundation.ContinuumLog
import Mathlib.Topology.Algebra.InfiniteSum.NatInt

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- tsum ≤ c from partial-sum bound, via hasSum tendsto + le_of_tendsto'
example (f : ℕ → Cut) (hf : Summable f) (c : Cut)
    (h : ∀ n, ∑ i ∈ Finset.range n, f i ≤ c) : ∑' i, f i ≤ c :=
  le_of_tendsto' hf.hasSum.tendsto_sum_nat h

-- geometric tsum ≤ (1-r)⁻¹
example (r : Cut) (hr0 : 0 ≤ r) (hr1 : r < 1) :
    ∑' k, r ^ k ≤ (1 - r)⁻¹ := by
  have hsum : Summable (fun k => r ^ k) := cut_summable_geometric hr0 hr1
  apply le_of_tendsto' hsum.hasSum.tendsto_sum_nat
  intro n
  have h1r : (0:Cut) < 1 - r := by linarith
  have htel := cut_geom_telescope r n
  rw [le_inv_comm₀ h1r (by positivity)]  -- probe
  sorry

-- inv_anti₀ confirmed; le_inv_comm₀ probe
example (a b : Cut) (ha : 0 < a) (hb : 0 < b) : a ≤ b⁻¹ ↔ b ≤ a⁻¹ := le_inv_comm₀ ha hb

-- tsum_le_tsum name
example (f g : ℕ → Cut) (hf : Summable f) (hg : Summable g) (h : ∀ i, f i ≤ g i) :
    ∑' i, f i ≤ ∑' i, g i := hf.tsum_le_tsum h hg

end
end ContinuumQ
end Phys.Foundation
