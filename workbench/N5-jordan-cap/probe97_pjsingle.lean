/- PROBE 97: pure-octonion projector + SINGLE Y-gen — bb1-scale. Does coordinate route close it?
   pc1(Pj0)(Xz abc)(Xz p 0 0) entries (0,0),(0,1),(2,2). KILL 150s. -/
import Phys.Algebra.HermitianJordan.PieceBscale
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Probe97
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

noncomputable def Pj0 : Matrix (Fin 3) (Fin 3) (O ℚ) := Matrix.diagonal (fun i => if i = 0 then 1 else 0)
theorem Pj0_00 : Pj0 0 0 = 1 := by unfold Pj0; rw [Matrix.diagonal_apply_eq]; rfl
theorem Pj0_11 : Pj0 1 1 = 0 := by unfold Pj0; rw [Matrix.diagonal_apply_eq]; rfl
theorem Pj0_22 : Pj0 2 2 = 0 := by unfold Pj0; rw [Matrix.diagonal_apply_eq]; rfl
theorem Pj0_01 : Pj0 0 1 = 0 := by unfold Pj0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Pj0_02 : Pj0 0 2 = 0 := by unfold Pj0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Pj0_10 : Pj0 1 0 = 0 := by unfold Pj0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Pj0_12 : Pj0 1 2 = 0 := by unfold Pj0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Pj0_20 : Pj0 2 0 = 0 := by unfold Pj0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Pj0_21 : Pj0 2 1 = 0 := by unfold Pj0; exact Matrix.diagonal_apply_ne _ (by decide)

local macro "pjsimp" : tactic =>
  `(tactic| simp only [Fin.isValue, jb, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three,
    Pj0_00, Pj0_11, Pj0_22, Pj0_01, Pj0_02, Pj0_10, Pj0_12, Pj0_20, Pj0_21, Xz,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, neg_zero, one_mul, mul_one])

local macro "cdsimp0" : tactic =>
  `(tactic| simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_re, zero_im, star_zero, mul_zero, zero_mul,
      add_zero, zero_add, neg_zero, one_mul, mul_one])

set_option maxHeartbeats 4000000 in
theorem pc1Pj0_00 (a b c p : O ℚ) :
    (polarCross1 Pj0 (Xz a b c) (Xz p 0 0)) 0 0 = 0 := by
  unfold polarCross1
  simp only [Matrix.add_apply, Matrix.sub_apply]
  pjsimp
  ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
theorem pc1Pj0_22 (a b c p : O ℚ) :
    (polarCross1 Pj0 (Xz a b c) (Xz p 0 0)) 2 2 = 0 := by
  unfold polarCross1
  simp only [Matrix.add_apply, Matrix.sub_apply]
  pjsimp
  ext <;> cdsimp0 <;> ring

end Probe97
