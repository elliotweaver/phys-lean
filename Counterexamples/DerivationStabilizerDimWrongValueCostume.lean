/-
  Counterexamples.DerivationStabilizerDimWrongValueCostume — N42b costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE CLAIM for the N42b DIMENSION of the stabilizer Lie subalgebra `stabLieQ` of the
  fixed imaginary unit `u1` inside `Der(𝕆)`. N42b banks `finrank_stabLieQ : dim stabLieQ = 8`
  (`= dim su(3)`), DERIVED by rank–nullity on the banked `evalU1` (`14 − 6 = 8`). The VALUE `8`
  is LOAD-BEARING: the stabilizer is the 8-dim `su(3)`, STRICTLY inside the 14-dim `g₂` and
  STRICTLY larger than its 6-dim image complement.

  THE GARBAGE CLAIM the kernel MUST reject (anti-vacuity, W8): that the dimension is `14` (the
  WHOLE derivation algebra `g₂` — i.e. the stabilizer is everything, no constraint) rather than
  `8`. This is FALSE: `finrank_stabLieQ` proves the dimension is exactly `8`, and `8 ≠ 14`. The
  costume tries to supply `finrank_stabLieQ` (`= 8`) where a proof of `= 14` is demanded; the
  type mismatch (`8` vs `14`) makes it FAIL to compile — the guard against a dimension read as
  the whole algebra (which would collapse `su(3) ⊊ g₂` into `su(3) = g₂`).

  This costume DIRECTLY exercises the NEW N42b content: it uses `finrank_stabLieQ` (the banked
  dimension theorem). Deleting `Phys/Algebra/DerivationStabilizerDim.lean` removes the
  `finrank_stabLieQ` the costume references, so the costume would fail with a DIFFERENT
  (unknown-identifier) error and the PASS_SIGNATURE below would not match.
-/
import Phys.Algebra.DerivationStabilizerDim

namespace Counterexamples

open Phys.Cascade Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- WRONG: claiming the stabilizer has dimension `14` (the whole `g₂`) rather than the derived
    `8` (`su(3)`). Supplying the banked `finrank_stabLieQ` (`= 8`) forces a `8 ≠ 14` type
    mismatch. Must FAIL to compile. -/
theorem finrank_stabLieQ_eq_14_BOGUS :
    Module.finrank ℚ stabLieQ.toSubmodule = 14 := finrank_stabLieQ

end Counterexamples
