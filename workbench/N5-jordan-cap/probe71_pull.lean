/- PROBE 71 (W9.7 EXECUTE): the ocR pull-out canonicalization + cheapest entry (0,1).
   ocR is central+nuclear ⇒ pull every ocR d_k to outermost-left: a true canonical form.
   Then bb-part matches the banked bb1_e01; (0,1) has deg1=0 so it should close on hbb alone. -/
import Phys.Algebra.HermitianJordan.PieceB
import Phys.Algebra.HermitianJordan.Building
import Mathlib.Tactic

namespace Probe71
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Phys.Algebra.HJ Matrix
attribute [local instance] CD.narCD CD.srCD

variable {B : Type*} [CommRing B] [StarRing B]

-- ★ THE PULL-OUT LEMMAS: every ocR-bearing binary product → ocR r * (product).
-- Derived from the banked centrality ocR_comm / ocR_assocL/M/R. ocR kept opaque.
theorem pull_L (r : ℚ) (x y : O ℚ) : (ocR r * x) * y = ocR r * (x * y) :=
  (ocR_assocL r x y).symm

theorem pull_RR (r : ℚ) (x y : O ℚ) : (x * y) * ocR r = ocR r * (x * y) :=
  (ocR_comm r (x * y)).symm

theorem pull_M (r : ℚ) (x y : O ℚ) : (x * ocR r) * y = ocR r * (x * y) := by
  rw [← ocR_comm r x]; exact (ocR_assocL r x y).symm

theorem pull_R2 (r : ℚ) (x y : O ℚ) : x * (y * ocR r) = ocR r * (x * y) := by
  rw [ocR_assocR r x y]; exact (ocR_comm r (x * y)).symm

theorem pull_R1 (r : ℚ) (x y : O ℚ) : x * (ocR r * y) = ocR r * (x * y) := by
  rw [ocR_comm r y]; exact pull_R2 r x y

local macro "entrysimpG" : tactic =>
  `(tactic| simp only [jdef, jb, Hm, Xz, Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk,
    Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero])

set_option maxHeartbeats 1200000 in
set_option maxRecDepth 100000 in
theorem b01 (d0 d1 d2 : ℚ) (a b c p : O ℚ) :
    (jdef (Hm d0 d1 d2 a b c) (Xz p 0 0)) 0 1 = 0 := by
  have hbb : (jdef (Xz a b c) (Xz p 0 0)) 0 1 = 0 := bb1_e01 a b c p
  simp only [jdef, jb, Xz, Fin.isValue, Fin.mk_zero, Fin.mk_one, Fin.reduceFinMk,
    Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, star_zero,
    Matrix.zero_apply, mul_zero, zero_mul, add_zero, zero_add, sub_eq_add_neg, neg_zero] at hbb
  entrysimpG
  simp only [mul_add, add_mul, pull_L, pull_M, pull_R1, pull_R2, pull_RR,
    mul_zero, zero_mul, add_zero, zero_add]
  simp only [mul_add, add_mul, mul_zero, zero_mul, add_zero, zero_add] at hbb
  linear_combination (norm := abel) hbb

end Probe71
