import Phys.Algebra.NeutrinoMassSum
import Mathlib.Tactic

namespace Phys.Algebra.ProbeC2b

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

/-- the mass of a generation-direction v = Born self-overlap through the light seesaw operator. -/
def massOfDir (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) (v : Fin 3 → Cut) : Cut :=
  dotProduct v (((M⁻¹) • (D * Dᵀ)).mulVec v)

theorem smul_mulVec_eq (Mc : Cut) (A : Matrix (Fin 3) (Fin 3) Cut) (v : Fin 3 → Cut) :
    (Mc • A).mulVec v = Mc • (A.mulVec v) := by
  funext i; simp only [Matrix.mulVec, dotProduct, Matrix.smul_apply, smul_eq_mul,
    Pi.smul_apply, Finset.mul_sum]; congr 1; funext x; ring

/-- ★ mass = M⁻¹ · ‖Dᵀ v‖² (Born = self-overlap). -/
theorem massOfDir_eq_normSq (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) (v : Fin 3 → Cut) :
    massOfDir D M v = M⁻¹ * (∑ i, (Dᵀ.mulVec v) i ^ 2) := by
  unfold massOfDir
  rw [smul_mulVec_eq, dotProduct_smul, smul_eq_mul]
  congr 1
  simp only [dotProduct, Matrix.mulVec, Matrix.mul_apply, Matrix.transpose_apply,
    Fin.sum_univ_three]
  ring

/-- ★ PSD: 0 ≤ massOfDir (M>0) — the ordering floor. -/
theorem massOfDir_nonneg (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) (hM : 0 < M)
    (v : Fin 3 → Cut) : 0 ≤ massOfDir D M v := by
  rw [massOfDir_eq_normSq]
  apply mul_nonneg (le_of_lt (inv_pos.mpr hM))
  simp only [Fin.sum_univ_three]; positivity

/-- ★ Dᵀ s = 0 for the others-coupling D = othersProj·D₀ (self-blindness). -/
theorem dirac_others_self_blind (D0 : Matrix (Fin 3) (Fin 3) Cut) :
    (othersProj * D0)ᵀ.mulVec selfDir = 0 := by
  rw [Matrix.transpose_mul, othersProj_symm, ← Matrix.mulVec_mulVec, othersProj_self_zero,
    Matrix.mulVec_zero]

/-- ★★ THE MASSLESS LIGHTEST NEUTRINO: the self/sterile generation is massless (m₁ = 0). -/
theorem self_generation_massless (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) :
    massOfDir (othersProj * D0) M selfDir = 0 := by
  rw [massOfDir_eq_normSq, dirac_others_self_blind]
  simp

end

end Phys.Algebra.ProbeC2b
