import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- STEP 1: right exchange (polarize gForm_comp in the LEFT factor)
theorem gForm_right_exchange (a c y : O ℚ) :
    gForm (a * y) (c * y) = gForm a c * gForm y y := by
  have h := gForm_comp (a + c) y
  rw [add_mul] at h
  simp only [gForm_add_left, gForm_add_right] at h
  have ha := gForm_comp a y
  have hc := gForm_comp c y
  have hsym : gForm (c * y) (a * y) = gForm (a * y) (c * y) := gForm_symm _ _
  have hsym2 : gForm c a = gForm a c := gForm_symm _ _
  linear_combination h / 2 - ha / 2 - hc / 2 - hsym / 2 + (gForm y y) * hsym2 / 2

-- STEP 2: full exchange (polarize right exchange in the RIGHT factor)
theorem gForm_exchange (x y z w : O ℚ) :
    gForm (x * y) (z * w) + gForm (x * w) (z * y) = 2 * gForm x z * gForm y w := by
  have h := gForm_right_exchange x z (y + w)
  rw [mul_add, mul_add] at h
  simp only [gForm_add_left, gForm_add_right] at h
  have hy := gForm_right_exchange x z y
  have hw := gForm_right_exchange x z w
  have hyw : gForm y w = gForm w y := gForm_symm _ _
  linear_combination h - hy - hw - (gForm x z) * hyw

end

#print axioms gForm_right_exchange
#print axioms gForm_exchange

end Phys.Algebra
