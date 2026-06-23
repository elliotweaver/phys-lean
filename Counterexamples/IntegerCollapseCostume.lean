/-
  Counterexamples.IntegerCollapseCostume — N8 ℤ-from-the-derived-ℕ costume (must be
  REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the derived integers, in the precise wrong shape the trunk
  rules out: claiming the additive group CLOSURE COLLAPSES — that the negative count
  `-1 = mk 0 1` (one re-entry BACK, the fold's reflection of `1`) equals the void
  `0 = mk 0 0`. This is the degenerate closure where the look-back reflection
  annihilates instead of inverting: if `-1 = 0`, the group completion has collapsed,
  negation is trivial, and the embedding `Re ↪ ℤ` is non-injective (distinct counts
  identify) — exactly the W8 vacuity the battery exists to catch.

  The whole content of `Phys/Foundation/IntegerTower.lean` is that ℤ STRICTLY extends
  the counting tower `Re`: `-1` is a genuine NEW element with NO count preimage
  (`neg_one_not_ofRe`), the embedding is injective (`ofRe_injective`), and `Z` carries
  a real `CommRing` whose negation = the fold's reflection (the swap). If the closure
  instead collapsed `-1 = 0`, every signed count would identify and `Z` would carry no
  more than the trivial ring — the derived integers would be vacuous.

  Via the banked quotient API (`Z.mk_eq`), the bogus equality `mk 0 1 = mk 0 0`
  reduces to the `Re`-arithmetic equation `0 + 0 = 0 + 1`, i.e. `void = step void`
  (`step` is never the void, `step_ne_void`, N7), which is `False`. So the proof below
  must FAIL to elaborate. The manifest's PASS_SIGNATURE matches the resulting `False`
  goal.
-/
import Phys.Foundation.IntegerTower

namespace Counterexamples

open Phys.Foundation

/-- WRONG (GATE) CLAIM: that the additive group closure COLLAPSES — the negative
    count `-1 = mk 0 1` equals the void `mk 0 0`. This is the literal degeneration of
    the banked `neg_one_not_ofRe` / `ofRe_injective`: if it held, the derived ℤ would
    be vacuous and the fold's reflection trivial. `simp` reduces it (via `Z.mk_eq`) to
    the false `Re` equation, leaving the goal `False`. It must FAIL to elaborate. -/
theorem integer_collapse_BOGUS : Z.mk 0 1 = Z.mk 0 0 := by
  simp [Z.mk_eq]

end Counterexamples
