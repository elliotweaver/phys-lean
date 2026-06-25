import Phys.Foundation.ContinuumArchimedean
import Mathlib.Topology.Algebra.IsUniformGroup.Defs
import Mathlib.Topology.Algebra.IsUniformGroup.Basic
import Mathlib.Topology.Algebra.InfiniteSum.Basic

open Phys.Foundation
open scoped Topology

namespace Phys.Foundation.ContinuumQ

noncomputable section

-- ROUTE B: build the UniformSpace from the banked topological-add-group structure.
example : UniformSpace Cut := IsTopologicalAddGroup.rightUniformSpace Cut

-- ★ ACID TEST 1: induced topology DEFEQ to the banked instTopologicalSpaceCut?  (rfl ⟹ YES)
example : (IsTopologicalAddGroup.rightUniformSpace Cut).toTopologicalSpace
    = instTopologicalSpaceCut := rfl

-- ★ ACID TEST 2: the comm case gives IsUniformAddGroup (left=right uniformity coincide)
example : @IsUniformAddGroup Cut (IsTopologicalAddGroup.rightUniformSpace Cut) _ :=
  isUniformAddGroup_of_addCommGroup

-- ★ ACID TEST 3: with the UniformSpace as a scoped instance, does CompleteSpace synth or
--    need a build? And can tsum be STATED?
section WithUniform
attribute [local instance] IsTopologicalAddGroup.rightUniformSpace
example (f : ℕ → Cut) : Cut := ∑' n, f n  -- tsum statable
-- #synth CompleteSpace Cut  -- likely needs a build
end WithUniform

end

end Phys.Foundation.ContinuumQ
