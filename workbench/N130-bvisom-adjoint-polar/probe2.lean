import Phys.Algebra.LorentzContinuumGenerationBoostRotationSplit
import Phys.Algebra.LorentzContinuumReverseSurj

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

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

theorem probe_bvIsomLin_isQvIsomC {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    IsQvIsomC S := by
  intro p
  show QvC (S p) = QvC p
  rw [← BvC_self, ← BvC_self, hS p p]

theorem probe_evC_eq_bvC_sigOpC (p q : STVC) : EvC p q = BvC p (sigOpC q) := by
  rw [BvC_eq_EvC_sigOpC, ← LinearMap.comp_apply, sigOpC_comp_self, LinearMap.id_apply]

theorem probe_bvIsomLin_inverse {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ Sinv : Module.End Cut STVC, S.comp Sinv = LinearMap.id ∧ Sinv.comp S = LinearMap.id := by
  have hinj : Function.Injective S := probe_bvIsomLin_injective hS
  have hbij : Function.Bijective S := ⟨hinj, LinearMap.injective_iff_surjective.mp hinj⟩
  have hunit : IsUnit S := (Module.End.isUnit_iff S).mpr hbij
  obtain ⟨u, hu⟩ := hunit
  exact ⟨u.inv, by rw [← hu]; exact u.val_inv, by rw [← hu]; exact u.inv_val⟩

-- STEP 4: THE JOINT — the EvC-adjoint of an arbitrary BvC-isometry.
theorem probe_bvIsomLin_has_evCAdjoint {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ h : Module.End Cut STVC, IsEvCAdjoint S h := by
  obtain ⟨Sinv, hSi, hiS⟩ := probe_bvIsomLin_inverse hS
  refine ⟨sigOpC.comp (Sinv.comp sigOpC), ?_⟩
  intro p q
  have hSr : S (Sinv (sigOpC q)) = sigOpC q := by
    have := congrArg (fun (f : Module.End Cut STVC) => f (sigOpC q)) hSi
    simpa only [LinearMap.comp_apply, LinearMap.id_apply] using this
  calc EvC (S p) q
      = BvC (S p) (sigOpC q) := probe_evC_eq_bvC_sigOpC (S p) q
    _ = BvC (S p) (S (Sinv (sigOpC q))) := by rw [hSr]
    _ = BvC p (Sinv (sigOpC q)) := hS p (Sinv (sigOpC q))
    _ = EvC p (sigOpC (Sinv (sigOpC q))) := BvC_eq_EvC_sigOpC p (Sinv (sigOpC q))
    _ = EvC p ((sigOpC.comp (Sinv.comp sigOpC)) q) := by simp only [LinearMap.comp_apply]

-- STEP 5: feed N97 — the polar path decomposition of an arbitrary BvC-isometry.
theorem probe_bvIsomLin_polar_path_decomp {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ (h : Module.End Cut STVC) (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC)
      (γ : Cut → Module.End Cut STVC),
      h.comp S = specOpN c u ∧
      γ = specPathOp c u ∧
      γ 0 = (LinearMap.id : Module.End Cut STVC) ∧
      IsEvCOpSqrt (γ 1) (specOpN c u) ∧
      (∀ t, IsEvCSymm (γ t)) ∧
      (∀ t, 0 ≤ t → t ≤ 1 → ∀ p, 0 ≤ EvC (γ t p) p) ∧
      IsQvIsomC (S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) ∧
      (S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp (γ 1) = S := by
  obtain ⟨h, Hadj⟩ := probe_bvIsomLin_has_evCAdjoint hS
  obtain ⟨n, c, u, γ, h1, h2, h3, h4, h5, h6, h7, h8⟩ :=
    isometry_polar_path_decomp (probe_bvIsomLin_isQvIsomC hS) Hadj
  exact ⟨h, n, c, u, γ, h1, h2, h3, h4, h5, h6, h7, h8⟩

end

end Phys.Algebra
