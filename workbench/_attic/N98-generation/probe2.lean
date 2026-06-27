import Phys.Algebra.LorentzContinuumSpin9Product
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- Concrete e₂·ιe₂ value: read its coordinates.
-- O Cut = CD (H Cut). Let's see what e₂ * je2 is by evaluating coordinate projections.
example : ((CD.e2 : O Cut) * (je2 : O Cut)) = ((CD.e2 : O Cut) * (je2 : O Cut)) := rfl

-- Probe: is e₂·ιe₂ purely imaginary (re = 0)? read .re
#check @CD.mul_re
-- The space-comp of biMulFun e₂ ιe₂ (0,0,1) is e₂·ιe₂. Its re.re.re coordinate:
theorem probe_e2je2_re :
    ((biMulFun (CD.e2 : O Cut) (je2 : O Cut) ((0:Cut),(0:Cut),(1:O Cut))).2.2).re.re.re = 0 := by
  simp only [biMulFun, one_mul]
  simp [CD.e2, CD.iota, CD.mul_re, CD.mul_im]

-- Is the distinct-units generator an INVOLUTION? Probe on generic v.
-- (biMulFun u u')² v = u·((u·(v·u'))·u'). Try to see if it equals v in general.
theorem probe_distinct_invol (u u' v : O Cut) (hsqu : u*u = -1) (hsqu' : u'*u' = -1)
    (hLu : ∀ w : O Cut, u*(u*w) = -w) :
    u * (((u * (v * u')) * u')) = v := by
  sorry

-- product unit u·u' is a Born unit when u,u' anticommuting Born units?
-- gFormC (u·u') (u·u') = gFormC u u * gFormC u' u' via gFormC_comp.
theorem probe_prod_born (u u' : O Cut) (hu : gFormC u u = 1) (hu' : gFormC u' u' = 1) :
    gFormC (u * u') (u * u') = 1 := by
  rw [gFormC_comp u u', hu, hu', mul_one]

end

end Phys.Algebra
