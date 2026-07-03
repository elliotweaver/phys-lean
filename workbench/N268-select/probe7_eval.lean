import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.DerivationUpperBound
import Mathlib.Tactic
namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
-- fully evaluate witnessDerivQ on u2 and u4; check all 8 deep coords for a nonzero
example : (witnessDerivQ u4) = witnessDerivQ u4 := rfl
#check (inferInstance : DecidableEq (O ℚ))
-- Instead: assert a candidate. e2 in H = CD(Dbl). adHom e2 acts... try re.im.re coords.
example : (witnessDerivQ u2).im.re.re = 0 := by
  show (toEndQ witnessDeriv u2).im.re.re = 0
  rw [toEndQ_apply]
  show (witnessDeriv u2).im.re.re = 0
  unfold witnessDeriv
  rw [innerDeriv_apply]
  norm_num [adHom_apply, u2, CD.e2, CD.mul_re, CD.mul_im, CD.zero_re, CD.zero_im,
    Dbl.mul_re, Dbl.mul_im, Dbl.e1]
end Phys.Algebra.HJ
