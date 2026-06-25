import Phys.Foundation.ContinuumArchimedean
import Phys.Foundation.ContinuumUniform
import Phys.Foundation.ContinuumTopology
import Mathlib.Topology.Algebra.Order.Field
import Mathlib.Order.Filter.CountablyGenerated
import Mathlib.Topology.Order.IsLUB
import Mathlib.Topology.Sequences
import Mathlib.Topology.UniformSpace.Cauchy

namespace Phys.Foundation
namespace ContinuumQ

open Filter Set
open scoped Topology Uniformity

noncomputable section

-- Step 0: IsCountablyGenerated (𝓝 0)
theorem cut_nhds_zero_countablyGenerated : IsCountablyGenerated (𝓝 (0:Cut)) := by
  have habs : (𝓝 (0:Cut)).HasBasis (fun ε:Cut => (0:Cut) < ε) (fun ε => {x | |x| < ε}) := by
    simpa using nhds_basis_abs_sub_lt (0 : Cut)
  have hnat : (𝓝 (0:Cut)).HasBasis (fun _:ℕ => True) (fun n => {x:Cut | |x| < 1/(n+1)}) := by
    refine habs.to_hasBasis' ?_ ?_
    · intro ε hε
      obtain ⟨n, hn⟩ := exists_nat_one_div_lt hε
      exact ⟨n, trivial, fun x hx => lt_trans hx hn⟩
    · intro n _
      have : (0:Cut) < 1/(n+1) := by positivity
      exact (habs.mem_iff).2 ⟨1/(n+1), this, fun x hx => hx⟩
  exact hnat.isCountablyGenerated

instance cut_uniformity_countablyGenerated : IsCountablyGenerated (𝓤 Cut) := by
  rw [cut_uniformity_eq]
  have := cut_nhds_zero_countablyGenerated
  infer_instance

-- abs basis on uniformity (reusable)
theorem cut_uniformity_hasBasis_abs :
    (𝓤 Cut).HasBasis (fun ε:Cut => (0:Cut) < ε) (fun ε => {p:Cut×Cut | |p.2 - p.1| < ε}) := by
  rw [cut_uniformity_eq]
  have := (nhds_basis_abs_sub_lt (0:Cut)).comap (fun p:Cut×Cut => p.2 - p.1)
  simpa [sub_zero] using this

-- Step 1: a Cauchy sequence has bounded range
theorem cauchySeq_bddAbove_range {u : ℕ → Cut} (hu : CauchySeq u) : BddAbove (range u) := by
  rw [cut_uniformity_hasBasis_abs.cauchySeq_iff'] at hu
  obtain ⟨N, hN⟩ := hu 1 one_pos
  -- for n ≥ N: |u N - u n| < 1 → u n < u N + 1
  -- bound = max over {u 0,...,u N} and u N + 1
  have hfin : BddAbove (u '' {k | k ≤ N}) := (Set.finite_le_nat N).image u |>.bddAbove
  obtain ⟨B, hB⟩ := hfin
  refine ⟨max B (u N + 1), ?_⟩
  rintro x ⟨n, rfl⟩
  rcases le_or_gt n N with hn | hn
  · exact le_trans (hB ⟨n, hn, rfl⟩) (le_max_left _ _)
  · have := hN n (le_of_lt hn)
    simp only [mem_setOf_eq] at this
    have h2 : -1 < u N - u n := (abs_lt.1 this).1
    have : u n < u N + 1 := by linarith
    exact le_trans (le_of_lt this) (le_max_right _ _)

end

end ContinuumQ
end Phys.Foundation
