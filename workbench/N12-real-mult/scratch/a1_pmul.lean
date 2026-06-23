import Phys.Foundation.ContinuumField
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Foundation ContinuumQ

/-- POSITIVE-CONE PRODUCT: the Dedekind product on the nonneg cone. Computes the
    correct product only when x, y ≥ 0, but is a genuine gather for ALL x, y. -/
def mulNonnegS (x y : Cut) (q : Q) : Prop :=
  q < 0 ∨ ∃ a b, 0 ≤ a ∧ 0 ≤ b ∧ x.S a ∧ y.S b ∧ q < a * b

theorem mulNonnegGather (x y : Cut) : IsGather (mulNonnegS x y) := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · exact ⟨-1, Or.inl (by norm_num)⟩
  · -- proper: a positive upper bound P*R is not in the set
    obtain ⟨p, hp⟩ := x.isG.proper
    obtain ⟨r, hr⟩ := y.isG.proper
    set P : Q := max p 1 with hP
    set R : Q := max r 1 with hR
    have hP1 : (1:Q) ≤ P := le_max_right _ _
    have hR1 : (1:Q) ≤ R := le_max_right _ _
    have hPx : ¬ x.S P := fun h => hp (x.isG.down h (le_max_left _ _))
    have hRy : ¬ y.S R := fun h => hr (y.isG.down h (le_max_left _ _))
    refine ⟨P * R, ?_⟩
    rintro (hneg | ⟨a, b, ha, hb, hxa, hyb, hq⟩)
    · nlinarith [hP1, hR1]
    · -- a < P, b < R, all nonneg ⇒ a*b < P*R, contradicting P*R < a*b
      have haP : a < P := by
        rcases le_or_gt P a with h | h
        · exact absurd (x.isG.down hxa h) hPx
        · exact h
      have hbR : b < R := by
        rcases le_or_gt R b with h | h
        · exact absurd (y.isG.down hyb h) hRy
        · exact h
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

theorem pmul_comm (x y : Cut) : pmul x y = pmul y x := by
  apply Cut.ext'; intro q
  rw [pmul_S, pmul_S]
  constructor
  · rintro (h | ⟨a, b, ha, hb, hxa, hyb, hq⟩)
    · exact Or.inl h
    · exact Or.inr ⟨b, a, hb, ha, hyb, hxa, by rw [mul_comm]; exact hq⟩
  · rintro (h | ⟨a, b, ha, hb, hxa, hyb, hq⟩)
    · exact Or.inl h
    · exact Or.inr ⟨b, a, hb, ha, hyb, hxa, by rw [mul_comm]; exact hq⟩

end ContinuumQ
end Phys.Foundation
