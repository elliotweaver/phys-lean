import Phys.Algebra.LorentzContinuumGenerationConverse
import Phys.Algebra.LorentzContinuumSpin9Reach

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

set_option maxHeartbeats 400000

theorem M1_isQvIsom (u : O Cut) (hu : gFormC u u = 1) :
    IsQvIsomC (biMulLin u u) :=
  fun p => biMulFun_isom hu hu p

theorem M2_involution (u : O Cut) (husq : u * u = -1)
    (hL : ∀ w : O Cut, u * (u * w) = -w) :
    (biMulLin u u).comp (biMulLin u u) = LinearMap.id := by
  apply endToFunEnd_injective
  have h2 : endToFunEnd ((biMulLin u u).comp (biMulLin u u))
      = biMulFun u u ∘ biMulFun u u := by
    rw [show (biMulLin u u).comp (biMulLin u u) = biMulLin u u * biMulLin u u from rfl,
        map_mul, endToFunEnd_biMulLin]
    rfl
  rw [h2, biMulFun_imag_involutive_comp u husq hL]
  rfl

theorem biMulLin_apply' (u u' : O Cut) (p : STVC) :
    biMulLin u u' p = (p.1, p.2.1, u * (p.2.2 * u')) := rfl

theorem M3a_polarized_isom (u : O Cut) (hu : gFormC u u = 1) (v w : O Cut) :
    gFormC (u * (v * u)) (u * (w * u)) = gFormC v w := by
  have hdiag : ∀ z : O Cut, gFormC (u * (z * u)) (u * (z * u)) = gFormC z z := by
    intro z
    rw [biMul_gFormC, hu, mul_one, one_mul]
  have hBadd : u * ((v + w) * u) = u * (v * u) + u * (w * u) := by
    rw [add_mul, mul_add_na]
  have h := hdiag (v + w)
  rw [hBadd] at h
  simp only [gFormC_add_left, gFormC_add_right] at h
  rw [gFormC_symm (u * (w * u)) (u * (v * u)), gFormC_symm w v] at h
  have hv := hdiag v
  have hw := hdiag w
  linarith [h, hv, hw]

theorem M3_self_adjoint (u : O Cut) (hu : gFormC u u = 1) (husq : u * u = -1)
    (hL : ∀ z : O Cut, u * (u * z) = -z) :
    IsEvCAdjoint (biMulLin u u) (biMulLin u u) := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', w⟩ := q
  rw [biMulLin_apply', biMulLin_apply']
  show t * t' + x * x' + gFormC (u * (v * u)) w
      = t * t' + x * x' + gFormC v (u * (w * u))
  have hBinv : u * ((u * (w * u)) * u) = w := biMulFun_imag_sq u husq hL w
  have key : gFormC (u * (v * u)) w = gFormC v (u * (w * u)) := by
    conv_lhs => rw [← hBinv]
    rw [M3a_polarized_isom u hu v (u * (w * u))]
  rw [key]

/-! ### M4: THE CONVERSE CORE — the half-turn's polar compact part IS the half-turn itself. -/
theorem M4_compact_part_eq_self (u : O Cut) (hu : gFormC u u = 1) (husq : u * u = -1)
    (hL : ∀ z : O Cut, u * (u * z) = -z) :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (∀ i j, EvC (uu i) (uu j) = if i = j then 1 else 0) ∧
      (∀ i, 0 < c i) ∧
      (biMulLin u u).comp (biMulLin u u) = specOpN c uu ∧
      (biMulLin u u).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu) = biMulLin u u := by
  set g := biMulLin u u with hg
  have hgisom : IsQvIsomC g := M1_isQvIsom u hu
  have hgadj : IsEvCAdjoint g g := M3_self_adjoint u hu husq hL
  obtain ⟨n, c, uu, horth, hcpos, heq, _⟩ :=
    isometry_compact_part_isQvIsom hgisom hgadj
  refine ⟨n, c, uu, horth, hcpos, heq, ?_⟩
  -- g∘g = id (involution), so specOpN c uu = id
  have hgg_id : g.comp g = LinearMap.id := M2_involution u husq hL
  have hspec_id : specOpN c uu = LinearMap.id := by rw [← heq, hgg_id]
  -- the spectral root and the identity are both positive sqrts of specOpN c uu = id
  have h₁ : IsEvCOpSqrt (specOpN (fun i => cutSqrt (c i)) uu) (specOpN c uu) :=
    specOpN_op_sqrt (fun i => (hcpos i).le) horth
  have h_id : IsEvCOpSqrt (LinearMap.id : Module.End Cut STVC) (specOpN c uu) := by
    refine ⟨lid_isEvCSymm, ?_, ?_⟩
    · intro p; rw [LinearMap.id_apply]; exact EvC_nonneg p
    · rw [hspec_id]; rfl
  have hqinj : Function.Injective (specOpN c uu) := by
    rw [hspec_id]; exact fun x y h => h
  have hsqrt_eq : specOpN (fun i => cutSqrt (c i)) uu = LinearMap.id :=
    op_sqrt_unique_of_injective hqinj h₁ h_id
  -- so (p^{1/2})⁻¹ = id, hence k = g∘id = g
  have hres : (∑ i, projC (uu i)) = (LinearMap.id : Module.End Cut STVC) :=
    specOpN_resolution_of_injective horth hqinj
  have hsq_ne : ∀ i, cutSqrt (c i) ≠ 0 := fun i => ne_of_gt (cutSqrt_pos (hcpos i))
  have hinv : (specOpN (fun i => cutSqrt (c i)) uu).comp
      (specOpN (fun i => (cutSqrt (c i))⁻¹) uu) = LinearMap.id :=
    specOpN_inverse horth hres hsq_ne
  rw [hsqrt_eq, LinearMap.id_comp] at hinv
  rw [hinv, LinearMap.comp_id]

end

end Phys.Algebra
