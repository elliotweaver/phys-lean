import Phys.Algebra.NeutrinoMassSum
import Mathlib.Tactic

namespace Phys.Algebra.ProbeC2c

open Phys.Foundation Phys.Foundation.ContinuumQ
open Matrix

noncomputable section

def selfDir : Fin 3 → Cut := ![1, 1, 1]
def demProj : Matrix (Fin 3) (Fin 3) Cut := Matrix.of fun _ _ => (3 : Cut)⁻¹
def othersProj : Matrix (Fin 3) (Fin 3) Cut := 1 - demProj

theorem demProj_self : demProj.mulVec selfDir = selfDir := by
  funext i
  simp only [demProj, selfDir, Matrix.mulVec, dotProduct, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons, mul_one]
  fin_cases i <;> · simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_two, Matrix.tail_cons]; norm_num

theorem othersProj_self_zero : othersProj.mulVec selfDir = 0 := by
  rw [othersProj, Matrix.sub_mulVec, Matrix.one_mulVec, demProj_self, sub_self]

theorem othersProj_symm : (othersProj)ᵀ = othersProj := by
  funext i j
  simp only [othersProj, demProj, Matrix.transpose_apply, Matrix.sub_apply, Matrix.one_apply,
    Matrix.of_apply]
  by_cases h : i = j <;> simp [h, eq_comm]

theorem dirac_others_self_blind (D0 : Matrix (Fin 3) (Fin 3) Cut) :
    (othersProj * D0)ᵀ.mulVec selfDir = 0 := by
  rw [Matrix.transpose_mul, othersProj_symm, ← Matrix.mulVec_mulVec, othersProj_self_zero,
    Matrix.mulVec_zero]

theorem smul_mulVec_eq (Mc : Cut) (A : Matrix (Fin 3) (Fin 3) Cut) (v : Fin 3 → Cut) :
    (Mc • A).mulVec v = Mc • (A.mulVec v) := by
  funext i; simp only [Matrix.mulVec, dotProduct, Matrix.smul_apply, smul_eq_mul,
    Pi.smul_apply, Finset.mul_sum]; congr 1; funext x; ring

/-- ★★ THE MASSLESS EIGENVALUE (kernel / rank-deficiency): the self-direction is a genuine
    ZERO-EIGENVECTOR of the light seesaw mass operator `M⁻¹·(D Dᵀ)` for the others-coupling
    `D = othersProj·D₀` — the operator ANNIHILATES the self-direction, so the spectrum contains an
    EXACT 0. This is the massless lightest neutrino as an eigenvalue, not just a vanishing form. -/
theorem selfDir_zero_mode (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) :
    ((M⁻¹) • ((othersProj * D0) * (othersProj * D0)ᵀ)).mulVec selfDir = 0 := by
  rw [smul_mulVec_eq, ← Matrix.mulVec_mulVec, dirac_others_self_blind,
    Matrix.mulVec_zero, smul_zero]

end

end Phys.Algebra.ProbeC2c
