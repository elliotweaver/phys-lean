/-
  SCRATCH — N8: Re-as-CommSemiring (the ℕ semiring on the derived counting tower).
  Test add/mul + laws + the CommSemiring instance compile cheaply before production.
-/
import Phys.Foundation.Counting
import Mathlib.Algebra.Ring.Defs
import Mathlib.Tactic

namespace Phys.Foundation
namespace Re

/-- Addition: iterate `step` of the second argument onto the first. -/
def add : Re → Re → Re
  | a, void    => a
  | a, step b  => step (add a b)

instance : Add Re := ⟨add⟩

@[simp] theorem add_void (a : Re) : a + void = a := rfl
@[simp] theorem add_step (a b : Re) : a + step b = step (a + b) := rfl

@[simp] theorem void_add (a : Re) : void + a = a := by
  induction a with
  | void => rfl
  | step k ih => rw [add_step, ih]

theorem step_add (a b : Re) : step a + b = step (a + b) := by
  induction b with
  | void => rfl
  | step k ih => rw [add_step, add_step, ih]

theorem add_comm (a b : Re) : a + b = b + a := by
  induction b with
  | void => rw [add_void, void_add]
  | step k ih => rw [add_step, step_add, ih]

theorem add_assoc (a b c : Re) : a + b + c = a + (b + c) := by
  induction c with
  | void => rfl
  | step k ih => rw [add_step, add_step, add_step, ih]

theorem add_right_cancel {a b c : Re} (h : a + c = b + c) : a = b := by
  induction c with
  | void => simpa using h
  | step k ih => exact ih (step_inj (by simpa using h))

theorem add_left_cancel {a b c : Re} (h : a + b = a + c) : b = c :=
  add_right_cancel (by rw [add_comm b a, add_comm c a]; exact h)

end Re
end Phys.Foundation
