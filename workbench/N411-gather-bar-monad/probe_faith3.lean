import Phys.Cascade.Sedenion
import Phys.Algebra.TowerGatherCoherence

namespace Phys.Algebra.ProbeFaith
open Phys.Cascade Phys.Cascade.CD

-- v3: route through worldMap_one (which carries propext/Quot.sound via funext)
theorem worldMap_one_v {A : Type*} [MulOneClass A] : worldMap (1 : A) = id := by
  funext x; simp only [worldMap, one_mul, id_eq]

theorem worldMap_faithful_v3 {A : Type*} [MulOneClass A] :
    Function.Injective (worldMap : A → (A → A)) := by
  intro a b h
  have hx := congrFun h 1
  simpa [worldMap] using hx

end Phys.Algebra.ProbeFaith
#print axioms Phys.Algebra.ProbeFaith.worldMap_faithful_v3
