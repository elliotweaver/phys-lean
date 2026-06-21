/-
  Counterexamples.ForcedStopForwardNeedsCommCostume — N2d-hard forward-law costume
  (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the NEW forward content, in the precise wrong shape the task
  names: "the forced link needs COMMUTATIVITY, not associativity." N2d-hard proved the
  composition law SURVIVES the quaternion → octonion step, whose base `H ℚ = CD (Dbl ℚ)`
  is associative but NON-commutative: `Nrm_mul_on_O` gives `Nrm (x y) = Nrm x · Nrm y`
  for ALL `x, y : O ℚ`. If the link instead required a COMMUTATIVE base, the law would
  already FAIL at this associative-noncommutative rung — at a concrete witness. This
  costume asserts exactly that failure on the witness `e₂ ∈ O ℚ`, where
  `Nrm (e₂ · e₂) = 1` and `Nrm e₂ · Nrm e₂ = 1` (both project to `1`): claiming the
  law FAILS there forces the false core `1 ≠ 1`. The kernel must REJECT it.

  If this ever COMPILES, multiplicativity would fail on an associative non-commutative
  base — i.e. the link would hinge on commutativity, contradicting the banked
  `Nrm_mul_on_O` (the law holds across the whole associative regime, not only the
  commutative rungs). This is the wrong-stop / wrong-hypothesis the battery catches.

  The manifest's PASS_SIGNATURE matches the false core `1 ≠ 1` left after reducing both
  sides of the witnessed octonion-rung instance with the proved norm values.
-/
import Phys.Cascade.ForcedStop
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

open Phys.Cascade

/-- WRONG HYPOTHESIS: claiming the composition law FAILS at the associative
    NON-commutative rung `O ℚ` on the witness `e₂` (i.e. that multiplicativity needs a
    commutative base). The projected norms are `Nrm (e₂ · e₂) = 1` and
    `Nrm e₂ · Nrm e₂ = 1`, so the inequality reduces to the false core `1 ≠ 1` — this
    must FAIL to elaborate. -/
theorem forwardlaw_needs_comm_BOGUS :
    (CD.Nrm ((CD.e2 : O ℚ) * CD.e2)).re.re ≠ (CD.Nrm (CD.e2 : O ℚ) * CD.Nrm CD.e2).re.re := by
  rw [Nrm_mul_on_O]
