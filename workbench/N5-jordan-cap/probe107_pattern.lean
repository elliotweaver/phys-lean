/- PROBE 107: which entries of pc1(Pj0)(Xz abc)(Xz p 0 0) close by bb1's ext<;>cdsimp0<;>ring?
   4-var (a,b,c,p), abstract CD (CD B), EXACT bb1 macros. Per-entry `first|(...ring)|sorry`
   reports the pass pattern (warnings = sorry used = needs ka). KILL via measure. -/
import Phys.Algebra.HermitianJordan.PolarFirst
import Phys.Algebra.HermitianJordan.SinglePair
import Phys.Algebra.Alternative
import Mathlib.Tactic

namespace Probe107
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
variable {B : Type*} [CommRing B] [StarRing B]
attribute [local instance] CD.narCD CD.srCD

noncomputable def Pj0 : Matrix (Fin 3) (Fin 3) (CD (CD B)) := !![ 1, 0, 0; 0, 0, 0; 0, 0, 0]

local macro "entrysimp" : tactic =>
  `(tactic| simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero,
    one_mul, mul_one, star_one])
local macro "cdsimp0" : tactic =>
  `(tactic| simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_re, zero_im, star_zero, mul_zero, zero_mul, add_zero, zero_add, neg_zero])

set_option maxHeartbeats 4000000 in
theorem e00 (a b c p : CD (CD B)) : (polarCross1 (Pj0) (Xz a b c) (Xz p 0 0)) 0 0 = 0 := by
  unfold polarCross1 jb Pj0 Xz; entrysimp; first | (ext <;> cdsimp0 <;> ring) | sorry
set_option maxHeartbeats 4000000 in
theorem e01 (a b c p : CD (CD B)) : (polarCross1 (Pj0) (Xz a b c) (Xz p 0 0)) 0 1 = 0 := by
  unfold polarCross1 jb Pj0 Xz; entrysimp; first | (ext <;> cdsimp0 <;> ring) | sorry
set_option maxHeartbeats 4000000 in
theorem e02 (a b c p : CD (CD B)) : (polarCross1 (Pj0) (Xz a b c) (Xz p 0 0)) 0 2 = 0 := by
  unfold polarCross1 jb Pj0 Xz; entrysimp; first | (ext <;> cdsimp0 <;> ring) | sorry
set_option maxHeartbeats 4000000 in
theorem e10 (a b c p : CD (CD B)) : (polarCross1 (Pj0) (Xz a b c) (Xz p 0 0)) 1 0 = 0 := by
  unfold polarCross1 jb Pj0 Xz; entrysimp; first | (ext <;> cdsimp0 <;> ring) | sorry
set_option maxHeartbeats 4000000 in
theorem e11 (a b c p : CD (CD B)) : (polarCross1 (Pj0) (Xz a b c) (Xz p 0 0)) 1 1 = 0 := by
  unfold polarCross1 jb Pj0 Xz; entrysimp; first | (ext <;> cdsimp0 <;> ring) | sorry
set_option maxHeartbeats 4000000 in
theorem e12 (a b c p : CD (CD B)) : (polarCross1 (Pj0) (Xz a b c) (Xz p 0 0)) 1 2 = 0 := by
  unfold polarCross1 jb Pj0 Xz; entrysimp; first | (ext <;> cdsimp0 <;> ring) | sorry
set_option maxHeartbeats 4000000 in
theorem e20 (a b c p : CD (CD B)) : (polarCross1 (Pj0) (Xz a b c) (Xz p 0 0)) 2 0 = 0 := by
  unfold polarCross1 jb Pj0 Xz; entrysimp; first | (ext <;> cdsimp0 <;> ring) | sorry
set_option maxHeartbeats 4000000 in
theorem e21 (a b c p : CD (CD B)) : (polarCross1 (Pj0) (Xz a b c) (Xz p 0 0)) 2 1 = 0 := by
  unfold polarCross1 jb Pj0 Xz; entrysimp; first | (ext <;> cdsimp0 <;> ring) | sorry
set_option maxHeartbeats 4000000 in
theorem e22 (a b c p : CD (CD B)) : (polarCross1 (Pj0) (Xz a b c) (Xz p 0 0)) 2 2 = 0 := by
  unfold polarCross1 jb Pj0 Xz; entrysimp; first | (ext <;> cdsimp0 <;> ring) | sorry

end Probe107
