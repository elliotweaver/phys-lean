import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace ScratchAntiVac

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

-- ANTI-VACUITY (W8): my fast tactic must FAIL on the genuinely-false H4 witness entry
-- (jdef_witness proves (jdef Xwit Ywit 0 3).im.re.im = 4 ≠ 0). If noncomm_ring closes
-- this, my tactic is UNSOUND. It MUST error.
set_option maxHeartbeats 4000000 in
example : (jdef Xwit Ywit) 0 3 = 0 := by
  unfold jdef jb Xwit Ywit w1 w2 w3
  ext <;>
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_four,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.cons_val, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.cons_val_three, Matrix.tail_cons, Matrix.head_fin_const,
    CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
    CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
    star_mul', star_add, star_neg, star_star, star_zero, star_one,
    mul_neg, neg_mul, mul_add, add_mul, mul_zero, zero_mul,
    add_zero, zero_add] <;>
  noncomm_ring

end ScratchAntiVac
