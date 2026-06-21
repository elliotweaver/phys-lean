/-
  Counterexamples.OperatorCliffordSignCostume — N3 anti-vacuity / sign costume
  (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the operator (Clifford) relation, in the precise wrong shape
  the task names: claiming the imaginary left-multiplication operator squares with the
  WRONG SIGN — `L a ∘ L a = +Nrm(a)·id` instead of the derived `L a ∘ L a = −Nrm(a)·id`.
  The whole content of `Phys/Algebra/Operator.lean` (`L_sq_op`, `L_unit_sq`) is that the
  square carries a MINUS sign — the trunk's Born self-overlap positivity made into the
  `J² = −1` operator law. Flipping the sign is the canonical Clifford-relation error.

  At the concrete imaginary unit `u = e₂ : O ℚ` the derived law (`L_unit_sq`, BANKED) is
  `L u * L u = −1` in the associative endomorphism ring `End (O ℚ)`. The bogus claim is
  `L u * L u = 1`. Substituting the banked value, this reduces to the false core
  `−1 = 1` in `End (O ℚ)`, and (applying the identity at `1 : O ℚ`) to `−1 = 1` in `O ℚ`,
  i.e. its first coordinate `(-1 : H ℚ) = 1`, projecting to the false `(-1 : ℚ) = 1`.
  The manifest PASS_SIGNATURE matches the core `-1 = 1`.

  This guards the SIGN (docs/RUNBOOK.md W8): if `L u * L u = 1` ever COMPILED, the
  operator relation would carry the wrong sign — the self-overlap would be a `+` form
  (split/degenerate), not the trunk's positive Born form, and the whole spinor structure
  would be the wrong one. The kernel must REJECT it.
-/
import Phys.Algebra.Operator
import Mathlib.Tactic

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra

namespace Counterexamples

attribute [local instance] CD.narCD CD.srCD

/-- WRONG (SIGN) CLAIM: that the imaginary unit operator `L e₂` squares to `+1` in
    `End (O ℚ)`. The derived law (`L_unit_sq`, banked) is `L e₂ * L e₂ = −1`; substituting
    it, the claim reduces to the false core `−1 = 1` and must FAIL to elaborate. -/
theorem operator_clifford_sign_BOGUS :
    Lop (CD.e2 : O ℚ) * Lop (CD.e2 : O ℚ) = 1 := by
  rw [L_unit_sq]

end Counterexamples
