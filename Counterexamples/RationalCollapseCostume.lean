/-
  Counterexamples.RationalCollapseCostume — N9 ℚ-from-the-derived-ℤ costume (must be
  REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the derived rationals, in the precise wrong shape the trunk
  rules out: claiming the multiplicative (field-of-fractions) CLOSURE COLLAPSES — that
  the rational `1/2 = Q.half` (the multiplicative inverse-partner of 2, the genuine new
  element ℚ adds) equals the void `0`. This is the degenerate closure where the
  multiplicative reflection annihilates instead of inverting: if `1/2 = 0`, the field
  closure has collapsed, the denominator `2` has been allowed to act as if it could be
  zero, and the embedding `Z ↪ ℚ` is no longer strict (every fraction identifies with an
  integer) — exactly the W8 vacuity the battery exists to catch.

  The whole content of `Phys/Foundation/RationalTower.lean` is that ℚ STRICTLY extends
  the derived ℤ (`Z`): `1/2` is a genuine NEW element with an inverse (`2` is invertible,
  `half_mul_two`) and NO integer preimage (`half_not_ofZ`), and `Q` carries a real
  `Field` whose multiplicative inverse = the SWAP (numerator ↔ denominator). If the
  closure instead collapsed `1/2 = 0`, every fraction would identify and `Q` would carry
  no more than the trivial ring — the derived rationals would be vacuous (and a field
  cannot be trivial: `0 ≠ 1`).

  Via the banked quotient API (`Q.mk_eq_zero`), the bogus equality `mk 1 dTwo = 0`
  reduces to the `Z`-equation `(1 : Z) = 0` — i.e. the derived `1` equals the derived
  void, which `Z.one_ne_zero'` (tracing to `step ≠ void`, N7) refutes. So the proof below
  must FAIL to elaborate. The manifest's PASS_SIGNATURE matches the resulting `1 = 0`
  goal over the derived integers.
-/
import Phys.Foundation.RationalTower

namespace Counterexamples

open Phys.Foundation

/-- WRONG (GATE) CLAIM: that the multiplicative closure COLLAPSES — the rational
    `1/2 = Q.half` equals the void `0`. This is the literal degeneration of the banked
    `half_ne_zero` / `half_not_ofZ`: if it held, the derived ℚ would be vacuous and the
    multiplicative reflection (the swap) trivial. `Q.mk_eq_zero` reduces it to the false
    `Z` equation `(1 : Z) = 0`. It must FAIL to elaborate. -/
theorem rational_collapse_BOGUS : Q.half = 0 := by
  rw [Q.half, Q.mk_eq_zero]

end Counterexamples
