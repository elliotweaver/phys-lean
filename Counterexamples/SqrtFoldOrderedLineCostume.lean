/-
  Counterexamples.SqrtFoldOrderedLineCostume — N2 rung-1 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS: claiming a SCALAR square root of the fold exists on an
  ORDERED base line — i.e. that some `j` in a linearly-ordered field has
  `j * j = -1`. This is exactly the OBSTRUCTION the cascade's first rung turns on:
  on the ordered line self-overlap is nonnegative (`j*j ≥ 0 > -1`), so NO such `j`
  exists. The positivity (Born = self-overlap, the trunk) is what forbids the root
  on the line and FORCES the step up a dimension.

  `sqrt_fold_not_on_line` (Phys/Cascade/ComplexUnit.lean) proves no scalar squares
  to `-1` on an ordered ring. This costume asserts the opposite over `ℚ` (a concrete
  linearly-ordered field): `∃ j : ℚ, j * j = -1`. That is FALSE — the kernel must
  REJECT it. If it ever COMPILES, the obstruction was vacuous and the doubling was
  not actually forced — exactly the "wrong continuation" the battery exists to catch.

  CRUCIAL CONTRAST (proves the obstruction is POSITIVITY, not algebra): the very
  same statement is TRUE once order is dropped — `2 * 2 = -1` in `ZMod 5`
  (`sqrt_fold_on_unordered_line`). So this costume must bite SPECIFICALLY because
  the base is ordered.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

/-- WRONG: a scalar square root of `-1` on the ordered line `ℚ`. None exists
    (`j*j ≥ 0 > -1`), so this must FAIL to elaborate. -/
theorem sqrt_fold_ordered_line_BOGUS : ∃ j : ℚ, j * j = -1 := by
  norm_num
