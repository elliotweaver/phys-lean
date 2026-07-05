import Phys.Algebra.ScaleTowerOneObject
import Mathlib.Tactic

namespace Phys.Algebra.Probe335

open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open Matrix

noncomputable section

/-- Family-blind heavy scale ∝ id. -/
def heavyMajorana (M : Cut) : Matrix (Fin 3) (Fin 3) Cut := M • 1

/-- Commutes with every family rotation U. -/
theorem heavyMajorana_family_blind (M : Cut) (U : Matrix (Fin 3) (Fin 3) Cut) :
    U * heavyMajorana M = heavyMajorana M * U := by
  unfold heavyMajorana
  rw [Matrix.mul_smul, Matrix.smul_mul, mul_one, one_mul]

/-- Scalar seesaw inverse. -/
theorem heavyMajorana_scalar_inv (M : Cut) (hM : M ≠ 0) :
    heavyMajorana M * (M⁻¹ • (1 : Matrix (Fin 3) (Fin 3) Cut)) = 1 := by
  unfold heavyMajorana
  rw [Matrix.smul_mul, Matrix.mul_smul, mul_one, smul_smul, mul_inv_cancel₀ hM, one_smul]

/-- Born self-overlap of the Dirac coupling. -/
def diracSelfOverlap (D : Matrix (Fin 3) (Fin 3) Cut) : Cut := Matrix.trace (D * Dᵀ)

/-- = sum of squares (Born = self-overlap). -/
theorem diracSelfOverlap_eq_sum_sq (D : Matrix (Fin 3) (Fin 3) Cut) :
    diracSelfOverlap D = (D 0 0)^2 + (D 0 1)^2 + (D 0 2)^2
      + (D 1 0)^2 + (D 1 1)^2 + (D 1 2)^2
      + (D 2 0)^2 + (D 2 1)^2 + (D 2 2)^2 := by
  unfold diracSelfOverlap
  simp only [Matrix.trace, Matrix.diag_apply, Matrix.mul_apply, Matrix.transpose_apply,
    Fin.sum_univ_three]
  ring

/-- Born positivity. -/
theorem diracSelfOverlap_nonneg (D : Matrix (Fin 3) (Fin 3) Cut) :
    0 ≤ diracSelfOverlap D := by
  rw [diracSelfOverlap_eq_sum_sq]
  positivity

/-- Σm_ν = trace of the light seesaw operator M⁻¹·(D Dᵀ). -/
def neutrinoMassSum (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) : Cut :=
  Matrix.trace ((M⁻¹) • (D * Dᵀ))

/-- ★ the sum rides the ONE scale M. -/
theorem neutrinoMassSum_eq (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) :
    neutrinoMassSum D M = diracSelfOverlap D / M := by
  unfold neutrinoMassSum diracSelfOverlap
  rw [Matrix.trace_smul]
  simp [smul_eq_mul, div_eq_inv_mul]

/-- non-vacuity certificate: three generations. -/
theorem diracSelfOverlap_one : diracSelfOverlap (1 : Matrix (Fin 3) (Fin 3) Cut) = 3 := by
  rw [diracSelfOverlap_eq_sum_sq]
  simp [Matrix.one_apply]
  norm_num

end
end Phys.Algebra.Probe335
