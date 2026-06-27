import Phys.Algebra.LorentzContinuumIsomCompact
import Phys.Algebra.LorentzContinuumSpectralPath

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

variable {g h : Module.End Cut STVC}

theorem isometry_polar_path_decomp (hg : IsQvIsomC g) (H : IsEvCAdjoint g h) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC) (γ : Cut → Module.End Cut STVC),
      h.comp g = specOpN c u ∧
      γ = specPathOp c u ∧
      γ 0 = (LinearMap.id : Module.End Cut STVC) ∧
      IsEvCOpSqrt (γ 1) (specOpN c u) ∧
      (∀ t, IsEvCSymm (γ t)) ∧
      (∀ t, 0 ≤ t → t ≤ 1 → ∀ p, 0 ≤ EvC (γ t p) p) ∧
      IsQvIsomC (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) ∧
      (g.comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp (γ 1) = g := by
  obtain ⟨n, c, u, horth, hcpos, heq, hk⟩ := isometry_compact_part_isQvIsom hg H
  -- the eigen-family resolves the identity (injectivity of the positive part p = g*g)
  have hinj : Function.Injective (specOpN c u) := by
    rw [← heq]; exact comp_injective_of_adjoint H (linIsom_injective hg H)
  have hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) :=
    specOpN_resolution_of_injective horth hinj
  -- p^{1/2}⁻¹ ∘ p^{1/2} = id  (the reconstruction lever)
  have hsq_ne : ∀ i, cutSqrt (c i) ≠ 0 := fun i => ne_of_gt (cutSqrt_pos (hcpos i))
  have hpi_ps :
      (specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp (specOpN (fun i => cutSqrt (c i)) u)
        = (LinearMap.id : Module.End Cut STVC) :=
    specOpN_inverse_right horth hres hsq_ne
  refine ⟨n, c, u, specPathOp c u, heq, rfl, specPathOp_zero hres, ?_,
    specPathOp_isEvCSymm c u, ?_, hk, ?_⟩
  · -- γ 1 = p^{1/2} is the positive operator square root of p = specOpN c u
    rw [specPathOp_one]; exact specOpN_op_sqrt (fun i => (hcpos i).le) horth
  · -- cone-positive along the path
    intro t ht0 ht1 p; exact specPathOp_nonneg u ht0 ht1 p
  · -- THE POLAR RECONSTRUCTION g = k ∘ γ1
    rw [specPathOp_one, LinearMap.comp_assoc, hpi_ps, LinearMap.comp_id]

/-- non-vacuity: the concrete boost realises the packaged decomposition. -/
theorem boost_polar_path_decomp {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC) (γ : Cut → Module.End Cut STVC),
      (boostEndC a b).comp (boostEndC a b) = specOpN c u ∧
      γ = specPathOp c u ∧
      γ 0 = (LinearMap.id : Module.End Cut STVC) ∧
      IsEvCOpSqrt (γ 1) (specOpN c u) ∧
      (∀ t, IsEvCSymm (γ t)) ∧
      (∀ t, 0 ≤ t → t ≤ 1 → ∀ p, 0 ≤ EvC (γ t p) p) ∧
      IsQvIsomC ((boostEndC a b).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)) ∧
      ((boostEndC a b).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp (γ 1) = boostEndC a b :=
  isometry_polar_path_decomp (boostEndC_isQvIsomC hab) (boostEndC_isEvCAdjoint_self a b)

/-- the reconstructed operator `k∘γ1` read at the pure-time vector has space coordinate `4/3`. -/
theorem boost_polar_recon_coord
    {n : ℕ} (c : Fin n → Cut) (u : Fin n → STVC)
    (hrecon : ((boostEndC ((5 : Cut)/3) ((4 : Cut)/3)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp (specPathOp c u 1)
          = boostEndC ((5 : Cut)/3) ((4 : Cut)/3)) :
    (((boostEndC ((5 : Cut)/3) ((4 : Cut)/3)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp (specPathOp c u 1)
          ((1 : Cut), (0 : Cut), (0 : O Cut))).2.1 = 4/3 := by
  rw [hrecon, boostEndC_apply]
  norm_num

end

end Phys.Algebra
