/- PROBE (run 51, W9.2): GENUINELY DIFFERENT instrument on core (0,0).
   The dead route was `cdsimp <;> ring` where cdsimp INCLUDES add_mul/mul_add — distributing
   CD-level products combinatorially (the simp-recursion blowup, 7GB). HERE: project FIRST with
   ONLY the projection lemmas (mul_re/mul_im/star_*/add_*/neg_*, NO add_mul/mul_add), pushing the
   distribution down to ground-ring B polynomials, then `ring` normalizes once at the B level.
   NOT a re-run of the measured dead route. MEASURE (hard kill at 100s outside). -/
import Phys.Algebra.JordanTower
import Phys.Algebra.Alternative
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace ProbeCore00R
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

set_option maxHeartbeats 2000000 in
theorem core00r (a b c p q r : CD (CD B)) :
    (jdef (Xz a b c) (Xz p q r)) 0 0 = 0 := by
  unfold jdef jb Xz
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add]
  ext <;>
  simp only [sub_eq_add_neg, mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
    star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg] <;>
  ring

end ProbeCore00R
