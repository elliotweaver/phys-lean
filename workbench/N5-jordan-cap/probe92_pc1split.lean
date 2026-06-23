/- PROBE 92: polarCross1 is LINEAR in Y. Split Y into single generators -> 4-generator entries
   (bb1-scale). Test: does polarCross1 (Dg)(Xz a b c)(Xz p 0 0) close per-entry by coordinate
   route (like bb1)? Test (0,0) and (0,1). Also confirm Y-additivity. KILL 120s. -/
import Phys.Algebra.HermitianJordan.PieceBscale
import Phys.Algebra.HermitianJordan.PolarFirst
import Phys.Algebra.HermitianJordan.Linear
import Mathlib.Tactic

namespace Probe92
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

-- Y-additivity of polarCross1 (over any NonAssocRing).
section Abs
variable {S : Type*} [NonAssocRing S] {n : ℕ}
theorem pc1_add_right (D X Y Z : Matrix (Fin n) (Fin n) S) :
    polarCross1 D X (Y + Z) = polarCross1 D X Y + polarCross1 D X Z := by
  unfold polarCross1 jb
  simp only [mul_add, add_mul]
  abel
end Abs

local macro "dgsimp" : tactic =>
  `(tactic| simp only [Fin.isValue, jb, Matrix.add_apply, Matrix.mul_apply, Fin.sum_univ_three,
    Dg00, Dg11, Dg22, Dg01, Dg02, Dg10, Dg12, Dg20, Dg21, Xz,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, neg_zero])

local macro "cdsimp0" : tactic =>
  `(tactic| simp only [ocR, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re,
      Dbl.zero_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im,
      zero_mul, mul_zero, add_zero, zero_add, neg_zero])

set_option maxHeartbeats 4000000 in
theorem pc1p_00 (d0 d1 d2 : ℚ) (a b c p : O ℚ) :
    (polarCross1 (Dg d0 d1 d2) (Xz a b c) (Xz p 0 0)) 0 0 = 0 := by
  unfold polarCross1
  simp only [Matrix.add_apply, Matrix.sub_apply]
  dgsimp
  ext <;> cdsimp0 <;> ring

set_option maxHeartbeats 4000000 in
theorem pc1p_01 (d0 d1 d2 : ℚ) (a b c p : O ℚ) :
    (polarCross1 (Dg d0 d1 d2) (Xz a b c) (Xz p 0 0)) 0 1 = 0 := by
  unfold polarCross1
  simp only [Matrix.add_apply, Matrix.sub_apply]
  dgsimp
  ext <;> cdsimp0 <;> ring

end Probe92
