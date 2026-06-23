import Phys.Foundation.ContinuumDerived
import Mathlib.Tactic
import Mathlib.Algebra.Order.Archimedean.Basic

namespace Phys.Foundation
open Phys.Foundation
namespace ContinuumQ
open ContinuumQ

def addS (x y : Cut) (q : Q) : Prop := ∃ a b, x.S a ∧ y.S b ∧ q = a + b
axiom addGather (x y : Cut) : IsGather (addS x y)
noncomputable instance : Add Cut := ⟨fun x y => ⟨addS x y, addGather x y⟩⟩
theorem add_S (x y : Cut) (q : Q) : (x + y).S q ↔ ∃ a b, x.S a ∧ y.S b ∧ q = a + b := Iff.rfl
noncomputable instance : Zero Cut := ⟨Qcut 0⟩
def negS (x : Cut) (q : Q) : Prop := ∃ r, q < -r ∧ ¬ x.S r
axiom negGather (x : Cut) : IsGather (negS x)
noncomputable instance : Neg Cut := ⟨fun x => ⟨negS x, negGather x⟩⟩
axiom add_assoc' (x y z : Cut) : x + y + z = x + (y + z)
axiom add_comm' (x y : Cut) : x + y = y + x
axiom zero_add' (x : Cut) : 0 + x = x
axiom add_zero' (x : Cut) : x + 0 = x
axiom add_neg_self (x : Cut) : x + (-x) = 0

-- Probe: AddCommGroup assembly
noncomputable instance addCommGroup : AddCommGroup Cut where
  add := (· + ·)
  add_assoc := add_assoc'
  zero := 0
  zero_add := zero_add'
  add_zero := add_zero'
  neg := (- ·)
  add_comm := add_comm'
  nsmul := nsmulRec
  zsmul := zsmulRec
  neg_add_cancel := fun x => by rw [add_comm']; exact add_neg_self x

-- Probe: LinearOrder alongside the banked PartialOrder. Does diamond resolve?
noncomputable instance linearOrder : LinearOrder Cut where
  le := Cut.le
  lt := fun x y => x ≤ y ∧ ¬ y ≤ x
  le_refl := Cut.le_refl
  le_trans := fun _ _ _ => Cut.le_trans'
  le_antisymm := fun _ _ => Cut.le_antisymm'
  le_total := Cut.le_total
  lt_iff_le_not_ge := fun _ _ => Iff.rfl
  toDecidableLE := Classical.decRel _

-- Probe: order compatibility (add_le_add_left).
theorem add_le_add_right' (a b : Cut) (h : a ≤ b) (c : Cut) : a + c ≤ b + c := by
  rw [Cut.le_def]
  intro q hq
  rw [add_S] at hq ⊢
  obtain ⟨u, v, hu, hv, hq'⟩ := hq
  exact ⟨u, v, h u hu, hv, hq'⟩

noncomputable instance : IsOrderedAddMonoid Cut where
  add_le_add_left := fun a b h c => add_le_add_right' a b h c

#check (inferInstance : AddCommGroup Cut)
#check (inferInstance : LinearOrder Cut)
#check (inferInstance : IsOrderedAddMonoid Cut)
#check (inferInstance : PartialOrder Cut)

end ContinuumQ
end Phys.Foundation
