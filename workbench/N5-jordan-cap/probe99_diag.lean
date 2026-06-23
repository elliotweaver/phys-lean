/- PROBE 99: DIAGNOSTIC — why does ext<;>cdsimp0<;>ring leave residual on pc1(Proj0)?
   Trace the goal state. Use the EXACT Building.lean route (unfold jdef-style) but for pc1.
   Compare: does `ext` crack CD (CD B), and does cdsimp0 expand? Show goals. -/
import Phys.Algebra.HermitianJordan.PolarFirst
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.Alternative
import Mathlib.Tactic

namespace Probe99
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

local macro "cdsimp0" : tactic =>
  `(tactic| simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_re, zero_im, star_zero, mul_zero, zero_mul,
      add_zero, zero_add, neg_zero])

-- Diagnostic: entry (0,0). Show goal after pjsimp (NO ext yet), then try ext<;>cdsimp0<;>ring.
set_option maxHeartbeats 4000000 in
theorem pc1diag_00 (a b c p q r : CD (CD B)) :
    (polarCross1 (Proj0) (Xz a b c) (Xz p q r)) 0 0 = 0 := by
  unfold polarCross1 jb Xz
  simp only [Fin.isValue, Matrix.add_apply, Matrix.sub_apply, Matrix.mul_apply, Fin.sum_univ_three,
    P0_00, P0_11, P0_22, P0_01, P0_02, P0_10, P0_12, P0_20, P0_21,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, neg_zero, one_mul, mul_one]
  ext <;> cdsimp0 <;> ring

end Probe99
