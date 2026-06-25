import Phys.Algebra.DerivationIrreducible
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

theorem selfconj_eq_smul {y : O ℚ} (h : star y = y) : y = (reQ y) • (1 : O ℚ) := by
  have ht := trace_id y
  rw [h] at ht
  have h2 : (2 : ℚ) • y = (2 * reQ y) • (1 : O ℚ) := by rw [two_smul]; exact ht
  have hc := congrArg (fun z => (2⁻¹ : ℚ) • z) h2
  simp only [smul_smul] at hc
  rw [show (2⁻¹ : ℚ) * 2 = 1 by norm_num, one_smul,
      show (2⁻¹ : ℚ) * (2 * reQ y) = reQ y by ring] at hc
  exact hc

theorem selfMul_eq_smul (x : O ℚ) : x * star x = (gForm x x) • (1 : O ℚ) := by
  have := selfconj_eq_smul (selfMul_selfconj x); rw [this]; rfl

theorem octo_quadratic (x : O ℚ) :
    x * x = (2 * reQ x) • x - (gForm x x) • (1 : O ℚ) := by
  have hst : star x = (2 * reQ x) • (1 : O ℚ) - x := by
    have ht := trace_id x; linear_combination (norm := abel) ht
  have hsm : x * star x = (gForm x x) • (1 : O ℚ) := selfMul_eq_smul x
  rw [hst, mul_sub, qsmul_mul_right, mul_one] at hsm
  linear_combination (norm := abel) -hsm

@[simp] theorem reQ_one : reQ (1 : O ℚ) = 1 := by simp [reQ]

def IsAlgAut (φ : O ℚ ≃ₗ[ℚ] O ℚ) : Prop :=
  (∀ x y, φ (x * y) = φ x * φ y) ∧ φ 1 = 1

theorem aut_quad_diff {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) (x : O ℚ) :
    (2 * (reQ x - reQ (φ x))) • (φ x)
      = (gForm x x - gForm (φ x) (φ x)) • (1 : O ℚ) := by
  obtain ⟨hmul, hone⟩ := h
  have hL : φ (x * x) = φ x * φ x := hmul x x
  have hQ := octo_quadratic x
  have hφQ : φ (x * x) = (2 * reQ x) • (φ x) - (gForm x x) • (1 : O ℚ) := by
    rw [hQ]; simp [map_sub, map_smul, hone]
  have hQ' := octo_quadratic (φ x)
  rw [hL, hQ'] at hφQ
  linear_combination (norm := module) -hφQ

-- φ maps scalars to scalars and (with φ1=1) fixes them
theorem aut_smul_one {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) (c : ℚ) :
    φ (c • (1 : O ℚ)) = c • (1 : O ℚ) := by
  rw [map_smul, h.2]

-- ★ S2: reQ preservation
theorem aut_reQ {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) (x : O ℚ) :
    reQ (φ x) = reQ x := by
  set a : ℚ := 2 * (reQ x - reQ (φ x)) with ha
  have hkey := aut_quad_diff h x      -- a • φx = (gForm x x - gForm φx φx) • 1
  -- apply reQ to both sides
  have hreQ : a * reQ (φ x) = (gForm x x - gForm (φ x) (φ x)) := by
    have := congrArg reQ hkey
    rw [reQ_smul, reQ_smul, reQ_one, mul_one] at this
    exact this
  -- substitute b := a * reQ(φx): a • φx = (a * reQ φx) • 1  ⟹ a • (φx - reQ(φx)•1) = 0
  rw [← hreQ] at hkey
  have hzero : a • ((φ x) - reQ (φ x) • (1 : O ℚ)) = 0 := by
    rw [smul_sub, hkey, smul_smul, sub_self]
  rcases smul_eq_zero.mp hzero with ha0 | hw0
  · -- a = 0 ⟹ reQ x = reQ φx
    have : reQ x - reQ (φ x) = 0 := by
      have : (2 : ℚ) * (reQ x - reQ (φ x)) = 0 := ha0
      linarith [this]
    linarith [this]
  · -- φx - reQ(φx)•1 = 0 ⟹ φx is a scalar ⟹ x is a scalar ⟹ reQ preserved
    have hφscalar : φ x = reQ (φ x) • (1 : O ℚ) := by
      rw [sub_eq_zero] at hw0; exact hw0
    -- x = φ⁻¹ (reQ(φx)•1) = reQ(φx)•1
    have hxscalar : x = reQ (φ x) • (1 : O ℚ) := by
      have hsymm : φ.symm (reQ (φ x) • (1 : O ℚ)) = reQ (φ x) • (1 : O ℚ) := by
        apply φ.injective
        rw [φ.apply_symm_apply, aut_smul_one h]
      have h1 : φ.symm (φ x) = φ.symm (reQ (φ x) • (1 : O ℚ)) := congrArg φ.symm hφscalar
      rw [φ.symm_apply_apply, hsymm] at h1
      exact h1
    -- reQ x = reQ (reQ(φx)•1) = reQ(φx)
    have hr := congrArg reQ hxscalar
    rw [reQ_smul, reQ_one, mul_one] at hr
    exact hr.symm

end
end Phys.Algebra
