import Phys.Algebra.SpacetimeTwiceContractedBianchi
import Phys.Algebra.LorentzContinuumLieAlgebra

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- (0) Reachability: BvCRight, BvC_nondegenerate, IsInfIsomC visible?
#check @BvCRight
#check @BvC_nondegenerate
#check @IsInfIsomC
#check @BvC_symm
#check @divCov
#check @divCov_add
#check @LinearMap.trace_smulRight

-- (1) The key divCov computation on (f.smulRight id).
-- divCov (f.smulRight id) ν = f ν.
example (f : STVC →ₗ[Cut] Cut) (ν : STVC) :
    divCov (f.smulRight (LinearMap.id : MetricEnd)) ν = f ν := by
  unfold divCov
  rw [show (LinearMap.applyₗ (R := Cut) ν).comp (f.smulRight (LinearMap.id : MetricEnd))
      = f.smulRight ν from by
    refine LinearMap.ext fun w => ?_
    simp only [LinearMap.comp_apply, LinearMap.applyₗ_apply_apply, LinearMap.smulRight_apply,
      LinearMap.id_coe, id_eq]]
  rw [LinearMap.trace_smulRight]

-- (2) orthogonality: IsInfIsomC T → BvC (T u) u = 0
example (T : Module.End Cut STVC) (hT : IsInfIsomC T) (u : STVC) : BvC (T u) u = 0 := by
  have h := hT u u
  rw [BvC_symm u (T u)] at h
  linarith

end
end Phys.Algebra
