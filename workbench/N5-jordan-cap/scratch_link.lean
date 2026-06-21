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

-- jordan over a genuine Ring, all n
section RingCase
variable {S : Type*} [Ring S] {n : ℕ}
theorem jordan_of_ring (A B : Matrix (Fin n) (Fin n) S) : jdef A B = 0 := by
  unfold jdef jbr; noncomm_ring
end RingCase

-- THE LINK TEST: from a pointwise associativity hypothesis on O ℚ, build a Ring
-- instance and conclude jdef = 0 for 4×4.  If this compiles, the n=4 failure
-- DERIVES not_associative (one cause).
section LinkTest
variable {B : Type*} [CommRing B] [StarRing B]

example (hassoc : ∀ x y z : CD (CD B), x * y * z = x * (y * z))
    (A C : Matrix (Fin 4) (Fin 4) (CD (CD B))) : jdef A C = 0 := by
  letI : Ring (CD (CD B)) := { CD.narCD with mul_assoc := hassoc }
  exact jordan_of_ring A C
end LinkTest
