/- PROBE 112: the pure-octonion-UNIT diagonal coefficient. polarCross1 is additive+homogeneous
   in D. The d0-coefficient is polarCross1 with D = diagonal ![1,0,0] (octonion UNIT, NOT ocR).
   NO ocR bloat -> the bb1-style coordinate route (cdsimp0 WITH zero_re/zero_im, over generic B,
   no ocR) should close it. Test (0,0) and (0,1) for the matrix unit diagonal. KILL 150s. -/
import Phys.Algebra.JordanTower
import Phys.Algebra.Alternative
import Phys.Algebra.HermitianJordan.PolarFirst
import Mathlib.Tactic

namespace Probe112
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

local macro "entrysimp" : tactic =>
  `(tactic| simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three, Matrix.diagonal,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero, star_one,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero,
    one_mul, mul_one, ite_mul, mul_ite, zero_ne_one])

local macro "cdsimp0" : tactic =>
  `(tactic| simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_re, zero_im, star_zero, mul_zero, zero_mul,
      add_zero, zero_add, neg_zero])

-- the pure-octonion-unit diagonal: 1 at (0,0), 0 elsewhere
noncomputable def D1 : Matrix (Fin 3) (Fin 3) (CD (CD B)) := Matrix.diagonal ![1, 0, 0]

set_option maxHeartbeats 2000000 in
theorem pc1u_00 (a b c p q r : CD (CD B)) :
    (polarCross1 (D1 (B := B)) (Xz a b c) (Xz p q r)) 0 0 = 0 := by
  unfold polarCross1 D1 jb Xz
  entrysimp
  ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 2000000 in
theorem pc1u_01 (a b c p q r : CD (CD B)) :
    (polarCross1 (D1 (B := B)) (Xz a b c) (Xz p q r)) 0 1 = 0 := by
  unfold polarCross1 D1 jb Xz
  entrysimp
  ext <;> cdsimp0 <;> ring

end Probe112
