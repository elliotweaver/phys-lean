import Phys.Algebra.LorentzContinuumOctStabilizerG2KleinFour
import Mathlib.GroupTheory.SpecificGroups.KleinFour

namespace N178Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- the four membership witnesses
theorem one_mem' : (1 : O Cut ≃ₗ[Cut] O Cut) ∈ kleinFour := by
  simp only [kleinFour, Subgroup.mem_mk]; tauto
theorem top_mem' : octTopNeg ∈ kleinFour := by
  simp only [kleinFour, Subgroup.mem_mk]; tauto
theorem inner_mem' : octInnerNeg ∈ kleinFour := by
  simp only [kleinFour, Subgroup.mem_mk]; tauto
theorem comp_mem' : octCompNeg ∈ kleinFour := by
  simp only [kleinFour, Subgroup.mem_mk]; tauto

-- the carrier as a set
example : (kleinFour : Set (O Cut ≃ₗ[Cut] O Cut)) = {1, octTopNeg, octInnerNeg, octCompNeg} := rfl

-- distinctness, converting 1 to refl
theorem one_ne_top : (1 : O Cut ≃ₗ[Cut] O Cut) ≠ octTopNeg := by
  rw [LinearEquiv.one_eq_refl]; exact fun h => octTopNeg_ne_refl h.symm
theorem one_ne_inner : (1 : O Cut ≃ₗ[Cut] O Cut) ≠ octInnerNeg := by
  rw [LinearEquiv.one_eq_refl]; exact fun h => octInnerNeg_ne_refl h.symm
theorem one_ne_comp : (1 : O Cut ≃ₗ[Cut] O Cut) ≠ octCompNeg := by
  rw [LinearEquiv.one_eq_refl]; exact fun h => octCompNeg_ne_refl h.symm

-- CARD probe (approach A: ncard of carrier set)
example : Nat.card (kleinFour : Set (O Cut ≃ₗ[Cut] O Cut)) = 4 := by
  rw [Nat.card_coe_set_eq]
  show ({1, octTopNeg, octInnerNeg, octCompNeg} : Set (O Cut ≃ₗ[Cut] O Cut)).ncard = 4
  rw [Set.ncard_insert_of_not_mem, Set.ncard_insert_of_not_mem,
      Set.ncard_insert_of_not_mem, Set.ncard_singleton]
  · simp only [Set.mem_singleton_iff]; exact octCompNeg_ne_octInnerNeg.symm
  · simp only [Set.mem_insert_iff, Set.mem_singleton_iff, not_or]
    exact ⟨octInnerNeg_ne_octTopNeg.symm, octCompNeg_ne_octTopNeg.symm⟩
  · simp only [Set.mem_insert_iff, Set.mem_singleton_iff, not_or]
    exact ⟨one_ne_top, one_ne_inner, one_ne_comp⟩

-- does Nat.card ↥kleinFour reduce to the set ncard?
example : Nat.card ↥kleinFour = Nat.card (kleinFour : Set (O Cut ≃ₗ[Cut] O Cut)) := rfl

end

end N178Probe
