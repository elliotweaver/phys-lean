import Phys.Cascade.ForcedStop
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Algebra.Star.Basic
import Mathlib.Tactic
open Phys.Cascade
abbrev M2 := Matrix (Fin 2) (Fin 2) ℚ
attribute [local instance] CD.narCD CD.srCD
def ma : M2 := !![0,1;0,0]
def mb : M2 := !![0,0;1,0]
def mc : M2 := !![1,0;0,0]
def uu : CD M2 := ⟨ma, 0⟩
def vv : CD M2 := ⟨mb, 0⟩
def ww : CD M2 := ⟨mc, 0⟩
set_option maxHeartbeats 1000000 in
theorem adj_lhs : (CD.bilin (uu*vv) ww) 0 0 = (2:ℚ) := by
  simp only [CD.bilin, uu, vv, ww, ma, mb, mc, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, star_zero, mul_zero, zero_mul, add_zero, zero_add, Matrix.add_apply,
    Matrix.mul_apply, Fin.sum_univ_two, Matrix.star_apply, star_trivial,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.empty_val', Matrix.cons_val_fin_one, Matrix.zero_apply]
  norm_num
