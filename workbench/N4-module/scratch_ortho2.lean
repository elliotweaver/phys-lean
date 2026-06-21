import Phys.Algebra.Operator
import Mathlib.Tactic
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 4000000
def ebasis : Fin 7 → O ℚ
  | 0 => ⟨⟨⟨0,1⟩,⟨0,0⟩⟩, ⟨⟨0,0⟩,⟨0,0⟩⟩⟩
  | 1 => ⟨⟨⟨0,0⟩,⟨1,0⟩⟩, ⟨⟨0,0⟩,⟨0,0⟩⟩⟩
  | 2 => ⟨⟨⟨0,0⟩,⟨0,1⟩⟩, ⟨⟨0,0⟩,⟨0,0⟩⟩⟩
  | 3 => ⟨⟨⟨0,0⟩,⟨0,0⟩⟩, ⟨⟨1,0⟩,⟨0,0⟩⟩⟩
  | 4 => ⟨⟨⟨0,0⟩,⟨0,0⟩⟩, ⟨⟨0,1⟩,⟨0,0⟩⟩⟩
  | 5 => ⟨⟨⟨0,0⟩,⟨0,0⟩⟩, ⟨⟨0,0⟩,⟨1,0⟩⟩⟩
  | 6 => ⟨⟨⟨0,0⟩,⟨0,0⟩⟩, ⟨⟨0,0⟩,⟨0,1⟩⟩⟩
theorem bilin_re_re (x y : O ℚ) : (bilin x y).re.re =
    2*(x.re.re.re*y.re.re.re + x.re.re.im*y.re.re.im + x.re.im.re*y.re.im.re + x.re.im.im*y.re.im.im
     + x.im.re.re*y.im.re.re + x.im.re.im*y.im.re.im + x.im.im.re*y.im.im.re + x.im.im.im*y.im.im.im) := by
  simp only [bilin, CD.add_re, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.neg_re, CD.neg_im,
    Dbl.add_re, Dbl.add_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.neg_re, Dbl.neg_im]
  ring
theorem bilin_re_im (x y : O ℚ) : (bilin x y).re.im = 0 := by
  simp only [bilin, CD.add_re, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.neg_re, CD.neg_im,
    Dbl.add_re, Dbl.add_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.neg_re, Dbl.neg_im]
  ring
theorem bilin_im_re (x y : O ℚ) : (bilin x y).im.re = 0 := by
  simp only [bilin, CD.add_re, CD.add_im, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.neg_re, CD.neg_im,
    Dbl.add_re, Dbl.add_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.neg_re, Dbl.neg_im]
  ring
theorem bilin_im_im (x y : O ℚ) : (bilin x y).im.im = 0 := by
  simp only [bilin, CD.add_re, CD.add_im, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.neg_re, CD.neg_im,
    Dbl.add_re, Dbl.add_im, Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.neg_re, Dbl.neg_im]
  ring
-- reduce bilin=0 in H ℚ to the scalar dot
theorem ortho_of_dot (x y : O ℚ) (h : (bilin x y).re.re = 0) : bilin x y = (0 : H ℚ) := by
  ext
  · exact h
  · exact bilin_re_im x y
  · exact bilin_im_re x y
  · exact bilin_im_im x y
-- full orthogonality
theorem ebasis_ortho (i j : Fin 7) (h : i ≠ j) : bilin (ebasis i) (ebasis j) = (0 : H ℚ) := by
  apply ortho_of_dot
  rw [bilin_re_re]
  fin_cases i <;> fin_cases j <;> first | (exact absurd rfl h) | (simp [ebasis])
