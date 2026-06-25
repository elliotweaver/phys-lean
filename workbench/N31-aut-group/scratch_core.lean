import Phys.Algebra.DerivationIrreducible
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- banked-here (proved in scratch_quad)
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

-- reQ 1 = 1
@[simp] theorem reQ_one : reQ (1 : O ℚ) = 1 := by simp [reQ]

/-- The ℚ-linear unital ring-automorphism predicate on a ℚ-linear equiv of `O ℚ`. -/
def IsAlgAut (φ : O ℚ ≃ₗ[ℚ] O ℚ) : Prop :=
  (∀ x y, φ (x * y) = φ x * φ y) ∧ φ 1 = 1

-- φ preserves the quadratic structure. The key identity, post-φ:
-- (2(reQ x - reQ φx)) • φx = (gForm x x - gForm φx φx) • 1
theorem aut_quad_diff {φ : O ℚ ≃ₗ[ℚ] O ℚ} (h : IsAlgAut φ) (x : O ℚ) :
    (2 * (reQ x - reQ (φ x))) • (φ x)
      = (gForm x x - gForm (φ x) (φ x)) • (1 : O ℚ) := by
  obtain ⟨hmul, hone⟩ := h
  -- apply φ to octo_quadratic x:
  have hL : φ (x * x) = φ x * φ x := hmul x x
  have hQ := octo_quadratic x          -- x*x = (2 reQ x)•x - (gForm x x)•1
  have hφQ : φ (x * x) = (2 * reQ x) • (φ x) - (gForm x x) • (1 : O ℚ) := by
    rw [hQ]; simp [map_sub, map_smul, hone]
  -- quadratic at φx:
  have hQ' := octo_quadratic (φ x)     -- φx*φx = (2 reQ φx)•φx - (gForm φx φx)•1
  -- combine: (2 reQ x)•φx - (gForm x x)•1 = (2 reQ φx)•φx - (gForm φx φx)•1
  rw [hL, hQ'] at hφQ
  -- rearrange
  linear_combination (norm := module) -hφQ

end
end Phys.Algebra
