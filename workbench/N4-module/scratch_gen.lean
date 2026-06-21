import Phys.Algebra.Operator
import Mathlib.Tactic
import Mathlib.Algebra.Ring.Subring.Basic
open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
attribute [local instance] CD.narCD CD.srCD

section Gen
variable {B : Type*} [CommRing B] [StarRing B]

-- the set of imaginary left-multiplications
def genSet : Set (AddMonoid.End (CD (CD B))) :=
  {f | ∃ a : CD (CD B), star a = -a ∧ Lop a = f}

-- the generated unital associative subring
def gen : Subring (AddMonoid.End (CD (CD B))) := Subring.closure genSet

-- generators are in gen
theorem Lop_mem_gen (a : CD (CD B)) (ha : star a = -a) : Lop a ∈ gen :=
  Subring.subset_closure ⟨a, ha, rfl⟩

-- module structure over the generated subring
noncomputable def genModule : Module (gen (B := B)) (CD (CD B)) :=
  Module.compHom _ (gen (B := B)).subtype

-- the action is application = left multiplication
theorem gen_smul (g : gen (B := B)) (y : CD (CD B)) :
    (letI := genModule (B := B); (g • y : CD (CD B))) = (g : AddMonoid.End (CD (CD B))) y := rfl

-- action of a generator recovers octonion left-mult
theorem gen_smul_Lop (a : CD (CD B)) (ha : star a = -a) (y : CD (CD B)) :
    (letI := genModule (B := B); ((⟨Lop a, Lop_mem_gen a ha⟩ : gen) • y : CD (CD B))) = a * y := rfl

end Gen
