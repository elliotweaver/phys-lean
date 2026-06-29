import Phys.Algebra.LorentzContinuumOctStabilizerG2KleinFour
import Mathlib.GroupTheory.SpecificGroups.KleinFour

namespace N178Probe

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

noncomputable section

theorem top_mem' : octTopNeg ∈ kleinFour := by
  simp only [kleinFour, Subgroup.mem_mk]; tauto

theorem one_ne_top : (1 : O Cut ≃ₗ[Cut] O Cut) ≠ octTopNeg := by
  rw [LinearEquiv.one_eq_refl]; exact fun h => octTopNeg_ne_refl h.symm
theorem one_ne_inner : (1 : O Cut ≃ₗ[Cut] O Cut) ≠ octInnerNeg := by
  rw [LinearEquiv.one_eq_refl]; exact fun h => octInnerNeg_ne_refl h.symm
theorem one_ne_comp : (1 : O Cut ≃ₗ[Cut] O Cut) ≠ octCompNeg := by
  rw [LinearEquiv.one_eq_refl]; exact fun h => octCompNeg_ne_refl h.symm

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

theorem exponent_two : Monoid.exponent ↥kleinFour = 2 := by
  have hdvd : Monoid.exponent ↥kleinFour ∣ 2 := by
    apply Monoid.exponent_dvd_of_forall_pow_eq_one
    intro g
    apply Subtype.ext
    rw [pow_two]
    exact kleinFour_elem_involution g.1 g.2
  rcases (Nat.dvd_prime Nat.prime_two).mp hdvd with h1 | h2
  · exfalso
    have hg : (⟨octTopNeg, top_mem'⟩ : ↥kleinFour) ^ Monoid.exponent ↥kleinFour = 1 :=
      Monoid.pow_exponent_eq_one _
    rw [h1, pow_one] at hg
    exact one_ne_top (congrArg Subtype.val hg).symm
  · exact h2

-- THE ABSTRACT GROUP OBJECT
instance isKleinFour_kleinFour : IsKleinFour ↥kleinFour where
  card_four := card_four
  exponent_two := exponent_two

-- the canonical iso to ZMod 2 × ZMod 2 (as Multiplicative, since kleinFour is multiplicative)
theorem nonempty_iso :
    Nonempty (↥kleinFour ≃* Multiplicative (ZMod 2 × ZMod 2)) :=
  IsKleinFour.nonempty_mulEquiv

#print axioms card_four
#print axioms exponent_two
#print axioms nonempty_iso

end

end N178Probe
