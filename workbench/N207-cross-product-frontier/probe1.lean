import Phys.Algebra.OctonionCrossProduct

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- ★ MAIN: derivation-invariance of the cross product (front b).
theorem octCross_deriv_leibniz (D : Module.End ℚ (O ℚ)) (hD : IsDerivQ D) (x y : O ℚ) :
    D (octCross x y) = octCross (D x) y + octCross x (D y) := by
  unfold octCross
  rw [map_add, map_smul, derivQ_one D hD, smul_zero, add_zero, hD x y]
  have hskew := gFormQ_skew D hD x y
  have hcorr : (gForm (D x) y) • (1 : O ℚ) + (gForm x (D y)) • (1 : O ℚ) = 0 := by
    rw [← add_smul, hskew, zero_smul]
  rw [show ((D x * y + (gForm (D x) y) • (1 : O ℚ)) + (x * D y + (gForm x (D y)) • (1 : O ℚ)))
       = (D x * y + x * D y)
         + ((gForm (D x) y) • (1 : O ℚ) + (gForm x (D y)) • (1 : O ℚ)) from by abel,
     hcorr, add_zero]

#print axioms octCross_deriv_leibniz

end

end Phys.Algebra
