import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.DerivationCompact
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- Explicit basis elements (verified bO 0 = e0). State all 8 as building blocks.
-- coordO.symm (Pi.single k 1): index k -> nested position.
-- 0:re.re.re 1:re.re.im 2:re.im.re 3:re.im.im 4:im.re.re 5:im.re.im 6:im.im.re 7:im.im.im

-- MEASURE: full trace-form sum for innerDeriv hI, computed by stating each bO j explicitly.
-- Use show to convert bO j to explicit tuples, then compute gForm via gForm_self_sum_sq.
set_option maxHeartbeats 2000000 in
example :
    (∑ j, gForm (innerDeriv (hI : H ℚ) (bO j)) (innerDeriv (hI : H ℚ) (bO j))) = 16 := by
  have e0 : (bO 0 : O ℚ) = ⟨⟨⟨1,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩ := by
    simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 0 1) = _
    simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
  have e1 : (bO 1 : O ℚ) = ⟨⟨⟨0,1⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩ := by
    simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 1 1) = _
    simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
  have e2 : (bO 2 : O ℚ) = ⟨⟨⟨0,0⟩,⟨1,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩ := by
    simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 2 1) = _
    simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
  have e3 : (bO 3 : O ℚ) = ⟨⟨⟨0,0⟩,⟨0,1⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩ := by
    simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 3 1) = _
    simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
  have e4 : (bO 4 : O ℚ) = ⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨1,0⟩,⟨0,0⟩⟩⟩ := by
    simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 4 1) = _
    simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
  have e5 : (bO 5 : O ℚ) = ⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,1⟩,⟨0,0⟩⟩⟩ := by
    simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 5 1) = _
    simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
  have e6 : (bO 6 : O ℚ) = ⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨1,0⟩⟩⟩ := by
    simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 6 1) = _
    simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
  have e7 : (bO 7 : O ℚ) = ⟨⟨⟨0,0⟩,⟨0,0⟩⟩,⟨⟨0,0⟩,⟨0,1⟩⟩⟩ := by
    simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 7 1) = _
    simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
  rw [Fin.sum_univ_eight, e0, e1, e2, e3, e4, e5, e6, e7]
  simp only [gForm_self_sum_sq, innerDeriv_apply, adHom_apply, hI, CD.iota, Dbl.J,
    c0, c1, c2, c3, c4, c5, c6, c7,
    CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im]
  norm_num

end Phys.Algebra
