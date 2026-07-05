import Mathlib.Tactic
import Mathlib.Data.Matrix.Basic
import Mathlib.LinearAlgebra.Matrix.Trace

/-! Probe N305b — de-risk the Born weight split of the self-blind seeing operator over ℚ.
    seeMat = J − I on Fin 3 (all-ones minus identity): diagonal 0 (self-blind), ℤ₃-symmetric.
    Spectral projectors Pdem = (1/3)J (rank 1, Unity), Poth = I − (1/3)J (rank 2, others).
    The self-seen "other" fraction T = tr(Poth)/3 = 2/3 falls out of self-blindness (tr seeMat = 0). -/

namespace Phys.Probe305b
open Matrix

abbrev M := Matrix (Fin 3) (Fin 3) ℚ

def Jall : M := Matrix.of (fun _ _ => 1)
def seeMat : M := Jall - 1
def Pdem : M := (1/3 : ℚ) • Jall
def Poth : M := 1 - (1/3 : ℚ) • Jall

-- self-blindness: diagonal zero
theorem see_diag_zero (i : Fin 3) : seeMat i i = 0 := by
  fin_cases i <;> simp [seeMat, Jall, Matrix.one_apply, Matrix.sub_apply]

-- trace of the self-blind operator is zero (self-blindness ⟹ trace 0)
theorem see_trace_zero : Matrix.trace seeMat = 0 := by
  simp [Matrix.trace, Matrix.diag, seeMat, Jall, Matrix.one_apply, Matrix.sub_apply]

-- J² = 3 J
theorem Jsq : Jall * Jall = (3 : ℚ) • Jall := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Jall, Matrix.mul_apply, Fin.sum_univ_three] <;> ring

-- Pdem idempotent
theorem Pdem_idem : Pdem * Pdem = Pdem := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Pdem, Jall, Matrix.mul_apply, Matrix.smul_apply, Fin.sum_univ_three] <;> ring

-- Poth idempotent
theorem Poth_idem : Poth * Poth = Poth := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Poth, Jall, Matrix.mul_apply, Matrix.smul_apply, Matrix.one_apply, Matrix.sub_apply,
      Fin.sum_univ_three] <;> ring

-- orthogonal projectors summing to I
theorem P_sum : Pdem + Poth = 1 := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Pdem, Poth, Jall, Matrix.add_apply, Matrix.smul_apply, Matrix.one_apply, Matrix.sub_apply]
theorem P_orth : Pdem * Poth = 0 := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [Pdem, Poth, Jall, Matrix.mul_apply, Matrix.smul_apply, Matrix.one_apply, Matrix.sub_apply,
      Fin.sum_univ_three] <;> ring

-- seeMat's spectral action: eigenvalue 2 on Pdem, −1 on Poth
theorem see_Pdem : seeMat * Pdem = (2 : ℚ) • Pdem := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [seeMat, Pdem, Jall, Matrix.mul_apply, Matrix.smul_apply, Matrix.one_apply, Matrix.sub_apply,
      Fin.sum_univ_three] <;> ring
theorem see_Poth : seeMat * Poth = (-1 : ℚ) • Poth := by
  apply Matrix.ext; intro i j; fin_cases i <;> fin_cases j <;>
    simp [seeMat, Poth, Jall, Matrix.mul_apply, Matrix.smul_apply, Matrix.one_apply, Matrix.sub_apply,
      Fin.sum_univ_three] <;> ring

-- projector traces (dimensions of eigenspaces)
theorem tr_Pdem : Matrix.trace Pdem = 1 := by
  simp [Matrix.trace, Matrix.diag, Pdem, Jall, Matrix.smul_apply, Fin.sum_univ_three]
theorem tr_Poth : Matrix.trace Poth = 2 := by
  simp [Matrix.trace, Matrix.diag, Poth, Jall, Matrix.one_apply, Matrix.sub_apply, Matrix.smul_apply,
    Fin.sum_univ_three]; ring

-- THE BORN WEIGHTS: normalized projector traces = 1/3, 2/3
-- the self-seen "other" fraction T = tr Poth / 3 = 2/3
theorem born_weight_others : Matrix.trace Poth / 3 = 2/3 := by rw [tr_Poth]
theorem born_weight_dem : Matrix.trace Pdem / 3 = 1/3 := by rw [tr_Pdem]

-- self-blindness reads as the weighted eigenvalue balance: w_dem·λ_dem + w_oth·λ_oth = 0
-- (1/3)·2 + (2/3)·(−1) = 0   ⟺  trace seeMat = 0
theorem weight_balance :
    (Matrix.trace Pdem / 3) * 2 + (Matrix.trace Poth / 3) * (-1) = 0 := by
  rw [tr_Pdem, tr_Poth]; ring

end Phys.Probe305b
