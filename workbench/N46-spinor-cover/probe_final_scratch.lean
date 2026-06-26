import Phys.Algebra.SpacetimeSignature
import Mathlib.Tactic

namespace Phys.AlgebraProbe

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def boostMat (p : ℚ) : Matrix (Fin 2) (Fin 2) (O ℚ) :=
  !![ (p • (1 : O ℚ)), 0 ;
      0, (p⁻¹ • (1 : O ℚ)) ]

def actBy (A M : Matrix (Fin 2) (Fin 2) (O ℚ)) : Matrix (Fin 2) (Fin 2) (O ℚ) := (A * M) * Aᴴ

-- generalized real-part determinant of an arbitrary 2×2 over O ℚ
def mdet (M : Matrix (Fin 2) (Fin 2) (O ℚ)) : ℚ :=
  reQ (M 0 0 * M 1 1 - M 0 1 * M 1 0)

theorem act_herm2 (p t x : ℚ) (hp : p ≠ 0) (v : O ℚ) :
    actBy (boostMat p) (herm2 t x v) =
      herm2 ((p^2*(t+x) + p⁻¹^2*(t-x))/2) ((p^2*(t+x) - p⁻¹^2*(t-x))/2) v := by
  refine Matrix.ext fun i j => ?_
  fin_cases i <;> fin_cases j <;>
    simp [actBy, boostMat, herm2, Matrix.mul_apply, Fin.sum_univ_two,
      Matrix.conjTranspose_apply, qsmul_mul_left, smul_smul,
      mul_inv_cancel₀ hp, inv_mul_cancel₀ hp] <;>
    ring_nf

-- the lightcone-rescaled coords have the SAME Qform
theorem scaled_Qform (p t x : ℚ) (hp : p ≠ 0) (v : O ℚ) :
    Qform ((p^2*(t+x) + p⁻¹^2*(t-x))/2) ((p^2*(t+x) - p⁻¹^2*(t-x))/2) v = Qform t x v := by
  unfold Qform
  have hpp : p^2 * p⁻¹^2 = 1 := by rw [← mul_pow, mul_inv_cancel₀ hp, one_pow]
  nlinarith [hpp]

-- mdet of the action equals herm2_det of the original = Qform t x v.
-- mdet (actBy ...) is herm2_det of the rescaled herm2, which = Qform of rescaled = Qform t x v.
theorem mdet_act (p t x : ℚ) (hp : p ≠ 0) (v : O ℚ) :
    mdet (actBy (boostMat p) (herm2 t x v)) = Qform t x v := by
  have hshape := act_herm2 p t x hp v
  have : mdet (actBy (boostMat p) (herm2 t x v))
      = herm2_det ((p^2*(t+x) + p⁻¹^2*(t-x))/2) ((p^2*(t+x) - p⁻¹^2*(t-x))/2) v := by
    rw [hshape]; rfl
  rw [this, herm2_det_eq, scaled_Qform p t x hp v]

end

end Phys.AlgebraProbe
