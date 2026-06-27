import Phys.Algebra.LorentzContinuumSpin9Reach
import Phys.Algebra.Alternative
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section
-- negates_neg_one helper
theorem negNegOne (w : O Cut) (hsqw : w * w = -1) :
    biMulFun w w ((0:Cut),(0:Cut),-(1:O Cut)) = ((0:Cut),(0:Cut),(1:O Cut)) := by
  simp only [biMulFun]
  rw [neg_one_mul, mul_neg w w, hsqw, neg_neg]
-- C fixes 1
theorem fixOne (u w : O Cut) (hsqu : u*u = -1) (hsqw : w*w = -1) :
    biMulFun w w (biMulFun u u ((0:Cut),(0:Cut),(1:O Cut))) = ((0:Cut),(0:Cut),(1:O Cut)) := by
  rw [biMulFun_imag_negates_one u hsqu, negNegOne w hsqw]
-- C negates u : need -u anticommutes with w
theorem negU (u w : O Cut) (hsqu : u*u = -1)
    (hLw : ∀ z:O Cut, w*(w*z) = -z) (hac : u*w = -(w*u)) :
    biMulFun w w (biMulFun u u ((0:Cut),(0:Cut),u)) = ((0:Cut),(0:Cut),-u) := by
  rw [biMulFun_imag_negates_self u hsqu]
  have hacw : w * (-u) = -((-u) * w) := by
    rw [mul_neg w u, neg_mul u w]
    rw [show w * u = -(u*w) by rw [hac, neg_neg]]
  exact biMulFun_imag_fixes_anticomm w (-u) hLw hacw
-- C negates w
theorem negW (u w : O Cut) (hsqw : w*w = -1)
    (hLu : ∀ z:O Cut, u*(u*z) = -z) (hac : u*w = -(w*u)) :
    biMulFun w w (biMulFun u u ((0:Cut),(0:Cut),w)) = ((0:Cut),(0:Cut),-w) := by
  rw [biMulFun_imag_fixes_anticomm u w hLu hac, biMulFun_imag_negates_self w hsqw]
-- C fixes common complement
theorem fixCommon (u w z : O Cut)
    (hLu : ∀ y:O Cut, u*(u*y) = -y) (hLw : ∀ y:O Cut, w*(w*y) = -y)
    (hacu : u*z = -(z*u)) (hacw : w*z = -(z*w)) :
    biMulFun w w (biMulFun u u ((0:Cut),(0:Cut),z)) = ((0:Cut),(0:Cut),z) := by
  rw [biMulFun_imag_fixes_anticomm u z hLu hacu, biMulFun_imag_fixes_anticomm w z hLw hacw]
end
end Phys.Algebra
