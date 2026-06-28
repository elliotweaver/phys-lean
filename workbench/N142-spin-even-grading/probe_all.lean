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

-- 1. abstract Clifford group identification
theorem cliffUnit_mem_lipschitzGroup {a : STVC} (ha : BvC a a ≠ 0) :
    cliffUnitOf a ha ∈ lipschitzGroup QvCQuad :=
  Subgroup.subset_closure ⟨a, rfl⟩

theorem cliffUnitMul_mem_lipschitzGroup {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    cliffUnitOf a ha * cliffUnitOf b hb ∈ lipschitzGroup QvCQuad :=
  mul_mem (cliffUnit_mem_lipschitzGroup ha) (cliffUnit_mem_lipschitzGroup hb)

-- 2. odd grade — single generator (improper)
theorem cliffUnit_involute_neg {a : STVC} (ha : BvC a a ≠ 0) :
    CliffordAlgebra.involute ((cliffUnitOf a ha : CliffCˣ) : CliffC)
      = -((cliffUnitOf a ha : CliffCˣ) : CliffC) := by
  rw [cliffUnitOf_val]; exact CliffordAlgebra.involute_ι a

theorem cliffUnit_mem_evenOdd_one {a : STVC} (ha : BvC a a ≠ 0) :
    ((cliffUnitOf a ha : CliffCˣ) : CliffC) ∈ CliffordAlgebra.evenOdd QvCQuad 1 := by
  rw [cliffUnitOf_val]; exact CliffordAlgebra.ι_mem_evenOdd_one QvCQuad a

-- 3. even grade — two-generator product (Spin)
theorem cliffEvenUnit_mem_even {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ CliffordAlgebra.even QvCQuad := by
  rw [Units.val_mul, cliffUnitOf_val, cliffUnitOf_val, CliffordAlgebra.even,
      Submodule.mem_toSubalgebra]
  exact CliffordAlgebra.ι_mul_ι_mem_evenOdd_zero QvCQuad a b

-- 4. even = involute-fixed (Spin characterization over CliffC)
theorem even_involute_fixed_cliffC {x : CliffC} (h : x ∈ CliffordAlgebra.even QvCQuad) :
    CliffordAlgebra.involute x = x := by
  rw [CliffordAlgebra.even, Submodule.mem_toSubalgebra] at h
  exact CliffordAlgebra.involute_eq_of_mem_even h

theorem cliffEvenUnit_involute_fixed {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    CliffordAlgebra.involute ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC)
      = ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) :=
  even_involute_fixed_cliffC (cliffEvenUnit_mem_even ha hb)

-- 5. kernel {±1} ⊂ even (Spin/Pin index-2 datum)
theorem cover_kernel_one_mem_even : ((1 : CliffCˣ) : CliffC) ∈ CliffordAlgebra.even QvCQuad := by
  rw [Units.val_one]; exact one_mem _

theorem cover_kernel_neg_one_mem_even :
    ((-1 : CliffCˣ) : CliffC) ∈ CliffordAlgebra.even QvCQuad := by
  rw [Units.val_neg, Units.val_one]; exact Subalgebra.neg_mem _ (one_mem _)

-- 6. HEADLINE — a proper (even reflection word) isometry covered by an even (Spin-grade) unit
theorem cover_proper_even {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    CliffCovers (cliffUnitOf a ha * cliffUnitOf b hb) (houseHolderM a * houseHolderM b)
      ∧ ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ CliffordAlgebra.even QvCQuad :=
  ⟨cliffCovers_mul (cliffCovers_reflection ha) (cliffCovers_reflection hb),
   cliffEvenUnit_mem_even ha hb⟩

-- 7. the even/odd split — proper vs improper distinguished by grade
theorem cover_even_odd_split {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    CliffordAlgebra.involute ((cliffUnitOf a ha : CliffCˣ) : CliffC)
        = -((cliffUnitOf a ha : CliffCˣ) : CliffC)
      ∧ CliffordAlgebra.involute ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC)
        = ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) :=
  ⟨cliffUnit_involute_neg ha, cliffEvenUnit_involute_fixed ha hb⟩

-- W8 anchor
theorem cover_spin_timelike_double_val_eq_one
    (hmt : BvC (mTimeUnit : STVC) (mTimeUnit : STVC) ≠ 0) :
    ((cliffUnitOf (mTimeUnit : STVC) hmt * cliffUnitOf (mTimeUnit : STVC) hmt : CliffCˣ) : CliffC)
      = 1 := by
  rw [Units.val_mul, cliffUnitOf_val]
  exact cover_timelike_unit_clifford_sq

end

end Phys.Algebra
