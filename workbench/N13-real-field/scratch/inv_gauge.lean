import Phys.Foundation.ContinuumFieldRing
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Foundation ContinuumQ

/-! ## THE POSITIVE-CUT INVERSE — the multiplicative SWAP one level up. -/

/-- THE INVERSE of a positive cut: the reflect-and-reciprocate set. `q ∈ x⁻¹` iff
    `q ≤ 0`, or `q > 0` and some upper bound `r ∉ x` (with `r > 0`) has `q < 1/r`.
    The multiplicative analogue of the additive reflection `negS`. -/
def pinvS (x : Cut) (q : Q) : Prop :=
  q ≤ 0 ∨ ∃ r, 0 < r ∧ ¬ x.S r ∧ q < 1 / r

theorem one_div_lt_one_div_of_lt' {a b : Q} (ha : 0 < a) (h : a < b) : 1 / b < 1 / a :=
  one_div_lt_one_div_of_lt ha h

/-- For `x > 0`, the reflect-and-reciprocate set is a genuine gather. -/
theorem pinvGather {x : Cut} (hx0 : (0:Cut) < x) : IsGather (pinvS x) := by
  have hxne : x ≠ 0 := ne_of_gt hx0
  have hxnn : (0:Cut) ≤ x := le_of_lt hx0
  obtain ⟨a0, ha0, hxa0⟩ := exists_pos_mem hxnn hxne
  -- a fixed upper bound R > 0
  obtain ⟨p, hp⟩ := x.isG.proper
  set R : Q := max p (a0 + 1) with hR
  have hxR : ¬ x.S R := fun h => hp (x.isG.down h (le_max_left _ _))
  have hR0 : 0 < R := lt_of_lt_of_le (by linarith) (le_max_right _ _)
  refine ⟨⟨0, Or.inl le_rfl⟩, ?_, ?_, ?_⟩
  · -- proper: 1/a0 ∉ pinvS
    refine ⟨1 / a0, ?_⟩
    rintro (hle | ⟨r, hr0, hxr, hlt⟩)
    · have : 0 < 1 / a0 := by positivity
      linarith
    · have har : a0 < r := by
        rcases le_or_gt r a0 with h | h
        · exact absurd (x.isG.down hxa0 h) hxr
        · exact h
      have : 1 / r < 1 / a0 := one_div_lt_one_div_of_lt' ha0 har
      linarith
  · rintro p' q (hle | ⟨r, hr0, hxr, hlt⟩) hpq
    · exact Or.inl (le_trans hpq hle)
    · rcases le_or_gt p' 0 with hp0 | hp0
      · exact Or.inl hp0
      · exact Or.inr ⟨r, hr0, hxr, lt_of_le_of_lt hpq hlt⟩
  · rintro q (hle | ⟨r, hr0, hxr, hlt⟩)
    · -- q ≤ 0: step up to 1/(2R) > 0
      have h2R : 0 < 1 / (2 * R) := by positivity
      have hstep : 1 / (2 * R) < 1 / R := one_div_lt_one_div_of_lt' hR0 (by linarith)
      exact ⟨1 / (2 * R), Or.inr ⟨R, hR0, hxR, hstep⟩, by linarith⟩
    · -- q > 0 with witness r: midpoint up-step toward 1/r
      refine ⟨(q + 1 / r) / 2, Or.inr ⟨r, hr0, hxr, by linarith⟩, by linarith⟩

/-- The positive-cut inverse, as a `Cut` (for `x > 0`). -/
noncomputable def pinv {x : Cut} (hx0 : (0:Cut) < x) : Cut := ⟨pinvS x, pinvGather hx0⟩

@[simp] theorem pinv_S {x : Cut} (hx0 : (0:Cut) < x) (q : Q) :
    (pinv hx0).S q ↔ q ≤ 0 ∨ ∃ r, 0 < r ∧ ¬ x.S r ∧ q < 1 / r := Iff.rfl

/-- `0 ≤ pinv x` (the inverse cut contains the whole nonpositive ray). -/
theorem zero_le_pinv {x : Cut} (hx0 : (0:Cut) < x) : (0:Cut) ≤ pinv hx0 := by
  rw [nonneg_iff]; intro q hq; rw [pinv_S]; exact Or.inl (le_of_lt hq)

end ContinuumQ
end Phys.Foundation
