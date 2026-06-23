import Mathlib.Data.Rat.Defs
import Mathlib.Data.Rat.Lemmas
import Mathlib.Tactic

namespace Phys.Foundation

-- crux (banked-quality)
theorem no_int_sq_two (n : ℤ) (h : n ^ 2 = 2) : False := by
  have hlo : -2 ≤ n := by nlinarith [sq_nonneg (n+2)]
  have hhi : n ≤ 2 := by nlinarith [sq_nonneg (n-2)]
  interval_cases n <;> omega

theorem no_rat_sq_two : ¬ ∃ q : ℚ, q ^ 2 = 2 := by
  rintro ⟨q, h⟩
  have hd : (q ^ 2).den = 1 := by rw [h]; rfl
  rw [Rat.den_pow] at hd
  have hden1 : q.den = 1 := by nlinarith [Nat.one_le_iff_ne_zero.mpr q.den_nz, hd]
  have hnum : (q.num) ^ 2 = 2 := by
    have hp := Rat.num_pow q 2; rw [h] at hp; simpa [hden1] using hp.symm
  exact no_int_sq_two q.num hnum

-- A GATHER (of lower closures): a downward-closed, proper, no-greatest predicate on the ground.
structure IsGather (S : ℚ → Prop) : Prop where
  ne     : ∃ q, S q
  proper : ∃ q, ¬ S q
  down   : ∀ {p q}, S q → p ≤ q → S p
  nomax  : ∀ q, S q → ∃ r, S r ∧ q < r

-- COHERENT: the gather is realized by a ground point c (its coherence point / lub).
def IsCoherent (S : ℚ → Prop) : Prop := ∃ c : ℚ, ∀ q, S q ↔ q < c

-- the canonical analytic gap
def sqrtTwoGather (q : ℚ) : Prop := q ≤ 0 ∨ q ^ 2 < 2

theorem sqrtTwoGather_isGather : IsGather sqrtTwoGather := by
  refine ⟨⟨0, Or.inl le_rfl⟩, ⟨2, ?_⟩, ?_, ?_⟩
  · simp [sqrtTwoGather]; norm_num
  · rintro p q (hq | hq) hpq
    · exact Or.inl (le_trans hpq hq)
    · rcases le_or_gt p 0 with hp | hp
      · exact Or.inl hp
      · exact Or.inr (by nlinarith)
  · rintro q (hq | hq)
    · -- q ≤ 0: r = 1 works (1>q, 1∈S since 1<2... 1^2=1<2)
      exact ⟨1, Or.inr (by norm_num), by linarith⟩
    · -- q>... q^2<2: Heron up-step r = (q²... ) ; use mediant toward √2
      -- r = (2q+2)/(q+2): if 0<? handle q possibly ≤0 too. Use r = q + (2-q^2)/(q+2)
      rcases le_or_gt q 0 with hq0 | hq0
      · exact ⟨1, Or.inr (by norm_num), by linarith⟩
      · refine ⟨(2*q+2)/(q+2), Or.inr ?_, ?_⟩
        · have hpos : 0 < q + 2 := by linarith
          rw [div_pow, div_lt_iff₀ (by positivity)]
          nlinarith [hq, sq_nonneg (q-2), sq_nonneg q]
        · have hpos : 0 < q + 2 := by linarith
          rw [lt_div_iff₀ hpos]; nlinarith [hq]

theorem sqrtTwoGather_not_coherent : ¬ IsCoherent sqrtTwoGather := by
  rintro ⟨c, hc⟩
  -- 1 ∈ S so 1 < c, c>1>0
  have h1 : sqrtTwoGather 1 := Or.inr (by norm_num)
  have hc1 : (1:ℚ) < c := (hc 1).mp h1
  have hcpos : 0 < c := by linarith
  -- c² = 2 by ruling out both strict cases
  have hc2 : c ^ 2 = 2 := by
    rcases lt_trichotomy (c^2) 2 with hlt | heq | hgt
    · -- c ∈ S → c < c, contradiction
      have : sqrtTwoGather c := Or.inr hlt
      have := (hc c).mp this; linarith
    · exact heq
    · -- Heron down-step d = (c²+2)/(2c): 0<d<c, d²>2, but d<c → d∈S → d²<2
      exfalso
      set d : ℚ := (c^2+2)/(2*c) with hd
      have hdpos : 0 < d := by rw [hd]; positivity
      have hdc : d < c := by
        rw [hd, div_lt_iff₀ (by positivity)]; nlinarith
      have hdS : sqrtTwoGather d := (hc d).mpr hdc
      have hd2 : 2 < d ^ 2 := by
        rw [hd, div_pow, lt_div_iff₀ (by positivity)]
        nlinarith [sq_nonneg (c^2-2), hgt]
      rcases hdS with h | h
      · linarith
      · linarith
  exact no_rat_sq_two ⟨c, hc2⟩

end Phys.Foundation
#print axioms Phys.Foundation.sqrtTwoGather_not_coherent
