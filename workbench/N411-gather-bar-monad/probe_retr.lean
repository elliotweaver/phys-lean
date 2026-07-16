import Phys.Cascade.Sedenion
import Phys.Algebra.TowerGatherCoherence

namespace Phys.Algebra.ProbeRetr
open Phys.Cascade Phys.Cascade.CD

/-- η has an explicit RETRACTION: evaluating the world at the trivial standpoint recovers
    the standpoint. Function equality → uses funext → carries foundational axioms. -/
theorem worldMap_retraction {A : Type*} [MulOneClass A] :
    (fun f : A → A => f 1) ∘ worldMap = id := by
  funext a; simp only [worldMap, Function.comp_apply, mul_one, id_eq]

/-- injective is a corollary (kept as a check it still holds). -/
theorem worldMap_faithful_fromRetr {A : Type*} [MulOneClass A] :
    Function.Injective (worldMap : A → (A → A)) :=
  Function.LeftInverse.injective (g := fun f => f 1) (fun a => by
    simp only [worldMap, mul_one])

end Phys.Algebra.ProbeRetr
#print axioms Phys.Algebra.ProbeRetr.worldMap_retraction
#print axioms Phys.Algebra.ProbeRetr.worldMap_faithful_fromRetr
