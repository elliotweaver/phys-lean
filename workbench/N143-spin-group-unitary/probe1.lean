import Phys.Algebra.LorentzContinuumCliffordSpinEven
import Mathlib.LinearAlgebra.CliffordAlgebra.SpinGroup
import Mathlib.LinearAlgebra.CliffordAlgebra.Even
import Mathlib.LinearAlgebra.CliffordAlgebra.Grading

namespace ProbeN143

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- PROBE 1: the star of the even unit value = ι b · ι a
theorem star_even_unit {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    star ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC)
      = CliffordAlgebra.ι QvCQuad b * CliffordAlgebra.ι QvCQuad a := by
  rw [Units.val_mul, cliffUnitOf_val, cliffUnitOf_val, star_mul,
      CliffordAlgebra.star_ι, CliffordAlgebra.star_ι, neg_mul_neg]

-- PROBE 2: the central star-mul-self identity
theorem cliffEvenUnit_star_mul_self {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    star ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC)
        * ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC)
      = algebraMap Cut CliffC (QvC a * QvC b) := by
  rw [star_even_unit, Units.val_mul, cliffUnitOf_val, cliffUnitOf_val]
  set ιa := CliffordAlgebra.ι QvCQuad a
  set ιb := CliffordAlgebra.ι QvCQuad b
  have hcomm : ιb * algebraMap Cut CliffC (QvC a)
      = algebraMap Cut CliffC (QvC a) * ιb := (Algebra.commute_algebraMap_right _ _).eq
  calc ιb * ιa * (ιa * ιb)
      = ιb * (ιa * ιa) * ιb := by noncomm_ring
    _ = ιb * algebraMap Cut CliffC (QvC a) * ιb := by rw [cliffSq a]
    _ = algebraMap Cut CliffC (QvC a) * (ιb * ιb) := by rw [hcomm]; noncomm_ring
    _ = algebraMap Cut CliffC (QvC a) * algebraMap Cut CliffC (QvC b) := by rw [cliffSq b]
    _ = algebraMap Cut CliffC (QvC a * QvC b) := by rw [map_mul]

-- PROBE 3: the mul-star-self identity (other side)
theorem cliffEvenUnit_mul_star_self {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC)
        * star ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC)
      = algebraMap Cut CliffC (QvC a * QvC b) := by
  rw [star_even_unit, Units.val_mul, cliffUnitOf_val, cliffUnitOf_val]
  set ιa := CliffordAlgebra.ι QvCQuad a
  set ιb := CliffordAlgebra.ι QvCQuad b
  have hcomm : ιa * algebraMap Cut CliffC (QvC b)
      = algebraMap Cut CliffC (QvC b) * ιa := (Algebra.commute_algebraMap_right _ _).eq
  calc ιa * ιb * (ιb * ιa)
      = ιa * (ιb * ιb) * ιa := by noncomm_ring
    _ = ιa * algebraMap Cut CliffC (QvC b) * ιa := by rw [cliffSq b]
    _ = algebraMap Cut CliffC (QvC b) * (ιa * ιa) := by rw [hcomm]; noncomm_ring
    _ = algebraMap Cut CliffC (QvC b) * algebraMap Cut CliffC (QvC a) := by rw [cliffSq a]
    _ = algebraMap Cut CliffC (QvC b * QvC a) := by rw [map_mul]
    _ = algebraMap Cut CliffC (QvC a * QvC b) := by rw [mul_comm]

-- PROBE 4: the unitary condition
theorem cliffEvenUnit_mem_unitary {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0)
    (h : QvC a * QvC b = 1) :
    ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ unitary CliffC := by
  rw [unitary.mem_iff]
  refine ⟨?_, ?_⟩
  · rw [cliffEvenUnit_star_mul_self, h, map_one]
  · rw [cliffEvenUnit_mul_star_self, h, map_one]

-- PROBE 5: pinGroup membership
theorem cliffEvenUnit_mem_pinGroup {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0)
    (h : QvC a * QvC b = 1) :
    ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ pinGroup QvCQuad := by
  rw [pinGroup.units_mem_iff]
  exact ⟨cliffUnitMul_mem_lipschitzGroup ha hb, cliffEvenUnit_mem_unitary ha hb h⟩

-- PROBE 6: THE HEADLINE — spinGroup membership
theorem cliffEvenUnit_mem_spinGroup {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0)
    (h : QvC a * QvC b = 1) :
    ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ spinGroup QvCQuad := by
  rw [spinGroup.mem_iff]
  exact ⟨cliffEvenUnit_mem_pinGroup ha hb h, cliffEvenUnit_mem_even ha hb⟩

end

end ProbeN143
