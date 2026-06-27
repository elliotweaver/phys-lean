import Phys.Algebra.LorentzContinuumSpin9Product
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- Is biMulFun e₂ ιe₂ an involution? Test concretely: square on (0,0,1) should give back (0,0,1) iff involution.
-- (biMulFun e₂ ιe₂)²(0,0,1) = biMulFun e₂ ιe₂ (0,0, e₂·ιe₂).
-- space comp = e₂·((e₂·ιe₂)·ιe₂).
example : ((biMulFun (CD.e2 : O Cut) (je2 : O Cut)
            (biMulFun (CD.e2 : O Cut) (je2 : O Cut) ((0:Cut),(0:Cut),(1:O Cut)))).2.2)
          = (CD.e2 : O Cut) * (((CD.e2 : O Cut) * (je2 : O Cut)) * (je2 : O Cut)) := by
  simp only [biMulFun, one_mul]

-- compute e₂·((e₂·ιe₂)·ιe₂) concretely - is it 1 (involution) or -1 or something else?
-- (e₂·ιe₂)·ιe₂ = e₂·(ιe₂·ιe₂) = e₂·(-1) = -e₂  [mul_mul_right, je2_sq], then e₂·(-e₂)=-(e₂·e₂)=1.
theorem probe_invol_one :
    (CD.e2 : O Cut) * (((CD.e2 : O Cut) * (je2 : O Cut)) * (je2 : O Cut)) = (1 : O Cut) := by
  rw [mul_mul_right (CD.e2 : O Cut) (je2 : O Cut), je2_sq, mul_neg_one]
  rw [show (CD.e2 : O Cut) * -(CD.e2 : O Cut) = -((CD.e2:O Cut)*(CD.e2:O Cut)) from mul_neg _ _,
      biMulFun_e2_sq, neg_neg]

-- GENERAL: is biMulFun u u' (distinct anticommuting units) an involution?
-- (biMulFun u u')²(v).space = u·((u·(v·u'))·u').
-- Try the Moufang/alternative route. Need: u·((u·(v·u'))·u') = v.
-- Step: ((u·(v·u'))·u') — apply right alternativity? not directly.
-- Let me test on the unit v=u itself:  biMulFun u u' (0,0,u) then square.
theorem probe_invol_general (u u' v : O Cut) (hsqu : u*u = -1) (hsqu' : u'*u' = -1)
    (hLu : ∀ w : O Cut, u*(u*w) = -w) :
    u * (((u * (v * u')) * u')) = v := by
  rw [mul_mul_right (u * (v*u')) u', hsqu', mul_neg_one]
  rw [show u * -(u*(v*u')) = -(u*(u*(v*u'))) from mul_neg _ _, hLu (v*u'), neg_neg]
  -- now goal: u*(v*u') ... wait that gives -(- (v*u')) → (v*u')? no.
  sorry

end

end Phys.Algebra
