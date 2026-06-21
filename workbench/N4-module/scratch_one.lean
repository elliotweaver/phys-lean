import Phys.Algebra.Operator
import Mathlib.Tactic
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD
def u (a b c d e f g : ℚ) : O ℚ := ⟨⟨⟨0,a⟩,⟨b,c⟩⟩, ⟨⟨d,e⟩,⟨f,g⟩⟩⟩
set_option maxHeartbeats 400000
-- one orthogonality case: u1 vs u7
theorem one_ortho : bilin (u 1 0 0 0 0 0 0) (u 0 0 0 0 0 0 1) = (0 : H ℚ) := by
  simp only [bilin, u, CD.add_re, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.neg_re, Dbl.neg_im,
    CD.neg_re, CD.neg_im, Dbl.add_re, Dbl.add_im]
  norm_num
