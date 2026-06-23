/- PROBE 98: pure-octonion projector pc1 over ABSTRACT CD (CD B) (the bb1-proven route).
   Proj0 = diagonal(1,0,0). Test polarCross1 (Proj0) (Xz a b c) (Xz p q r) entries by the
   bb1 coordinate route (ext<;>cdsimp0<;>ring over abstract base — ring closes over B).
   Compare full-Y (6 gens) vs single-Y-gen (4 gens). Which entries close, at what cost? -/
import Phys.Algebra.HermitianJordan.PolarFirst
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.Alternative
import Mathlib.Tactic

namespace Probe98
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix

variable {B : Type*} [CommRing B] [StarRing B]

attribute [local instance] CD.narCD CD.srCD

noncomputable def Proj0 : Matrix (Fin 3) (Fin 3) (CD (CD B)) :=
  Matrix.diagonal (fun i => if i = 0 then 1 else 0)

theorem P0_00 : (Proj0 (B:=B)) 0 0 = 1 := by unfold Proj0; rw [Matrix.diagonal_apply_eq]; rfl
theorem P0_11 : (Proj0 (B:=B)) 1 1 = 0 := by unfold Proj0; rw [Matrix.diagonal_apply_eq]; rfl
theorem P0_22 : (Proj0 (B:=B)) 2 2 = 0 := by unfold Proj0; rw [Matrix.diagonal_apply_eq]; rfl
theorem P0_01 : (Proj0 (B:=B)) 0 1 = 0 := by unfold Proj0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem P0_02 : (Proj0 (B:=B)) 0 2 = 0 := by unfold Proj0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem P0_10 : (Proj0 (B:=B)) 1 0 = 0 := by unfold Proj0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem P0_12 : (Proj0 (B:=B)) 1 2 = 0 := by unfold Proj0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem P0_20 : (Proj0 (B:=B)) 2 0 = 0 := by unfold Proj0; exact Matrix.diagonal_apply_ne _ (by decide)
theorem P0_21 : (Proj0 (B:=B)) 2 1 = 0 := by unfold Proj0; exact Matrix.diagonal_apply_ne _ (by decide)

local macro "pjsimp" : tactic =>
  `(tactic| simp only [Fin.isValue, jb, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three,
    P0_00, P0_11, P0_22, P0_01, P0_02, P0_10, P0_12, P0_20, P0_21, Xz,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, neg_zero, one_mul, mul_one])

local macro "cdsimp0" : tactic =>
  `(tactic| simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_re, zero_im, star_zero, mul_zero, zero_mul,
      add_zero, zero_add, neg_zero])

-- (A) single-Y-gen p (4 generators a,b,c,p) — bb1-scale. Entry (0,0) and (0,1).
set_option maxHeartbeats 4000000 in
theorem pc1P0p_00 (a b c p : CD (CD B)) :
    (polarCross1 (Proj0) (Xz a b c) (Xz p 0 0)) 0 0 = 0 := by
  unfold polarCross1
  simp only [Matrix.add_apply, Matrix.sub_apply]
  pjsimp
  ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
theorem pc1P0p_01 (a b c p : CD (CD B)) :
    (polarCross1 (Proj0) (Xz a b c) (Xz p 0 0)) 0 1 = 0 := by
  unfold polarCross1
  simp only [Matrix.add_apply, Matrix.sub_apply]
  pjsimp
  ext <;> cdsimp0 <;> ring

end Probe98
