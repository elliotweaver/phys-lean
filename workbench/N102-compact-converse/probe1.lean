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

/-! ### M1: the half-turn `biMulLin u u` is a QvC-isometry (linear-operator level). -/
theorem M1_isQvIsom (u : O Cut) (hu : gFormC u u = 1) :
    IsQvIsomC (biMulLin u u) :=
  fun p => biMulFun_isom hu hu p

/-! ### M2: the half-turn is an involution at the linear (Module.End) level: g∘g = id.
    Reframed through the FAITHFUL bridge (no coordinate unfolding — the W9-avoiding route):
    `endToFunEnd (g.comp g) = biMulFun u u ∘ biMulFun u u = id = endToFunEnd 1`, then injectivity. -/
theorem M2_involution (u : O Cut) (husq : u * u = -1)
    (hL : ∀ w : O Cut, u * (u * w) = -w) :
    (biMulLin u u).comp (biMulLin u u) = LinearMap.id := by
  apply endToFunEnd_injective
  rw [map_mul, map_one, endToFunEnd_biMulLin]
  exact biMulFun_imag_involutive_comp u husq hL

/-! ### M3: EvC-self-adjointness via polarized isometry + involution.
    First the polarized v-block isometry `gFormC (u·(v·u)) (u·(w·u)) = gFormC v w`. -/
theorem M3a_polarized_isom (u : O Cut) (hu : gFormC u u = 1) (v w : O Cut) :
    gFormC (u * (v * u)) (u * (w * u)) = gFormC v w := by
  -- diagonal: gFormC (u·(z·u)) (u·(z·u)) = gFormC z z
  have hdiag : ∀ z : O Cut, gFormC (u * (z * u)) (u * (z * u)) = gFormC z z := by
    intro z
    rw [biMul_gFormC, hu, mul_one, one_mul]
  -- B is additive
  have hBadd : u * ((v + w) * u) = u * (v * u) + u * (w * u) := by
    rw [add_mul, mul_add_na]
  have h := hdiag (v + w)
  rw [hBadd] at h
  simp only [gFormC_add_left, gFormC_add_right] at h
  rw [gFormC_symm (u * (w * u)) (u * (v * u)), gFormC_symm w v] at h
  have hv := hdiag v
  have hw := hdiag w
  linarith [h, hv, hw]

/-! ### M3: EvC-self-adjointness of `biMulLin u u`. -/
theorem M3_self_adjoint (u : O Cut) (hu : gFormC u u = 1) (husq : u * u = -1)
    (hL : ∀ z : O Cut, u * (u * z) = -z) :
    IsEvCAdjoint (biMulLin u u) (biMulLin u u) := by
  intro p q
  obtain ⟨t, x, v⟩ := p; obtain ⟨t', x', w⟩ := q
  show t * t' + x * x' + gFormC (u * (v * u)) w
      = t * t' + x * x' + gFormC v (u * (w * u))
  -- involution on the v-block: B (B w) = w
  have hBinv : u * ((u * (w * u)) * u) = w := biMulFun_imag_sq u husq hL w
  -- rewrite w as B (B w), then apply polarized isometry
  have key : gFormC (u * (v * u)) w = gFormC v (u * (w * u)) := by
    conv_lhs => rw [← hBinv]
    rw [M3a_polarized_isom u hu v (u * (w * u))]
  rw [key]

/-! ### M4: the full assembly — the compact part of the half-turn is the half-turn itself. -/
theorem M4_compact_part_eq_self (u : O Cut) (hu : gFormC u u = 1) (husq : u * u = -1)
    (hL : ∀ z : O Cut, u * (u * z) = -z) :
    ∃ (n : ℕ) (c : Fin n → Cut) (uu : Fin n → STVC),
      (∀ i, 0 < c i) ∧
      (biMulLin u u).comp (specOpN (fun i => (cutSqrt (c i))⁻¹) uu) = biMulLin u u := by
  have hg : IsQvIsomC (biMulLin u u) := by
    intro p
    have := biMulFun_isom hu hu p
    simpa [endToFunEnd_biMulLin] using this
  sorry

end

end Phys.Algebra
