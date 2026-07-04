import Phys.Algebra.OctonionJordanGaugeNeutralInnerDerivation
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD
set_option maxHeartbeats 2000000

variable (D : Module.End ℚ (O ℚ))

-- jAct kills slotC 1 too (real core)
theorem jAct_slotC_one (hD : IsDerivQ D) : jAct D (slotC (1 : O ℚ)) = 0 := by
  rw [jAct_slotC D hD, derivQ_one D hD]
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [slotC, Xz]

-- FA = innerMul (slotB 1)(slotC 1) is gauge-central (same lever as M0)
theorem FA_gauge_central (hD : IsDerivQ D) :
    ⁅jActL D, innerMul (slotB (1:O ℚ)) (slotC 1)⁆ = 0 := by
  rw [innerMul_gauge_leibniz D hD, jAct_slotB_one D hD, jAct_slotC_one D hD,
    innerMul_zero_left, innerMul_zero_right, add_zero]

-- FB = innerMul (slotC 1)(slotA 1) gauge-central
theorem FB_gauge_central (hD : IsDerivQ D) :
    ⁅jActL D, innerMul (slotC (1:O ℚ)) (slotA 1)⁆ = 0 := by
  rw [innerMul_gauge_leibniz D hD, jAct_slotC_one D hD, jAct_slotA_one D hD,
    innerMul_zero_left, innerMul_zero_right, add_zero]

end Phys.Algebra.HJ
