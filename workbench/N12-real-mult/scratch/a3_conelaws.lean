import Phys.Foundation.ContinuumField
import Mathlib.Tactic
namespace Phys.Foundation
namespace ContinuumQ
open Phys.Foundation ContinuumQ

def mulNonnegS (x y : Cut) (q : Q) : Prop :=
  q < 0 ∨ ∃ a b, 0 ≤ a ∧ 0 ≤ b ∧ x.S a ∧ y.S b ∧ q < a * b
theorem mulNonnegGather (x y : Cut) : IsGather (mulNonnegS x y) := by
  refine ⟨⟨-1, Or.inl (by norm_num)⟩, ?_, ?_, ?_⟩
  · obtain ⟨p, hp⟩ := x.isG.proper; obtain ⟨r, hr⟩ := y.isG.proper
    set P : Q := max p 1; set R : Q := max r 1
    have hP1 : (1:Q) ≤ P := le_max_right _ _; have hR1 : (1:Q) ≤ R := le_max_right _ _
    have hPx : ¬ x.S P := fun h => hp (x.isG.down h (le_max_left _ _))
    have hRy : ¬ y.S R := fun h => hr (y.isG.down h (le_max_left _ _))
    refine ⟨P * R, ?_⟩
    rintro (hneg | ⟨a, b, ha, hb, hxa, hyb, hq⟩)
    · nlinarith [hP1, hR1]
    · have haP : a < P := by rcases le_or_gt P a with h|h; exact absurd (x.isG.down hxa h) hPx; exact h
      have hbR : b < R := by rcases le_or_gt R b with h|h; exact absurd (y.isG.down hyb h) hRy; exact h
      nlinarith [ha, hb, haP, hbR, hP1, hR1]
  · rintro p q (hneg | ⟨a, b, ha, hb, hxa, hyb, hq⟩) hpq
    · exact Or.inl (lt_of_le_of_lt hpq hneg)
    · exact Or.inr ⟨a, b, ha, hb, hxa, hyb, lt_of_le_of_lt hpq hq⟩
  · rintro q (hneg | ⟨a, b, ha, hb, hxa, hyb, hq⟩)
    · exact ⟨q / 2, Or.inl (by linarith), by linarith⟩
    · exact ⟨(q + a * b) / 2, Or.inr ⟨a, b, ha, hb, hxa, hyb, by linarith⟩, by linarith⟩
noncomputable def pmul (x y : Cut) : Cut := ⟨mulNonnegS x y, mulNonnegGather x y⟩
@[simp] theorem pmul_S (x y : Cut) (q : Q) :
    (pmul x y).S q ↔ q < 0 ∨ ∃ a b, 0 ≤ a ∧ 0 ≤ b ∧ x.S a ∧ y.S b ∧ q < a * b := Iff.rfl

/-- `0 ≤ x` (i.e. `Qcut 0 ≤ x`) means x contains every negative rational. -/
theorem nonneg_iff {x : Cut} : (0:Cut) ≤ x ↔ ∀ q, q < 0 → x.S q := by
  rw [show (0:Cut) = Qcut 0 from rfl, Cut.le_def]; rfl

/-- For x ≥ 0 with x ≠ 0, x has a strictly positive element (nomax past 0). -/
theorem exists_pos_mem {x : Cut} (hx : 0 ≤ x) (hne : x ≠ 0) : ∃ a, 0 < a ∧ x.S a := by
  by_contra h
  push_neg at h
  -- then x ⊆ {q < 0}; combined with 0 ≤ x gives x = 0
  apply hne
  apply Cut.ext'; intro q
  rw [show (0:Cut) = Qcut 0 from rfl]
  show x.S q ↔ q < 0
  constructor
  · intro hq
    rcases le_or_gt q 0 with hq0 | hq0
    · rcases eq_or_lt_of_le hq0 with hq00 | h0
      · -- q = 0 ∈ x; but nomax gives r > 0 in x, contradiction
        obtain ⟨r, hr, h0r⟩ := x.isG.nomax q hq
        exact absurd hr (h r (by rw [hq00] at h0r; linarith))
      · exact h0
    · exact absurd hq (h q hq0)
  · intro hq; exact (nonneg_iff.mp hx) q hq

end ContinuumQ
end Phys.Foundation
