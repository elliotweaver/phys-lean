import Phys.Algebra.LorentzContinuumOctBlockSO8Word
import Phys.Algebra.LorentzContinuumGenerationSO8PeelOracle

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

theorem octBlockEndC_mul (R S : O Cut →ₗ[Cut] O Cut) :
    octBlockEndC (R * S) = octBlockEndC R * octBlockEndC S := by
  apply LinearMap.ext; intro p
  rw [Module.End.mul_apply, octBlockEndC_apply, octBlockEndC_apply, octBlockEndC_apply]
  rfl

/-- PROBE: the quarter-turn squared = the half-turn, for orthonormal e,f. -/
theorem octPlaneRot_quarter_sq (e f : O Cut)
    (hee : gFormC e e = 1) (hff : gFormC f f = 1) (hef : gFormC e f = 0) :
    octPlaneRot e f 0 1 * octPlaneRot e f 0 1 = octPlaneRot e f (-1) 0 := by
  have hfe : gFormC f e = 0 := by rw [gFormC_symm]; exact hef
  apply LinearMap.ext; intro v
  rw [Module.End.mul_apply, octPlaneRot_apply e f 0 1 (octPlaneRot e f 0 1 v),
      octPlaneRot_apply e f 0 1 v, octPlaneRot_apply e f (-1) 0 v]
  -- Compute gFormC (R v) e and gFormC (R v) f where R = octPlaneRot e f 0 1
  -- R v = v + (-gFormC v e - gFormC v f)•e + (gFormC v e - gFormC v f)•f
  simp only [gFormC_add_left, gFormC_smul_left, hee, hff, hef, hfe]
  module

end
end Phys.Algebra
