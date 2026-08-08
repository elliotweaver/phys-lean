/-
  # THE DIVISOR FORM — divisibility is geometry (GQ SG-as)

  ## What this file proves (SEED-GROWTH campaign, THE BRIDGE)

  The class-relation route for the silent crown, kernel form: a
  divisor of a window value CARRIES a form of the disc —

  * `divisor_form` — ★★★ (∀): P(x) = s·r, s, r > 0 ⟹
    disc ⟨s, 2x+1, r⟩ = 1 − 4c₀ ∧ PosDef. One ring identity.
  * `divisor_form_reduced` — ★★ the band landing: −s < 2x+1 ≤ s ≤ r
    ⟹ the divisor form is a REDUCED box member as-is.

  With the composed look (N665) this is the return chain's data: a
  repeat pair's cofactors s, s′ carry forms of the same disc from
  the same window; the composed look multiplies the looks; the
  reduction of the composed representation is the principal return.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussComposedLook

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE DIVISOR FORM: a divisor of a window value carries the
    explicit form of the disc — divisibility is geometry. -/
theorem divisor_form {c₀ x s r : Z}
    (hsr : x * x + x + c₀ = s * r) (hs : 0 < s) (hr : 0 < r) :
    disc ⟨s, 2 * x + 1, r⟩ = 1 - 4 * c₀ ∧ PosDef ⟨s, 2 * x + 1, r⟩ := by
  constructor
  · show (2 * x + 1) * (2 * x + 1) - 4 * s * r = 1 - 4 * c₀
    have : s * r = x * x + x + c₀ := hsr.symm
    nlinarith [this]
  · exact ⟨hs, hr⟩

/-- ★★ THE BAND LANDING: when the divisor sits in the normalization
    window it is a reduced box member as-is. -/
theorem divisor_form_reduced {c₀ x s r : Z}
    (hsr : x * x + x + c₀ = s * r) (hs : 0 < s) (hr : 0 < r)
    (hlow : -s < 2 * x + 1) (hhigh : 2 * x + 1 ≤ s) (hsr' : s ≤ r) :
    Reduced ⟨s, 2 * x + 1, r⟩ ∧ PosDef ⟨s, 2 * x + 1, r⟩ ∧
      disc ⟨s, 2 * x + 1, r⟩ = 1 - 4 * c₀ := by
  obtain ⟨hdisc, hpos⟩ := divisor_form hsr hs hr
  exact ⟨⟨hlow, hhigh, hsr'⟩, hpos, hdisc⟩


#print axioms divisor_form
#print axioms divisor_form_reduced

end BQF
end GaussForms
end Phys.Foundation
