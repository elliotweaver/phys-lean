import Phys.Algebra.LorentzContinuumSpin9
import Phys.Algebra.LorentzContinuumRotationSubgroup
import Phys.Algebra.Alternative

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- e₂ * e₂ = -1 (from the banked e2_alt at v = 1).
theorem probe_e2_sq : (CD.e2 : O Cut) * (CD.e2 : O Cut) = -1 := by
  have h := e2_alt (1 : O Cut)
  rwa [mul_one] at h

-- CONCRETE: the half-turn biMulFun e₂ e₂ is involutive.
theorem probe_biMul_e2_involutive (p : STVC) :
    biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut) (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut) p) = p := by
  obtain ⟨t, x, v⟩ := p
  simp only [biMulFun]
  have hflex : ((CD.e2 : O Cut) * (v * CD.e2)) * CD.e2 = (CD.e2 : O Cut) * ((v * CD.e2) * CD.e2) :=
    (mul_flex (CD.e2 : O Cut) (v * CD.e2)).symm
  have hrt : (v * (CD.e2 : O Cut)) * (CD.e2 : O Cut) = -v := by
    rw [mul_mul_right v (CD.e2 : O Cut), probe_e2_sq, mul_neg_one]
  rw [hflex, hrt, e2_alt (-v), neg_neg]

-- W8 DISTINGUISHING FACT: the two-sided half-turn FIXES the anticommuting unit j,
-- whereas the wrong "whole-block negation" claim would send j to -j.
-- biMulFun e₂ e₂ (j) = e₂*(j*e₂).  Using j*e₂ = -(e₂*j) (anticommutation) and e2_alt:
theorem probe_biMul_e2_fixes_j :
    biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut) ((0:Cut), (0:Cut), (CD.iota (CD.e2 : H Cut) : O Cut))
      = ((0:Cut), (0:Cut), (CD.iota (CD.e2 : H Cut) : O Cut)) := by
  simp only [biMulFun]
  have hac : (CD.e2 : O Cut) * (CD.iota (CD.e2 : H Cut) : O Cut)
      = -((CD.iota (CD.e2 : H Cut) : O Cut) * (CD.e2 : O Cut)) := by
    ext <;> simp [CD.e2, CD.iota]
  have hje : (CD.iota (CD.e2 : H Cut) : O Cut) * (CD.e2 : O Cut)
      = -((CD.e2 : O Cut) * (CD.iota (CD.e2 : H Cut) : O Cut)) := by
    rw [hac, neg_neg]
  rw [hje, mul_neg (CD.e2 : O Cut), e2_alt (CD.iota (CD.e2 : H Cut) : O Cut), neg_neg]

end

end Phys.Algebra
