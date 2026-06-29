import Phys.Algebra.LorentzContinuumOctStabilizerG2KleinFour
import Mathlib.GroupTheory.SpecificGroups.KleinFour

namespace N178Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- distinctness, converting 1 to refl
theorem one_ne_top : (1 : O Cut ≃ₗ[Cut] O Cut) ≠ octTopNeg := by
  rw [LinearEquiv.one_eq_refl]; exact fun h => octTopNeg_ne_refl h.symm
theorem one_ne_inner : (1 : O Cut ≃ₗ[Cut] O Cut) ≠ octInnerNeg := by
  rw [LinearEquiv.one_eq_refl]; exact fun h => octInnerNeg_ne_refl h.symm
theorem one_ne_comp : (1 : O Cut ≃ₗ[Cut] O Cut) ≠ octCompNeg := by
  rw [LinearEquiv.one_eq_refl]; exact fun h => octCompNeg_ne_refl h.symm

-- the carrier finiteness
theorem carrier_finite : ({1, octTopNeg, octInnerNeg, octCompNeg} : Set (O Cut ≃ₗ[Cut] O Cut)).Finite := by
  apply Set.Finite.insert; apply Set.Finite.insert; apply Set.Finite.insert; exact Set.finite_singleton _

-- CARD = 4
theorem card_four : Nat.card ↥kleinFour = 4 := by
  show Nat.card (kleinFour : Set (O Cut ≃ₗ[Cut] O Cut)) = 4
  rw [Nat.card_coe_set_eq]
  show ({1, octTopNeg, octInnerNeg, octCompNeg} : Set (O Cut ≃ₗ[Cut] O Cut)).ncard = 4
  rw [Set.ncard_insert_of_notMem, Set.ncard_insert_of_notMem,
      Set.ncard_insert_of_notMem, Set.ncard_singleton]
  · simp only [Set.mem_singleton_iff]; exact octCompNeg_ne_octInnerNeg.symm
  · simp only [Set.mem_insert_iff, Set.mem_singleton_iff, not_or]
    exact ⟨octInnerNeg_ne_octTopNeg.symm, octCompNeg_ne_octTopNeg.symm⟩
  · simp only [Set.mem_insert_iff, Set.mem_singleton_iff, not_or]
    exact ⟨one_ne_top, one_ne_inner, one_ne_comp⟩

-- EXPONENT = 2 : every element squares to 1 (banked) + there is a non-identity element
-- exponent divides 2 (all square to 1) and ≠ 1 (octTopNeg ≠ 1).
theorem exponent_two : Monoid.exponent ↥kleinFour = 2 := by
  have hdvd : Monoid.exponent ↥kleinFour ∣ 2 := by
    apply Monoid.exponent_dvd_of_forall_pow_eq_one
    intro g
    have := kleinFour_elem_involution g.1 g.2
    apply Subtype.ext
    rw [pow_two]
    exact this
  -- exponent ≠ 1 : octTopNeg as a subgroup element is not the identity
  interval_cases h : Monoid.exponent ↥kleinFour
  all_goals sorry

end

end N178Probe
