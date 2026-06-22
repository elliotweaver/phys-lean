import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Matrix

namespace ScratchDiag
attribute [local instance] CD.narCD CD.srCD

def jbr {S : Type*} [NonAssocRing S] {n : ℕ}
    (A B : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S := A * B + B * A
def jdefr {S : Type*} [NonAssocRing S] {n : ℕ}
    (A B : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S :=
  jbr (jbr A B) (jbr A A) - jbr A (jbr B (jbr A A))

def ocR (r : ℚ) : O ℚ := ⟨⟨⟨r,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩

-- centrality bricks
theorem ocR_comm (r : ℚ) (x : O ℚ) : ocR r * x = x * ocR r := by
  ext <;> simp only [ocR, mul_re, mul_im, star_re, star_im, star_zero,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re, Dbl.zero_im,
    mul_zero, zero_mul, mul_comm] <;> ring
theorem ocR_assocL (r : ℚ) (x y : O ℚ) : ocR r * (x * y) = (ocR r * x) * y := by
  ext <;> simp only [ocR, mul_re, mul_im, star_re, star_im, star_zero,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re, Dbl.zero_im,
    mul_zero, zero_mul] <;> ring
theorem ocR_assocM (r : ℚ) (x y : O ℚ) : x * (ocR r * y) = (x * ocR r) * y := by
  ext <;> simp only [ocR, mul_re, mul_im, star_re, star_im, star_zero,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re, Dbl.zero_im,
    mul_zero, zero_mul] <;> ring
theorem ocR_assocR (r : ℚ) (x y : O ℚ) : x * (y * ocR r) = (x * y) * ocR r := by
  ext <;> simp only [ocR, mul_re, mul_im, star_re, star_im, star_zero,
    Dbl.mul_re, Dbl.mul_im, Dbl.star_re', Dbl.star_im', Dbl.zero_re, Dbl.zero_im,
    mul_zero, zero_mul] <;> ring

-- diagonal real matrix
def Adiag (a0 a1 a2 : ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  !![ocR a0, 0, 0; 0, ocR a1, 0; 0, 0, ocR a2]

set_option maxHeartbeats 8000000 in
-- The H_3 Jordan identity for A = real diagonal, B ARBITRARY (opaque entries).
example (a0 a1 a2 : ℚ) (B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    jdefr (Adiag a0 a1 a2) B = 0 := by
  unfold jdefr jbr Adiag
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_three,
      Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.head_cons, Matrix.cons_val_fin_one, Matrix.cons_val, Matrix.empty_val',
      Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_fin_const, Matrix.zero_apply,
      mul_zero, zero_mul, add_zero, zero_add] <;>
    sorry

end ScratchDiag
