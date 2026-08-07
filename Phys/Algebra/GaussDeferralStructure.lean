/-
  # THE DEFERRAL STRUCTURE THEOREM — the box is caged (GQ SG-l)

  ## What this file proves (SEED-GROWTH campaign, production node)

  The descent's contrapositive at box level — the uniform-closure
  route's structural half:

  * `blocked_slot_shallow` — ★★★ THE PIN: an odd prime factor of any
    slot's leading coefficient CANNOT be blocked on the principal
    branch (immediate from slot_factor_touches, N633).
  * `deferral_pins_box` — ★★★ THE STRUCTURE THEOREM: total odd-deep
    blocking ⟹ every odd prime factor of every reduced form's leading
    coefficient is SHALLOW (A < 4p²) — the whole box lives in the
    2-power × band cage. Deferral doesn't just fail to bill: it
    FORBIDS structure.

  With the banked ledger (box size = h) the route to the uniform ∀m
  closure is cage-counting: 2-tower ≤ log₂(gate) slots + band slots
  (N625's pinch confines band a's near √A) ⟹ deferring D have small
  h ⟹ they live below the record table's fiber maxima. The jaws meet
  at the box.

  ## Standard
  Foundations-only; no sorry; imports the GQ production chain only.
-/
import Phys.Algebra.GaussSlotDescent

namespace Phys.Foundation
namespace GaussForms
namespace BQF

open IntegerArith

/-- ★★★ THE PIN: an odd prime factor of a slot cannot be blocked. -/
theorem blocked_slot_shallow {f : BQF} {c₀ p e m : Z}
    (hdisc : disc f = 1 - 4 * c₀)
    (hpa : f.a = p * e) (hodd : p = 2 * m + 1)
    (hblocked : ∀ x : Z, ¬ ZDvd' p (x * x + x + c₀)) : False := by
  obtain ⟨x, k, hxk⟩ := slot_factor_touches hdisc hpa hodd
  exact hblocked x ⟨k, hxk⟩

/-- ★★★ THE STRUCTURE THEOREM: total odd-deep blocking forces every
    odd prime factor of every slot's leading coefficient to be
    SHALLOW — the box is pinned into the 2-power × band cage. -/
theorem deferral_pins_box {c₀ A : Z} (hA : A = 4 * c₀ - 1)
    (hblockall : ∀ p m : Z, p = 2 * m + 1 → 1 ≤ m → 4 * (p * p) ≤ A →
      ∀ x : Z, ¬ ZDvd' p (x * x + x + c₀)) :
    ∀ f : BQF, disc f = 1 - 4 * c₀ →
    ∀ p e m : Z, f.a = p * e → p = 2 * m + 1 → 1 ≤ m →
    A < 4 * (p * p) := by
  intro f hdisc p e m hpa hodd hm
  by_contra hdeep
  push_neg at hdeep
  exact blocked_slot_shallow hdisc hpa hodd
    (hblockall p m hodd hm hdeep)


#print axioms blocked_slot_shallow
#print axioms deferral_pins_box

end BQF
end GaussForms
end Phys.Foundation
