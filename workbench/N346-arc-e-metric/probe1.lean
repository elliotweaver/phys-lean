/- PROBE: N346 E1a — de-risk the metric + linearized-inverse residual over the derived ℝ Cut. -/
import Phys.Foundation.ContinuumFieldInverse
import Mathlib.Data.Matrix.Basic
import Mathlib.Tactic

namespace Probe346

open Phys.Foundation Phys.Foundation.ContinuumQ
open Matrix

noncomputable section

-- The derived ℝ Cut is a Field (banked). Carrier: 10×10 matrices over Cut.
abbrev M : Type := Matrix (Fin 10) (Fin 10) Cut

/-- The (1,9) flat signature diagonal: entry 0 is +1, entries 1..9 are −1. -/
def sigDiag : Fin 10 → Cut := fun i => if i = 0 then (1 : Cut) else (-1 : Cut)

def flatMetric : M := Matrix.diagonal sigDiag

-- (1) each diagonal entry squares to 1
example (i : Fin 10) : sigDiag i * sigDiag i = 1 := by
  unfold sigDiag; by_cases h : i = 0 <;> simp [h]

-- (2) η involutive: η*η = 1
theorem flatMetric_involutive : flatMetric * flatMetric = 1 := by
  unfold flatMetric
  rw [Matrix.diagonal_mul_diagonal]
  have : (fun i => sigDiag i * sigDiag i) = (fun _ => (1 : Cut)) := by
    funext i; unfold sigDiag; by_cases h : i = 0 <;> simp [h]
  rw [this]
  exact Matrix.diagonal_one

-- (3) η symmetric
theorem flatMetric_symm : flatMetricᵀ = flatMetric := by
  unfold flatMetric; exact Matrix.diagonal_transpose sigDiag

-- (4) THE GENERAL RING LEMMA: exact linearized inverse residual
theorem residual_identity {R : Type} [Ring R] (η h : R) (hη : η * η = 1) :
    (η + h) * (η - η * h * η) = 1 - (h * η) * (h * η) := by
  have e1 : (η + h) * (η - η * h * η)
      = η * η - η * η * h * η + h * η - h * η * h * η := by noncomm_ring
  rw [e1, hη]
  noncomm_ring

-- (5) instantiate at flatMetric
theorem metric_linearized_inverse (h : M) :
    (flatMetric + h) * (flatMetric - flatMetric * h * flatMetric)
      = 1 - (h * flatMetric) * (h * flatMetric) :=
  residual_identity flatMetric h flatMetric_involutive

-- (6) flat limit: h = 0 ⟹ residual 0, g*ǧ = 1
theorem flat_limit :
    (flatMetric + (0:M)) * (flatMetric - flatMetric * (0:M) * flatMetric) = 1 := by
  rw [metric_linearized_inverse]; simp

-- (7) W8 non-vacuity: concrete nonzero h₀, (h₀η)² ≠ 0, g*ǧ ≠ 1
def h0 : M := Matrix.diagonal (fun i => if i = 0 then (1:Cut) else 0)

theorem h0_symm : h0ᵀ = h0 := by unfold h0; exact Matrix.diagonal_transpose _

-- (h0 * flatMetric) = diagonal(if i=0 then 1 else 0)
theorem h0_mul_flat :
    h0 * flatMetric = Matrix.diagonal (fun i => if i = 0 then (1:Cut) else 0) := by
  unfold h0 flatMetric
  rw [Matrix.diagonal_mul_diagonal]
  congr 1; funext i; unfold sigDiag; by_cases h : i = 0 <;> simp [h]

theorem sq_ne_zero : (h0 * flatMetric) * (h0 * flatMetric) ≠ 0 := by
  rw [h0_mul_flat, Matrix.diagonal_mul_diagonal]
  intro hcon
  have h00 := congrFun (congrFun hcon 0) 0
  rw [Matrix.diagonal_apply_eq, Matrix.zero_apply] at h00
  simp at h00

theorem metric_inverse_not_exact :
    (flatMetric + h0) * (flatMetric - flatMetric * h0 * flatMetric) ≠ 1 := by
  rw [metric_linearized_inverse]
  intro hcon
  -- 1 - (h0η)² = 1 ⟹ (h0η)² = 0, contradiction
  exact sq_ne_zero (sub_eq_self.mp hcon)

end
end Probe346
