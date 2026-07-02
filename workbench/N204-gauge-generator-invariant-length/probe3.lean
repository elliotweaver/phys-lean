import Phys.Algebra.DerivationColourIsospinMeet
import Phys.Algebra.DerivationCompact
import Mathlib.Tactic

open Phys.Cascade

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- (a) DJ diagonal term at bO 2 : hJ = e2 (CD.e2 : H ℚ).  Expect contribution differs per j.
-- (b) An off-diagonal cross gForm term: gForm (innerDeriv hI (bO 2)) (innerDeriv hJ (bO 2)).
set_option maxHeartbeats 800000 in
example : gForm (innerDeriv (hJ : H ℚ) (bO 2)) (innerDeriv (hJ : H ℚ) (bO 2))
        = gForm (innerDeriv (hJ : H ℚ) (bO 2)) (innerDeriv (hJ : H ℚ) (bO 2)) := rfl

-- off-diagonal cross term cost test
set_option maxHeartbeats 800000 in
example : gForm (innerDeriv (hI : H ℚ) (bO 2)) (innerDeriv (hJ : H ℚ) (bO 2)) = 0 := by
  have e2 : (bO 2 : O ℚ) = ⟨⟨⟨0,0⟩,⟨1,0⟩⟩,⟨⟨0,0⟩,⟨0,0⟩⟩⟩ := by
    simp only [bO, Module.Basis.coe_ofEquivFun]; show coordO.symm (Pi.single 2 1) = _
    simp only [coordO, LinearEquiv.coe_symm_mk]; ext <;> simp [Pi.single, Function.update]
  rw [e2]
  simp only [gForm, reQ, innerDeriv_apply, adHom_apply, hI, hJ, CD.iota, CD.e2, Dbl.J,
    sub_eq_add_neg,
    CD.mul_re, CD.mul_im, CD.add_re, CD.add_im, CD.neg_re, CD.neg_im,
    CD.star_re, CD.star_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.add_re, Dbl.add_im, Dbl.neg_re, Dbl.neg_im,
    Dbl.star_re', Dbl.star_im']
  norm_num

end Phys.Algebra
