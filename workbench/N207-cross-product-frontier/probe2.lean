import Phys.Algebra.OctonionCrossProduct
import Phys.Algebra.DerivationLowerBound

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

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

-- W8 tooth value: the witness coordinate is -1.
theorem octCross_deriv_witness_coord : (D0E (octCross u1 u2)).im.re.re = -1 := by
  rw [show octCross u1 u2 = u1 * u2 by
        unfold octCross; rw [gForm_u1_u2, zero_smul, add_zero]]
  simp only [D0E, c3, u1, u2, CD.mul_re, CD.mul_im, CD.add_re, CD.add_im,
    CD.neg_im, Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im,
    LinearMap.coe_mk, AddHom.coe_mk]
  norm_num

-- W8 tooth: D0E (octCross u1 u2) ≠ 0
theorem octCross_deriv_witness_ne_zero : D0E (octCross u1 u2) ≠ 0 := by
  intro h
  have hz := octCross_deriv_witness_coord
  rw [h] at hz
  simp only [CD.zero_re, CD.zero_im, Dbl.zero_re] at hz
  norm_num at hz

-- the invariance instantiated at the concrete derivation witness, both sides nonzero.
theorem octCross_deriv_witness :
    D0E (octCross u1 u2) = octCross (D0E u1) u2 + octCross u1 (D0E u2) :=
  octCross_deriv_leibniz D0E D0E_isDerivQ u1 u2

#print axioms octCross_deriv_leibniz
#print axioms octCross_deriv_witness_coord
#print axioms octCross_deriv_witness_ne_zero
#print axioms octCross_deriv_witness

end

end Phys.Algebra
