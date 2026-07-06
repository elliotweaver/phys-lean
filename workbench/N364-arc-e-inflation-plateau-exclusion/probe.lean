import Phys.Algebra.SpacetimePageCurve
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section

/-- Plateau potential built on the fold's OWN Born-positive self-overlap exponential `cutExp`. -/
def plateauPotP (c φ : Cut) : Cut := (1 - cutExp (-(c * φ))) ^ 2

/-- Monomial potential. -/
def monoPotP (p : ℕ) (φ : Cut) : Cut := φ ^ p

/-- Hilltop potential. -/
def hilltopPotP (μ : Cut) (p : ℕ) (φ : Cut) : Cut := 1 - (φ / μ) ^ p

-- (0) nonneg — trivially a square
theorem plateauPotP_nonneg (c φ : Cut) : 0 ≤ plateauPotP c φ := by
  unfold plateauPotP; positivity

-- (1) plateau is bounded above by 1 on φ ≥ 0 (the coherence asymptote), UNIFORMLY
theorem plateauPotP_lt_one (c φ : Cut) (hc : 0 < c) (hφ : 0 ≤ φ) :
    plateauPotP c φ < 1 := by
  unfold plateauPotP
  set e := cutExp (-(c * φ)) with he
  have hepos : 0 < e := by rw [he]; exact cutExp_pos _
  have hle : e ≤ 1 := by
    rw [he]; apply cutExp_le_one_of_nonpos
    have : 0 ≤ c * φ := by positivity
    linarith
  nlinarith [hepos, hle]

-- (2) THE NO-FIXED-POINT CORE (C6 / self-blindness): plateau NEVER attains its bound on φ ≥ 0
theorem plateauPotP_never_attains_bound (c φ : Cut) (hc : 0 < c) (hφ : 0 ≤ φ) :
    plateauPotP c φ ≠ 1 :=
  ne_of_lt (plateauPotP_lt_one c φ hc hφ)

-- (3) THE APPROACH: strictly increasing on φ ≥ 0 (rolls toward, never reaches, the asymptote)
theorem plateauPotP_strictMono (c φ₁ φ₂ : Cut)
    (hc : 0 < c) (h0 : 0 ≤ φ₁) (h12 : φ₁ < φ₂) :
    plateauPotP c φ₁ < plateauPotP c φ₂ := by
  unfold plateauPotP
  have harg : -(c * φ₂) < -(c * φ₁) := by nlinarith
  have hmono : cutExp (-(c * φ₂)) < cutExp (-(c * φ₁)) := cutExp_strictMono harg
  set e1 := cutExp (-(c * φ₁)) with he1
  set e2 := cutExp (-(c * φ₂)) with he2
  have he1le : e1 ≤ 1 := by
    rw [he1]
    apply cutExp_le_one_of_nonpos
    have hcf : 0 ≤ c * φ₁ := by positivity
    linarith
  have he2pos : 0 < e2 := by rw [he2]; exact cutExp_pos _
  nlinarith [hmono, he1le, he2pos]

-- (4) MONOMIAL EXCLUDED: unbounded above (no coherence asymptote to approach)
theorem monoPotP_unbounded (p : ℕ) (hp : p ≠ 0) (B : Cut) :
    ∃ φ : Cut, 0 ≤ φ ∧ B < monoPotP p φ := by
  refine ⟨|B| + 1, by positivity, ?_⟩
  unfold monoPotP
  have h1 : (1 : Cut) ≤ |B| + 1 := by have := abs_nonneg B; linarith
  have hself : |B| + 1 ≤ (|B| + 1) ^ p := le_self_pow₀ h1 hp
  have hBle : B ≤ |B| := le_abs_self B
  linarith

-- (5) HILLTOP EXCLUDED: attains its bound 1 at the origin (a fixed-point maximum)
theorem hilltopPotP_attains_bound (μ : Cut) (p : ℕ) (hp : p ≠ 0) :
    hilltopPotP μ p 0 = 1 := by
  unfold hilltopPotP
  rw [zero_div, zero_pow hp, sub_zero]

theorem hilltopPotP_le_one (μ φ : Cut) (p : ℕ) (hμ : 0 < μ) (hφ : 0 ≤ φ) :
    hilltopPotP μ p φ ≤ 1 := by
  unfold hilltopPotP
  have : 0 ≤ (φ / μ) ^ p := by positivity
  linarith

/-! ## Class-universal slow-roll relations (candidate-grade — DEFINED here, derivation CHILDED) -/

def nsPlateauP (N : Cut) : Cut := 1 - 2 / N
def nsMonoP (p N : Cut) : Cut := 1 - (p + 2) / (2 * N)
def rPlateauP (c N : Cut) : Cut := 8 / (c ^ 2 * N ^ 2)
def rMonoP (p N : Cut) : Cut := 4 * p / N

-- (6) tensor ratio: plateau's r is the monomial's SCALED by 2/(p c² N) → the 1/N suppression
theorem rPlateauP_eq_rMonoP_scaled (c N p : Cut)
    (hc : c ≠ 0) (hN : N ≠ 0) (hp : p ≠ 0) :
    rPlateauP c N = rMonoP p N * (2 / (p * c ^ 2 * N)) := by
  unfold rPlateauP rMonoP
  field_simp
  ring

-- (7) monomials die on r: for p c² N > 2, plateau's r is STRICTLY below the monomial's
theorem rPlateauP_lt_rMonoP (c N p : Cut)
    (hc : 0 < c) (hN : 0 < N) (hp : 0 < p) (hbig : 2 < p * c ^ 2 * N) :
    rPlateauP c N < rMonoP p N := by
  have hrm : 0 < rMonoP p N := by unfold rMonoP; positivity
  have hpc : 0 < p * c ^ 2 * N := by positivity
  rw [rPlateauP_eq_rMonoP_scaled c N p (ne_of_gt hc) (ne_of_gt hN) (ne_of_gt hp)]
  have hfrac : 2 / (p * c ^ 2 * N) < 1 := by
    rw [div_lt_one hpc]; exact hbig
  nlinarith [hrm, hfrac]

-- (8) monomials never bluer in n_s: for p ≥ 2, N > 0, nsMono ≤ nsPlateau
theorem nsMonoP_le_nsPlateauP (p N : Cut) (hp : 2 ≤ p) (hN : 0 < N) :
    nsMonoP p N ≤ nsPlateauP N := by
  unfold nsMonoP nsPlateauP
  have h2N : 0 < 2 * N := by positivity
  have hdiff : (p + 2) / (2 * N) - 2 / N = (p - 2) / (2 * N) := by
    field_simp; ring
  have hnn : 0 ≤ (p - 2) / (2 * N) := by
    apply div_nonneg
    · linarith
    · linarith
  linarith [hdiff, hnn]

end
end Phys.Algebra
