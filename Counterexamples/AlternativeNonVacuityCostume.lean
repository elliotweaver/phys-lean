/-
  Counterexamples.AlternativeNonVacuityCostume — N5b anti-vacuity costume
  (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the terminal algebra's alternativity battery
  (`Phys/Algebra/Alternative.lean`): claiming the associator
  `[ι(ιJ), ι(e₂), e₂]` of `O ℚ` VANISHES at its `im.im.im` coordinate — i.e. that
  the cascade's own non-associating triple actually associates, which would make the
  alternating-form statements (`assoc_swap12`, `alt_left`, …) VACUOUS (an alternating
  form that is identically zero says nothing) and would contradict the banked
  `not_associative` (`Phys/Cascade/Octonion.lean`).

  The content of `Alternative.lean` is that `O ℚ` is alternative AND genuinely
  non-associative: the witness associator has `im.im.im` coordinate `= 2`
  (`assoc_witness_coord`, BANKED). The bogus claim is that this same coordinate is `0`.

  Substituting the banked value, the bogus claim reduces to the false core `2 = 0` in
  `ℚ`. The manifest PASS_SIGNATURE matches that core.

  This guards the non-vacuity of the cap's positive lever (docs/RUNBOOK.md W8): if the
  associator vanished on the cascade's non-associating triple, "𝕆 is alternative" would
  be the empty statement that 𝕆 is associative, and the gap between "alternative" and
  "associative" — the exact gap the Hermitian-tower cap value 3 measures — would
  collapse. The kernel must REJECT it.
-/
import Phys.Algebra.Alternative
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra

namespace Counterexamples

attribute [local instance] CD.narCD CD.srCD

/-- WRONG (NON-VACUITY) CLAIM: that the witness associator of `O ℚ` vanishes at its
    `im.im.im` coordinate (the cascade's non-associating triple would associate). The
    derived law (`assoc_witness_coord`, banked) is that this coordinate `= 2`;
    substituting it, the claim reduces to the false core `2 = 0` and must FAIL to
    elaborate. -/
theorem alternative_nonvacuity_BOGUS :
    (assoc (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ)).im.im.im = 0 := by
  rw [assoc_witness_coord]

end Counterexamples
