/-
  # THE SEED DICHOTOMY — the boxed sentence's engine (GQ SG-aw)

  ## What this file proves (SEED-GROWTH campaign, THE ASSEMBLY TERM)

  Both parities, one term: a small box forces a WALL position (no
  in-window divisor witness) inside every long list of distinct low
  positions —

  * `seed_dichotomy` — ★★★ (∀ negative fundamental disc via the
    parity flag): box ≤ H ⟹ every (> H)-list of distinct low
    positions contains a position with NO in-window divisor. The
    pigeonhole contrapositive of the parity jaw (N669): billing
    positions number ≤ h; a longer list must contain a wall.

  The kernel form of "small h ⟹ the branch is almost everywhere
  locally prime" — the exact statement the boxed inverse form
  contraposes. With the silent factory law (N668): a wall position
  under silence has its value PRIME past the wall; with the ramified
  arm (N664) and JAW 1 (N663): every content channel of a wall is a
  forced deep touch. The composition to seedcount ≥ m is the
  instantiation of these four sealed terms.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussParityJaw

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE SEED DICHOTOMY (both parities, one term): a small box
    forces a wall position in every long list of distinct low
    positions — the boxed sentence's engine. -/
theorem seed_dichotomy {par base : Z} {H : Nat} (hpar : par = 0 ∨ par = 1)
    (box : List BQF)
    (hboxpw : List.Pairwise (· ≠ ·) box)
    (hcomplete : ∀ f : BQF, Reduced f → PosDef f →
      disc f = par - 4 * base → f ∈ box)
    (hH : box.length ≤ H)
    (xs : List Z)
    (hxspw : List.Pairwise (· ≠ ·) xs)
    (hxlow : ∀ x ∈ xs, 0 ≤ x)
    (hlong : H < xs.length) :
    ∃ x ∈ xs, ¬ ∃ s r : Z, x * x + x * par + base = s * r ∧
      0 < s ∧ s ≤ r ∧ 2 * x + par ≤ s ∧ -s < 2 * x + par := by
  by_contra hall
  push_neg at hall
  -- every position has a witness ⟹ the parity jaw bills them all
  have hjaw := parity_jaw hpar box hboxpw hcomplete xs hxspw
    (by
      intro x hx
      obtain ⟨s, r, hsr, hs, hsle, hwin, hlow⟩ := hall x hx
      exact ⟨hxlow x hx, s, r, hsr, hs, hsle, hwin, hlow⟩)
  omega


#print axioms seed_dichotomy

end BQF
end GaussForms
end Phys.Foundation
