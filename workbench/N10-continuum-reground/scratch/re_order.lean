import Phys.Foundation.RationalTower
import Mathlib.Algebra.Order.Ring.Defs
import Mathlib.Tactic

/-! Scratch R1: the order on the derived ℕ (`Re`), from comparability. -/

namespace Phys.Foundation
namespace Re

/-- x + y = 0 over Re forces x = 0 (and y = 0): step is never void. -/
theorem add_eq_zero {a b : Re} (h : a + b = 0) : a = 0 ∧ b = 0 := by
  cases b with
  | void =>
    rw [add_void] at h; exact ⟨h, rfl⟩
  | step b' =>
    rw [add_step] at h
    exact absurd h (Re.step_ne_void _)

/-- THE ORDER on counting: `a ≤ b` iff `b` is `a` continued by some count. -/
protected def le (a b : Re) : Prop := ∃ c, b = a + c

instance : LE Re := ⟨Re.le⟩

theorem le_def {a b : Re} : a ≤ b ↔ ∃ c, b = a + c := Iff.rfl

protected theorem le_refl (a : Re) : a ≤ a := ⟨0, (add_void a).symm⟩

protected theorem le_trans {a b c : Re} (hab : a ≤ b) (hbc : b ≤ c) : a ≤ c := by
  obtain ⟨x, hx⟩ := hab
  obtain ⟨y, hy⟩ := hbc
  exact ⟨x + y, by rw [hy, hx, Re.add_assoc]⟩

protected theorem le_antisymm {a b : Re} (hab : a ≤ b) (hba : b ≤ a) : a = b := by
  obtain ⟨x, hx⟩ := hab
  obtain ⟨y, hy⟩ := hba
  -- a = a + x + y  ⟹  x + y = 0
  have : a + (x + y) = a + 0 := by rw [← Re.add_assoc, ← hx, ← hy, add_zero]
  have hxy : x + y = 0 := Re.add_left_cancel this
  rw [hx, (add_eq_zero hxy).1, add_zero]

protected theorem le_total (a b : Re) : a ≤ b ∨ b ≤ a := by
  rcases add_comparable a b with ⟨s, hs⟩ | ⟨s, hs⟩
  · exact Or.inl ⟨s, hs⟩
  · exact Or.inr ⟨s, hs⟩

noncomputable instance linearOrder : LinearOrder Re where
  le := Re.le
  le_refl := Re.le_refl
  le_trans := fun _ _ _ => Re.le_trans
  le_antisymm := fun _ _ => Re.le_antisymm
  le_total := Re.le_total
  toDecidableLE := Classical.decRel _

/-- 0 is the bottom. -/
theorem zero_le (a : Re) : 0 ≤ a := ⟨a, (void_add a).symm⟩

example : (0 : Re) ≤ 1 := zero_le 1

end Re
end Phys.Foundation
