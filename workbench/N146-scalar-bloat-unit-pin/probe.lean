import Phys.Algebra.LorentzContinuumCliffordPinGroup

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- reflection-square value-level (needed below)
theorem probe_cliffUnitOf_sq_val {a : STVC} (ha : BvC a a ≠ 0) :
    (((cliffUnitOf a ha) ^ 2 : CliffCˣ) : CliffC) = algebraMap Cut CliffC (QvC a) := by
  rw [sq, Units.val_mul, cliffUnitOf_val]
  rw [CliffordAlgebra.ι_sq_scalar QvCQuad a, QvCQuad_apply]

-- ===== The unit-normalized Pin group =====

def probe_pinUnitGenSet : Set CliffCˣ :=
  { u | ∃ (a : STVC) (ha : BvC a a ≠ 0), (QvC a = 1 ∨ QvC a = -1) ∧ u = cliffUnitOf a ha }

theorem probe_pinUnitGenSet_subset : probe_pinUnitGenSet ⊆ pinGenSet := by
  rintro u ⟨a, ha, _, rfl⟩
  exact ⟨a, ha, rfl⟩

def probe_PinUnitSub : Submonoid CliffCˣ := Submonoid.closure probe_pinUnitGenSet

theorem probe_pinUnitSub_le_pinSub : probe_PinUnitSub ≤ PinSub :=
  Submonoid.closure_mono probe_pinUnitGenSet_subset

theorem probe_pinUnitSub_le_coversSub : probe_PinUnitSub ≤ CoversSub :=
  le_trans probe_pinUnitSub_le_pinSub pinSub_le_coversSub

-- bloat COLLAPSE: a unit generator's reflection square is exactly ±1
theorem probe_cliffUnitOf_unit_sq {a : STVC} (ha : BvC a a ≠ 0)
    (hu : QvC a = 1 ∨ QvC a = -1) :
    ((cliffUnitOf a ha) ^ 2 : CliffCˣ) = 1 ∨ ((cliffUnitOf a ha) ^ 2 : CliffCˣ) = -1 := by
  rcases hu with h | h
  · left; apply Units.ext
    rw [probe_cliffUnitOf_sq_val, h, map_one, Units.val_one]
  · right; apply Units.ext
    rw [probe_cliffUnitOf_sq_val, h, map_neg, map_one, Units.val_neg, Units.val_one]

-- -1 survives in the unit-normalized group (square of the UNIT spacelike reflection)
theorem probe_negOne_mem_pinUnitSub : (-1 : CliffCˣ) ∈ probe_PinUnitSub := by
  have hms : BvC (mSpaceUnit : STVC) (mSpaceUnit : STVC) ≠ 0 := by
    rw [BvC_mSpaceUnit_self]; exact neg_ne_zero.mpr one_ne_zero
  have hqms : QvC (mSpaceUnit : STVC) = -1 := by rw [← BvC_self]; exact BvC_mSpaceUnit_self
  have hgen : cliffUnitOf mSpaceUnit hms ∈ probe_pinUnitGenSet :=
    ⟨mSpaceUnit, hms, Or.inr hqms, rfl⟩
  have h2 : (cliffUnitOf mSpaceUnit hms) ^ 2 ∈ probe_PinUnitSub := by
    rw [sq]
    exact mul_mem (Submonoid.subset_closure hgen) (Submonoid.subset_closure hgen)
  have hsq : (cliffUnitOf mSpaceUnit hms) ^ 2 = (-1 : CliffCˣ) := by
    apply Units.ext
    rw [probe_cliffUnitOf_sq_val, hqms, map_neg, map_one, Units.val_neg, Units.val_one]
  rwa [hsq] at h2

-- the restricted cover and its order-2 mker
def probe_coverMapPinUnit : probe_PinUnitSub →* bvIsomLinMonoid :=
  coverMap.comp (Submonoid.inclusion probe_pinUnitSub_le_coversSub)

theorem probe_negOne_mem_mker :
    (⟨(-1 : CliffCˣ), probe_negOne_mem_pinUnitSub⟩ : probe_PinUnitSub)
      ∈ MonoidHom.mker probe_coverMapPinUnit := by
  rw [MonoidHom.mem_mker]
  apply Subtype.ext
  show coverOp ⟨(-1 : CliffCˣ), probe_pinUnitSub_le_coversSub probe_negOne_mem_pinUnitSub⟩
    = (1 : Module.End Cut STVC)
  exact cliffCovers_unique
    (coverOp_covers ⟨(-1 : CliffCˣ), probe_pinUnitSub_le_coversSub probe_negOne_mem_pinUnitSub⟩)
    cover_kernel_neg_one

theorem probe_coverMapPinUnit_mker_nontrivial :
    (⟨(-1 : CliffCˣ), probe_negOne_mem_pinUnitSub⟩ : probe_PinUnitSub) ≠ 1 ∧
    (⟨(-1 : CliffCˣ), probe_negOne_mem_pinUnitSub⟩ : probe_PinUnitSub)
      ∈ MonoidHom.mker probe_coverMapPinUnit := by
  refine ⟨?_, probe_negOne_mem_mker⟩
  intro h
  exact cover_kernel_distinct (congrArg Subtype.val h)

end

end Phys.Algebra
