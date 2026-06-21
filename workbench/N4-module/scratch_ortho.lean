import Phys.Algebra.Operator
import Mathlib.Tactic
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD
def ebasis : Fin 7 → O ℚ
  | 0 => ⟨⟨⟨0,1⟩,⟨0,0⟩⟩, ⟨⟨0,0⟩,⟨0,0⟩⟩⟩
  | 1 => ⟨⟨⟨0,0⟩,⟨1,0⟩⟩, ⟨⟨0,0⟩,⟨0,0⟩⟩⟩
  | 2 => ⟨⟨⟨0,0⟩,⟨0,1⟩⟩, ⟨⟨0,0⟩,⟨0,0⟩⟩⟩
  | 3 => ⟨⟨⟨0,0⟩,⟨0,0⟩⟩, ⟨⟨1,0⟩,⟨0,0⟩⟩⟩
  | 4 => ⟨⟨⟨0,0⟩,⟨0,0⟩⟩, ⟨⟨0,1⟩,⟨0,0⟩⟩⟩
  | 5 => ⟨⟨⟨0,0⟩,⟨0,0⟩⟩, ⟨⟨0,0⟩,⟨1,0⟩⟩⟩
  | 6 => ⟨⟨⟨0,0⟩,⟨0,0⟩⟩, ⟨⟨0,0⟩,⟨0,1⟩⟩⟩
set_option maxHeartbeats 8000000
theorem ebasis_ortho (i j : Fin 7) (h : i ≠ j) : bilin (ebasis i) (ebasis j) = (0 : H ℚ) := by
  fin_cases i <;> fin_cases j <;> first | (exact absurd rfl h) | (
    simp only [bilin]
    ext <;> simp [ebasis, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im, CD.add_re, CD.add_im,
      Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im'])
