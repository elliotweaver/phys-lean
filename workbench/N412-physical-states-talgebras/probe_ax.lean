import Phys.Algebra.TowerGatherPhysicalState
import Phys.Algebra.ConfinementCriterion

namespace Phys.Algebra.ProbeAx
open Phys.Algebra
open Phys.Cascade
open Phys.Cascade.CD

-- variant A: simp only unfolds
theorem v_a (A : Type*) [Mul A] :
    SectorGlobalGather A ↔ ∀ a : A, GluesGlobally a := by
  simp only [SectorGlobalGather, GluesGlobally]

-- variant B: forall_congr route
theorem v_b (A : Type*) [Mul A] :
    SectorGlobalGather A ↔ ∀ a : A, GluesGlobally a := by
  rfl

end Phys.Algebra.ProbeAx

#print axioms Phys.Algebra.ProbeAx.v_a
#print axioms Phys.Algebra.ProbeAx.v_b
