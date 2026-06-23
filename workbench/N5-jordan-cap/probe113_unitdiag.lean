/- PROBE 113: unit-diagonal coefficient via PRE-PROVEN entry lemmas (avoid Matrix.diagonal
   ite isDefEq blowup that killed probe112). Du0 = diag(1,0,0) over generic B, NO ocR.
   Test pc1 (0,0) diag + (0,1) off-diag close by bb1-style cdsimp0<;>ring. KILL 150s. -/
import Phys.Algebra.JordanTower
import Phys.Algebra.Alternative
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Probe113
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

noncomputable def Du0 : Matrix (Fin 3) (Fin 3) (CD (CD B)) := Matrix.diagonal ![1, 0, 0]

theorem Du0_00 : (Du0 (B := B)) 0 0 = 1 := by unfold Du0; rw [Matrix.diagonal_apply_eq]; rfl
theorem Du0_11 : (Du0 (B := B)) 1 1 = 0 := by unfold Du0; rw [Matrix.diagonal_apply_eq]; rfl
theorem Du0_22 : (Du0 (B := B)) 2 2 = 0 := by unfold Du0; rw [Matrix.diagonal_apply_eq]; rfl
theorem Du0_01 : (Du0 (B := B)) 0 1 = 0 := by unfold Du0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du0_02 : (Du0 (B := B)) 0 2 = 0 := by unfold Du0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du0_10 : (Du0 (B := B)) 1 0 = 0 := by unfold Du0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du0_12 : (Du0 (B := B)) 1 2 = 0 := by unfold Du0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du0_20 : (Du0 (B := B)) 2 0 = 0 := by unfold Du0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Du0_21 : (Du0 (B := B)) 2 1 = 0 := by unfold Du0; exact Matrix.diagonal_apply_ne _ (by decide)

local macro "du0simp" : tactic =>
  `(tactic| simp only [Fin.isValue, jb, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three,
    Du0_00, Du0_11, Du0_22, Du0_01, Du0_02, Du0_10, Du0_12, Du0_20, Du0_21, Xz,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, neg_zero, one_mul, mul_one, star_one,
    sub_eq_add_neg])

local macro "cdsimp0" : tactic =>
  `(tactic| simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      sub_eq_add_neg,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_re, zero_im, star_zero, mul_zero, zero_mul,
      add_zero, zero_add, neg_zero] )

set_option maxHeartbeats 2000000 in
theorem pc1u_00 (a b c p q r : CD (CD B)) :
    (polarCross1 (Du0 (B := B)) (Xz a b c) (Xz p q r)) 0 0 = 0 := by
  unfold polarCross1
  simp only [Matrix.add_apply, Matrix.sub_apply]
  du0simp
  ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 2000000 in
theorem pc1u_01 (a b c p q r : CD (CD B)) :
    (polarCross1 (Du0 (B := B)) (Xz a b c) (Xz p q r)) 0 1 = 0 := by
  unfold polarCross1
  simp only [Matrix.add_apply, Matrix.sub_apply]
  du0simp
  ext <;> cdsimp0 <;> ring

end Probe113
