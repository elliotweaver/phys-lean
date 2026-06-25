import Phys.Foundation.ContinuumArchimedean
import Mathlib.Topology.Algebra.IsUniformGroup.Defs
import Mathlib.Topology.Algebra.IsUniformGroup.Basic
import Mathlib.Topology.Algebra.InfiniteSum.Basic

open Phys.Foundation Filter
open scoped Topology Uniformity

namespace Phys.Foundation.ContinuumQ

noncomputable section

instance instUniformSpaceCut : UniformSpace Cut := IsTopologicalAddGroup.rightUniformSpace Cut

theorem cut_uniformSpace_toTopologicalSpace_eq :
    instUniformSpaceCut.toTopologicalSpace = instTopologicalSpaceCut := rfl

instance instIsUniformAddGroupCut : IsUniformAddGroup Cut := isUniformAddGroup_of_addCommGroup

-- the explicit uniformity (order-native: entourages = "difference near 0")
theorem cut_uniformity_eq :
    𝓤 Cut = Filter.comap (fun p : Cut × Cut => p.2 - p.1) (𝓝 (0 : Cut)) := rfl

-- non-vacuity: tsum statable, const Cauchy
example (f : ℕ → Cut) : Cut := ∑' n, f n
example (c : Cut) : CauchySeq (fun _ : ℕ => c) := cauchySeq_const _

end

end Phys.Foundation.ContinuumQ
