import Phys.Algebra.DerivationLowerBound
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- (a) MEASURE: the ℚ bracket-closure lemma (analog of N6 isDeriv_bracket).
theorem isDerivQ_bracket (f g : Module.End ℚ (O ℚ))
    (hf : IsDerivQ f) (hg : IsDerivQ g) : IsDerivQ ⁅f, g⁆ := by
  intro x y
  show (f * g - g * f) (x * y) = (f * g - g * f) x * y + x * (f * g - g * f) y
  simp only [LinearMap.sub_apply, Module.End.mul_apply]
  rw [hg x y, hf x y]
  simp only [map_add]
  rw [hf (g x) y, hf x (g y), hg (f x) y, hg x (f y)]
  simp only [sub_mul, mul_sub]; abel

-- (b) MEASURE: one single-term structure constant, [D0E, D4E] = D7E (numerics say =D7).
theorem br_0_4 : ⁅D0E, D4E⁆ = D7E := by
  ext z
  show (D0E * D4E - D4E * D0E) z = D7E z
  simp only [LinearMap.sub_apply, Module.End.mul_apply, D0E, D4E, D7E,
    c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
    Dbl.neg_re, Dbl.neg_im]

-- (c) MEASURE: a two-term (octonionic) structure constant, [D4E, D7E] = 2 D0E + 2 D3E.
theorem br_4_7 : ⁅D4E, D7E⁆ = (2:ℚ) • D0E + (2:ℚ) • D3E := by
  ext z
  show (D4E * D7E - D7E * D4E) z = ((2:ℚ) • D0E + (2:ℚ) • D3E) z
  simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.smul_apply,
    Module.End.mul_apply, D0E, D3E, D4E, D7E,
    c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
    CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
    Dbl.neg_re, Dbl.neg_im, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im]

end Phys.Algebra
