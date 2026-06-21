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
-- try to PROVE the component values in the kernel
theorem adj_lhs : (CD.bilin (uu*vv) ww) 0 0 = (2:ℚ) := by
  simp only [CD.bilin, uu, vv, ww, ma, mb, mc, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.neg_re, CD.neg_im, star_zero, mul_zero, zero_mul, add_zero, zero_add]
  decide
theorem adj_rhs : (CD.bilin vv (star uu * ww)) 0 0 = (0:ℚ) := by
  simp only [CD.bilin, uu, vv, ww, ma, mb, mc, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.neg_re, CD.neg_im, star_zero, mul_zero, zero_mul, add_zero, zero_add]
  decide
#print axioms adj_lhs
#print axioms adj_rhs
