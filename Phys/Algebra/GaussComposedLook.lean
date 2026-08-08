/-
  # THE COMPOSED LOOK — window looks compose (GQ SG-ar)

  ## What this file proves (SEED-GROWTH campaign, THE RETURN'S ENGINE)

  The gather composing its own looks: every window value is a
  principal look (4V = y² + A, y = 2x+1); two looks compose EXACTLY
  in halved window coordinates (y, y′ odd, A ≡ 3 mod 4 make the
  halving integral):

  * `composed_look` — ★★★ (∀, choice-free): 4·P(x)·P(x′) =
    (2xx′ + x + x′ − 2c₀ + 1)² + A·(x + x′ + 1)². The Brahmagupta
    identity as window arithmetic — the composed value is again
    A-represented with ȳ = x + x′ + 1.
  * `composed_scale` — ★★ the return stays in reach: positions ≤ W
    land at ȳ ≤ 2W + 1.

  THE RETURN'S ENGINE for the silent crown: under deferral the
  repeat (same T-part at two positions) composes to the principal
  return of the band-cofactor product — the object PREREG-39
  measures on the deferring rosters. The death composition (repeat +
  composed look + reduction) is the active front.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussRamifiedSeeds

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE COMPOSED LOOK: two principal window looks compose exactly —
    the Brahmagupta identity in halved window coordinates. With
    y = 2x+1, y′ = 2x′+1, A = 4c₀ − 1:
    w = (yy′ − A)/2 = 2xx′ + x + x′ − 2c₀ + 1 and
    ȳ = (y + y′)/2 = x + x′ + 1 are integers, and
    4·P(x)·P(x′) = w² + A·ȳ². -/
theorem composed_look {c₀ A x x' : Z} (hA : A = 4 * c₀ - 1) :
    4 * ((x * x + x + c₀) * (x' * x' + x' + c₀))
      = (2 * x * x' + x + x' - 2 * c₀ + 1) * (2 * x * x' + x + x' - 2 * c₀ + 1)
        + A * ((x + x' + 1) * (x + x' + 1)) := by
  rw [hA]; ring

/-- ★★ THE RETURN SCALE: the composed look's ȳ-content is the position
    sum — for window positions x, x′ ≤ W the return lands at
    ȳ ≤ 2W + 1: the next generation stays in reach. -/
theorem composed_scale {x x' W : Z} (hx : 0 ≤ x) (hx' : 0 ≤ x')
    (hxW : x ≤ W) (hx'W : x' ≤ W) :
    1 ≤ x + x' + 1 ∧ x + x' + 1 ≤ 2 * W + 1 := by
  constructor <;> linarith


#print axioms composed_look
#print axioms composed_scale

end BQF
end GaussForms
end Phys.Foundation
