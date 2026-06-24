import Phys.Algebra.DerivationLowerBound
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- (b) MEASURE: one single-term structure constant, [D0E, D4E] = D7E.
theorem br_0_4 : ⁅D0E, D4E⁆ = D7E := by
  show D0E * D4E - D4E * D0E = D7E
  ext z <;>
    simp only [LinearMap.sub_apply, Module.End.mul_apply, sub_eq_add_neg, D0E, D4E, D7E,
      c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im] <;> ring

-- (c) MEASURE: a two-term (octonionic) structure constant, [D4E, D7E] = 2 D0E + 2 D3E.
theorem br_4_7 : ⁅D4E, D7E⁆ = (2:ℚ) • D0E + (2:ℚ) • D3E := by
  show D4E * D7E - D7E * D4E = (2:ℚ) • D0E + (2:ℚ) • D3E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.smul_apply,
      Module.End.mul_apply, sub_eq_add_neg, D0E, D3E, D4E, D7E,
      c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

end Phys.Algebra
