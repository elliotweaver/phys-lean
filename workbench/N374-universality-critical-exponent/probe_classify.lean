import Mathlib.Tactic
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Data.Matrix.Basic

open scoped BigOperators
open Matrix

noncomputable section

variable {N : ℕ}

/-- all-ones matrix -/
def Jall (N : ℕ) : Matrix (Fin N) (Fin N) ℚ := fun _ _ => 1

/-- J*J = N • J -/
theorem Jall_mul_Jall (N : ℕ) : (Jall N) * (Jall N) = (N : ℚ) • Jall N := by
  ext i j
  simp only [Matrix.mul_apply, Jall, mul_one, Finset.sum_const, Finset.card_univ,
    Fintype.card_fin, nsmul_eq_mul, Matrix.smul_apply, smul_eq_mul, mul_one]

/-- 1 * Jall = Jall -/
theorem one_mul_Jall (N : ℕ) : (1 : Matrix (Fin N) (Fin N) ℚ) * Jall N = Jall N := one_mul _
theorem Jall_mul_one (N : ℕ) : Jall N * (1 : Matrix (Fin N) (Fin N) ℚ) = Jall N := mul_one _

/-- The candidate operator c•1 + e•J. -/
def cand (c e : ℚ) (N : ℕ) : Matrix (Fin N) (Fin N) ℚ := c • (1 : Matrix (Fin N) (Fin N) ℚ) + e • Jall N

/-- idempotent expansion -/
theorem cand_sq (c e : ℚ) (N : ℕ) :
    (cand c e N) * (cand c e N) = (c^2) • (1 : Matrix (Fin N) (Fin N) ℚ) + (2*c*e + e^2 * N) • Jall N := by
  unfold cand
  rw [Matrix.add_mul, Matrix.mul_add, Matrix.mul_add]
  rw [Matrix.smul_mul, Matrix.smul_mul, Matrix.mul_smul, Matrix.mul_smul]
  rw [one_mul, one_mul_Jall, Jall_mul_one, Jall_mul_Jall]
  -- now combine
  rw [smul_smul, smul_smul, smul_smul, smul_smul]
  -- collect: c*c•1 + c*e•J + e*c•J + e*(N•J)... need to fold N•J
  simp only [smul_smul]
  ext i j
  simp only [Matrix.add_apply, Matrix.smul_apply, Matrix.one_apply, smul_eq_mul]
  by_cases h : i = j
  · subst h; simp [Jall]; ring
  · simp [Jall, h]; ring

/-- 1 and Jall are linearly independent for N ≥ 2: extract coeffs. -/
theorem coeff_extract (c e c' e' : ℚ) (N : ℕ) (hN : 2 ≤ N)
    (h : cand c e N = cand c' e' N) : c = c' ∧ e = e' := by
  unfold cand at h
  have hdiag := congrFun (congrFun h ⟨0, by omega⟩) ⟨0, by omega⟩
  have hoff := congrFun (congrFun h ⟨0, by omega⟩) ⟨1, by omega⟩
  simp only [Matrix.add_apply, Matrix.smul_apply, Matrix.one_apply, Jall, smul_eq_mul] at hdiag hoff
  norm_num at hdiag hoff
  -- hoff : e = e', hdiag : c + e = c' + e'
  refine ⟨?_, hoff⟩
  linarith [hdiag, hoff]

end
