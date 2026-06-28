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

theorem star_even_unit {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0) :
    star ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC)
      = CliffordAlgebra.ι QvCQuad b * CliffordAlgebra.ι QvCQuad a := by
  rw [Units.val_mul, cliffUnitOf_val, cliffUnitOf_val, star_mul,
      CliffordAlgebra.star_ι, CliffordAlgebra.star_ι, neg_mul_neg]

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

theorem cliffEvenUnit_mem_unitary {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0)
    (h : QvC a * QvC b = 1) :
    ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ unitary CliffC := by
  rw [Unitary.mem_iff]
  exact ⟨by rw [cliffEvenUnit_star_mul_self, h, map_one],
         by rw [cliffEvenUnit_mul_star_self, h, map_one]⟩

theorem cliffEvenUnit_mem_pinGroup {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0)
    (h : QvC a * QvC b = 1) :
    ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ pinGroup QvCQuad := by
  rw [pinGroup.units_mem_iff]
  exact ⟨cliffUnitMul_mem_lipschitzGroup ha hb, cliffEvenUnit_mem_unitary ha hb h⟩

theorem cliffEvenUnit_mem_spinGroup {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0)
    (h : QvC a * QvC b = 1) :
    ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ spinGroup QvCQuad := by
  rw [spinGroup.mem_iff]
  exact ⟨cliffEvenUnit_mem_pinGroup ha hb h, cliffEvenUnit_mem_even ha hb⟩

-- Concrete witnesses over the banked signature facts QvC mTimeUnit = 1, QvC mSpaceUnit = -1.
theorem QvC_mTimeUnit : QvC (mTimeUnit : STVC) = 1 := by rw [← BvC_self]; exact BvC_mTimeUnit_self
theorem QvC_mSpaceUnit : QvC (mSpaceUnit : STVC) = -1 := by rw [← BvC_self]; exact BvC_mSpaceUnit_self

-- The double-timelike even unit lands in spinGroup (a concrete rotor witness).
theorem cover_spin_timelike_double_mem_spinGroup
    (hmt : BvC (mTimeUnit : STVC) (mTimeUnit : STVC) ≠ 0) :
    ((cliffUnitOf (mTimeUnit : STVC) hmt * cliffUnitOf (mTimeUnit : STVC) hmt : CliffCˣ) : CliffC)
      ∈ spinGroup QvCQuad :=
  cliffEvenUnit_mem_spinGroup hmt hmt (by rw [QvC_mTimeUnit]; ring)

-- The double-spacelike even unit lands in spinGroup (a concrete compact-rotor witness).
theorem cover_spin_spacelike_double_mem_spinGroup
    (hms : BvC (mSpaceUnit : STVC) (mSpaceUnit : STVC) ≠ 0) :
    ((cliffUnitOf (mSpaceUnit : STVC) hms * cliffUnitOf (mSpaceUnit : STVC) hms : CliffCˣ) : CliffC)
      ∈ spinGroup QvCQuad :=
  cliffEvenUnit_mem_spinGroup hms hms (by rw [QvC_mSpaceUnit]; ring)

-- ★ W8 TEETH — the mixed (timelike·spacelike = boost) even unit has star x · x = -1 (NOT 1):
-- pseudo-unitary, NOT in the compact unitary group. The genuinely-indefinite read-off.
theorem cover_boost_even_star_mul_self_eq_neg_one
    (hmt : BvC (mTimeUnit : STVC) (mTimeUnit : STVC) ≠ 0)
    (hms : BvC (mSpaceUnit : STVC) (mSpaceUnit : STVC) ≠ 0) :
    star ((cliffUnitOf (mTimeUnit : STVC) hmt * cliffUnitOf (mSpaceUnit : STVC) hms : CliffCˣ) : CliffC)
        * ((cliffUnitOf (mTimeUnit : STVC) hmt * cliffUnitOf (mSpaceUnit : STVC) hms : CliffCˣ) : CliffC)
      = -1 := by
  rw [cliffEvenUnit_star_mul_self, QvC_mTimeUnit, QvC_mSpaceUnit, mul_neg_one, map_neg, map_one]

-- THE GROUP-LEVEL Spin ↠ SO⁺ half: a proper isometry from two like-signature reflections is covered
-- by a spinGroup-landing unit.
theorem cover_proper_spin {a b : STVC} (ha : BvC a a ≠ 0) (hb : BvC b b ≠ 0)
    (h : QvC a * QvC b = 1) :
    CliffCovers (cliffUnitOf a ha * cliffUnitOf b hb) (houseHolderM a * houseHolderM b)
      ∧ ((cliffUnitOf a ha * cliffUnitOf b hb : CliffCˣ) : CliffC) ∈ spinGroup QvCQuad :=
  ⟨cliffCovers_mul (cliffCovers_reflection ha) (cliffCovers_reflection hb),
   cliffEvenUnit_mem_spinGroup ha hb h⟩

end

end ProbeN143
