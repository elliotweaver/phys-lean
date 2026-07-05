import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

/-! N300 PROBE N — diagonal idempotents E_ii, perm-equality, sum = 1, phi(1)=2·finrank. -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- E i := the i-th diagonal idempotent as a member of hermSub
noncomputable def Eidem (i : Fin 3) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.diagonal (fun k => if k = i then 1 else 0)

theorem Eidem_herm (i : Fin 3) : (Eidem i)ᴴ = Eidem i := by
  unfold Eidem
  rw [Matrix.diagonal_conjTranspose]
  congr 1; funext k; by_cases h : k = i <;> simp [h, star]

-- sum of E_ii = 1
theorem sum_Eidem : Eidem 0 + Eidem 1 + Eidem 2 = 1 := by
  unfold Eidem
  apply Matrix.ext; intro i j
  simp only [Matrix.add_apply, Matrix.diagonal_apply, Matrix.one_apply]
  fin_cases i <;> fin_cases j <;> simp

-- pconj σ (Eidem i) = Eidem (σ⁻¹ i)  (submatrix of a diagonal)
theorem pconj_Eidem (σ : Equiv.Perm (Fin 3)) (i : Fin 3) :
    (Eidem i).submatrix σ σ = Eidem (σ.symm i) := by
  unfold Eidem
  rw [Matrix.submatrix_diagonal_equiv]
  congr 1; funext k
  simp only [Function.comp_apply]
  by_cases h : σ k = i
  · rw [if_pos h, if_pos (by rw [← h, Equiv.symm_apply_apply])]
  · rw [if_neg h, if_neg (by intro hc; apply h; rw [← hc, Equiv.apply_symm_apply])]

#print axioms pconj_Eidem
end Phys.Algebra.HJ
