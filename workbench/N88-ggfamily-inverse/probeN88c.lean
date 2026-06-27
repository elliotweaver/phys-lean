import Phys.Algebra.LorentzContinuumResolutionId

namespace Phys.Algebra.ProbeN88c

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

-- scaled identity: IsEvCAdjoint and injective
theorem smulId_adjoint (c : Cut) :
    IsEvCAdjoint (c • (LinearMap.id : Module.End Cut STVC)) (c • LinearMap.id) := by
  intro p q
  show EvC (c • p) q = EvC p (c • q)
  rw [EvC_smul_left, EvC_smul_right]

theorem smulId_injective {c : Cut} (hc : c ≠ 0) :
    Function.Injective (c • (LinearMap.id : Module.End Cut STVC)) := by
  rw [injective_iff_map_eq_zero]
  intro v hv
  have : c • v = 0 := hv
  rcases smul_eq_zero.mp this with h | h
  · exact absurd h hc
  · exact h

end

end Phys.Algebra.ProbeN88c
