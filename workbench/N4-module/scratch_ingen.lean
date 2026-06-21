import Phys.Algebra.Operator
import Mathlib.Tactic
import Mathlib.Algebra.Ring.Subring.Basic
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD

section Gen
variable {B : Type*} [CommRing B] [StarRing B]
def genSet : Set (AddMonoid.End (CD (CD B))) := {f | ∃ a : CD (CD B), star a = -a ∧ Lop a = f}
def gen : Subring (AddMonoid.End (CD (CD B))) := Subring.closure genSet
theorem Lop_mem_gen (a : CD (CD B)) (ha : star a = -a) : Lop a ∈ gen := Subring.subset_closure ⟨a, ha, rfl⟩

-- membership of the anticommutator-value
theorem anticomm_val_mem (a b : CD (CD B)) (ha : star a = -a) (hb : star b = -b) :
    - Lop (iota (bilin a b)) ∈ gen (B := B) := by
  rw [← clifford_op a b ha hb]
  exact Subring.add_mem _ (Subring.mul_mem _ (Lop_mem_gen a ha) (Lop_mem_gen b hb))
    (Subring.mul_mem _ (Lop_mem_gen b hb) (Lop_mem_gen a ha))

-- in-gen Clifford relation
theorem clifford_in_gen (a b : CD (CD B)) (ha : star a = -a) (hb : star b = -b) :
    (⟨Lop a, Lop_mem_gen a ha⟩ : gen) * ⟨Lop b, Lop_mem_gen b hb⟩
      + ⟨Lop b, Lop_mem_gen b hb⟩ * ⟨Lop a, Lop_mem_gen a ha⟩
      = ⟨- Lop (iota (bilin a b)), anticomm_val_mem a b ha hb⟩ := by
  apply Subtype.ext
  show Lop a * Lop b + Lop b * Lop a = - Lop (iota (bilin a b))
  exact clifford_op a b ha hb
end Gen
