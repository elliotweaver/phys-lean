/-
  # THE ∀D LEDGER LINK — every box is caged (GQ SG-y)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The ∀D bridge's second half: the cage shape (N648) transported to
  the BOX level — the object the ledger counts.

  * `forall_box_caged` — ★★★ in ANY box of reduced PosDef forms of a
    totally-blocked disc, no member's leading coefficient carries two
    odd prime factors. With fiber_exclusion's complete-box predicate
    (production) and deferring_h_bound (N641), the counting
    composition to h ≤ (T₂ + B)·K runs with the membership hypothesis
    discharged STRUCTURALLY: an a-value outside {2^j · (1 | p)} would
    need two odd factors — dead here, ∀D, list-free.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussForallCage

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE ∀D LEDGER LINK: in any box of reduced PosDef forms of a
    totally-blocked disc, no member's leading coefficient carries two
    odd prime factors. -/
theorem forall_box_caged {c₀ A : Z} (hA : A = 4 * c₀ - 1) (hApos : 0 < A)
    (hblockall : ∀ p m : Z, p = 2 * m + 1 → 1 ≤ m → 4 * (p * p) ≤ A →
      ∀ x : Z, ¬ ZDvd' p (x * x + x + c₀))
    (L : List BQF)
    (hmem : ∀ f ∈ L, Reduced f ∧ PosDef f ∧ disc f = 1 - 4 * c₀) :
    ∀ f ∈ L, ∀ p q e m₁ m₂ : Z, f.a = p * q * e →
    p = 2 * m₁ + 1 → q = 2 * m₂ + 1 → 3 ≤ p → 3 ≤ q → 0 < e → False := by
  intro f hf p q e m₁ m₂ hpa hop hoq hp3 hq3 hepos
  obtain ⟨hred, hpos, hdisc⟩ := hmem f hf
  exact forall_cage_shape hA hApos hblockall f hdisc hred hpos
    p q e m₁ m₂ hpa hop hoq hp3 hq3 hepos


#print axioms forall_box_caged

end BQF
end GaussForms
end Phys.Foundation
