import Phys.Algebra.ScaleTowerOneObject
import Mathlib.Tactic

open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open Matrix

noncomputable section

def heavyMajorana (M : Cut) : Matrix (Fin 3) (Fin 3) Cut := M • 1
def diracSelfOverlap (D : Matrix (Fin 3) (Fin 3) Cut) : Cut := Matrix.trace (D * Dᵀ)
def neutrinoMassSum (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) : Cut :=
  Matrix.trace ((M⁻¹) • (D * Dᵀ))

theorem neutrinoMassSum_eq (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) :
    neutrinoMassSum D M = diracSelfOverlap D / M := by
  unfold neutrinoMassSum diracSelfOverlap
  rw [Matrix.trace_smul]
  simp [smul_eq_mul, div_eq_inv_mul]

/-- v as the banked transmutationScale (the EW rung). -/
noncomputable def vevScale (M g2 : Cut) : Cut :=
  transmutationScale M (rungExponent (Module.finrank ℚ spaceSub) * g2) g2

/-- ★ THE C1 LANDING: under the Born self-overlap saturating v², Σm_ν = seesawScale M = m₀. -/
theorem neutrinoMassSum_eq_seesawScale (D : Matrix (Fin 3) (Fin 3) Cut) (M g2 : Cut)
    (hM : M ≠ 0) (hg : g2 ≠ 0)
    (hnorm : diracSelfOverlap D = (vevScale M g2) ^ 2) :
    neutrinoMassSum D M = seesawScale M := by
  rw [neutrinoMassSum_eq, hnorm, vevScale]
  exact seesawScale_eq_vev_sq_div M g2 hM hg

/-- ★ THE TOWER: Σm_ν/M = seesawRatio = scaleTowerRung 9 (−2). -/
theorem neutrinoMassSum_over_M_eq_rung (D : Matrix (Fin 3) (Fin 3) Cut) (M g2 : Cut)
    (hM : M ≠ 0) (hg : g2 ≠ 0)
    (hnorm : diracSelfOverlap D = (vevScale M g2) ^ 2) :
    neutrinoMassSum D M / M = scaleTowerRung 9 (-2) := by
  rw [neutrinoMassSum_eq_seesawScale D M g2 hM hg hnorm]
  unfold seesawScale
  rw [mul_div_cancel_left₀ seesawRatio hM, seesawRatio_as_rung]

end
