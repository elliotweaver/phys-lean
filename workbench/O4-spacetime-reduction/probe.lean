import Phys.Algebra.SpacetimeSignature

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Matrix
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

/-- The ℂ-rung embedding `Dbl ℚ → O ℚ`, `d ↦ ⟨⟨d,0⟩,0⟩` (= iota ∘ iota). -/
def cToO (d : Dbl ℚ) : O ℚ := ⟨⟨d, 0⟩, 0⟩

-- PROBE 1: the coordinate collapse — gForm of a ℂ-rung element is d.re² + d.im².
example (d : Dbl ℚ) : gForm (cToO d) (cToO d) = d.re^2 + d.im^2 := by
  rw [gForm_self_sum_sq]
  simp only [cToO, c0, c1, c2, c3, c4, c5, c6, c7, CD.zero_re, CD.zero_im,
    Dbl.zero_re, Dbl.zero_im]
  ring

-- PROBE 2: cToO is additive and smul (so linear).
example (d d' : Dbl ℚ) : cToO (d + d') = cToO d + cToO d' := by
  unfold cToO; ext <;> simp

example (q : ℚ) (d : Dbl ℚ) : cToO (q • d) = q • cToO d := by
  unfold cToO; ext <;> simp

-- PROBE 3: the 4D form and its space anisotropy (sum of 2 squares).
def Q4 (t x : ℚ) (d : Dbl ℚ) : ℚ := t^2 - x^2 - (d.re^2 + d.im^2)

example (x : ℚ) (d : Dbl ℚ) : Q4 0 x d = 0 ↔ x = 0 ∧ d = 0 := by
  unfold Q4
  constructor
  · intro h
    have hx : (0:ℚ) ≤ x^2 := sq_nonneg x
    have hr : (0:ℚ) ≤ d.re^2 := sq_nonneg _
    have hi : (0:ℚ) ≤ d.im^2 := sq_nonneg _
    have hx0 : x^2 = 0 := by linarith
    have hr0 : d.re^2 = 0 := by linarith
    have hi0 : d.im^2 = 0 := by linarith
    refine ⟨pow_eq_zero_iff (by norm_num) |>.mp hx0, ?_⟩
    have : d.re = 0 := pow_eq_zero_iff (by norm_num) |>.mp hr0
    have h2 : d.im = 0 := pow_eq_zero_iff (by norm_num) |>.mp hi0
    ext <;> assumption
  · rintro ⟨hx, hd⟩; subst hx; subst hd; simp

-- PROBE 4: finrank Dbl ℚ = 2 (banked), so finrank STV4 = 4.
example : Module.finrank ℚ (Dbl ℚ) = 2 := finrank_dbl_eq_two

end
end Phys.Algebra
