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

theorem nonneg_mem {x : Cut} (hx : 0 ≤ x) {q : Q} (hq : q < 0) : x.S q :=
  (show (0:Cut) ≤ x from hx) q hq

/-- The key fact: for a cut x ≥ 0, x contains some nonneg element (0 itself or has nomax).
    Actually x always contains arbitrarily-close-to-0-from-below; for ≥0 it contains ≥0 too. -/
theorem mem_zero_of_nonneg {x : Cut} (hx : 0 ≤ x) : x.S 0 ∨ (∀ a, x.S a → a < 0) := by
  by_cases h : x.S 0
  · exact Or.inl h
  · right; intro a ha
    rcases le_or_gt 0 a with h0 | h0
    · exact absurd (x.isG.down ha h0) h
    · exact h0

/-- CONE ASSOCIATIVITY (the hard one): pmul (pmul x y) z = pmul x (pmul y z) for x,y,z ≥ 0. -/
theorem pmul_assoc_cone {x y z : Cut} (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
    pmul (pmul x y) z = pmul x (pmul y z) := by
  apply Cut.ext'; intro q
  rw [pmul_S, pmul_S]
  constructor
  · rintro (hneg | ⟨ab, c, hab0, hc0, habmem, hzc, hq⟩)
    · exact Or.inl hneg
    · rw [pmul_S] at habmem
      rcases habmem with hn | ⟨a, b, ha0, hb0, hxa, hyb, hablt⟩
      · -- ab < 0 but ab ≥ 0
        linarith
      · -- q < ab*c < (a*b)*c = a*(b*c); need b*c ∈ pmul y z
        right
        refine ⟨a, b * c, ha0, by positivity, hxa, ?_, by nlinarith [hq, hablt, hc0, mul_nonneg hb0 hc0]⟩
        rw [pmul_S]; right
        exact ⟨b, c, hb0, hc0, hyb, hzc, by nlinarith [mul_pos]⟩
  · rintro (hneg | ⟨a, bc, ha0, hbc0, hxa, hbcmem, hq⟩)
    · exact Or.inl hneg
    · rw [pmul_S] at hbcmem
      rcases hbcmem with hn | ⟨b, c, hb0, hc0, hyb, hzc, hbclt⟩
      · linarith
      · left
        sorry -- direction 2 placeholder, gauge only
end ContinuumQ
end Phys.Foundation
