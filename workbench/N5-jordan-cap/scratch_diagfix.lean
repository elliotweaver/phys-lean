import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

namespace ScratchDiagFix

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable def ocR (r : ℚ) : O ℚ := ⟨⟨⟨r, 0⟩, ⟨0, 0⟩⟩, ⟨⟨0, 0⟩, ⟨0, 0⟩⟩⟩
noncomputable def Hm (d0 d1 d2 : ℚ) (a b c : O ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  !![ ocR d0,   a,       b;
      star a,   ocR d1,  c;
      star b,   star c,  ocR d2]

-- Keep ocR OPAQUE at H. Only two facts needed: its new-dimension (im) layer vanishes,
-- and it is self-conjugate. Then noncomm_ring over the associative base H ℚ closes it,
-- treating (ocR r).re as an opaque central H atom.
@[simp] theorem ocR_im (r : ℚ) : (ocR r).im = 0 := rfl
@[simp] theorem star_ocR (r : ℚ) : star (ocR r) = ocR r := rfl

set_option maxHeartbeats 4000000 in
theorem t00 (d0 d1 d2 e0 e1 e2 : ℚ) (a b c p q r : O ℚ) :
    (jdef (Hm d0 d1 d2 a b c) (Hm e0 e1 e2 p q r)) 0 0 = 0 := by
  unfold jdef jb Hm
  ext <;>
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.cons_val, Matrix.empty_val',
    Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const,
    ocR_im, star_ocR,
    CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
    CD.neg_re, CD.neg_im, CD.zero_re, CD.zero_im,
    star_mul', star_add, star_neg, star_star, star_zero, star_one,
    mul_neg, neg_mul, mul_add, add_mul, mul_zero, zero_mul,
    add_zero, zero_add] <;>
  noncomm_ring

end ScratchDiagFix
