import Phys.Algebra.LorentzContinuumOpSqrtJConj

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- sanity: genuine LHS first coord = 4, genuine RHS first coord = 64
example : ((sigOpC.comp ((boostEndC 5 3).comp sigOpC)).comp
      (sigOpC.comp ((boostEndC 5 3).comp sigOpC))
      ((1 : Cut), (1 : Cut), (0 : O Cut))).1 = (4 : Cut) := by
  simp only [LinearMap.comp_apply, boostEndC_apply, sigOpC_apply]; ring

example : (((boostEndC 5 3).comp (boostEndC 5 3))
      ((1 : Cut), (1 : Cut), (0 : O Cut))).1 = (64 : Cut) := by
  simp only [LinearMap.comp_apply, boostEndC_apply]; ring

end

end Counterexamples
