import Phys.Foundation.ContinuumUniform

namespace Counterexamples
open Phys.Foundation Phys.Foundation.ContinuumQ Filter Set
open scoped Topology Uniformity

noncomputable section

example (h : instUniformSpaceCut.toTopologicalSpace = (⊥ : TopologicalSpace Cut)) : False := by
  rw [cut_uniformSpace_toTopologicalSpace_eq] at h
  haveI hd : @DiscreteTopology Cut instTopologicalSpaceCut := ⟨h⟩
  have hnb : (𝓝[>] (0 : Cut)).NeBot := nhdsGT_neBot 0
  have hbot : (𝓝[>] (0 : Cut)) = ⊥ := by
    rw [nhdsWithin, nhds_discrete, inf_principal_eq_bot]
    simp only [Set.mem_compl_iff, Set.mem_Ioi, mem_pure]
    exact lt_irrefl 0
  exact hnb.ne hbot

end
end Counterexamples
