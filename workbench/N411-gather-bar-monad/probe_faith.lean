import Phys.Cascade.Sedenion
import Phys.Algebra.TowerGatherCoherence

namespace Phys.Algebra.ProbeFaith
open Phys.Cascade Phys.Cascade.CD

theorem worldMap_faithful_v2 {A : Type*} [MulOneClass A] :
    Function.Injective (worldMap : A → (A → A)) := by
  intro a b h
  have hx := congrFun h 1
  simp only [worldMap, mul_one] at hx
  exact hx

end Phys.Algebra.ProbeFaith
#print axioms Phys.Algebra.ProbeFaith.worldMap_faithful_v2
