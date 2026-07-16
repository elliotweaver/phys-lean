import Phys.Algebra.PoincareMassEnergy
import Mathlib.Tactic

namespace Phys.Algebra.ProbeO7

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-- A general symmetric quadratic form on the inertial time-space plane. -/
def genForm2 (p q r : ℚ) (t x : ℚ) : ℚ := p * t ^ 2 + 2 * q * t * x + r * x ^ 2

/-- The Lorentz / mass form on the plane. -/
def massForm2 (t x : ℚ) : ℚ := t ^ 2 - x ^ 2

/-- Invariance under all unit-hyperbola boosts of the plane. -/
def IsPlaneBoostInvariant (p q r : ℚ) : Prop :=
  ∀ (a b : ℚ), a ^ 2 - b ^ 2 = 1 → ∀ t x : ℚ,
    genForm2 p q r (a * t + b * x) (b * t + a * x) = genForm2 p q r t x

/-- ★ PROBE 1: THE UNIQUENESS — any boost-invariant symmetric form has q = 0 and r = -p. -/
theorem plane_uniqueness {p q r : ℚ} (h : IsPlaneBoostInvariant p q r) : q = 0 ∧ r = -p := by
  -- instantiate at the rational boost a = 5/4, b = 3/4 (a²-b² = 25/16 - 9/16 = 1)
  have hab : (5/4 : ℚ) ^ 2 - (3/4 : ℚ) ^ 2 = 1 := by norm_num
  -- invariance at (t,x) = (1,0):
  have h10 := h (5/4) (3/4) hab 1 0
  -- invariance at (t,x) = (0,1):
  have h01 := h (5/4) (3/4) hab 0 1
  -- invariance at (t,x) = (1,1):
  have h11 := h (5/4) (3/4) hab 1 1
  unfold genForm2 at h10 h01 h11
  -- these three give linear constraints; extract q=0 and r=-p
  constructor
  · nlinarith [h10, h01, h11]
  · nlinarith [h10, h01, h11]

/-- Consequence: an invariant form is a scalar multiple of the mass form. -/
theorem plane_invariant_is_scalar_massForm {p q r : ℚ} (h : IsPlaneBoostInvariant p q r)
    (t x : ℚ) : genForm2 p q r t x = p * massForm2 t x := by
  obtain ⟨hq, hr⟩ := plane_uniqueness h
  unfold genForm2 massForm2
  rw [hq, hr]; ring

/-- ★ PROBE 2: bForm4 NON-DEGENERACY — if bForm4 P R = 0 for all R then P = 0. -/
theorem bForm4_nondegenerate {P : STV4} (h : ∀ R : STV4, bForm4 P R = 0) : P = 0 := by
  have hE := h ((1 : ℚ), (0 : ℚ), (0 : Dbl ℚ))
  rw [bForm4_energy] at hE
  have hpx := h ((0 : ℚ), (1 : ℚ), (0 : Dbl ℚ))
  rw [bForm4_momentum_x] at hpx
  have hpx' : P.2.1 = 0 := by linarith
  have hdre := h ((0 : ℚ), (0 : ℚ), (⟨1, 0⟩ : Dbl ℚ))
  have hdim := h ((0 : ℚ), (0 : ℚ), (⟨0, 1⟩ : Dbl ℚ))
  unfold bForm4 at hdre hdim
  -- hdre : P.1*0 - P.2.1*0 - (P.2.2.re*1 + P.2.2.im*0) = 0
  have hre : P.2.2.re = 0 := by nlinarith [hdre]
  have him : P.2.2.im = 0 := by nlinarith [hdim]
  have hd : P.2.2 = 0 := by
    apply Dbl.ext
    · simpa using hre
    · simpa using him
  obtain ⟨t, x, d⟩ := P
  simp only at hE hpx' hd
  subst hE; subst hpx'; subst hd
  rfl

end

end Phys.Algebra.ProbeO7
