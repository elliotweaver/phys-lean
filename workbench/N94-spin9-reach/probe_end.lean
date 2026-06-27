import Phys.Algebra.LorentzContinuumSpin9
import Phys.Algebra.Alternative

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
noncomputable section

theorem core (u : O Cut) (hsq : u * u = -1)
    (hL : ∀ w : O Cut, u * (u * w) = -w) (v : O Cut) :
    u * ((u * (v * u)) * u) = v := by
  have hflex : (u * (v * u)) * u = u * ((v * u) * u) := (mul_flex u (v * u)).symm
  have hrt : (v * u) * u = -v := by rw [mul_mul_right v u, hsq, mul_neg_one]
  rw [hflex, hrt, hL (-v), neg_neg]

theorem invol (u : O Cut) (hsq : u * u = -1)
    (hL : ∀ w : O Cut, u * (u * w) = -w) (p : STVC) :
    biMulFun u u (biMulFun u u p) = p := by
  obtain ⟨t, x, v⟩ := p
  simp only [biMulFun]
  rw [core u hsq hL v]

-- the End mul application: (f*g) p = f (g p) for Function.End is defeq via Monoid.
theorem probe_end (u : O Cut) (hsq : u * u = -1)
    (hL : ∀ w : O Cut, u * (u * w) = -w) :
    (biMulFun u u : Function.End STVC) * (biMulFun u u : Function.End STVC)
      = (1 : Function.End STVC) := by
  funext p
  show biMulFun u u (biMulFun u u p) = id p
  exact invol u hsq hL p

end
end Phys.Algebra
