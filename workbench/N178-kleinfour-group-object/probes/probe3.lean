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

-- EXPONENT = 2
theorem exponent_two : Monoid.exponent ↥kleinFour = 2 := by
  have hdvd : Monoid.exponent ↥kleinFour ∣ 2 := by
    apply Monoid.exponent_dvd_of_forall_pow_eq_one
    intro g
    apply Subtype.ext
    rw [pow_two]
    exact kleinFour_elem_involution g.1 g.2
  rcases (Nat.dvd_prime Nat.prime_two).mp hdvd with h1 | h2
  · -- exponent = 1 is impossible: octTopNeg subgroup element would be the identity
    exfalso
    have hg : (⟨octTopNeg, top_mem'⟩ : ↥kleinFour) ^ Monoid.exponent ↥kleinFour = 1 :=
      Monoid.pow_exponent_eq_one _
    rw [h1, pow_one] at hg
    have : octTopNeg = (1 : O Cut ≃ₗ[Cut] O Cut) := congrArg Subtype.val hg
    exact one_ne_top this.symm
  · exact h2

end

end N178Probe
