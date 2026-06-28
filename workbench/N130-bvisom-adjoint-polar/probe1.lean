import Phys.Algebra.LorentzContinuumGenerationBoostRotationSplit
import Phys.Algebra.LorentzContinuumReverseSurj

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- STEP 1: injectivity from BvC nondegeneracy (no adjoint needed).
theorem probe_bvIsomLin_injective {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    Function.Injective S := by
  intro p q hpq
  have hd : S (p - q) = 0 := by rw [map_sub, hpq, sub_self]
  have : p - q = 0 := by
    apply bvC_right_nondeg
    intro r
    have := hS (p - q) r
    rw [hd, BvC_zero_left] at this
    exact this.symm
  exact sub_eq_zero.mp this

-- STEP 2: QvC-isometry from BvC-isometry via BvC_self.
theorem probe_bvIsomLin_isQvIsomC {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    IsQvIsomC S := by
  intro p
  show QvC (S p) = QvC p
  rw [← BvC_self, ← BvC_self, hS p p]

-- helper: EvC p q = BvC p (sigOpC q)
theorem probe_evC_eq_bvC_sigOpC (p q : STVC) : EvC p q = BvC p (sigOpC q) := by
  rw [BvC_eq_EvC_sigOpC, ← LinearMap.comp_apply, sigOpC_comp_self, LinearMap.id_apply]

-- STEP 3: the inverse as a Module.End (bijective in finite dim).
theorem probe_bvIsomLin_inverse {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ Sinv : Module.End Cut STVC, S.comp Sinv = LinearMap.id ∧ Sinv.comp S = LinearMap.id := by
  have hinj : Function.Injective S := probe_bvIsomLin_injective hS
  have hbij : Function.Bijective S := ⟨hinj, LinearMap.injective_iff_surjective.mp hinj⟩
  have hunit : IsUnit S := (Module.End.isUnit_iff S).mpr hbij
  obtain ⟨u, hu⟩ := hunit
  refine ⟨u.inv, ?_, ?_⟩
  · have := u.val_inv
    rw [hu] at this
    exact this
  · have := u.inv_val
    rw [hu] at this
    exact this

end

end Phys.Algebra
