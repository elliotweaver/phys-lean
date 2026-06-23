import Phys.Foundation.OrderedTower
import Mathlib.Tactic

namespace Phys.Foundation

namespace Re

theorem step_eq_add_one (x : Re) : step x = x + 1 := by
  show step x = x + step void
  rw [add_step, add_void]

@[simp] theorem zero_eq_void : (0 : Re) = void := rfl

theorem two_eq : (2 : Re) = step (step 0) := by
  rw [← one_add_one_eq_two]
  show (1:Re) + 1 = step (step 0)
  show step void + step void = step (step void)
  rw [add_step, add_void]

theorem two_ne_zero : (2 : Re) ≠ 0 := by
  rw [two_eq]; exact step_ne_void _

/-- Parity of counting: every count is even or odd. -/
theorem even_or_odd (a : Re) : (∃ c, a = 2 * c) ∨ (∃ c, a = 2 * c + 1) := by
  induction a with
  | void => exact Or.inl ⟨0, by simp⟩
  | step a' ih =>
    rcases ih with ⟨c, hc⟩ | ⟨c, hc⟩
    · right; exact ⟨c, by rw [step_eq_add_one, hc]⟩
    · left; refine ⟨c + 1, ?_⟩
      rw [step_eq_add_one, hc]; ring

/-- `a < a + c` whenever `c ≠ 0` (strict growth by a nonzero count). -/
theorem lt_add_of_ne {a c : Re} (hc : c ≠ 0) : a < a + c := by
  refine lt_of_le_of_ne ⟨c, rfl⟩ ?_
  intro h
  have : a + 0 = a + c := by rw [add_zero]; exact h
  exact hc (Re.add_left_cancel this).symm

theorem pos_iff_ne_zero {a : Re} : 0 < a ↔ a ≠ 0 := by
  constructor
  · intro h; exact (ne_of_lt h).symm
  · intro h
    rcases lt_or_eq_of_le (zero_le a) with h' | h'
    · exact h'
    · exact absurd h'.symm h

theorem mul_pos_of_ne {a b : Re} (ha : a ≠ 0) (hb : b ≠ 0) : 0 < a * b :=
  pos_iff_ne_zero.mpr (mul_ne_zero' ha hb)

/-- `a * b = 0 → a = 0 ∨ b = 0` over counting (contrapositive of `mul_ne_zero'`). -/
theorem mul_eq_zero' {a b : Re} (h : a * b = 0) : a = 0 ∨ b = 0 := by
  by_contra hc
  rw [not_or] at hc
  exact mul_ne_zero' hc.1 hc.2 h

/-- `x + x = y + y → x = y` (cancel the doubling). -/
theorem add_self_cancel {x y : Re} (h : x + x = y + y) : x = y := by
  rcases add_comparable x y with ⟨s, hs⟩ | ⟨s, hs⟩
  · rw [hs] at h
    have key : x + x + (s + s) = x + x + 0 := by
      rw [add_zero]
      calc x + x + (s + s) = (x + s) + (x + s) := by ring
        _ = x + x := h.symm
    have hss : s + s = 0 := Re.add_left_cancel key
    rw [hs, (add_eq_zero hss).1, add_zero]
  · rw [hs] at h
    have key : y + y + (s + s) = y + y + 0 := by
      rw [add_zero]
      calc y + y + (s + s) = (y + s) + (y + s) := by ring
        _ = y + y := h
    have hss : s + s = 0 := Re.add_left_cancel key
    rw [hs, (add_eq_zero hss).1, add_zero]

/-- `2*x = 2*y → x = y`. -/
theorem two_mul_cancel {x y : Re} (h : 2 * x = 2 * y) : x = y := by
  apply add_self_cancel
  have e1 : (2:Re) * x = x + x := by ring
  have e2 : (2:Re) * y = y + y := by ring
  rw [e1, e2] at h; exact h

theorem sq_lt_sq {a b : Re} (h : b < a) : b * b < a * a := by
  obtain ⟨c, hc⟩ := le_of_lt h
  have hc0 : c ≠ 0 := by
    rintro rfl; rw [add_zero] at hc; exact (ne_of_lt h) hc.symm
  rw [hc]
  have hexp : (b + c) * (b + c) = (b * b) + (2 * (b * c) + c * c) := by ring
  rw [hexp]
  have hpos : 2 * (b * c) + c * c ≠ 0 := by
    have : c * c ≠ 0 := mul_ne_zero' hc0 hc0
    intro hz; exact this (add_eq_zero hz).2
  exact lt_add_of_ne hpos

theorem lt_of_sq_lt_sq {a b : Re} (h : b * b < a * a) : b < a := by
  rcases lt_trichotomy b a with hlt | heq | hgt
  · exact hlt
  · rw [heq] at h; exact absurd h (lt_irrefl _)
  · exact absurd (sq_lt_sq hgt) (not_lt.mpr (le_of_lt h))

theorem add_one_ne_zero (c : Re) : c + 1 ≠ 0 := by
  show c + step void ≠ 0
  rw [add_step, add_void]
  exact step_ne_void _

theorem lt_succ_iff_le {b n : Re} : b < step n ↔ b ≤ n := by
  constructor
  · intro h
    obtain ⟨c, hc⟩ := le_of_lt h
    have hc0 : c ≠ 0 := by
      rintro rfl; rw [add_zero] at hc; exact (ne_of_lt h) hc.symm
    cases c with
    | void => exact absurd rfl hc0
    | step c' =>
      rw [add_step] at hc
      exact ⟨c', step_inj hc⟩
  · intro h
    obtain ⟨c, hc⟩ := h
    rw [step_eq_add_one]
    have hle : b ≤ n + 1 := ⟨c + 1, by rw [hc]; ring⟩
    refine lt_of_le_of_ne hle ?_
    intro heq
    rw [hc] at heq
    have h2 : b + (c + 1) = b + 0 := by
      rw [add_zero]
      calc b + (c + 1) = b + c + 1 := by ring
        _ = b := heq.symm
    exact add_one_ne_zero c (Re.add_left_cancel h2)

/-- ★ THE DESCENT (bounded form): no count `a ≤ n` has `a*a = 2*(b*b)` with `b ≠ 0`.
    Induction on the bound `n`. The descent step: `a*a = 2*(b*b)` forces `a` even
    (parity), `a = 2a'`, hence `b*b = 2*(a'*a')` with `b < a` and `a' ≠ 0` — a smaller
    instance, killed by the inductive hypothesis. -/
theorem no_sq_two_bounded :
    ∀ n a : Re, a ≤ n → ∀ b, b ≠ 0 → a * a = 2 * (b * b) → False := by
  intro n
  induction n with
  | void =>
    intro a ha b hb heq
    have ha0 : a = 0 := le_antisymm ha (zero_le a)
    rw [ha0] at heq
    have hz : (2 : Re) * (b * b) = 0 := by rw [← heq]; ring
    rcases mul_eq_zero' hz with h | h
    · exact two_ne_zero h
    · exact hb ((mul_eq_zero' h).resolve_left hb)
  | step n ih =>
    intro a ha b hb heq
    rcases lt_or_eq_of_le ha with hlt | heqn
    · exact ih a (lt_succ_iff_le.mp hlt) b hb heq
    · rcases even_or_odd a with ⟨a', ha'⟩ | ⟨a', ha'⟩
      · -- a = 2a' even
        have hb2 : b * b = 2 * (a' * a') := by
          have h4 : 2 * (2 * (a' * a')) = 2 * (b * b) := by rw [← heq, ha']; ring
          exact (two_mul_cancel h4).symm
        have ha'0 : a' ≠ 0 := by
          rintro rfl
          rw [mul_zero, mul_zero] at hb2
          rcases mul_eq_zero' hb2 with h | h
          · exact hb h
          · exact hb h
        have hba : b < a := by
          apply lt_of_sq_lt_sq
          rw [heq]
          have hbb : 0 < b * b := mul_pos_of_ne hb hb
          calc b * b < b * b + b * b := lt_add_of_ne (ne_of_gt hbb)
            _ = 2 * (b * b) := by ring
        have hbn : b ≤ n := lt_succ_iff_le.mp (by rw [← heqn]; exact hba)
        exact ih b hbn a' ha'0 hb2
      · -- a = 2a'+1 odd: a² odd ≠ 2b² even
        exfalso
        rw [ha'] at heq
        have hodd : (2 * a' + 1) * (2 * a' + 1) = step (2 * (2 * a' * a' + 2 * a')) := by
          rw [step_eq_add_one]; ring
        rw [hodd] at heq
        have hL : step (2 * (2 * a' * a' + 2 * a'))
            = step ((2*a'*a'+2*a') + (2*a'*a'+2*a')) := by congr 1; ring
        have hR : (2:Re) * (b * b) = (b * b) + (b * b) := by ring
        rw [hL, hR] at heq
        exact Re.add_self_ne_step_add_self (b*b) (2*a'*a'+2*a') heq.symm

/-- ★ NO COUNT-PAIR SOLVES `a² = 2b²` NONTRIVIALLY (the Re core of √2's irrationality,
    by bounded infinite descent — no well-founded recursion, no Mathlib `Rat.den`). -/
theorem no_sq_two {a b : Re} (hb : b ≠ 0) : a * a ≠ 2 * (b * b) :=
  fun h => no_sq_two_bounded a a (le_refl a) b hb h

end Re
end Phys.Foundation
