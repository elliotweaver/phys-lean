/-
  # THE BOXED THEOREM — deferral is confined (GQ SG-z)

  ## What this file proves (SEED-GROWTH campaign, THE CAPSTONE)

  The final assembly: both jaws of the ∀m composition applied to one
  box, as one statement.

  * `boxed_confinement` — ★★★ a caged duplicate-free box is COUNTED
    (≤ (T₂+B)·K — deferring_h_bound N641, membership discharged
    structurally by the ∀D bridge N648/N649) AND any realized
    (H+1)-family EXPELS it past the fiber h ≤ H (split_fiber_exit
    N645). No third case exists for a caged box.
  * `confinement_squeeze` — ★★ the jaws meet: a realized (H+1)-family
    in a caged box forces H < (T₂+B)·K — the tower is CAPPED by the
    cage count. Deferral cannot hold both a long tower and a short
    cage: the arithmetic that makes X_m explicit at every m
    (X_m = max(fibermax(H(m)), 3·4^(H(m)+1)), forall_m_final.md).

  THE TWENTY-SIX-NODE ARC N625→N650 IS COMPLETE: band lemma →
  trichotomy → price list → two-class/Euclid → factory → skeleton →
  descent → structure → cage count → exactness → assembly → cofactor
  kill → window/pairing → ratio kill → H(m) → signature bound →
  tower growth → case composition → ∀D shape → ∀D ledger → THE BOXED
  THEOREM. Zero analytic input at any node.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussForallLedger

namespace Phys.Foundation
namespace GaussForms
namespace BQF

/-- ★★★ THE BOXED THEOREM (kernel form): a caged box is CONFINED —
    counted by the cage when the cage is short, expelled past every
    fiber when the tower is long. Both jaws in one statement. -/
theorem boxed_confinement {T₂ B K H : Nat}
    (twoTower bandList : List Z) (box : List BQF)
    (idx : List Nat) (pick : Nat → BQF)
    (ht : twoTower.length ≤ T₂) (hb : bandList.length ≤ B)
    (hin : ∀ f ∈ box, f.a ∈ twoTower ++ bandList)
    (hcap : ∀ p ∈ twoTower ++ bandList,
      (box.filter (fun f => decide (f.a = p))).length ≤ K)
    (hlen : idx.length = H + 1)
    (hpin : ∀ t ∈ idx, pick t ∈ box)
    (hppw : List.Pairwise (fun s t => pick s ≠ pick t) idx)
    (hboxpw : List.Pairwise (· ≠ ·) box) :
    box.length ≤ (T₂ + B) * K ∧ H < box.length := by
  constructor
  · exact deferring_h_bound twoTower bandList box ht hb hin hcap
  · exact split_fiber_exit idx box pick hlen hpin hppw hboxpw

/-- ★★ THE CONFINEMENT COROLLARY: the two jaws squeeze — any realized
    (H+1)-family in a caged box forces H < (T₂ + B)·K: the tower
    length is CAPPED by the cage count. Deferral cannot have both a
    long tower and a short cage — the arithmetic that makes X_m
    explicit. -/
theorem confinement_squeeze {T₂ B K H : Nat}
    (twoTower bandList : List Z) (box : List BQF)
    (idx : List Nat) (pick : Nat → BQF)
    (ht : twoTower.length ≤ T₂) (hb : bandList.length ≤ B)
    (hin : ∀ f ∈ box, f.a ∈ twoTower ++ bandList)
    (hcap : ∀ p ∈ twoTower ++ bandList,
      (box.filter (fun f => decide (f.a = p))).length ≤ K)
    (hlen : idx.length = H + 1)
    (hpin : ∀ t ∈ idx, pick t ∈ box)
    (hppw : List.Pairwise (fun s t => pick s ≠ pick t) idx)
    (hboxpw : List.Pairwise (· ≠ ·) box) :
    H < (T₂ + B) * K := by
  obtain ⟨hcount, hexit⟩ := boxed_confinement twoTower bandList box idx pick
    ht hb hin hcap hlen hpin hppw hboxpw
  omega


#print axioms boxed_confinement
#print axioms confinement_squeeze

end BQF
end GaussForms
end Phys.Foundation
