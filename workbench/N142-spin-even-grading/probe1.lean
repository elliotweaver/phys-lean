import Phys.Algebra.LorentzContinuumCliffordCoverKernel
import Mathlib.LinearAlgebra.CliffordAlgebra.SpinGroup
import Mathlib.LinearAlgebra.CliffordAlgebra.Even
import Mathlib.LinearAlgebra.CliffordAlgebra.Grading

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- PROBE 1: the derived covering generator ι a (anisotropic) is in the abstract Lipschitz group.
-- lipschitzGroup is a Subgroup of CliffCˣ; membership needs the unit ↑u = ι a in the generating set.
example {a : STVC} (ha : BvC a a ≠ 0) :
    cliffUnitOf a ha ∈ lipschitzGroup QvCQuad := by
  apply Subgroup.subset_closure
  exact ⟨a, rfl⟩

-- PROBE 2: a single reflection generator is involute-negated (odd / improper grade read-off).
example (a : STVC) :
    CliffordAlgebra.involute (CliffordAlgebra.ι QvCQuad a) = -(CliffordAlgebra.ι QvCQuad a) :=
  CliffordAlgebra.involute_ι a

-- PROBE 3: ι a ∈ evenOdd 1 (odd grade).
example (a : STVC) :
    CliffordAlgebra.ι QvCQuad a ∈ CliffordAlgebra.evenOdd QvCQuad 1 :=
  CliffordAlgebra.ι_mem_evenOdd_one QvCQuad a

-- PROBE 4: the even product ι a · ι b ∈ even subalgebra (Spin grade).
example (a b : STVC) :
    CliffordAlgebra.ι QvCQuad a * CliffordAlgebra.ι QvCQuad b ∈ CliffordAlgebra.even QvCQuad := by
  rw [CliffordAlgebra.even]
  simp only [Subalgebra.mem_toSubalgebra] -- guess; will check error
  exact CliffordAlgebra.ι_mul_ι_mem_evenOdd_zero QvCQuad a b

end

end Phys.Algebra
