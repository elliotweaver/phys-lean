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

-- PROBE 4 (fixed): the even product ι a · ι b ∈ even subalgebra (Spin grade).
example (a b : STVC) :
    CliffordAlgebra.ι QvCQuad a * CliffordAlgebra.ι QvCQuad b ∈ CliffordAlgebra.even QvCQuad := by
  rw [CliffordAlgebra.even, Submodule.mem_toSubalgebra]
  exact CliffordAlgebra.ι_mul_ι_mem_evenOdd_zero QvCQuad a b

-- PROBE 5: even elements are involute-fixed (Spin = proper).
example {x : CliffC} (h : x ∈ CliffordAlgebra.even QvCQuad) :
    CliffordAlgebra.involute x = x := by
  rw [CliffordAlgebra.even, Submodule.mem_toSubalgebra] at h
  exact CliffordAlgebra.involute_eq_of_mem_even h

-- PROBE 6: the cover-kernel elements ±1 are in the even subalgebra (Spin/Pin index-2 datum).
example : (1 : CliffC) ∈ CliffordAlgebra.even QvCQuad := one_mem _
example : (-1 : CliffC) ∈ CliffordAlgebra.even QvCQuad := by
  have : (1 : CliffC) ∈ CliffordAlgebra.even QvCQuad := one_mem _
  exact (Subalgebra.neg_mem _ this)

-- PROBE 7: the even covering unit ↑(u*w) is even-graded, with u,w = cliffUnitOf.
example {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ CliffordAlgebra.even QvCQuad := by
  rw [Units.val_mul, cliffUnitOf_val, cliffUnitOf_val, CliffordAlgebra.even,
      Submodule.mem_toSubalgebra]
  exact CliffordAlgebra.ι_mul_ι_mem_evenOdd_zero QvCQuad a b

end

end Phys.Algebra
