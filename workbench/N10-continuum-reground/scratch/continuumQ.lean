-- SCRATCH: Continuum re-grounded onto derived Q. Drafting before production.
import Phys.Foundation.DerivedSqrtTwo
import Mathlib.Tactic

namespace Phys.Foundation
namespace ContinuumQ
open Phys.Foundation.Q

/-- Gather over the DERIVED ordered field Q. -/
structure IsGather (S : Q → Prop) : Prop where
  ne     : ∃ q, S q
  proper : ∃ q, ¬ S q
  down   : ∀ {p q}, S q → p ≤ q → S p
  nomax  : ∀ q, S q → ∃ r, S r ∧ q < r

def IsCoherent (S : Q → Prop) : Prop := ∃ c : Q, ∀ q, S q ↔ q < c

def sqrtTwoGather (q : Q) : Prop := q ≤ 0 ∨ q ^ 2 < 2

theorem sqrtTwoGather_isGather : IsGather sqrtTwoGather := by
  refine ⟨⟨0, Or.inl le_rfl⟩, ⟨2, ?_⟩, ?_, ?_⟩
  · simp only [sqrtTwoGather, not_or]
    constructor
    · norm_num
    · norm_num
  · rintro p q (hq | hq) hpq
    · exact Or.inl (le_trans hpq hq)
    · rcases le_or_gt p 0 with hp | hp
      · exact Or.inl hp
      · exact Or.inr (by nlinarith)
  · rintro q (hq | hq)
    · exact ⟨1, Or.inr (by norm_num), by linarith⟩
    · rcases le_or_gt q 0 with hq0 | hq0
      · exact ⟨1, Or.inr (by norm_num), by linarith⟩
      · refine ⟨(2 * q + 2) / (q + 2), Or.inr ?_, ?_⟩
        · have hpos : 0 < q + 2 := by linarith
          rw [div_pow, div_lt_iff₀ (by positivity)]
          nlinarith [hq, sq_nonneg (q - 2), sq_nonneg q]
        · have hpos : 0 < q + 2 := by linarith
          rw [lt_div_iff₀ hpos]; nlinarith [hq]

theorem sqrtTwoGather_not_coherent : ¬ IsCoherent sqrtTwoGather := by
  rintro ⟨c, hc⟩
  have h1 : sqrtTwoGather 1 := Or.inr (by norm_num)
  have hc1 : (1 : Q) < c := (hc 1).mp h1
  have hcpos : 0 < c := by linarith
  have hc2 : c ^ 2 = 2 := by
    rcases lt_trichotomy (c ^ 2) 2 with hlt | heq | hgt
    · have hcS : sqrtTwoGather c := Or.inr hlt
      have := (hc c).mp hcS; linarith
    · exact heq
    · exfalso
      set d : Q := (c ^ 2 + 2) / (2 * c) with hd
      have hdc : d < c := by
        rw [hd, div_lt_iff₀ (by positivity)]; nlinarith
      have hdS : sqrtTwoGather d := (hc d).mpr hdc
      have hd2 : 2 < d ^ 2 := by
        rw [hd, div_pow, lt_div_iff₀ (by positivity)]
        nlinarith [sq_nonneg (c ^ 2 - 2), hgt]
      have hdpos : 0 < d := by rw [hd]; positivity
      rcases hdS with h | h
      · linarith
      · linarith
  exact Q.no_q_sq_two ⟨c, by rw [← pow_two]; exact hc2⟩

theorem ground_not_coherence_closed :
    ∃ S : Q → Prop, IsGather S ∧ ¬ IsCoherent S :=
  ⟨sqrtTwoGather, sqrtTwoGather_isGather, sqrtTwoGather_not_coherent⟩

end ContinuumQ
end Phys.Foundation
