import Phys.Algebra.NeutrinoMassSum
import Mathlib.Tactic

namespace Phys.Algebra.ProbeC2d

open Phys.Foundation Phys.Foundation.ContinuumQ
open Matrix

noncomputable section

def selfDir : Fin 3 → Cut := ![1, 1, 1]
def demProj : Matrix (Fin 3) (Fin 3) Cut := Matrix.of fun _ _ => (3 : Cut)⁻¹
def othersProj : Matrix (Fin 3) (Fin 3) Cut := 1 - demProj

def massOfDir (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) (v : Fin 3 → Cut) : Cut :=
  dotProduct v (((M⁻¹) • (D * Dᵀ)).mulVec v)

theorem smul_mulVec_eq (Mc : Cut) (A : Matrix (Fin 3) (Fin 3) Cut) (v : Fin 3 → Cut) :
    (Mc • A).mulVec v = Mc • (A.mulVec v) := by
  funext i; simp only [Matrix.mulVec, dotProduct, Matrix.smul_apply, smul_eq_mul,
    Pi.smul_apply, Finset.mul_sum]; congr 1; funext x; ring

theorem massOfDir_eq_normSq (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) (v : Fin 3 → Cut) :
    massOfDir D M v = M⁻¹ * (∑ i, (Dᵀ.mulVec v) i ^ 2) := by
  unfold massOfDir
  rw [smul_mulVec_eq, dotProduct_smul, smul_eq_mul]
  congr 1
  simp only [dotProduct, Matrix.mulVec, Matrix.mul_apply, Matrix.transpose_apply,
    Fin.sum_univ_three]
  ring

-- COSTUME CERT: trace of the DC/self projector = 1 (the ONE massless self-direction, rank-1).
example : Matrix.trace demProj = 1 := by
  simp only [demProj, Matrix.trace, Matrix.diag_apply, Matrix.of_apply, Fin.sum_univ_three]
  norm_num

-- trace of the others-projector = 2 (the TWO massive generations, rank-2).
example : Matrix.trace othersProj = 2 := by
  simp only [othersProj, demProj, Matrix.trace, Matrix.diag_apply, Matrix.sub_apply,
    Matrix.one_apply_eq, Matrix.of_apply, Fin.sum_univ_three]
  norm_num

-- NON-VACUITY: the WRONG claim fails — the identity (full-rank) coupling does NOT make the
-- self-direction massless. massOfDir 1 M selfDir = M⁻¹·3 ≠ 0 for M ≠ 0.
example (M : Cut) (hM : 0 < M) : massOfDir 1 M selfDir ≠ 0 := by
  rw [massOfDir_eq_normSq]
  simp only [Matrix.transpose_one, Matrix.one_mulVec, selfDir, Fin.sum_univ_three,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
    Matrix.tail_cons]
  have : (M⁻¹ * ((1:Cut)^2 + 1^2 + 1^2)) = M⁻¹ * 3 := by ring
  rw [this]
  positivity

-- NON-VACUITY: a genuine massive direction — massOfDir othersProj M (1,-1,0) = M⁻¹·2 > 0.
example (M : Cut) (hM : 0 < M) : 0 < massOfDir othersProj M ![1, -1, 0] := by
  rw [massOfDir_eq_normSq]
  have hval : (∑ i, (othersProjᵀ.mulVec ![(1:Cut), -1, 0]) i ^ 2) = 2 := by
    simp only [othersProj, demProj, Matrix.transpose_apply, Matrix.mulVec, dotProduct,
      Fin.sum_univ_three, Matrix.sub_apply, Matrix.one_apply, Matrix.of_apply,
      Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two,
      Matrix.tail_cons, Fin.reduceEq, if_true, if_false]
    norm_num
  rw [hval]
  positivity

end

end Phys.Algebra.ProbeC2d
