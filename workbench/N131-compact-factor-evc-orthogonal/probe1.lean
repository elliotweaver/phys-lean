import Phys.Algebra.LorentzContinuumGenerationConversePolar
import Phys.Algebra.LorentzContinuumGenerationConverseEvCOrthogonal

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-! ## PROBE — N131: the compact factor of an arbitrary BvC-isometry is an EvC-orthogonal
     QvC-isometry (the unified core, over a single spectral witness). -/

theorem bvIsomLin_compact_factor_spec {S : Module.End Cut STVC} (hS : IsBvIsomLin S) :
    ∃ (h : Module.End Cut STVC) (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      h.comp S = specOpN c u ∧
      IsEvCAdjoint (S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u))
                   ((specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp h) ∧
      ((specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp h).comp
          (S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) = LinearMap.id ∧
      IsQvIsomC (S.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) := by
  obtain ⟨h, Hadj⟩ := bvIsomLin_has_evCAdjoint hS
  have hg : IsQvIsomC S := bvIsomLin_isQvIsomC hS
  have hinj : Function.Injective S := bvIsomLin_injective hS
  obtain ⟨n, c, u, horth, hcpos, heq, hps_pi, hpi_ps⟩ := comp_specInverse_exists Hadj hinj
  set psqrt := specOpN (fun i => cutSqrt (c i)) u with hpsqrt
  set pinv := specOpN (fun i => (cutSqrt (c i))⁻¹) u with hpinv
  have hpinv_adj : IsEvCAdjoint pinv pinv := specOpN_isEvCSymm _ _
  have hkadj : IsEvCAdjoint (S.comp pinv) (pinv.comp h) := Hadj.comp hpinv_adj
  refine ⟨h, n, c, u, heq, hkadj, ?_, ?_⟩
  · -- EvC-orthogonality: k*∘k = id  (the comp_polar_decomposition collapse)
    have hsq : psqrt.comp psqrt = h.comp S := by
      rw [hpsqrt, specOpN_comp horth, heq]
      congr 1; funext i; rw [cutSqrt_sq (le_of_lt (hcpos i))]
    apply LinearMap.ext; intro v
    simp only [LinearMap.comp_apply, LinearMap.id_coe, id_eq]
    have e1 : h (S (pinv v)) = psqrt (psqrt (pinv v)) := by
      have := congrArg (fun (f : Module.End Cut STVC) => f (pinv v)) hsq
      simp only [LinearMap.comp_apply] at this
      exact this.symm
    rw [e1]
    have e2 : psqrt (pinv v) = v := by
      have := congrArg (fun (f : Module.End Cut STVC) => f v) hps_pi
      simpa only [LinearMap.comp_apply, LinearMap.id_coe, id_eq] using this
    rw [e2]
    have e3 : pinv (psqrt v) = v := by
      have := congrArg (fun (f : Module.End Cut STVC) => f v) hpi_ps
      simpa only [LinearMap.comp_apply, LinearMap.id_coe, id_eq] using this
    rw [e3]
  · -- IsQvIsomC k  (the metric-condition route)
    have hlift : sigOpC.comp (psqrt.comp sigOpC) = pinv := by
      have hroot1 : IsEvCOpSqrt (sigOpC.comp (psqrt.comp sigOpC))
          (specOpN (fun i => (c i)⁻¹) u) := by
        have h1 := linIsom_JsqrtJ_isOpSqrt horth hcpos heq
        rw [linIsom_JpJ_eq_specInv hg Hadj hinj horth heq] at h1
        exact h1
      have hroot2 : IsEvCOpSqrt pinv (specOpN (fun i => (c i)⁻¹) u) :=
        linIsom_posInv_isOpSqrt horth hcpos
      have hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) := by
        have hpinj : Function.Injective (specOpN c u) := by
          rw [← heq]; exact comp_injective_of_adjoint Hadj hinj
        exact specOpN_resolution_of_injective horth hpinj
      have hc_ne : ∀ i, c i ≠ 0 := fun i => ne_of_gt (hcpos i)
      have hqinj : Function.Injective (specOpN (fun i => (c i)⁻¹) u) := by
        have hli : (specOpN c u).comp (specOpN (fun i => (c i)⁻¹) u) = LinearMap.id :=
          specOpN_inverse horth hres hc_ne
        intro x y hxy
        have : (specOpN c u).comp (specOpN (fun i => (c i)⁻¹) u) x
             = (specOpN c u).comp (specOpN (fun i => (c i)⁻¹) u) y := by
          simp only [LinearMap.comp_apply, hxy]
        rwa [hli, LinearMap.id_apply, LinearMap.id_apply] at this
      exact op_sqrt_unique_of_injective hqinj hroot1 hroot2
    apply metric_condition_imp_isQvIsom hkadj
    have hswap : sigOpC.comp pinv = psqrt.comp sigOpC := by
      rw [← hlift, ← LinearMap.comp_assoc, ← LinearMap.comp_assoc, sigOpC_comp_self,
        LinearMap.id_comp]
    have hmc : h.comp (sigOpC.comp S) = sigOpC := linIsom_metric_condition hg Hadj
    calc (pinv.comp h).comp (sigOpC.comp (S.comp pinv))
        = pinv.comp ((h.comp (sigOpC.comp S)).comp pinv) := by
          simp only [LinearMap.comp_assoc]
      _ = pinv.comp (sigOpC.comp pinv) := by rw [hmc]
      _ = pinv.comp (psqrt.comp sigOpC) := by rw [hswap]
      _ = (pinv.comp psqrt).comp sigOpC := by rw [LinearMap.comp_assoc]
      _ = sigOpC := by rw [hpi_ps, LinearMap.id_comp]

end

end Phys.Algebra
