import Phys.Algebra.OctonionJordanInnerDerivationLeibniz

/-! N287 scratch — DE-RISK the full witness-level gauge-centrality of M0. -/

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

variable (D : Module.End ℚ (O ℚ))

-- THE LEVER (already de-risked; restate for the full chain).
theorem innerMul_gauge_leibniz (hD : IsDerivQ D) (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    ⁅jActL D, innerMul A B⁆
      = innerMul (jAct D A) B + innerMul A (jAct D B) := by
  rw [show (⁅jActL D, innerMul A B⁆ :
      Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ)))
        = jActL D * innerMul A B - innerMul A B * jActL D from
      Ring.lie_def _ _]
  apply LinearMap.ext; intro X
  simp only [LinearMap.sub_apply, LinearMap.add_apply, Module.End.mul_apply,
    innerMul_apply, jActL_apply]
  rw [show jAct D (jb A (jb B X) - jb B (jb A X))
        = jAct D (jb A (jb B X)) - jAct D (jb B (jb A X)) from
      map_sub (jActL D) _ _]
  rw [jAct_jb D hD A (jb B X), jAct_jb D hD B X, jAct_jb D hD B (jb A X), jAct_jb D hD A X]
  simp only [jb, mul_add, add_mul, sub_mul]
  abel

-- innerMul is zero when either multiplier is zero (bilinearity: Lmul 0 = 0).
theorem innerMul_zero_left (B : Matrix (Fin 3) (Fin 3) (O ℚ)) : innerMul 0 B = 0 := by
  apply LinearMap.ext; intro X
  simp only [innerMul_apply, jb, Matrix.zero_mul, Matrix.mul_zero, zero_add, add_zero,
    LinearMap.zero_apply, sub_self]

theorem innerMul_zero_right (A : Matrix (Fin 3) (Fin 3) (O ℚ)) : innerMul A 0 = 0 := by
  apply LinearMap.ext; intro X
  simp only [innerMul_apply, jb, Matrix.zero_mul, Matrix.mul_zero, zero_add, add_zero,
    LinearMap.zero_apply, sub_self]

-- jAct D (slotA 1) = 0 : slotA (D 1) = slotA 0 = 0.
theorem jAct_slotA_one (hD : IsDerivQ D) : jAct D (slotA (1 : O ℚ)) = 0 := by
  rw [jAct_slotA D hD, derivQ_one D hD]
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotA, Xz]

theorem jAct_slotB_one (hD : IsDerivQ D) : jAct D (slotB (1 : O ℚ)) = 0 := by
  rw [jAct_slotB D hD, derivQ_one D hD]
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotB, Xz]

-- THE DELIVERABLE: M0 = innerMul (slotA 1)(slotB 1) commutes with the WHOLE gauge.
theorem M0_gauge_central (hD : IsDerivQ D) :
    ⁅jActL D, innerMul (slotA (1 : O ℚ)) (slotB (1 : O ℚ))⁆ = 0 := by
  rw [innerMul_gauge_leibniz D hD, jAct_slotA_one D hD, jAct_slotB_one D hD,
    innerMul_zero_left, innerMul_zero_right, add_zero]

end Phys.Algebra.HJ
