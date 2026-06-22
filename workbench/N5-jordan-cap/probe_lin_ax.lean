import Phys.Algebra.JordanTower
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Tactic

namespace ProbeLinAx
open Phys.Algebra
open Matrix

variable {S : Type*} [NonAssocRing S] {n : ℕ}

theorem jb_add_right (A B C : Matrix (Fin n) (Fin n) S) :
    jb A (B + C) = jb A B + jb A C := by
  unfold jb; simp [Matrix.mul_add, Matrix.add_mul]; abel

theorem jb_add_left (A B C : Matrix (Fin n) (Fin n) S) :
    jb (A + B) C = jb A C + jb B C := by
  unfold jb; simp [Matrix.mul_add, Matrix.add_mul]; abel

theorem jdef_add_right (A B C : Matrix (Fin n) (Fin n) S) :
    jdef A (B + C) = jdef A B + jdef A C := by
  unfold jdef
  rw [jb_add_right A B C, jb_add_left (jb A B) (jb A C) (jb A A),
      jb_add_left B C (jb A A),
      jb_add_right A (jb B (jb A A)) (jb C (jb A A))]
  abel

end ProbeLinAx

#print axioms ProbeLinAx.jb_add_right
#print axioms ProbeLinAx.jb_add_left
#print axioms ProbeLinAx.jdef_add_right
