import Phys.Algebra.NeutrinoMassSum
import Mathlib.Tactic
open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open Matrix
noncomputable section

/-- The full type-I light seesaw operator m_D · M_R⁻¹ · m_Dᵀ, with the scalar heavy inverse. -/
def lightSeesawOperator (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) : Matrix (Fin 3) (Fin 3) Cut :=
  D * ((M⁻¹) • (1 : Matrix (Fin 3) (Fin 3) Cut)) * Dᵀ

/-- THE FAMILY-BLIND COLLAPSE: with the scalar (family-blind) heavy inverse, the type-I light operator
    collapses to M⁻¹·(D Dᵀ). -/
theorem lightSeesawOperator_collapse (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) :
    lightSeesawOperator D M = (M⁻¹) • (D * Dᵀ) := by
  unfold lightSeesawOperator
  rw [Matrix.mul_smul, mul_one, Matrix.smul_mul]

/-- Σm_ν IS the trace of the full type-I light seesaw operator (the collapse made a theorem). -/
theorem neutrinoMassSum_eq_trace_lightSeesaw (D : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) :
    neutrinoMassSum D M = Matrix.trace (lightSeesawOperator D M) := by
  rw [lightSeesawOperator_collapse]; rfl

/-- the heavy inverse used IS heavyMajorana's seesaw inverse (grounding on the banked object). -/
theorem lightSeesaw_uses_heavyMajorana_inv (M : Cut) (hM : M ≠ 0) :
    heavyMajorana M * ((M⁻¹) • (1 : Matrix (Fin 3) (Fin 3) Cut)) = 1 :=
  heavyMajorana_scalar_inv M hM

end
