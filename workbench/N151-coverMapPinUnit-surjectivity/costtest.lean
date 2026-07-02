import Phys.Algebra.LorentzContinuumCliffordPinSurjective
namespace Counterexamples
open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut
noncomputable section
theorem candA : QvC ((1 : Cut) • (mTimeUnit : STVC)) = (151 : Cut) := by
  rw [QvC_smul, QvC_mTimeUnit, mul_one, mul_one]
end
end Counterexamples
