import Phys.Algebra.TowerWorldMapSpinGenerators
import Phys.Algebra.TowerGatherObstructionAdjointSo7

open scoped Classical BigOperators
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000
noncomputable section

-- Is leftReg injective? leftReg a (1) = a·1 = a, so leftReg a = 0 ⟹ a = 0 (a ∈ ImO ⊂ O).
theorem leftReg_injective : Function.Injective (leftReg) := by
  rw [injective_iff_map_eq_zero]
  intro a ha
  have hval := congrArg (fun (f : Module.End ℚ (O ℚ)) => f 1) ha
  simp only [leftReg_apply, mul_one, LinearMap.zero_apply] at hval
  -- hval : (a : O ℚ) = 0
  exact Subtype.ext hval
end
end Phys.Algebra
