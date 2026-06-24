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
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D2E⁆ = ((2 : ℚ)) • D1E. -/
theorem br_0_2 : ⁅D0E, D2E⁆ = ((2 : ℚ)) • D1E := by
  show D0E * D2E - D2E * D0E = ((2 : ℚ)) • D1E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D3E⁆ = 0. -/
theorem br_0_3 : ⁅D0E, D3E⁆ = 0 := by
  show D0E * D3E - D3E * D0E = 0
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D4E⁆ = D7E. -/
theorem br_0_4 : ⁅D0E, D4E⁆ = D7E := by
  show D0E * D4E - D4E * D0E = D7E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D5E⁆ = -D6E. -/
theorem br_0_5 : ⁅D0E, D5E⁆ = -D6E := by
  show D0E * D5E - D5E * D0E = -D6E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D6E⁆ = D5E. -/
theorem br_0_6 : ⁅D0E, D6E⁆ = D5E := by
  show D0E * D6E - D6E * D0E = D5E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D7E⁆ = -D4E. -/
theorem br_0_7 : ⁅D0E, D7E⁆ = -D4E := by
  show D0E * D7E - D7E * D0E = -D4E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D8E⁆ = D2E. -/
theorem br_0_8 : ⁅D0E, D8E⁆ = D2E := by
  show D0E * D8E - D8E * D0E = D2E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D9E⁆ = D12E. -/
theorem br_0_9 : ⁅D0E, D9E⁆ = D12E := by
  show D0E * D9E - D9E * D0E = D12E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D10E⁆ = -D11E. -/
theorem br_0_10 : ⁅D0E, D10E⁆ = -D11E := by
  show D0E * D10E - D10E * D0E = -D11E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D11E⁆ = D10E. -/
theorem br_0_11 : ⁅D0E, D11E⁆ = D10E := by
  show D0E * D11E - D11E * D0E = D10E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D12E⁆ = -D9E. -/
theorem br_0_12 : ⁅D0E, D12E⁆ = -D9E := by
  show D0E * D12E - D12E * D0E = -D9E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D0E, D13E⁆ = -D1E. -/
theorem br_0_13 : ⁅D0E, D13E⁆ = -D1E := by
  show D0E * D13E - D13E * D0E = -D1E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D1E, D2E⁆ = ((-2 : ℚ)) • D0E. -/
theorem br_1_2 : ⁅D1E, D2E⁆ = ((-2 : ℚ)) • D0E := by
  show D1E * D2E - D2E * D1E = ((-2 : ℚ)) • D0E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D1E, D3E⁆ = -D2E. -/
theorem br_1_3 : ⁅D1E, D3E⁆ = -D2E := by
  show D1E * D3E - D3E * D1E = -D2E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D1E, D4E⁆ = D6E. -/
theorem br_1_4 : ⁅D1E, D4E⁆ = D6E := by
  show D1E * D4E - D4E * D1E = D6E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D1E, D5E⁆ = D7E. -/
theorem br_1_5 : ⁅D1E, D5E⁆ = D7E := by
  show D1E * D5E - D5E * D1E = D7E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D1E, D6E⁆ = -D4E. -/
theorem br_1_6 : ⁅D1E, D6E⁆ = -D4E := by
  show D1E * D6E - D6E * D1E = -D4E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D1E, D7E⁆ = -D5E. -/
theorem br_1_7 : ⁅D1E, D7E⁆ = -D5E := by
  show D1E * D7E - D7E * D1E = -D5E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D1E, D8E⁆ = 0. -/
theorem br_1_8 : ⁅D1E, D8E⁆ = 0 := by
  show D1E * D8E - D8E * D1E = 0
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D1E, D9E⁆ = D11E. -/
theorem br_1_9 : ⁅D1E, D9E⁆ = D11E := by
  show D1E * D9E - D9E * D1E = D11E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D1E, D10E⁆ = D12E. -/
theorem br_1_10 : ⁅D1E, D10E⁆ = D12E := by
  show D1E * D10E - D10E * D1E = D12E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D1E, D11E⁆ = -D9E. -/
theorem br_1_11 : ⁅D1E, D11E⁆ = -D9E := by
  show D1E * D11E - D11E * D1E = -D9E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D1E, D12E⁆ = -D10E. -/
theorem br_1_12 : ⁅D1E, D12E⁆ = -D10E := by
  show D1E * D12E - D12E * D1E = -D10E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D1E, D13E⁆ = D0E. -/
theorem br_1_13 : ⁅D1E, D13E⁆ = D0E := by
  show D1E * D13E - D13E * D1E = D0E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D2E, D3E⁆ = D1E. -/
theorem br_2_3 : ⁅D2E, D3E⁆ = D1E := by
  show D2E * D3E - D3E * D2E = D1E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D2E, D4E⁆ = -D5E. -/
theorem br_2_4 : ⁅D2E, D4E⁆ = -D5E := by
  show D2E * D4E - D4E * D2E = -D5E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D2E, D5E⁆ = D4E. -/
theorem br_2_5 : ⁅D2E, D5E⁆ = D4E := by
  show D2E * D5E - D5E * D2E = D4E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D2E, D6E⁆ = D7E. -/
theorem br_2_6 : ⁅D2E, D6E⁆ = D7E := by
  show D2E * D6E - D6E * D2E = D7E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D2E, D7E⁆ = -D6E. -/
theorem br_2_7 : ⁅D2E, D7E⁆ = -D6E := by
  show D2E * D7E - D7E * D2E = -D6E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D2E, D8E⁆ = -D0E. -/
theorem br_2_8 : ⁅D2E, D8E⁆ = -D0E := by
  show D2E * D8E - D8E * D2E = -D0E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D2E, D9E⁆ = -D10E. -/
theorem br_2_9 : ⁅D2E, D9E⁆ = -D10E := by
  show D2E * D9E - D9E * D2E = -D10E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D2E, D10E⁆ = D9E. -/
theorem br_2_10 : ⁅D2E, D10E⁆ = D9E := by
  show D2E * D10E - D10E * D2E = D9E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D2E, D11E⁆ = D12E. -/
theorem br_2_11 : ⁅D2E, D11E⁆ = D12E := by
  show D2E * D11E - D11E * D2E = D12E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D2E, D12E⁆ = -D11E. -/
theorem br_2_12 : ⁅D2E, D12E⁆ = -D11E := by
  show D2E * D12E - D12E * D2E = -D11E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D2E, D13E⁆ = 0. -/
theorem br_2_13 : ⁅D2E, D13E⁆ = 0 := by
  show D2E * D13E - D13E * D2E = 0
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D3E, D4E⁆ = D7E. -/
theorem br_3_4 : ⁅D3E, D4E⁆ = D7E := by
  show D3E * D4E - D4E * D3E = D7E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D3E, D5E⁆ = ((2 : ℚ)) • D6E. -/
theorem br_3_5 : ⁅D3E, D5E⁆ = ((2 : ℚ)) • D6E := by
  show D3E * D5E - D5E * D3E = ((2 : ℚ)) • D6E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D3E, D6E⁆ = ((-2 : ℚ)) • D5E. -/
theorem br_3_6 : ⁅D3E, D6E⁆ = ((-2 : ℚ)) • D5E := by
  show D3E * D6E - D6E * D3E = ((-2 : ℚ)) • D5E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D3E, D7E⁆ = -D4E. -/
theorem br_3_7 : ⁅D3E, D7E⁆ = -D4E := by
  show D3E * D7E - D7E * D3E = -D4E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D3E, D8E⁆ = D13E. -/
theorem br_3_8 : ⁅D3E, D8E⁆ = D13E := by
  show D3E * D8E - D8E * D3E = D13E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D3E, D9E⁆ = -D6E. -/
theorem br_3_9 : ⁅D3E, D9E⁆ = -D6E := by
  show D3E * D9E - D9E * D3E = -D6E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D3E, D10E⁆ = D7E + D11E. -/
theorem br_3_10 : ⁅D3E, D10E⁆ = D7E + D11E := by
  show D3E * D10E - D10E * D3E = D7E + D11E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D3E, D11E⁆ = D4E + (-D10E). -/
theorem br_3_11 : ⁅D3E, D11E⁆ = D4E + (-D10E) := by
  show D3E * D11E - D11E * D3E = D4E + (-D10E)
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D3E, D12E⁆ = -D5E. -/
theorem br_3_12 : ⁅D3E, D12E⁆ = -D5E := by
  show D3E * D12E - D12E * D3E = -D5E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D3E, D13E⁆ = -D8E. -/
theorem br_3_13 : ⁅D3E, D13E⁆ = -D8E := by
  show D3E * D13E - D13E * D3E = -D8E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D4E, D5E⁆ = -D2E. -/
theorem br_4_5 : ⁅D4E, D5E⁆ = -D2E := by
  show D4E * D5E - D5E * D4E = -D2E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D4E, D6E⁆ = D1E. -/
theorem br_4_6 : ⁅D4E, D6E⁆ = D1E := by
  show D4E * D6E - D6E * D4E = D1E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D4E, D7E⁆ = ((2 : ℚ)) • D0E + ((2 : ℚ)) • D3E. -/
theorem br_4_7 : ⁅D4E, D7E⁆ = ((2 : ℚ)) • D0E + ((2 : ℚ)) • D3E := by
  show D4E * D7E - D7E * D4E = ((2 : ℚ)) • D0E + ((2 : ℚ)) • D3E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D4E, D8E⁆ = D6E + (-D12E). -/
theorem br_4_8 : ⁅D4E, D8E⁆ = D6E + (-D12E) := by
  show D4E * D8E - D8E * D4E = D6E + (-D12E)
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D4E, D9E⁆ = D2E + D13E. -/
theorem br_4_9 : ⁅D4E, D9E⁆ = D2E + D13E := by
  show D4E * D9E - D9E * D4E = D2E + D13E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D4E, D10E⁆ = 0. -/
theorem br_4_10 : ⁅D4E, D10E⁆ = 0 := by
  show D4E * D10E - D10E * D4E = 0
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D4E, D11E⁆ = -D0E + (-D3E). -/
theorem br_4_11 : ⁅D4E, D11E⁆ = -D0E + (-D3E) := by
  show D4E * D11E - D11E * D4E = -D0E + (-D3E)
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D4E, D12E⁆ = D1E + D8E. -/
theorem br_4_12 : ⁅D4E, D12E⁆ = D1E + D8E := by
  show D4E * D12E - D12E * D4E = D1E + D8E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D4E, D13E⁆ = -D5E + (-D9E). -/
theorem br_4_13 : ⁅D4E, D13E⁆ = -D5E + (-D9E) := by
  show D4E * D13E - D13E * D4E = -D5E + (-D9E)
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D5E, D6E⁆ = ((2 : ℚ)) • D3E. -/
theorem br_5_6 : ⁅D5E, D6E⁆ = ((2 : ℚ)) • D3E := by
  show D5E * D6E - D6E * D5E = ((2 : ℚ)) • D3E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D5E, D7E⁆ = D1E. -/
theorem br_5_7 : ⁅D5E, D7E⁆ = D1E := by
  show D5E * D7E - D7E * D5E = D1E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D5E, D8E⁆ = -D11E. -/
theorem br_5_8 : ⁅D5E, D8E⁆ = -D11E := by
  show D5E * D8E - D8E * D5E = -D11E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D5E, D9E⁆ = 0. -/
theorem br_5_9 : ⁅D5E, D9E⁆ = 0 := by
  show D5E * D9E - D9E * D5E = 0
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D5E, D10E⁆ = D2E + D13E. -/
theorem br_5_10 : ⁅D5E, D10E⁆ = D2E + D13E := by
  show D5E * D10E - D10E * D5E = D2E + D13E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D5E, D11E⁆ = D8E. -/
theorem br_5_11 : ⁅D5E, D11E⁆ = D8E := by
  show D5E * D11E - D11E * D5E = D8E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D5E, D12E⁆ = D3E. -/
theorem br_5_12 : ⁅D5E, D12E⁆ = D3E := by
  show D5E * D12E - D12E * D5E = D3E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D5E, D13E⁆ = D4E + (-D10E). -/
theorem br_5_13 : ⁅D5E, D13E⁆ = D4E + (-D10E) := by
  show D5E * D13E - D13E * D5E = D4E + (-D10E)
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D6E, D7E⁆ = D2E. -/
theorem br_6_7 : ⁅D6E, D7E⁆ = D2E := by
  show D6E * D7E - D7E * D6E = D2E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D6E, D8E⁆ = -D4E + D10E. -/
theorem br_6_8 : ⁅D6E, D8E⁆ = -D4E + D10E := by
  show D6E * D8E - D8E * D6E = -D4E + D10E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D6E, D9E⁆ = D3E. -/
theorem br_6_9 : ⁅D6E, D9E⁆ = D3E := by
  show D6E * D9E - D9E * D6E = D3E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D6E, D10E⁆ = -D1E + (-D8E). -/
theorem br_6_10 : ⁅D6E, D10E⁆ = -D1E + (-D8E) := by
  show D6E * D10E - D10E * D6E = -D1E + (-D8E)
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D6E, D11E⁆ = D13E. -/
theorem br_6_11 : ⁅D6E, D11E⁆ = D13E := by
  show D6E * D11E - D11E * D6E = D13E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D6E, D12E⁆ = 0. -/
theorem br_6_12 : ⁅D6E, D12E⁆ = 0 := by
  show D6E * D12E - D12E * D6E = 0
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D6E, D13E⁆ = -D11E. -/
theorem br_6_13 : ⁅D6E, D13E⁆ = -D11E := by
  show D6E * D13E - D13E * D6E = -D11E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D7E, D8E⁆ = D9E. -/
theorem br_7_8 : ⁅D7E, D8E⁆ = D9E := by
  show D7E * D8E - D8E * D7E = D9E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D7E, D9E⁆ = -D8E. -/
theorem br_7_9 : ⁅D7E, D9E⁆ = -D8E := by
  show D7E * D9E - D9E * D7E = -D8E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D7E, D10E⁆ = -D0E + (-D3E). -/
theorem br_7_10 : ⁅D7E, D10E⁆ = -D0E + (-D3E) := by
  show D7E * D10E - D10E * D7E = -D0E + (-D3E)
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D7E, D11E⁆ = 0. -/
theorem br_7_11 : ⁅D7E, D11E⁆ = 0 := by
  show D7E * D11E - D11E * D7E = 0
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D7E, D12E⁆ = D13E. -/
theorem br_7_12 : ⁅D7E, D12E⁆ = D13E := by
  show D7E * D12E - D12E * D7E = D13E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D7E, D13E⁆ = -D12E. -/
theorem br_7_13 : ⁅D7E, D13E⁆ = -D12E := by
  show D7E * D13E - D13E * D7E = -D12E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D8E, D9E⁆ = ((-2 : ℚ)) • D11E. -/
theorem br_8_9 : ⁅D8E, D9E⁆ = ((-2 : ℚ)) • D11E := by
  show D8E * D9E - D9E * D8E = ((-2 : ℚ)) • D11E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D8E, D10E⁆ = D12E. -/
theorem br_8_10 : ⁅D8E, D10E⁆ = D12E := by
  show D8E * D10E - D10E * D8E = D12E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D8E, D11E⁆ = ((2 : ℚ)) • D9E. -/
theorem br_8_11 : ⁅D8E, D11E⁆ = ((2 : ℚ)) • D9E := by
  show D8E * D11E - D11E * D8E = ((2 : ℚ)) • D9E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D8E, D12E⁆ = -D10E. -/
theorem br_8_12 : ⁅D8E, D12E⁆ = -D10E := by
  show D8E * D12E - D12E * D8E = -D10E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D8E, D13E⁆ = D3E. -/
theorem br_8_13 : ⁅D8E, D13E⁆ = D3E := by
  show D8E * D13E - D13E * D8E = D3E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D9E, D10E⁆ = -D2E. -/
theorem br_9_10 : ⁅D9E, D10E⁆ = -D2E := by
  show D9E * D10E - D10E * D9E = -D2E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D9E, D11E⁆ = ((-2 : ℚ)) • D8E. -/
theorem br_9_11 : ⁅D9E, D11E⁆ = ((-2 : ℚ)) • D8E := by
  show D9E * D11E - D11E * D9E = ((-2 : ℚ)) • D8E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D9E, D12E⁆ = D0E. -/
theorem br_9_12 : ⁅D9E, D12E⁆ = D0E := by
  show D9E * D12E - D12E * D9E = D0E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D9E, D13E⁆ = D4E + (-D10E). -/
theorem br_9_13 : ⁅D9E, D13E⁆ = D4E + (-D10E) := by
  show D9E * D13E - D13E * D9E = D4E + (-D10E)
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D10E, D11E⁆ = -D0E. -/
theorem br_10_11 : ⁅D10E, D11E⁆ = -D0E := by
  show D10E * D11E - D11E * D10E = -D0E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D10E, D12E⁆ = ((2 : ℚ)) • D1E + ((2 : ℚ)) • D8E. -/
theorem br_10_12 : ⁅D10E, D12E⁆ = ((2 : ℚ)) • D1E + ((2 : ℚ)) • D8E := by
  show D10E * D12E - D12E * D10E = ((2 : ℚ)) • D1E + ((2 : ℚ)) • D8E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D10E, D13E⁆ = D5E + D9E. -/
theorem br_10_13 : ⁅D10E, D13E⁆ = D5E + D9E := by
  show D10E * D13E - D13E * D10E = D5E + D9E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D11E, D12E⁆ = D2E. -/
theorem br_11_12 : ⁅D11E, D12E⁆ = D2E := by
  show D11E * D12E - D12E * D11E = D2E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D11E, D13E⁆ = D6E. -/
theorem br_11_13 : ⁅D11E, D13E⁆ = D6E := by
  show D11E * D13E - D13E * D11E = D6E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

/-- Structure constant: ⁅D12E, D13E⁆ = D7E. -/
theorem br_12_13 : ⁅D12E, D13E⁆ = D7E := by
  show D12E * D13E - D13E * D12E = D7E
  ext z <;>
    simp only [LinearMap.sub_apply, LinearMap.add_apply, LinearMap.neg_apply, LinearMap.smul_apply,
      LinearMap.zero_apply, Module.End.mul_apply, sub_eq_add_neg,
      D0E, D1E, D2E, D3E, D4E, D5E, D6E, D7E, D8E, D9E, D10E, D11E, D12E, D13E,
      c0, c1, c2, c3, c4, c5, c6, c7, LinearMap.coe_mk, AddHom.coe_mk,
      CD.add_re, CD.add_im, Dbl.add_re, Dbl.add_im, CD.neg_re, CD.neg_im,
      Dbl.neg_re, Dbl.neg_im, CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im,
      cd_qsmul_re, cd_qsmul_im, Dbl.smul_re, Dbl.smul_im] <;> ring

end Phys.Algebra
