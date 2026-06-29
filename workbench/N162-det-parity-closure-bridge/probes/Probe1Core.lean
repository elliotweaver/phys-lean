import Phys.Algebra.LorentzContinuumOctBlockSO8ClosureWord

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

/-- PROBE 1 — THE EVEN-PAIRING CORE (det-free, trunk-native).
    Any EVEN-length list of nonzero-Born-norm axes: the embedded product of Householder
    reflections is `JoinedIdQvC`. Two-at-a-time recursion feeding N161's single-bireflection
    core `joinedIdQvC_octBlockEndC_bireflection` through `octBlockEndC_mul` + the engine
    `joinedIdQvC_mul`. -/
theorem joinedIdQvC_octBlockEndC_evenReflWord :
    ∀ (L : List (O Cut)), (∀ a ∈ L, gFormC a a ≠ 0) → Even L.length →
      JoinedIdQvC (octBlockEndC ((L.map houseHolder).prod))
  | [], _, _ => by
      simp only [List.map_nil, List.prod_nil, octBlockEndC_one]; exact joinedIdQvC_one
  | [a], _, hev => by
      simp only [List.length_singleton] at hev
      exact absurd hev (by decide)
  | a :: b :: L, hmem, hev => by
      have ha : gFormC a a ≠ 0 := hmem a (by simp)
      have hb : gFormC b b ≠ 0 := hmem b (by simp)
      have hLmem : ∀ x ∈ L, gFormC x x ≠ 0 := fun x hx => hmem x (by simp [hx])
      have hLev : Even L.length := by
        simpa [List.length_cons, Nat.add_comm, Nat.even_add] using hev
      simp only [List.map_cons, List.prod_cons]
      rw [← mul_assoc]
      rw [octBlockEndC_mul]
      refine joinedIdQvC_mul (joinedIdQvC_octBlockEndC_bireflection a b ha hb) ?_
      exact joinedIdQvC_octBlockEndC_evenReflWord L hLmem hLev

end
