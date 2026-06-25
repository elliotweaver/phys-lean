import Phys.Foundation.ContinuumUniform

namespace Counterexamples
open Phys.Foundation Phys.Foundation.ContinuumQ Filter
open scoped Topology Uniformity

noncomputable section

#synth DenselyOrdered Cut
#synth Nontrivial Cut
#check @nhds_eq_pure_iff
#check @t2Space_cut

-- If discrete: nhds 0 = pure 0. In a T1 densely-ordered space with >1 point, false.
-- Probe: from instTopologicalSpaceCut = ⊥, derive a crisp contradiction.
example (h : instUniformSpaceCut.toTopologicalSpace = (⊥ : TopologicalSpace Cut)) : False := by
  rw [cut_uniformSpace_toTopologicalSpace_eq] at h
  sorry

end
end Counterexamples
