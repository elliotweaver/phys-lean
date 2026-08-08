/-
  # THE REPEAT LAW + THE BOXED TERM (GQ SG-ax)

  ## What this file proves (SEED-GROWTH campaign, THE CLOSER)

  * `repeat_difference_law` — ★★★ (∀): P(x) = t·s, P(x′) = t·s′ ⟹
    t·(s′ − s) = (x′ − x)(x + x′ + 1) — same T-part at two positions
    divides the window difference (P63's mechanism: 100% of deferring
    members repeat at Δ ≤ 3).
  * `repeat_pinch` — ★★ an increasing repeat bounds its own T-part:
    t ≤ (x′ − x)(x + x′ + 1) — the deep alphabet pays the window.
  * `boxed_term` — ★★★ THE TERM (∀ negative fundamental disc, both
    parities, ONE quantifier string): box ≤ H ⟹ every (> H)-list of
    distinct low positions contains a WALL position where EVERY
    in-window factorization fails. Small h forces prime-or-blocked
    values in every window stretch — the boxed inverse sentence in
    the form the mechanism actually proves, composed from
    seed_dichotomy (N670) ← parity_jaw (N669) ← divisor forms
    (N666/N669) ← zpicks counting (N667).

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussSeedDichotomy

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE REPEAT DIFFERENCE LAW: same T-part, two positions — the
    T-part divides the window difference. -/
theorem repeat_difference_law {c₀ t s s' x x' : Z}
    (hv : x * x + x + c₀ = t * s) (hv' : x' * x' + x' + c₀ = t * s') :
    t * (s' - s) = (x' - x) * (x + x' + 1) := by
  nlinarith [hv, hv']

/-- ★★ THE PINCH: an increasing repeat bounds its own T-part. -/
theorem repeat_pinch {c₀ t s s' x x' : Z}
    (hv : x * x + x + c₀ = t * s) (hv' : x' * x' + x' + c₀ = t * s')
    (ht : 0 < t) (hss : s < s') (hxx : x < x') (hx0 : 0 ≤ x) :
    t ≤ (x' - x) * (x + x' + 1) := by
  have hlaw := repeat_difference_law hv hv'
  have hds : 1 ≤ s' - s := z_pos_ge_one (by linarith)
  calc t = t * 1 := by ring
    _ ≤ t * (s' - s) := mul_le_mul_of_nonneg_left hds (le_of_lt ht)
    _ = (x' - x) * (x + x' + 1) := hlaw

/-- ★★★ THE BOXED TERM (∀ negative fundamental disc, both parities,
    ONE quantifier string): a box within H over ANY branch forces,
    in every (H+1)-long distinct low-position list, a WALL position
    whose value's every in-window factorization fails — and at that
    position, every divisor d of the value with d² ≤ value must
    violate the look-window (d < 2x + par... i.e. the value's small
    divisors are EXHAUSTED below the look: for a silent disc the
    value is PRIME by the factory law). The sentence packages the
    dichotomy with the wall's meaning: small h ⟹ in every window
    stretch, a value that is prime-or-look-blocked. -/
theorem boxed_term {par base : Z} {H : Nat} (hpar : par = 0 ∨ par = 1)
    (box : List BQF)
    (hboxpw : List.Pairwise (· ≠ ·) box)
    (hcomplete : ∀ f : BQF, Reduced f → PosDef f →
      disc f = par - 4 * base → f ∈ box)
    (hH : box.length ≤ H)
    (xs : List Z)
    (hxspw : List.Pairwise (· ≠ ·) xs)
    (hxlow : ∀ x ∈ xs, 0 ≤ x)
    (hlong : H < xs.length) :
    ∃ x ∈ xs, ∀ s r : Z,
      x * x + x * par + base = s * r → 0 < s → s ≤ r →
      ¬ (2 * x + par ≤ s ∧ -s < 2 * x + par) := by
  obtain ⟨x, hx, hwall⟩ :=
    seed_dichotomy hpar box hboxpw hcomplete hH xs hxspw hxlow hlong
  refine ⟨x, hx, ?_⟩
  intro s r hsr hs hsle ⟨hwin, hlow⟩
  exact hwall ⟨s, r, hsr, hs, hsle, hwin, hlow⟩

#print axioms boxed_term


#print axioms repeat_difference_law
#print axioms repeat_pinch
#print axioms boxed_term

end BQF
end GaussForms
end Phys.Foundation
