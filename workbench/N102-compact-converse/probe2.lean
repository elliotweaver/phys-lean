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

/-! ### M1 -/
theorem M1_isQvIsom (u : O Cut) (hu : gFormC u u = 1) :
    IsQvIsomC (biMulLin u u) :=
  fun p => biMulFun_isom hu hu p

/-! ### M2 (faithful bridge route) -/
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

/-! ### biMulLin application as biMulFun (definitional, cheap rewrite) -/
theorem biMulLin_apply' (u u' : O Cut) (p : STVC) :
    biMulLin u u' p = (p.1, p.2.1, u * (p.2.2 * u')) := rfl

/-! ### M3a: polarized v-block isometry -/
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

/-! ### M3: EvC-self-adjointness -/
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

end

end Phys.Algebra
