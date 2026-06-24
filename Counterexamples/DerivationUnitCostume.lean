/-
  Counterexamples.DerivationUnitCostume — N16 costume (must be REJECTED).
  ===========================================================================
  THE GARBAGE WITNESS for the N16 structural law `deriv_one` (every Leibniz-derivation
  of the terminal algebra kills the unit, `D 1 = 0`): claiming the banked NONZERO
  derivation `witnessDeriv` (N6, `= innerDeriv e₂` on `O ℚ`) PRESERVES the unit,
  `witnessDeriv 1 = 1`.

  `witnessDeriv` is genuinely nonzero as an endomorphism (banked `witnessDeriv_ne_zero`),
  so it is a real derivation — but `deriv_one` proves EVERY derivation annihilates the
  unit, so `witnessDeriv 1 = 0` (banked `witnessDeriv_one`). After `rw [witnessDeriv_one]`
  the claim reduces to the FALSE numeric core `0 = 1` over the cascade ground ring `ℚ`.
  The kernel must REJECT it.

  This is the anti-vacuity teeth (docs/RUNBOOK.md W8) on the structural reduction the
  dimension count rests on: if `deriv_one` were vacuous (e.g. only the zero map counted as
  a derivation), the law would carry no content. It is not — a NONZERO map kills the unit,
  which is exactly why a derivation is determined by its restriction to the 7-dimensional
  imaginary subspace (the reduction cutting Der(𝕆) from so(7) to the 14-dimensional g₂).

  The manifest's PASS_SIGNATURE matches the elaboration error below.
-/
import Phys.Algebra.DerivationDim

namespace Counterexamples

open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

/-- WRONG: claiming the nonzero derivation `witnessDeriv` preserves the unit
    (`witnessDeriv 1 = 1`). False — every Leibniz-derivation kills the unit (`deriv_one`),
    so `witnessDeriv 1 = 0`, forcing `0 = 1`. Must FAIL. -/
theorem witnessDeriv_preserves_unit_BOGUS : witnessDeriv (1 : O ℚ) = 1 := by
  rw [witnessDeriv_one]

end Counterexamples
