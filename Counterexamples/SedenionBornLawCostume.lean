/-
  Counterexamples.SedenionBornLawCostume — N2c STOP costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS: claiming the terminal algebra `S ℚ = CD (O ℚ)` keeps the
  COMPOSITION / Born self-overlap law `N(xy) = N(x) N(y)`. The whole content of the
  STOP is that doubling the NON-associative `O` BREAKS this law
  (`Phys/Cascade/Sedenion.lean` `born_law_fails`: `N(zdX·zdY) ≠ N zdX · N zdY`,
  here `0 ≠ 2·2`). Claiming the law holds on the canonical witnesses is FALSE: the
  kernel must REJECT it. If it ever COMPILES, the cascade would NOT stop — the
  self-overlap composition law would survive past `O` — exactly the WRONG STOP the
  battery exists to catch.

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Cascade.Sedenion
import Mathlib.Data.Rat.Defs
import Mathlib.Tactic

open Phys.Cascade

/-- WRONG STOP: claiming the Born / composition law holds on the canonical witnesses
    (`N(zdX·zdY) = N zdX · N zdY`). False: the left side is `N 0 = 0` while the right
    is `2 · 2 = 4`. Reducing with the proved facts leaves the false core `0 = 4`, so
    this must FAIL to elaborate. -/
theorem sedenion_born_law_holds_BOGUS : N (zdX * zdY) = N zdX * N zdY := by
  rw [zero_divisor_prod, N_zero, N_zdX, N_zdY]
