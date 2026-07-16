import Phys.Foundation.ContinuumSummable
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology BigOperators

noncomputable section

-- CRUX 1: the Cut-native geometric closed form ∑' n, wⁿ = (1−w)⁻¹ for 0 ≤ w < 1.
-- Route: partial sums = (1−wᴺ)/(1−w) via cut_geom_telescope; wᴺ → 0; uniqueness.

-- Check the generic tendsto pow zero applies to Cut.
example (w : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) :
    Tendsto (fun n : ℕ => w ^ n) atTop (𝓝 0) :=
  tendsto_pow_atTop_nhds_zero_of_lt_one hw0 hw1

-- Check HasSum.tendsto_sum_nat exists over Cut.
example (w : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) :
    Tendsto (fun N : ℕ => ∑ i ∈ Finset.range N, w ^ i) atTop (𝓝 (∑' n, w ^ n)) :=
  (cut_summable_geometric hw0 hw1).hasSum.tendsto_sum_nat

-- The partial-sum closed form from the telescope.
theorem partial_geom (w : Cut) (hw : w ≠ 1) (N : ℕ) :
    ∑ i ∈ Finset.range N, w ^ i = (1 - w ^ N) / (1 - w) := by
  have h1w : (1 : Cut) - w ≠ 0 := sub_ne_zero.mpr (fun h => hw h.symm)
  have := cut_geom_telescope w N
  field_simp at this ⊢
  linarith [this]

-- THE CRUX THEOREM: geometric closed form over Cut.
theorem cut_tsum_geometric (w : Cut) (hw0 : 0 ≤ w) (hw1 : w < 1) :
    ∑' n : ℕ, w ^ n = (1 - w)⁻¹ := by
  have hw : w ≠ 1 := ne_of_lt hw1
  have h1w : (1 : Cut) - w ≠ 0 := sub_ne_zero.mpr (fun h => hw h.symm)
  -- limit of partial sums = tsum
  have hT1 : Tendsto (fun N : ℕ => ∑ i ∈ Finset.range N, w ^ i) atTop (𝓝 (∑' n, w ^ n)) :=
    (cut_summable_geometric hw0 hw1).hasSum.tendsto_sum_nat
  -- rewrite partial sums via closed form
  have hpow : Tendsto (fun n : ℕ => w ^ n) atTop (𝓝 0) :=
    tendsto_pow_atTop_nhds_zero_of_lt_one hw0 hw1
  have hT2 : Tendsto (fun N : ℕ => (1 - w ^ N) / (1 - w)) atTop (𝓝 ((1 - 0) / (1 - w))) := by
    apply Tendsto.div_const
    exact (tendsto_const_nhds.sub hpow)
  have hT2' : Tendsto (fun N : ℕ => ∑ i ∈ Finset.range N, w ^ i) atTop (𝓝 ((1 - 0) / (1 - w))) := by
    refine hT2.congr ?_
    intro N; rw [partial_geom w hw N]
  have := tendsto_nhds_unique hT1 hT2'
  rw [this]
  field_simp

end
end ContinuumQ
end Phys.Foundation
