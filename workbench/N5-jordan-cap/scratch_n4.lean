import Phys.Algebra.Operator
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Matrix

attribute [local instance] CD.narCD CD.srCD

section Defs
variable {S : Type*} [NonAssocRing S] {n : ℕ}
def jbr (A B : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S := A * B + B * A
def jdef (A B : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S :=
  jbr (jbr A B) (jbr A A) - jbr A (jbr B (jbr A A))
end Defs

-- the three entry octonions
noncomputable def a1 : O ℚ := CD.iota (ιJ ℚ)          -- e1
noncomputable def a2 : O ℚ := CD.iota (CD.e2 : H ℚ)   -- e2
noncomputable def a4 : O ℚ := (CD.e2 : O ℚ)           -- e4

-- X = E01(a1)+E02(a2) hermitian, Y = E13(a4) hermitian, in H_4(O ℚ).
-- Build with !![ ] matrix notation (4x4).
noncomputable def Xw : Matrix (Fin 4) (Fin 4) (O ℚ) :=
  !![0, a1, a2, 0;
     star a1, 0, 0, 0;
     star a2, 0, 0, 0;
     0, 0, 0, 0]
noncomputable def Yw : Matrix (Fin 4) (Fin 4) (O ℚ) :=
  !![0, 0, 0, 0;
     0, 0, 0, a4;
     0, 0, 0, 0;
     0, star a4, 0, 0]

-- Can we evaluate the (0,3) defect entry and show it is nonzero?
example : jdef Xw Yw 0 3 ≠ 0 := by
  unfold jdef jbr Xw Yw a1 a2 a4
  simp only [Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply, Fin.sum_univ_four,
    Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.head_fin_const, Matrix.cons_val_fin_one, Matrix.cons_val,
    Matrix.empty_val', Matrix.cons_val_three]
  sorry
