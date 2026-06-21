import Phys.Algebra.Operator
import Mathlib.Data.Matrix.Basic
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fin.VecNotation
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Matrix

attribute [local instance] CD.narCD CD.srCD

-- The symmetric (Jordan) bracket and the Jordan-identity defect, over any
-- NonAssocRing entry type (works for O ℚ and for any Ring).
section Defs
variable {S : Type*} [NonAssocRing S] {n : ℕ}
def jbr (A B : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S := A * B + B * A
def jdef (A B : Matrix (Fin n) (Fin n) S) : Matrix (Fin n) (Fin n) S :=
  jbr (jbr A B) (jbr A A) - jbr A (jbr B (jbr A A))
end Defs

-- PIECE A: over a genuine Ring, jbr is Jordan (defect = 0) for ALL n.
-- Matrix over a Ring is a Ring (associative), so jbr Jordan via noncomm_ring.
section RingCase
variable {S : Type*} [Ring S] {n : ℕ}
example (A B : Matrix (Fin n) (Fin n) S) : jdef A B = 0 := by
  unfold jdef jbr
  noncomm_ring
end RingCase
