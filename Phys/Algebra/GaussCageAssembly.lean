/-
  # THE ASSEMBLY — the caged box is counted (GQ SG-o)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The uniform route's final composition (all banked parts):

  * `box_bound` — ★★★ THE COUNT: pigeonhole (N627) contraposed —
    every value's assigned key in ps + per-key multiplicity ≤ K ⟹
    list length ≤ |ps| · K. List-generic.
  * `caged_h_bound` — ★★★ THE ASSEMBLY: a duplicate-free box whose
    a-values live in the cage list, with per-value multiplicity ≤ K,
    has length ≤ cage length · K. With the banked ledger (box = h) and
    the cage inventory (N634–N636: cage = 2-tower ++ single band
    primes) this is the deferring h-bound — h ≤ explicit function.

  THE CHAIN N625→N637 IS STRUCTURALLY COMPLETE: band → trichotomy →
  price list → two-class → factory → skeleton → descent → structure →
  cage count → exactness → assembly. Remaining for the full ∀m
  closure: per-D cage-list enumeration certificates (generator work,
  same pattern as all instantiations) composed against the record
  table's fiber maxima.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussCageExact

namespace Phys.Foundation
namespace GaussForms
namespace BQF

/-- ★★★ THE COUNT: if every value's assigned key lies in ps and each
    key carries at most K values, the list has at most |ps|·K members. -/
theorem box_bound {α : Type} {K : Nat} (ps : List Z) (vals : List α)
    (assign : α → Z)
    (hin : ∀ v ∈ vals, assign v ∈ ps)
    (hcap : ∀ p ∈ ps,
      (vals.filter (fun v => decide (assign v = p))).length ≤ K) :
    vals.length ≤ ps.length * K := by
  by_contra hbig
  push_neg at hbig
  obtain ⟨p, hp, hover⟩ := seed_pigeonhole ps vals assign hin hbig
  exact absurd (hcap p hp) (not_le.mpr hover)

/-- ★★★ THE ASSEMBLY (statement form): a duplicate-free box whose
    members' leading coefficients live in the cage list, with per-value
    multiplicity ≤ K, is bounded by K · cage length. The banked ledger
    (box length = h) turns this into the deferring h-bound. -/
theorem caged_h_bound {K : Nat} (cage : List Z) (box : List BQF)
    (hin : ∀ f ∈ box, f.a ∈ cage)
    (hcap : ∀ p ∈ cage,
      (box.filter (fun f => decide (f.a = p))).length ≤ K) :
    box.length ≤ cage.length * K :=
  box_bound cage box (fun f => f.a) hin hcap


#print axioms box_bound
#print axioms caged_h_bound

end BQF
end GaussForms
end Phys.Foundation
