/- MEASURE (run 77): close polarCross2 (0,0) by the bb1 coordinate route (cdsimp0 + ring),
   ocR UNFOLDED to its concrete structural real. polarCross2 is a SMALL split-off (not full Hm). -/
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Probe77D
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

theorem Dg00 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 0 0 = ocR d0 := by
  unfold Dg; rw [Matrix.diagonal_apply_eq]; rfl
theorem Dg11 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 1 1 = ocR d1 := by
  unfold Dg; rw [Matrix.diagonal_apply_eq]; rfl
theorem Dg22 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 2 2 = ocR d2 := by
  unfold Dg; rw [Matrix.diagonal_apply_eq]; rfl
theorem Dg01 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 0 1 = 0 := by
  unfold Dg; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Dg02 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 0 2 = 0 := by
  unfold Dg; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Dg10 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 1 0 = 0 := by
  unfold Dg; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Dg12 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 1 2 = 0 := by
  unfold Dg; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Dg20 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 2 0 = 0 := by
  unfold Dg; exact Matrix.diagonal_apply_ne _ (by decide)
theorem Dg21 (d0 d1 d2 : ℚ) : (Dg d0 d1 d2) 2 1 = 0 := by
  unfold Dg; exact Matrix.diagonal_apply_ne _ (by decide)

local macro "xzsimp" : tactic =>
  `(tactic| simp only [Fin.isValue, Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply,
    Fin.sum_univ_three, Dg00, Dg11, Dg22, Dg01, Dg02, Dg10, Dg12, Dg20, Dg21,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, neg_zero])

local macro "cdsimp0" : tactic =>
  `(tactic| simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_re, zero_im, star_zero, mul_zero, zero_mul,
      add_zero, zero_add, neg_zero,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re, Dbl.zero_im,
      Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im])

set_option maxHeartbeats 4000000 in
theorem pc2_00 (d0 d1 d2 : ℚ) (a b c p q r : O ℚ) :
    (polarCross2 (Dg d0 d1 d2) (Xz a b c) (Xz p q r)) 0 0 = 0 := by
  unfold polarCross2 jb Xz
  xzsimp
  unfold ocR
  ext <;> cdsimp0 <;> ring

end Probe77D
