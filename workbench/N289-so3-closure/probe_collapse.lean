import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Phys.Algebra.OctonionJordanInnerMultiplicationTriangle
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 1000000

/-- adE K : X ↦ K*X - X*K, the matrix-commutator endomorphism. -/
noncomputable def adE (K : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) →ₗ[ℚ] Matrix (Fin 3) (Fin 3) (O ℚ) where
  toFun X := K * X - X * K
  map_add' X Y := by rw [mul_add, add_mul]; abel
  map_smul' r X := by
    simp only [RingHom.id_apply, mat_mul_smul, mat_smul_mul, smul_sub]

@[simp] theorem adE_apply (K X : Matrix (Fin 3) (Fin 3) (O ℚ)) : adE K X = K * X - X * K := rfl

/-- The constant matrix Mc = [slotA 1, slotB 1] (as matrices). Entries (1,2)=1,(2,1)=-1. -/
noncomputable def Mc : Matrix (Fin 3) (Fin 3) (O ℚ) := !![0,0,0; 0,0,1; 0,-1,0]

-- LINCHPIN: does innerMul (slotA 1)(slotB 1) collapse to adE Mc full-space, cheaply?
set_option maxHeartbeats 2000000 in
theorem collapse_FC : innerMul (slotA (1:O ℚ)) (slotB 1) = adE Mc := by
  apply LinearMap.ext; intro X
  rw [innerMul_apply, adE_apply]
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [jb, slotA, slotB, Mc, Xz, Matrix.mul_apply, Matrix.add_apply, Matrix.sub_apply,
      Fin.sum_univ_three] <;> abel

end Phys.Algebra.HJ
