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

-- HEADLINE: the even covering unit u = cliffUnitOf a · cliffUnitOf b BOTH covers the composite
-- proper isometry houseHolderM a * houseHolderM b AND is even-graded (Spin grade).
example {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    CliffCovers (cliffUnitOf a ha * cliffUnitOf b hb) (houseHolderM a * houseHolderM b)
      ∧ ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ CliffordAlgebra.even QvCQuad := by
  refine ⟨cliffCovers_mul (cliffCovers_reflection ha) (cliffCovers_reflection hb), ?_⟩
  rw [Units.val_mul, cliffUnitOf_val, cliffUnitOf_val, CliffordAlgebra.even,
      Submodule.mem_toSubalgebra]
  exact CliffordAlgebra.ι_mul_ι_mem_evenOdd_zero QvCQuad a b

-- Abstract: the even covering unit is in the lipschitzGroup (product of two generators).
example {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    cliffUnitOf a ha * cliffUnitOf b hb ∈ lipschitzGroup QvCQuad :=
  mul_mem (Subgroup.subset_closure ⟨a, rfl⟩) (Subgroup.subset_closure ⟨b, rfl⟩)

-- The cover kernel -1 is even AND covers the identity (the Spin-grade kernel element).
example : ((-1 : CliffCˣ) : CliffC) ∈ CliffordAlgebra.even QvCQuad := by
  rw [Units.val_neg, Units.val_one]
  exact Subalgebra.neg_mem _ (one_mem _)

-- W8 anchor candidate: the even covering unit at the timelike generator squares to 1.
-- ι mt · ι mt = 1 (cover_timelike_unit_clifford_sq); so cliffUnitOf mt · cliffUnitOf mt has val ι mt·ι mt.
-- Read off QvC mTimeUnit = 1.
example : QvC (mTimeUnit : STVC) = 1 := cover_kernel_timelike_norm

end

end Phys.Algebra
