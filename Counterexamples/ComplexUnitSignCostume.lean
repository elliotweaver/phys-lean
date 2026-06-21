/-
  Counterexamples.ComplexUnitSignCostume — N2 rung-1 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS: claiming the derived complex unit in the FORCED ALGEBRA
  squares to `+1` instead of `-1`. The whole point of the first rung is that the
  doubling FORCES `J * J = -1` (the complex unit N1 deferred). The split-complex
  sign `J² = +1` is the "wrong stop": it is a reflection, not the fold's square
  root, and would mean the doubling produced the split numbers, not the complex
  ones.

  `Dbl.J_mul_J` (Phys/Cascade/ComplexUnit.lean) proves `J * J = -1` in the forced
  algebra `Dbl ℚ`. This costume asserts `J * J = 1` there, which is FALSE
  (`J * J = -1 ≠ 1`). The kernel must REJECT it. If it ever COMPILES, the SIGN of
  the derived complex unit was doing no work — the product could have been the
  split-complex one — exactly the failure the battery exists to catch.

  The manifest's PASS_SIGNATURE matches the elaboration error below (`-1 = 1`).
-/
import Phys.Cascade.ComplexUnit
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

open Phys.Cascade

/-- WRONG STOP: claiming the forced algebra's complex unit squares to `+1`.
    False: `Dbl.J * Dbl.J = -1` in `Dbl ℚ`, so this must FAIL to elaborate. -/
theorem complex_unit_sign_BOGUS : (Dbl.J : Dbl ℚ) * Dbl.J = 1 := by
  ext <;> simp [Dbl.J]
