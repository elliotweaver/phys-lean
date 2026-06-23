/- PROBE 106: pc1 over CONCRETE O ℚ with literal projector + FULL concrete cdsimp0 (Dbl.*
   lemmas -> reduce to ℚ where ring closes). Test (2,2),(0,1),(0,0). KILL via measure.
   This is the bb1 route at concrete O ℚ: P_k entries are 1/0 (no ocR), so full projection
   to ℚ should let ring close (alternativity automatic from CD over commutative ground). -/
import Phys.Algebra.HermitianJordan.PolarFirst
import Phys.Algebra.HermitianJordan.PieceBscale
import Mathlib.Tactic

namespace Probe106
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

noncomputable def Pj0 : Matrix (Fin 3) (Fin 3) (O ℚ) := !![ 1, 0, 0; 0, 0, 0; 0, 0, 0]

local macro "entrysimp" : tactic =>
  `(tactic| simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero,
    one_mul, mul_one, star_one])

local macro "cdsimpQ" : tactic =>
  `(tactic| simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re,
      Dbl.zero_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im,
      zero_mul, mul_zero, add_zero, zero_add, neg_zero, one_mul, mul_one])

set_option maxHeartbeats 4000000 in
theorem pc1_22 (a b c p q r : O ℚ) :
    (polarCross1 (Pj0) (Xz a b c) (Xz p q r)) 2 2 = 0 := by
  unfold polarCross1 jb Pj0 Xz; entrysimp; ext <;> cdsimpQ <;> ring

set_option maxHeartbeats 4000000 in
theorem pc1_01 (a b c p q r : O ℚ) :
    (polarCross1 (Pj0) (Xz a b c) (Xz p q r)) 0 1 = 0 := by
  unfold polarCross1 jb Pj0 Xz; entrysimp; ext <;> cdsimpQ <;> ring

end Probe106
