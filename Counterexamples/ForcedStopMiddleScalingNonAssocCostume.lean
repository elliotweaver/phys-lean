/-
  Counterexamples.ForcedStopMiddleScalingNonAssocCostume — N2d-hard-backward-MIDDLE
  anti-vacuity costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the scaling-law reflection (Part C), in the precise wrong
  shape the task names: claiming the LEFT SCALING LAW
  `x · (star x · y) = iota (Nrm x) · y` — the alternative/composition law in scaling
  form — holds on a base that is NOT associative. The entire content of `assoc_of_scaling`
  (`Phys/Cascade/ForcedStop.lean`, Part C) is that this scaling law FORCES the base to be
  associative; it is FALSE the moment the base is non-associative. The cascade's terminal
  algebra `S ℚ = CD (O ℚ)` has the NON-associative base `O ℚ` (`not_associative`), so the
  scaling law must FAIL on `CD (O ℚ)`.

  At the concrete witness `X = ⟨p, q⟩` and `Y = iota r` on `S ℚ`, where
  `p = ι(ιJ ℚ)`, `q = ι(e₂ : H ℚ)`, `r = e₂ : O ℚ` are the directions of the rung-3
  non-associating triple, the new-dimension component `.im.im.im.im` of the two sides is
  `2` on the left (`scal_lhs`) and `0` on the right (`scal_rhs`). Claiming they are equal
  forces the false core `2 = 0`.

  This guards ANTI-VACUITY (docs/RUNBOOK.md W8): `assoc_of_scaling` genuinely USES the
  non-associativity it concludes against — its hypothesis (the scaling law) is FALSE on a
  non-associative base, so the reflection is not a vacuous restatement true for any base.
  If this BOGUS scaling-law instance ever COMPILED, the banked reflection would be empty
  (the scaling law would hold even where the base fails to associate, so forcing
  associativity from it would be content-free). The kernel must REJECT it.

  The two component lemmas `scal_lhs = 2` and `scal_rhs = 0` are themselves PROVED (the
  projected sides really are `2` and `0`); only the final equality is bogus, and it
  reduces — via those proved values — to the false core `2 = 0`. The manifest's
  PASS_SIGNATURE matches that core.
-/
import Phys.Cascade.ForcedStop
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD

namespace Phys.Cascade

/-- Witness directions of the rung-3 non-associating triple, in `O ℚ`. -/
noncomputable def cmX1 : O ℚ := CD.iota (ιJ ℚ)
noncomputable def cmX2 : O ℚ := CD.iota (CD.e2 : H ℚ)
noncomputable def cmY0 : O ℚ := (CD.e2 : O ℚ)

/-- The scaling-law witness on `S ℚ`: `X = ⟨p, q⟩`. -/
noncomputable def cmX : S ℚ := ⟨cmX1, cmX2⟩
/-- The scaling-law witness on `S ℚ`: `Y = iota r`. -/
noncomputable def cmY : S ℚ := CD.iota cmY0

set_option maxHeartbeats 2000000 in
/-- The LEFT side of the scaling law at the witness, projected to the new dimension, is
    `2` (genuinely non-degenerate — this is what makes the law bite on a non-assoc base). -/
theorem scal_lhs :
    (cmX * (star cmX * cmY)).im.im.im.im = (2 : ℚ) := by
  simp only [cmX, cmY, cmX1, cmX2, cmY0, ιJ]
  simp [CD.iota, CD.e2, Dbl.J, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.mul_im,
    Dbl.star_re', Dbl.star_im']
  norm_num

set_option maxHeartbeats 2000000 in
/-- The RIGHT side of the scaling law at the witness, projected to the new dimension, is
    `0` (`iota (Nrm X) * Y` with `Y = iota r` keeps the new dimension empty). -/
theorem scal_rhs :
    (CD.iota (CD.Nrm cmX) * cmY).im.im.im.im = (0 : ℚ) := by
  simp only [cmX, cmY, cmX1, cmX2, cmY0, ιJ, CD.Nrm]
  simp [CD.iota, CD.e2, Dbl.J, CD.mul_re, CD.mul_im, CD.star_re, CD.star_im,
    CD.add_re, CD.add_im, CD.neg_re, CD.neg_im, Dbl.mul_re, Dbl.mul_im,
    Dbl.star_re', Dbl.star_im']

end Phys.Cascade

/-- WRONG (VACUITY) CLAIM: that the LEFT SCALING LAW `x · (star x · y) = iota (Nrm x) · y`
    holds at the witness `x = cmX, y = cmY` on `S ℚ` — whose base `O ℚ` is NON-associative.
    Projecting both sides to the new dimension (proved lemmas `scal_lhs = 2`,
    `scal_rhs = 0`) this reduces to the false core `2 = 0` and must FAIL to elaborate. -/
theorem middle_scaling_nonassoc_BOGUS :
    (Phys.Cascade.cmX * (star Phys.Cascade.cmX * Phys.Cascade.cmY)).im.im.im.im
      = (CD.iota (CD.Nrm Phys.Cascade.cmX) * Phys.Cascade.cmY).im.im.im.im := by
  rw [Phys.Cascade.scal_lhs, Phys.Cascade.scal_rhs]
