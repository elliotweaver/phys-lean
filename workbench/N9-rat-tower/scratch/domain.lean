import Phys.Foundation.IntegerTower
import Mathlib.Algebra.Ring.Defs
import Mathlib.Tactic

namespace Phys.Foundation
namespace Re

-- Re has no zero divisors: product of two nonzero counts is nonzero.
theorem mul_ne_zero' {a b : Re} (ha : a ≠ 0) (hb : b ≠ 0) : a * b ≠ 0 := by
  cases b with
  | void => exact (hb rfl).elim
  | step b' =>
    cases a with
    | void => exact (ha rfl).elim
    | step a' =>
      rw [mul_step, add_step]
      exact Re.step_ne_void _

-- Counting is linearly comparable: any two counts differ by a count on one side.
theorem add_comparable (a b : Re) : (∃ s, b = a + s) ∨ (∃ s, a = b + s) := by
  induction a with
  | void => left; exact ⟨b, by rw [void_add]⟩
  | step a' ih =>
    cases ih with
    | inl h =>
      obtain ⟨s, hs⟩ := h
      cases s with
      | void =>
        right; refine ⟨step void, ?_⟩
        rw [hs, add_void, add_step, add_void]
      | step s' =>
        left; refine ⟨s', ?_⟩
        rw [hs, step_add, add_step]
    | inr h =>
      obtain ⟨s, hs⟩ := h
      right; refine ⟨step s, ?_⟩
      rw [hs, add_step]

theorem sub_exists_of_ne {a b : Re} (h : a ≠ b) :
    (∃ s, s ≠ 0 ∧ b = a + s) ∨ (∃ s, s ≠ 0 ∧ a = b + s) := by
  cases add_comparable a b with
  | inl hc =>
    obtain ⟨s, hs⟩ := hc
    left; refine ⟨s, ?_, hs⟩
    rintro rfl; rw [add_zero] at hs; exact h hs.symm
  | inr hc =>
    obtain ⟨s, hs⟩ := hc
    right; refine ⟨s, ?_, hs⟩
    rintro rfl; rw [add_zero] at hs; exact h hs

/-- From `x = x + y` over `Re` (cancellative), `y = 0`. -/
theorem add_cancel_zero {x y : Re} (h : x = x + y) : y = 0 := by
  have h2 : x + 0 = x + y := by rwa [add_zero]
  exact (Re.add_left_cancel h2).symm

-- The cross-product parity = Z-zero-divisor-freeness over Re.
theorem mul_cross_ne {a b c d : Re} (hab : a ≠ b) (hcd : c ≠ d) :
    a * c + b * d ≠ a * d + b * c := by
  rcases sub_exists_of_ne hab with ⟨s, hs, rfl⟩ | ⟨s, hs, rfl⟩
  · rcases sub_exists_of_ne hcd with ⟨t, ht, rfl⟩ | ⟨t, ht, rfl⟩
    · -- b = a+s, d = c+t :  LHS = RHS + s*t
      intro heq
      have hr : a*c + (a+s)*(c+t) = (a*(c+t) + (a+s)*c) + s*t := by ring
      rw [heq] at hr
      exact mul_ne_zero' hs ht (add_cancel_zero hr)
    · -- b = a+s, c = d+t :  RHS = LHS + s*t
      intro heq
      have hr : a*d + (a+s)*(d+t) = (a*(d+t) + (a+s)*d) + s*t := by ring
      rw [← heq] at hr
      exact mul_ne_zero' hs ht (add_cancel_zero hr)
  · rcases sub_exists_of_ne hcd with ⟨t, ht, rfl⟩ | ⟨t, ht, rfl⟩
    · -- a = b+s, d = c+t :  RHS = LHS + s*t
      intro heq
      have hr : (b+s)*(c+t) + b*c = ((b+s)*c + b*(c+t)) + s*t := by ring
      rw [← heq] at hr
      exact mul_ne_zero' hs ht (add_cancel_zero hr)
    · -- a = b+s, c = d+t :  LHS = RHS + s*t
      intro heq
      have hr : (b+s)*(d+t) + b*d = ((b+s)*d + b*(d+t)) + s*t := by ring
      rw [heq] at hr
      exact mul_ne_zero' hs ht (add_cancel_zero hr)

end Re

namespace Z

/-- `mk a b = 0 ↔ a = b` over `Re`. -/
theorem mk_eq_zero {a b : Re} : mk a b = 0 ↔ a = b := by
  rw [zero_def, mk_eq, add_zero, zero_add]

/-- `(1 : Z) ≠ (0 : Z)` — the count-1 differs from the void. -/
theorem one_ne_zero' : (1 : Z) ≠ (0 : Z) := by
  rw [one_def]
  intro h
  rw [mk_eq_zero] at h
  exact Re.step_ne_void Re.void h

instance : Nontrivial Z := ⟨1, 0, one_ne_zero'⟩

instance : NoZeroDivisors Z where
  eq_zero_or_eq_zero_of_mul_eq_zero := by
    intro x y
    refine Z.ind (fun a b => ?_) x
    refine Z.ind (fun c d => ?_) y
    intro hxy
    rw [mk_mul_mk, mk_eq_zero] at hxy
    by_contra hcon
    push_neg at hcon
    obtain ⟨hx, hy⟩ := hcon
    exact Re.mul_cross_ne ((not_congr mk_eq_zero).mp hx) ((not_congr mk_eq_zero).mp hy) hxy

/-- The derived ℤ is an integral domain (no zero divisors + nontrivial). -/
example : IsDomain Z := inferInstance

end Z
end Phys.Foundation
