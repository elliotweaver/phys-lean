/- PROBE (run 50, W9.2): is the blowup in the SIMP expansion or in RING?
   Core entry (0,1), cdsimp-only to coordinates, NO ring closer (sorry). Bounded.
   If cdsimp alone is cheap -> ring is the cost (try alternatives). If cdsimp blows up
   -> term size is the cost (structural route mandatory). -/
import Phys.Algebra.JordanTower
import Phys.Algebra.Alternative
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace ProbeSimp
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

def Xz (a b c : CD (CD B)) : Matrix (Fin 3) (Fin 3) (CD (CD B)) :=
  !![ 0,       a,       b;
      star a,  0,       c;
      star b,  star c,  0]

set_option maxHeartbeats 1000000 in
theorem core01_simp (a b c p q r : CD (CD B)) :
    (jdef (Xz a b c) (Xz p q r)) 0 1 = 0 := by
  unfold jdef jb Xz
  ext <;>
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const,
    Matrix.zero_apply, sub_eq_add_neg, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
    star_add, star_neg, star_mul', star_star, star_zero,
    neg_mul, mul_neg, neg_neg, mul_add, add_mul, mul_zero, zero_mul,
    add_zero, zero_add]
  all_goals sorry

end ProbeSimp
