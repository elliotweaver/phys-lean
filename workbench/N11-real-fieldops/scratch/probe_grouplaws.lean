import Phys.Foundation.ContinuumDerived
import Mathlib.Tactic
import Mathlib.Algebra.Order.Archimedean.Basic

namespace Phys.Foundation
open Phys.Foundation

namespace ContinuumQ
open ContinuumQ

-- Stub the banked-from-probe_add defs as `sorry`-free copies for group-law probing.
def addS (x y : Cut) (q : Q) : Prop := ∃ a b, x.S a ∧ y.S b ∧ q = a + b
axiom addGather (x y : Cut) : IsGather (addS x y)
noncomputable instance : Add Cut := ⟨fun x y => ⟨addS x y, addGather x y⟩⟩
theorem add_S (x y : Cut) (q : Q) : (x + y).S q ↔ ∃ a b, x.S a ∧ y.S b ∧ q = a + b := Iff.rfl
noncomputable instance : Zero Cut := ⟨Qcut 0⟩
theorem zero_S (q : Q) : (0 : Cut).S q ↔ q < 0 := Iff.rfl

-- Probe the group laws (commutative monoid part) structurally.
theorem add_comm' (x y : Cut) : x + y = y + x := by
  apply Cut.ext'; intro q
  rw [add_S, add_S]
  constructor
  · rintro ⟨a, b, ha, hb, hq⟩; exact ⟨b, a, hb, ha, by rw [hq]; ring⟩
  · rintro ⟨a, b, ha, hb, hq⟩; exact ⟨b, a, hb, ha, by rw [hq]; ring⟩

theorem add_assoc' (x y z : Cut) : x + y + z = x + (y + z) := by
  apply Cut.ext'; intro q
  rw [add_S, add_S]
  constructor
  · rintro ⟨ab, c, hab, hc, hq⟩
    rw [add_S] at hab
    obtain ⟨a, b, ha, hb, hab'⟩ := hab
    exact ⟨a, b + c, ha, ⟨b, c, hb, hc, rfl⟩, by rw [hq, hab']; ring⟩
  · rintro ⟨a, bc, ha, hbc, hq⟩
    rw [add_S] at hbc
    obtain ⟨b, c, hb, hc, hbc'⟩ := hbc
    exact ⟨a + b, c, ⟨a, b, ha, hb, rfl⟩, hc, by rw [hq, hbc']; ring⟩

theorem zero_add' (x : Cut) : 0 + x = x := by
  apply Cut.ext'; intro q
  rw [add_S]
  constructor
  · rintro ⟨a, b, ha, hb, hq⟩
    rw [zero_S] at ha
    apply x.isG.down hb
    rw [hq]; linarith
  · intro hq
    obtain ⟨b, hb, hqb⟩ := x.isG.nomax q hq
    exact ⟨q - b, b, by rw [zero_S]; linarith, hb, by ring⟩

theorem add_zero' (x : Cut) : x + 0 = x := by rw [add_comm']; exact zero_add' x

#check @add_assoc'
#check @add_comm'
#check @zero_add'
#check @add_zero'

end ContinuumQ
end Phys.Foundation
