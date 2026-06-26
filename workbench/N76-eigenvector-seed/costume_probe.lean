import Phys.Algebra.LorentzContinuumSeedVector

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- a concrete NONZERO vector of STVC = Cut × Cut × O Cut (first coordinate 1)
def v0probe : STVC := ((1:Cut), (0:Cut), (0:O Cut))

-- WRONG costume probe: read the genuine eigenvalue of the scaling endomorphism 6•id off the first
-- coordinate of its eigen-equation T v0 = 6 • v0 (since v0.1 = 1, the read value is the eigenvalue 6),
-- then claim it is 13.
theorem eigen_wrong_eigenvalue_BOGUS :
    (((6:Cut) • (LinearMap.id : Module.End Cut STVC)) v0probe).1 = (13:Cut) := by
  rw [show (((6:Cut) • (LinearMap.id : Module.End Cut STVC)) v0probe).1 = (6:Cut) from by
        simp [v0probe]]

end

end Counterexamples
