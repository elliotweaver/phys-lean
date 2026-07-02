import Phys.Algebra.LorentzContinuumTimeFixingResidualSO9

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- boostEndC a b conjugated through prodAssoc to prodMap (boost on Cut×Cut) id (on O Cut)
-- First: the 2x2 boost on (Fin 2 → Cut)
def boostFin (a b : Cut) : Module.End Cut (Fin 2 → Cut) :=
  Matrix.toLin' !![a, b; b, a]

example {a b : Cut} (hab : a ^ 2 - b ^ 2 = 1) :
    LinearMap.det (boostFin a b) = 1 := by
  rw [boostFin, LinearMap.det_toLin']
  rw [Matrix.det_fin_two_of]
  nlinarith [hab]

end

end Phys.Algebra
