/- PROBE (run 62, W9.2): measure the cost of ONE entry of the FULL Hermitian pair
   jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r) via the building-block coordinate route
   (ext <;> cdsimp0 <;> ring). The diagonal is real-central (ocR). If one entry closes at
   bounded cost, the full Hm cap closes directly entry-by-entry like the building blocks,
   NO separate central-diagonal reduction lemma needed. KILL at first sign past ~3.5GB/90s. -/
import Phys.Algebra.HermitianJordan.Building
import Mathlib.Tactic

namespace ProbeFullHm
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.HJ
open Matrix

attribute [local instance] CD.narCD CD.srCD

variable {B : Type*} [CommRing B] [StarRing B]

local macro "entrysimp" : tactic =>
  `(tactic| simp only [Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk, Matrix.mul_apply,
    Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero])

local macro "cdsimp0" : tactic =>
  `(tactic| simp only [mul_re, mul_im, star_re, star_im, add_re, add_im, neg_re, neg_im,
      star_add, star_neg, star_mul', star_star, neg_mul, mul_neg, neg_neg,
      add_mul, mul_add, zero_re, zero_im, star_zero, mul_zero, zero_mul,
      add_zero, zero_add, neg_zero])

set_option maxHeartbeats 4000000 in
-- The (0,0) entry of the FULL Hermitian pair. Hm has real central diagonal ocR over ℚ.
theorem fhm_e00 (d0 d1 d2 e0 e1 e2 : ℚ) (a b c p q r : O ℚ) :
    (jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r)) 0 0 = 0 := by
  unfold jdef jb Hm ocR; entrysimp; ext <;> cdsimp0 <;> ring

end ProbeFullHm
