/-
  # THE H(m) ASSEMBLY — the deferring h-bound (GQ SG-s)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The composition closing the uniform route's structure: with the
  ledger (box = h), the cage (N634–N636), the count (N637), and the
  band machinery (N638–N640):

  * `cage_length_bound` — ★★ |twoTower ++ bandList| ≤ T₂ + B
    (choice-free list algebra).
  * `deferring_h_bound` — ★★★ THE H(m) STATEMENT: a duplicate-free
    box with a-values in the two-family cage and per-value cap K has
    length ≤ (T₂ + B)·K. Per-D instantiation facts, all banked:
    T₂ ≤ log₂ gate (2-tower; collapses when 2 is inert), B ≤ f(m)
    (signature engine: cofactor kill + window/pairing + ratio kill;
    PREREG-36b zero collisions population-wide), K = 2 (root pairing).
    For deferring D: h(D) ≤ (T₂ + f(m))·2 — the |D|-free core the
    uniform theorem instantiates.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussSignatureKill

namespace Phys.Foundation
namespace GaussForms
namespace BQF

/-- ★★ The cage list is bounded by its two families. -/
theorem cage_length_bound {T₂ B : Nat} (twoTower bandList : List Z)
    (ht : twoTower.length ≤ T₂) (hb : bandList.length ≤ B) :
    (twoTower ++ bandList).length ≤ T₂ + B := by
  rw [List.length_append]
  omega

/-- ★★★ THE H(m) STATEMENT: a duplicate-free box whose a-values live in
    the two-family cage, with per-value multiplicity ≤ K, is bounded by
    (T₂ + B)·K — the deferring h-bound in kernel form. -/
theorem deferring_h_bound {T₂ B K : Nat}
    (twoTower bandList : List Z) (box : List BQF)
    (ht : twoTower.length ≤ T₂) (hb : bandList.length ≤ B)
    (hin : ∀ f ∈ box, f.a ∈ twoTower ++ bandList)
    (hcap : ∀ p ∈ twoTower ++ bandList,
      (box.filter (fun f => decide (f.a = p))).length ≤ K) :
    box.length ≤ (T₂ + B) * K := by
  have h1 : box.length ≤ (twoTower ++ bandList).length * K :=
    caged_h_bound (twoTower ++ bandList) box hin hcap
  have h2 : (twoTower ++ bandList).length ≤ T₂ + B :=
    cage_length_bound twoTower bandList ht hb
  calc box.length ≤ (twoTower ++ bandList).length * K := h1
    _ ≤ (T₂ + B) * K := Nat.mul_le_mul_right K h2


#print axioms cage_length_bound
#print axioms deferring_h_bound

end BQF
end GaussForms
end Phys.Foundation
