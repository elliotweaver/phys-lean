import Phys.Algebra.LorentzContinuumResolutionId

namespace Phys.Algebra.ProbeN88b

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

variable {g h : Module.End Cut STVC}

-- helper: injective idempotent endomorphism = id
theorem injective_idem_eq_id (P : Module.End Cut STVC)
    (hidem : P.comp P = P) (hinj : Function.Injective P) :
    P = LinearMap.id := by
  apply LinearMap.ext
  intro v
  have h1 : P (P v) = P v := by
    have := congrArg (fun (f : Module.End Cut STVC) => f v) hidem
    simpa [LinearMap.comp_apply] using this
  simpa using hinj h1

-- bring forward the resolution lemma (proved in probeN88a)
theorem specOpN_resolution_of_injective {n : ℕ} {c : Fin n → Cut} {u : Fin n → STVC}
    (horth : ∀ i j, EvC (u i) (u j) = if i = j then 1 else 0)
    (hinj : Function.Injective (specOpN c u)) :
    (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) := by
  rw [← specOpN_one_eq_sum_projC u]
  have hidem : (specOpN (fun _ => (1:Cut)) u).comp (specOpN (fun _ => (1:Cut)) u)
      = specOpN (fun _ => (1:Cut)) u := by
    rw [specOpN_comp horth]; congr 1; funext i; ring
  apply injective_idem_eq_id _ hidem
  rw [injective_iff_map_eq_zero]
  intro v hv
  refine hinj ?_
  rw [map_zero]
  have hzero : ∀ k, EvC (u k) v = 0 := by
    intro k
    have hread := specOpN_EvC_read (l := fun _ => (1:Cut)) horth v k
    rw [hv] at hread
    rw [EvC_symm (u k) 0, EvC_zero_left, one_mul] at hread
    exact hread.symm
  rw [specOpN_apply]
  apply Finset.sum_eq_zero
  intro k _
  rw [hzero k, mul_zero, zero_smul]

-- (E) IsEvCAdjoint g h + g injective ⟹ h∘g injective
theorem comp_injective_of_adjoint (H : IsEvCAdjoint g h) (hg : Function.Injective g) :
    Function.Injective (h.comp g) := by
  rw [injective_iff_map_eq_zero]
  intro v hv
  -- EvC ((h∘g) v) v = EvC (g v) (g v) = 0 ⟹ g v = 0 ⟹ v = 0
  have hpos : EvC (g v) (g v) = 0 := by
    have := congrArg (fun w => EvC w v) hv
    simp only [LinearMap.zero_apply] at this
    rw [EvC_zero_left] at this
    rw [LinearMap.comp_apply, H.symm (g v) v] at this
    exact this
  have hgv : g v = 0 := (EvC_eq_zero_iff (g v)).mp hpos
  have : v = 0 := hg (by rw [hgv, map_zero])
  exact this

-- (F) ★★ THE PAYOFF: the concrete (p^{1/2})⁻¹ for the g*g-family of an injective g
theorem comp_specInverse_exists (H : IsEvCAdjoint g h) (hg : Function.Injective g) :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      h.comp g = specOpN c u ∧
      (specOpN (fun i => cutSqrt (c i)) u).comp
          (specOpN (fun i => (cutSqrt (c i))⁻¹) u) = LinearMap.id ∧
      (specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp
          (specOpN (fun i => cutSqrt (c i)) u) = LinearMap.id := by
  obtain ⟨n, c, u, horth, hc, heq⟩ := comp_specExists_nonneg H
  -- g*g injective
  have hinj : Function.Injective (specOpN c u) := by
    rw [← heq]; exact comp_injective_of_adjoint H hg
  -- strict eigenvalue positivity (positive-semidefinite + injective)
  have hpos : ∀ p, 0 ≤ EvC (specOpN c u p) p := by
    intro p; rw [← heq]; exact H.comp_nonneg p
  have hcpos : ∀ i, 0 < c i := fun i => specExists_eigen_pos horth hpos hinj i
  -- the family resolves the identity (the spanning lemma)
  have hres : (∑ i, projC (u i)) = (LinearMap.id : Module.End Cut STVC) :=
    specOpN_resolution_of_injective horth hinj
  -- the sqrt eigenvalues are nonzero
  have hsq : ∀ i, cutSqrt (c i) ≠ 0 := fun i => ne_of_gt (cutSqrt_pos (hcpos i))
  refine ⟨n, c, u, horth, hcpos, heq, ?_, ?_⟩
  · exact specOpN_inverse horth hres hsq
  · exact specOpN_inverse_right horth hres hsq

-- (G) non-vacuity: a CONCRETE injective operator producing a genuine inverse.
-- The scaled-identity operator (3 • id) is injective and self-adjoint; its g*g has a
-- concrete two-sided sqrt inverse. We use the identity operator itself as g (injective, self-adj).
theorem id_comp_specInverse_exists :
    ∃ (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      (∀ i j, EvC (u i) (u j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      (LinearMap.id : Module.End Cut STVC).comp LinearMap.id = specOpN c u ∧
      (specOpN (fun i => cutSqrt (c i)) u).comp
          (specOpN (fun i => (cutSqrt (c i))⁻¹) u) = LinearMap.id ∧
      (specOpN (fun i => (cutSqrt (c i))⁻¹) u).comp
          (specOpN (fun i => cutSqrt (c i)) u) = LinearMap.id :=
  comp_specInverse_exists (g := LinearMap.id) (h := LinearMap.id)
    (fun p q => rfl) Function.injective_id

end

end Phys.Algebra.ProbeN88b
