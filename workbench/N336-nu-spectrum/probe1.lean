import Phys.Algebra.NeutrinoMassSum
import Mathlib.Tactic

namespace Phys.Algebra.ProbeC2

open Phys.Foundation Phys.Foundation.ContinuumQ
open Matrix

noncomputable section

def selfDir : Fin 3 → Cut := ![1, 1, 1]
def demProj : Matrix (Fin 3) (Fin 3) Cut := Matrix.of fun _ _ => (3 : Cut)⁻¹
def othersProj : Matrix (Fin 3) (Fin 3) Cut := 1 - demProj

-- Pdem s = s (the DC projector fixes the self-direction).
example : demProj.mulVec selfDir = selfDir := by
  funext i
  simp only [demProj, selfDir, Matrix.mulVec, dotProduct, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
    Matrix.cons_val_two, Matrix.tail_cons, mul_one]
  fin_cases i <;> · simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_two, Matrix.tail_cons]; norm_num

-- PROBE 1: Poth kills the DC self-direction.
example : othersProj.mulVec selfDir = 0 := by
  have hdem : demProj.mulVec selfDir = selfDir := by
    funext i
    simp only [demProj, selfDir, Matrix.mulVec, dotProduct, Fin.sum_univ_three,
      Matrix.of_apply, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_two, Matrix.tail_cons, mul_one]
    fin_cases i <;> · simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
        Matrix.cons_val_two, Matrix.tail_cons]; norm_num
  rw [othersProj, Matrix.sub_mulVec, Matrix.one_mulVec, hdem, sub_self]

end

end Phys.Algebra.ProbeC2
