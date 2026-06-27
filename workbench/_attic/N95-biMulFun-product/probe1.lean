import Phys.Algebra.LorentzContinuumSpin9Reach
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

/-- helper: half-turn around w sends (0,0,-1) to (0,0,1). -/
theorem biMulFun_imag_negates_neg_one (w : O Cut) (hsq : w * w = -1) :
    biMulFun w w ((0 : Cut), (0 : Cut), -(1 : O Cut)) = ((0 : Cut), (0 : Cut), (1 : O Cut)) := by
  simp only [biMulFun]
  rw [neg_one_mul, mul_neg, hsq, neg_neg]

/-- the composite fixes the real axis: C(0,0,1) = (0,0,1). -/
theorem biMulComp_fixes_one (u w : O Cut) (hsqu : u * u = -1) (hsqw : w * w = -1) :
    biMulFun w w (biMulFun u u ((0 : Cut), (0 : Cut), (1 : O Cut)))
      = ((0 : Cut), (0 : Cut), (1 : O Cut)) := by
  rw [biMulFun_imag_negates_one u hsqu, biMulFun_imag_negates_neg_one w hsqw]

/-- the composite negates u: C(0,0,u) = (0,0,-u). -/
theorem biMulComp_negates_u (u w : O Cut) (hsqu : u * u = -1)
    (hLw : ∀ z : O Cut, w * (w * z) = -z) (hac : u * w = -(w * u)) :
    biMulFun w w (biMulFun u u ((0 : Cut), (0 : Cut), u))
      = ((0 : Cut), (0 : Cut), -u) := by
  rw [biMulFun_imag_negates_self u hsqu]
  -- now: biMulFun w w (0,0,-u) ; -u anticommutes with w
  have hacw : w * (-u) = -((-u) * w) := by
    rw [mul_neg, neg_mul, neg_neg]
    -- w*u = -(u*w)  from hac: u*w = -(w*u)  => w*u = -(u*w)
    rw [show w * u = -(u * w) by rw [hac, neg_neg]]
  exact biMulFun_imag_fixes_anticomm w (-u) hLw hacw

/-- the composite negates w: C(0,0,w) = (0,0,-w). -/
theorem biMulComp_negates_w (u w : O Cut) (hsqw : w * w = -1)
    (hLu : ∀ z : O Cut, u * (u * z) = -z) (hac : u * w = -(w * u)) :
    biMulFun w w (biMulFun u u ((0 : Cut), (0 : Cut), w))
      = ((0 : Cut), (0 : Cut), -w) := by
  rw [biMulFun_imag_fixes_anticomm u w hLu hac, biMulFun_imag_negates_self w hsqw]

/-- the composite fixes the common complement: z anticommuting with BOTH u and w is fixed. -/
theorem biMulComp_fixes_common (u w z : O Cut)
    (hLu : ∀ y : O Cut, u * (u * y) = -y) (hLw : ∀ y : O Cut, w * (w * y) = -y)
    (hacu : u * z = -(z * u)) (hacw : w * z = -(z * w)) :
    biMulFun w w (biMulFun u u ((0 : Cut), (0 : Cut), z))
      = ((0 : Cut), (0 : Cut), z) := by
  rw [biMulFun_imag_fixes_anticomm u z hLu hacu, biMulFun_imag_fixes_anticomm w z hLw hacw]

/-! ## The composite as a member of the extended generated monoid. -/

/-- how Function.End mul applies -/
example (u w : O Cut) (p : STVC) :
    ((biMulFun w w : Function.End STVC) * (biMulFun u u : Function.End STVC)) p
      = biMulFun w w (biMulFun u u p) := rfl

/-- the composite product lies in genIsomMonoidC2. -/
theorem biMulComp_mem_gen2 (u w : O Cut) (hu : gFormC u u = 1) (hw : gFormC w w = 1) :
    ((biMulFun w w : Function.End STVC) * (biMulFun u u : Function.End STVC)) ∈ genIsomMonoidC2 :=
  Submonoid.mul_mem _ (biMulFun_imag_mem_gen2 w hw) (biMulFun_imag_mem_gen2 u hu)

end

end Phys.Algebra
