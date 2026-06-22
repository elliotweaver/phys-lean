/- PROBE (run 50): is jdef LINEAR/additive in its 2nd argument B, cheaply + structurally
   (no coordinate expansion)? jb(A,B)=A*B+B*A is additive in B; jb(A,A) is constant in B;
   so jdef(A, ·) is additive. If provable by `simp [jdef, jb, mul_add, add_mul]` + abel-style
   matrix algebra, it is the lever for the central-diagonal reduction. MEASURE. -/
import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Tactic

namespace ProbeLin
open Phys.Algebra
open Matrix

variable {S : Type*} [NonAssocRing S] {n : ℕ}

-- additivity of the bracket in the 2nd arg (cheap):
theorem jb_add_right (A B C : Matrix (Fin n) (Fin n) S) :
    jb A (B + C) = jb A B + jb A C := by
  unfold jb; simp [Matrix.mul_add, Matrix.add_mul]; abel

theorem jb_add_left (A B C : Matrix (Fin n) (Fin n) S) :
    jb (A + B) C = jb A C + jb B C := by
  unfold jb; simp [Matrix.mul_add, Matrix.add_mul]; abel

-- additivity of jdef in B:
theorem jdef_add_right (A B C : Matrix (Fin n) (Fin n) S) :
    jdef A (B + C) = jdef A B + jdef A C := by
  unfold jdef
  rw [jb_add_right A B C, jb_add_left (jb A B) (jb A C) (jb A A),
      jb_add_left B C (jb A A),
      jb_add_right A (jb B (jb A A)) (jb C (jb A A))]
  abel

end ProbeLin
