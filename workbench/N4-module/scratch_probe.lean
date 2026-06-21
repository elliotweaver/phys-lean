import Phys.Algebra.Operator
import Mathlib.Tactic
import Mathlib.Algebra.Ring.Subring.Basic

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD

section Probe
variable {B : Type*} [CommRing B] [StarRing B]

-- generic Lop_one
example : Lop (1 : CD (CD B)) = 1 := by
  apply AddMonoidHom.ext; intro y; show (1 : CD (CD B)) * y = y; exact one_mul y

-- (1) generic unit-square
example (a : CD (CD B)) (ha : star a = -a) (hN : Nrm a = 1) :
    Lop a * Lop a = -1 := by
  have hone : Lop (1 : CD (CD B)) = 1 := by
    apply AddMonoidHom.ext; intro y; show (1 : CD (CD B)) * y = y; exact one_mul y
  rw [L_sq_op a ha, hN]
  have : (iota (1 : CD B) : CD (CD B)) = 1 := by ext <;> simp [iota]
  rw [this, hone]

-- (2) generic orthogonal anticommute
example (a b : CD (CD B)) (ha : star a = -a) (hb : star b = -b) (hbil : bilin a b = 0) :
    Lop a * Lop b + Lop b * Lop a = 0 := by
  rw [clifford_op a b ha hb, hbil]
  have : (iota (0 : CD B) : CD (CD B)) = 0 := by ext <;> simp [iota]
  rw [this]
  have h0 : Lop (0 : CD (CD B)) = 0 := by
    apply AddMonoidHom.ext; intro y; show (0 : CD (CD B)) * y = 0
    ext <;> simp
  rw [h0, neg_zero]

end Probe

section GenProbe
variable {M : Type*} [AddCommGroup M]

noncomputable example (S : Set (AddMonoid.End M)) : Subring (AddMonoid.End M) :=
  Subring.closure S

example (S : Subring (AddMonoid.End M)) : Module S M :=
  Module.compHom M S.subtype

example (S : Set (AddMonoid.End M)) (f : AddMonoid.End M) (hf : f ∈ S) :
    f ∈ Subring.closure S := Subring.subset_closure hf

example (S : Subring (AddMonoid.End M)) (f : S) (y : M) :
    (haveI := Module.compHom M S.subtype; (f • y : M)) = (f : AddMonoid.End M) y := by
  rfl
end GenProbe
