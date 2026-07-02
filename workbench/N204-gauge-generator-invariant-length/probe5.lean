import Phys.Algebra.DerivationColourIsospinNonNormalize
import Phys.Algebra.DerivationCompact
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable abbrev B := LieModule.traceForm ℚ derivationLieQ (O ℚ)

-- helper: all 8 basis elements explicitly.
private lemma e0' : (bO 0 : O ℚ) = ⟨⟨⟨1,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩ := by
  simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 0 1) = _
  simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
private lemma e1' : (bO 1 : O ℚ) = ⟨⟨⟨0,1⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩ := by
  simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 1 1) = _
  simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
private lemma e2' : (bO 2 : O ℚ) = ⟨⟨⟨0,0⟩,⟨1,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩ := by
  simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 2 1) = _
  simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
private lemma e3' : (bO 3 : O ℚ) = ⟨⟨⟨0,0⟩,⟨0,1⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩ := by
  simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 3 1) = _
  simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
private lemma e4' : (bO 4 : O ℚ) = ⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨1,0⟩,⟨0,0⟩⟩⟩ := by
  simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 4 1) = _
  simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
private lemma e5' : (bO 5 : O ℚ) = ⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,1⟩,⟨0,0⟩⟩⟩ := by
  simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 5 1) = _
  simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
private lemma e6' : (bO 6 : O ℚ) = ⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨1,0⟩⟩⟩ := by
  simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 6 1) = _
  simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
private lemma e7' : (bO 7 : O ℚ) = ⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,1⟩⟩⟩ := by
  simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 7 1) = _
  simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]

-- THE single coordinate computation. DI = ⟨innerDerivQ hI, _⟩, innerDerivQ hI z = innerDeriv hI z.
set_option maxHeartbeats 2000000 in
theorem traceForm_DI_DI : B DI DI = -16 := by
  show LieModule.traceForm ℚ derivationLieQ (O ℚ) DI DI = -16
  rw [show DI = ⟨innerDerivQ hI, innerDerivQ_isDerivQ hI hI_imag⟩ from rfl,
      traceForm_apply_neg (innerDerivQ hI) (innerDerivQ_isDerivQ hI hI_imag)]
  rw [Fin.sum_univ_eight, e0', e1', e2', e3', e4', e5', e6', e7']
  simp only [innerDerivQ_apply, gForm, reQ, innerDeriv_apply, adHom_apply, hI, CD.iota, Dbl.J,
    sub_eq_add_neg,
    CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im,
    Dbl.star_re', Dbl.star_im']
  norm_num

#print axioms traceForm_DI_DI

end Phys.Algebra
