import Phys.Algebra.DerivationBracket
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option linter.unusedSimpArgs false

/-- Structure constant: ⁅D0E, D1E⁆ = ((-2 : ℚ)) • D2E. -/
theorem br_0_1 : ⁅D0E, D1E⁆ = ((-2 : ℚ)) • D2E := by
  show D0E * D1E - D1E * D0E = ((-2 : ℚ)) • D2E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D2E⁆ = ((2 : ℚ)) • D1E. -/
theorem br_0_2 : ⁅D0E, D2E⁆ = ((2 : ℚ)) • D1E := by
  show D0E * D2E - D2E * D0E = ((2 : ℚ)) • D1E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D3E⁆ = 0. -/
theorem br_0_3 : ⁅D0E, D3E⁆ = 0 := by
  show D0E * D3E - D3E * D0E = 0
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D4E⁆ = D7E. -/
theorem br_0_4 : ⁅D0E, D4E⁆ = D7E := by
  show D0E * D4E - D4E * D0E = D7E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D5E⁆ = -D6E. -/
theorem br_0_5 : ⁅D0E, D5E⁆ = -D6E := by
  show D0E * D5E - D5E * D0E = -D6E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D6E⁆ = D5E. -/
theorem br_0_6 : ⁅D0E, D6E⁆ = D5E := by
  show D0E * D6E - D6E * D0E = D5E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

end Phys.Algebra
