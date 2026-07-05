import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Order

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

-- probe: geometric tsum ≤ (1-r)⁻¹ over Cut via partial-sum bound
example : (∑' n, (2/15 : Cut) ^ n) ≤ 15/13 := by
  have hs : Summable (fun n => (2/15 : Cut)^n) := cut_summable_geometric (by norm_num) (by norm_num)
  apply hs.tsum_le_of_sum_le
  intro s
  -- ∑_{i∈s} (2/15)^i ≤ 15/13
  obtain ⟨N, hN⟩ : ∃ N, s ⊆ Finset.range N :=
    ⟨(s.sup id) + 1, fun a ha => Finset.mem_range.2 (Nat.lt_succ_of_le (Finset.le_sup (f := id) ha))⟩
  have hmono : ∑ i ∈ s, (2/15:Cut)^i ≤ ∑ i ∈ range N, (2/15:Cut)^i :=
    Finset.sum_le_sum_of_subset_of_nonneg hN (fun i _ _ => by positivity)
  have htel := cut_geom_telescope (2/15 : Cut) N
  have h1r : (0:Cut) < 1 - 2/15 := by norm_num
  have hpow : (0:Cut) ≤ (2/15:Cut)^N := by positivity
  have hle1 : (1 - 2/15) * ∑ i ∈ range N, (2/15:Cut)^i ≤ 1 := by rw [htel]; nlinarith [hpow]
  have : ∑ i ∈ range N, (2/15:Cut)^i ≤ 15/13 := by nlinarith [hle1, h1r]
  linarith [hmono, this]

end
end ContinuumQ
end Phys.Foundation
