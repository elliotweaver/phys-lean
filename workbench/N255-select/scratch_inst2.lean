import Phys.Algebra.TowerGatherObstructionAdjointSo7
open Phys.Cascade Phys.Cascade.CD
namespace Phys.Algebra
example : (0 : O ℚ) = 0 := rfl
example (D : derivationLieQ) (a : O ℚ) : ⁅imRep D, crossOp a⁆ = crossOp ((D : Module.End ℚ (O ℚ)) a) :=
  crossOp_imRep_intertwine D a
end Phys.Algebra
