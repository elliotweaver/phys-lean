import Phys.Algebra.OctonionCoassociative4Form

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- ============ The master exchange identity (polarized composition law) ============

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

theorem gForm_exchange (x y z w : O ℚ) :
    gForm (x * y) (z * w) + gForm (x * w) (z * y) = 2 * gForm x z * gForm y w := by
  have h := gForm_right_exchange x z (y + w)
  rw [mul_add, mul_add] at h
  simp only [gForm_add_left, gForm_add_right] at h
  have hy := gForm_right_exchange x z y
  have hw := gForm_right_exchange x z w
  have hyw : gForm y w = gForm w y := gForm_symm _ _
  linear_combination h - hy - hw - (gForm x z) * hyw

-- ============ Cross-product Gram (from exchange, on imaginaries) ============

theorem gForm_xy_one (x y : O ℚ) (hy : y ∈ ImO) :
    gForm (x * y) (1 : O ℚ) = - gForm x y := by
  rw [gForm_one_right]; exact octMul_re_eq_neg_gForm hy

theorem gForm_one_zw (z w : O ℚ) (hw : w ∈ ImO) :
    gForm (1 : O ℚ) (z * w) = - gForm z w := by
  show reQ (1 * star (z * w)) = - reQ (z * star w)
  rw [one_mul, reQ_star]; exact octMul_re_eq_neg_gForm hw

theorem gForm_octCross_octCross {x y z w : O ℚ}
    (hy : y ∈ ImO) (hw : w ∈ ImO) :
    gForm (octCross x y) (octCross z w) = gForm (x * y) (z * w) - gForm x y * gForm z w := by
  unfold octCross
  simp only [gForm_add_left, gForm_add_right, gForm_smul_left, gForm_smul_right]
  rw [gForm_xy_one x y hy, gForm_one_zw z w hw, gForm_one_one]
  ring

-- THE HEADLINE: the symmetrized cross-product Gram contraction (the ψ-free part of the
-- calibration contraction; generalizes the Lagrange identity on the diagonal).
theorem octCross_gram_contraction {x y z w : O ℚ}
    (hy : y ∈ ImO) (hz : z ∈ ImO) (hw : w ∈ ImO) :
    gForm (octCross x y) (octCross z w) + gForm (octCross x w) (octCross z y) =
      2 * gForm x z * gForm y w - gForm x y * gForm z w - gForm x w * gForm y z := by
  have h1 := gForm_octCross_octCross (x := x) (y := y) (z := z) (w := w) hy hw
  have h2 := gForm_octCross_octCross (x := x) (y := w) (z := z) (w := y) hw hy
  have he := gForm_exchange x y z w
  have hsym : gForm z y = gForm y z := gForm_symm _ _
  linear_combination h1 + h2 + he - (gForm x w) * hsym

end

#print axioms gForm_right_exchange
#print axioms gForm_exchange
#print axioms gForm_octCross_octCross
#print axioms octCross_gram_contraction

end Phys.Algebra
