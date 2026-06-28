import Phys.Algebra.LorentzContinuumOperatorTopology
import Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

def cayleyC (m : Cut) : Cut := (1 - m^2)/(1 + m^2)
def cayleyS (m : Cut) : Cut := (2*m)/(1 + m^2)

example (c s : Cut) (h : c^2 + s^2 = 1) (hc : 1 + c ≠ 0) :
    cayleyC (s/(1+c)) = c ∧ cayleyS (s/(1+c)) = s := by
  have hden0 : (1+c)^2 ≠ 0 := pow_ne_zero 2 hc
  have hden : 1 + s^2/(1+c)^2 ≠ 0 := by positivity
  refine ⟨?_, ?_⟩
  · unfold cayleyC
    rw [div_pow, div_eq_iff hden]
    field_simp
    linear_combination (-(1+c)) * h
  · unfold cayleyS
    rw [div_pow, div_eq_iff hden]
    field_simp
    linear_combination (-s) * h

end
end Phys.Algebra
