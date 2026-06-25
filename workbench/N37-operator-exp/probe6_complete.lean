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

theorem cut_uniformity_hasBasis_abs :
    (𝓤 Cut).HasBasis (fun ε:Cut => (0:Cut) < ε) (fun ε => {p:Cut×Cut | |p.2 - p.1| < ε}) := by
  rw [cut_uniformity_eq]
  have := (nhds_basis_abs_sub_lt (0:Cut)).comap (fun p:Cut×Cut => p.2 - p.1)
  simpa [sub_zero] using this

theorem cauchySeq_bddAbove_range {u : ℕ → Cut} (hu : CauchySeq u) : BddAbove (range u) := by
  rw [cut_uniformity_hasBasis_abs.cauchySeq_iff'] at hu
  obtain ⟨N, hN⟩ := hu 1 one_pos
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

theorem cauchySeq_bddBelow_range {u : ℕ → Cut} (hu : CauchySeq u) : BddBelow (range u) := by
  rw [cut_uniformity_hasBasis_abs.cauchySeq_iff'] at hu
  obtain ⟨N, hN⟩ := hu 1 one_pos
  have hfin : BddBelow (u '' {k | k ≤ N}) := (Set.finite_le_nat N).image u |>.bddBelow
  obtain ⟨B, hB⟩ := hfin
  refine ⟨min B (u N - 1), ?_⟩
  rintro x ⟨n, rfl⟩
  rcases le_or_gt n N with hn | hn
  · exact le_trans (min_le_left _ _) (hB ⟨n, hn, rfl⟩)
  · have := hN n (le_of_lt hn)
    simp only [mem_setOf_eq] at this
    have h2 : u N - u n < 1 := (abs_lt.1 this).2
    have : u N - 1 < u n := by linarith
    exact le_trans (min_le_right _ _) (le_of_lt this)

-- THE TARGET: CompleteSpace Cut
instance instCompleteSpaceCut : CompleteSpace Cut := by
  apply UniformSpace.complete_of_cauchySeq_tendsto
  intro u hu
  -- range bounded
  have hA := cauchySeq_bddAbove_range hu
  have hB := cauchySeq_bddBelow_range hu
  obtain ⟨ub, hub⟩ := hA
  obtain ⟨lb, hlb⟩ := hB
  -- range ⊆ Icc lb ub
  have hsub : ∀ n, u n ∈ Icc lb ub := fun n =>
    ⟨hlb ⟨n, rfl⟩, hub ⟨n, rfl⟩⟩
  -- Icc compact (N34)
  have hcompact : IsCompact (Icc lb ub) := isCompact_Icc
  -- convergent subseq
  obtain ⟨a, _, φ, hφ, hφa⟩ := hcompact.tendsto_subseq hsub
  exact ⟨a, tendsto_nhds_of_cauchySeq_of_subseq hu hφ.tendsto_atTop hφa⟩

end

end ContinuumQ
end Phys.Foundation
