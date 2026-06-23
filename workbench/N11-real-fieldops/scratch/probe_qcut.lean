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

-- Qcut additivity: the embedding ℚ ↪ Cut is an additive hom (non-vacuity anchor).
theorem Qcut_add (a b : Q) : Qcut a + Qcut b = Qcut (a + b) := by
  apply Cut.ext'; intro q
  rw [add_S]
  show (∃ s t, s < a ∧ t < b ∧ q = s + t) ↔ q < a + b
  constructor
  · rintro ⟨s, t, hs, ht, hq⟩; rw [hq]; linarith
  · intro hq
    refine ⟨a - (a + b - q)/2, b - (a + b - q)/2, by linarith, by linarith, by ring⟩

#check @Qcut_add
end ContinuumQ
end Phys.Foundation
