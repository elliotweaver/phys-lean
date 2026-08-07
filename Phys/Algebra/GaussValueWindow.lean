/-
  # THE VALUE WINDOW + THE PAIRING (GQ SG-q)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The H(m) assembly's geometric welds (PREREG-35: 1019/1019 band
  touches balanced; PREREG-36b: worst band-composite window count = 2,
  signature map injective across the whole deferring population):

  * `least_value_window` — ★★ THE WINDOW: a band prime's least-root
    value V = p·q is pinched into (A/4, A/3]: A < 4pq ∧ 3pq ≤ A —
    the campaign's narrowest window.
  * `band_partner_touches` — ★★★ THE PAIRING: a band prime dividing a
    band touch's cofactor touches through the SAME value — explicit
    witness p·w, choice-free. With the kill (N638) band touches pair
    off through their values.

  NEXT (SG-r): signature injectivity — distinct band touches carry
  distinct (2-power, deep-part) signatures ⟹ B_touch ≤ #signatures =
  f(m) — the |D|-independent H(m).

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussBandTouch

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★ THE VALUE WINDOW: a band touch's least-root value V = p·q is
    pinched into (A/4, A/3]: A < 4·(p·q) ∧ 3·(p·q) ≤ A. -/
theorem least_value_window {p q A y : Z}
    (hy1 : 1 ≤ y) (hyp : y ≤ p)
    (hval : 4 * (p * q) = y * y + A)
    (hgate : 3 * (p * p) ≤ A) :
    A < 4 * (p * q) ∧ 3 * (p * q) ≤ A := by
  constructor
  · nlinarith
  · exact band_value_bound (by linarith) hyp hval hgate

/-- ★★★ THE PAIRING: a band prime r dividing the cofactor of a band
    touch at value V = p·q touches the branch through the SAME value —
    explicit witness. -/
theorem band_partner_touches {p q r w x c₀ : Z}
    (hV : x * x + x + c₀ = p * q) (hrq : q = r * w) :
    ∃ k : Z, x * x + x + c₀ = r * k := by
  refine ⟨p * w, ?_⟩
  rw [hV, hrq]
  ring


#print axioms least_value_window
#print axioms band_partner_touches

end BQF
end GaussForms
end Phys.Foundation
