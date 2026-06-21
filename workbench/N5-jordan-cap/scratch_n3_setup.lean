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

-- symbolic octonion over ℚ from 8 free rationals
def oc (a b c d e f g h : ℚ) : O ℚ := ⟨⟨⟨a,b⟩,⟨c,d⟩⟩,⟨⟨e,f⟩,⟨g,h⟩⟩⟩

-- symbolic Hermitian 3x3: diagonal real (scalar), off-diagonal octonion + conj.
-- Test ONE coordinate of jdef = 0 for symbolic X, Y.
set_option maxHeartbeats 8000000 in
example
  (d0 d1 d2 : ℚ)                       -- X diagonal reals
  (x01a x01b x01c x01d x01e x01f x01g x01h : ℚ)  -- X[0][1]
  (x02a x02b x02c x02d x02e x02f x02g x02h : ℚ)  -- X[0][2]
  (x12a x12b x12c x12d x12e x12f x12g x12h : ℚ)  -- X[1][2]
  (e0 e1 e2 : ℚ)                       -- Y diagonal reals
  (y01a y01b y01c y01d y01e y01f y01g y01h : ℚ)
  (y02a y02b y02c y02d y02e y02f y02g y02h : ℚ)
  (y12a y12b y12c y12d y12e y12f y12g y12h : ℚ)
  : True := by
  -- placeholder; build matrices below
  trivial
