import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Matrix

namespace ScratchSlice
attribute [local instance] CD.narCD CD.srCD

-- central scalar centrality bricks on O Q for ocR-style reals
-- diagonal-A slice: A = diag(ocR a0, ocR a1, ocR a2), B general Hermitian (opaque octonions)
-- test: jdef A B 0 0 = 0  (one diagonal entry), abstract opaque B entries.

def ocR (r : ℚ) : O ℚ := ⟨⟨⟨r,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩

-- centrality bricks (cheap?)
set_option maxHeartbeats 2000000 in
theorem ocR_comm (r : ℚ) (x : O ℚ) : ocR r * x = x * ocR r := by
  ext <;> simp only [ocR, mul_re, mul_im, star_re, star_im, star_zero,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re, Dbl.zero_im,
    mul_zero, zero_mul, mul_comm] <;> ring

set_option maxHeartbeats 2000000 in
theorem ocR_assocL (r : ℚ) (x y : O ℚ) : ocR r * (x * y) = (ocR r * x) * y := by
  ext <;> simp only [ocR, mul_re, mul_im, star_re, star_im, star_zero,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re, Dbl.zero_im,
    mul_zero, zero_mul] <;> ring

end ScratchSlice
