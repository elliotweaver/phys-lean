import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Phys.Algebra.HermitianJordan.Helpers
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 800000

/-- A matrix whose entries are the central embedded scalars `ocR (P i j)`. -/
noncomputable def ocRM (P : Matrix (Fin 3) (Fin 3) ℚ) : Matrix (Fin 3) (Fin 3) (O ℚ) :=
  Matrix.of (fun i j => ocR (P i j))

@[simp] theorem ocRM_apply (P : Matrix (Fin 3) (Fin 3) ℚ) (i j : Fin 3) :
    ocRM P i j = ocR (P i j) := rfl

-- Central-matrix LEFT associativity: (ocRM P) * (Y * Z) = ((ocRM P) * Y) * Z.
-- Entry (i,j): Σ_k ocR(P i k) * (Y*Z)_{kj} = Σ_k ocR(P i k) * (Σ_l Y_kl Z_lj)
--            = Σ_k Σ_l ocR(P i k)*(Y_kl Z_lj) = Σ_k Σ_l (ocR(P i k)*Y_kl)*Z_lj  [ocR_assocL]
-- RHS entry: Σ_l ((ocRM P * Y)_{il}) * Z_lj = Σ_l (Σ_k ocR(P i k) Y_kl) * Z_lj
--          = Σ_l Σ_k (ocR(P i k) Y_kl) Z_lj   [sum_mul]. Match by Finset.sum_comm.
theorem ocRM_assoc_L (P : Matrix (Fin 3) (Fin 3) ℚ) (Y Z : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    ocRM P * (Y * Z) = (ocRM P * Y) * Z := by
  apply Matrix.ext; intro i j
  simp only [Matrix.mul_apply, ocRM_apply, Fin.sum_univ_three, Finset.sum_mul, Finset.mul_sum]
  simp only [ocR_assocL]
  abel

end Phys.Algebra.HJ
