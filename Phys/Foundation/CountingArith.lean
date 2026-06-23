/-
  Phys.Foundation.CountingArith — THE NUMBER TOWER, rung 0+: ℕ's ARITHMETIC on the
  derived counting tower `Re`.
  ===========================================================================
  N7 (`Phys/Foundation/Counting.lean`) derived the CONTENT ℕ as the fold's own
  RE-ENTRY: the carrier `Re` (`void | step`), the Peano laws, and the universal
  property `iterate_unique` (`Re` IS the natural number object). This file equips
  that derived `Re` with its ARITHMETIC — addition and multiplication — and proves
  the COMMUTATIVE-SEMIRING laws as THEOREMS, with NO
  `import Mathlib.Data.{Nat,Int,Rat,Real,Complex}` as content. It is the structural
  prerequisite for rung 1 (ℤ, `Phys/Foundation/IntegerTower.lean`): one cannot
  group-complete `(Re, +)` to the integers without first having `(Re, +, ·)` as a
  semiring.

  ── THE THEORY-NATIVE PICTURE (read OUT of the math; §2 below) ──
  Counting is re-entry (N7). ADDING two counts is continuing the re-entry of one by
  the depth of the other — iterate `step` of the second tower onto the first
  (`add a (step b) = step (add a b)`); this is `Re.iterate`-style recursion, the
  banked recursor. MULTIPLYING is iterated addition (`mul a (step b) = mul a b + a`):
  the count `a` re-entered `b` times. Both are the SAME re-entry act applied to
  counts rather than to the bare distinction; the commutative-semiring laws are then
  forced theorems about the free structure on one generating re-entry.

  ── WHAT THIS BANKS ──
    Re.add, Re.mul, Re.one          — the arithmetic of counting (recursion on `step`).
    add_void/add_step/void_add/...  — the defining/forced reduction rules.
    Re.add_comm, Re.add_assoc       — `(Re, +)` is a commutative monoid.
    Re.add_right_cancel             — ★ CANCELLATION: counting is cancellative, the
                                      exact property the group completion (ℤ) needs for
                                      its relation to be transitive and its embedding
                                      injective.
    Re.mul_comm/assoc, distrib, ...  — `(Re, +, ·)` is a commutative semiring.
    Re.commSemiring                 — ★ THE INSTANCE: the derived ℕ as a CommSemiring.
                                      This makes the metalanguage tactic `ring`
                                      available ON the derived counts, so every
                                      downstream ℤ obligation reduces to a `Re`-semiring
                                      identity — Mathlib's `ring` as PROOF MACHINERY on
                                      the DERIVED object, never Mathlib's `Nat` as content.

  ── CONTENT vs. METALANGUAGE (STANDARD §3) ──
  The OBJECT every result here is ABOUT is `Re` — the derived counting tower. The
  CommSemiring typeclass and the `ring` tactic are Mathlib MACHINERY operating on that
  derived object (the metalanguage), exactly as permitted. NO Mathlib number system
  (`Nat`/`Int`/…) appears as content in any statement.

  §2. PHYSICS-WORDS-REMOVABLE (STANDARD §2). Delete "fold / re-entry / counting /
  distinction": what remains is the free commutative semiring on one generator — the
  arithmetic of the natural number object — with every law proved by induction. No
  theorem STATEMENT needs a trunk or physics word to be true.

  Foundations-only: no posited axiom, no sorry, no kernel-trust bypass, no bridge,
  NO Mathlib number-system import as content.
-/
import Phys.Foundation.Counting
import Mathlib.Algebra.Ring.Defs
import Mathlib.Tactic

namespace Phys.Foundation
namespace Re

/-! ## Addition — continuing the re-entry of one count by the depth of another. -/

/-- ADDITION: iterate `step` of the second count onto the first. `a + void = a`
    (adding nothing), `a + step b = step (a + b)` (one more re-entry). -/
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

protected theorem add_comm (a b : Re) : a + b = b + a := by
  induction b with
  | void => rw [add_void, void_add]
  | step k ih => rw [add_step, step_add, ih]

protected theorem add_assoc (a b c : Re) : a + b + c = a + (b + c) := by
  induction c with
  | void => rfl
  | step k ih => rw [add_step, add_step, add_step, ih]

/-! ## Multiplication — the count re-entered as many times as another. -/

/-- THE UNIT COUNT: one re-entry of the void. -/
def one : Re := step void

/-- MULTIPLICATION: iterated addition. `a * void = void`, `a * step b = a * b + a`
    (one more copy of `a`). -/
def mul : Re → Re → Re
  | _, void   => void
  | a, step b => mul a b + a

instance : Mul Re := ⟨mul⟩
instance : One Re := ⟨one⟩
instance : Zero Re := ⟨void⟩

@[simp] theorem mul_void (a : Re) : a * void = void := rfl
@[simp] theorem mul_step (a b : Re) : a * step b = a * b + a := rfl

@[simp] theorem void_mul (a : Re) : void * a = void := by
  induction a with
  | void => rfl
  | step k ih => rw [mul_step, ih, add_void]

theorem step_mul (a b : Re) : step a * b = a * b + b := by
  induction b with
  | void => rfl
  | step k ih =>
    rw [mul_step, mul_step, ih, add_step, add_step, Re.add_assoc, Re.add_assoc,
        Re.add_comm a k]

protected theorem left_distrib (a b c : Re) : a * (b + c) = a * b + a * c := by
  induction c with
  | void => rw [add_void, mul_void, add_void]
  | step k ih => rw [add_step, mul_step, mul_step, ih, Re.add_assoc]

protected theorem mul_comm (a b : Re) : a * b = b * a := by
  induction b with
  | void => rw [mul_void, void_mul]
  | step k ih => rw [mul_step, step_mul, ih]

protected theorem right_distrib (a b c : Re) : (a + b) * c = a * c + b * c := by
  rw [Re.mul_comm, Re.left_distrib, Re.mul_comm c a, Re.mul_comm c b]

protected theorem mul_assoc (a b c : Re) : a * b * c = a * (b * c) := by
  induction c with
  | void => rw [mul_void, mul_void, mul_void]
  | step k ih => rw [mul_step, mul_step, Re.left_distrib, ih]

protected theorem one_mul (a : Re) : 1 * a = a := by
  show one * a = a
  unfold one
  rw [step_mul, void_mul, void_add]

protected theorem mul_one (a : Re) : a * 1 = a := by
  show a * one = a
  unfold one
  rw [mul_step, mul_void, void_add]

/-! ## Cancellation — the property the group completion (ℤ) is built on. -/

/-- ★ COUNTING IS CANCELLATIVE: `a + c = b + c → a = b`. Proved by induction using
    `step_inj` (re-entry is injective, N7). This is EXACTLY what makes the
    Grothendieck relation on `Re × Re` transitive and the embedding `Re ↪ ℤ`
    injective — the structural bridge into rung 1. -/
theorem add_right_cancel {a b c : Re} (h : a + c = b + c) : a = b := by
  induction c with
  | void => simpa using h
  | step k ih => exact ih (step_inj (by simpa using h))

theorem add_left_cancel {a b c : Re} (h : a + b = a + c) : b = c :=
  add_right_cancel (by rw [Re.add_comm b a, Re.add_comm c a]; exact h)

/-- ★ THE DERIVED ℕ AS A COMMUTATIVE SEMIRING. The free structure on one generating
    re-entry carries `(+, ·, 0, 1)` with all the commutative-semiring laws — each a
    theorem above. With this instance the metalanguage tactic `ring` operates on the
    DERIVED counts, the machinery every downstream rung reduces to. -/
instance commSemiring : CommSemiring Re where
  add := add
  add_assoc := Re.add_assoc
  zero := void
  zero_add := void_add
  add_zero := add_void
  add_comm := Re.add_comm
  mul := mul
  mul_assoc := Re.mul_assoc
  one := one
  one_mul := Re.one_mul
  mul_one := Re.mul_one
  left_distrib := Re.left_distrib
  right_distrib := Re.right_distrib
  zero_mul := void_mul
  mul_zero := mul_void
  mul_comm := Re.mul_comm
  nsmul := nsmulRec

end Re
end Phys.Foundation
