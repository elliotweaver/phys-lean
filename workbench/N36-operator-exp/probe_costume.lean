import Phys.Foundation.ContinuumUniform

namespace Counterexamples
open Phys.Foundation Phys.Foundation.ContinuumQ Filter
open scoped Topology Uniformity

noncomputable section

-- CANDIDATE B (topology-agreement load-bearing): assert the uniform topology is DISCRETE.
-- The new agreement theorem reduces it to instTopologicalSpaceCut = ⊥ (FALSE: order topo not discrete).
theorem candB_BOGUS : instUniformSpaceCut.toTopologicalSpace = (⊥ : TopologicalSpace Cut) := by
  rw [cut_uniformSpace_toTopologicalSpace_eq]

-- CANDIDATE D: is non-discreteness cheaply provable so I could reduce to crisp False?
-- Check what's available: nhds 0 ≠ pure 0 in a densely ordered order topology.
#check @DenselyOrdered
-- #synth DenselyOrdered Cut

-- CANDIDATE C': constant-1 Cauchy seq (new content) tends to 1; assert it tends to 0 → 0 = 1.
-- The "tends to 0" is the bogus part — need it to come from a banked theorem on a bogus hyp.
-- Pin via: the uniform structure makes (fun _ => 1) Cauchy AND tendsto 1; uniqueness vs a claimed 0.
theorem candC_BOGUS : (1 : Cut) = (0 : Cut) := by
  have h1 : Tendsto (fun _ : ℕ => (1 : Cut)) atTop (𝓝 (1 : Cut)) := tendsto_const_nhds
  have hc : CauchySeq (fun _ : ℕ => (1 : Cut)) := cut_const_cauchySeq 1
  -- bogus: assert the SAME constant seq tends to 0
  have h0 : Tendsto (fun _ : ℕ => (1 : Cut)) atTop (𝓝 (0 : Cut)) := tendsto_const_nhds
  exact tendsto_nhds_unique h1 h0

end
end Counterexamples
