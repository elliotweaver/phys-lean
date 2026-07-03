import Phys.Algebra.TowerGatherForcedSecondNeutral
open Phys.Cascade Phys.Cascade.CD
namespace Phys.Algebra
example : (0 : O ℚ) = 0 := rfl
example (D : derivationLieQ) (a : O ℚ) : ⁅imRep D, crossOp a⁆ = crossOp ((D : Module.End ℚ (O ℚ)) a) :=
  crossOp_imRep_intertwine D a
example : (DI : Module.End ℚ (O ℚ)) (kappaO 1) = 0 := by
  have := imRep_DI_kappaO
  have h2 : ((imRep DI kap1 : ImO) : O ℚ) = ((0 : ImO) : O ℚ) := congrArg Subtype.val this
  rw [imRep_coe] at h2; simpa using h2
end Phys.Algebra
