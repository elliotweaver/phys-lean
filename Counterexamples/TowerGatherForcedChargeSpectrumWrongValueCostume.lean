/-
  Counterexamples.TowerGatherForcedChargeSpectrumWrongValueCostume — N243 anti-vacuity (C274).
  ===========================================================================
  W8 ANTI-VACUITY. The N243 node banks THE COMPLETE CHARGE SPECTRUM of the fundamental 7: the
  minimal polynomial of the forced charge operator `chargeOp = crossOp u1` on the ENTIRE `ImO` is
  exactly `X³ + X = X·(X² + 1)` (`chargeOp_minpoly`) — a degree-3 polynomial whose three roots
  `{0, +i, −i}` are the complete charge-eigenvalue decomposition of the branching `7 = 1 ⊕ 3 ⊕ 3̄`
  (singlet at `0`, two triplets at the opposite imaginary pair `±i`). The load-bearing fact — the
  one that makes the spectrum the FULL `{0, ±i}` on the whole 7 and not merely the `±i` pair of
  the V-restriction (N242, degree 2) — is that the minimal polynomial has DEGREE `3` (it PICKS UP
  the extra linear factor `X` from the genuine `0`-eigenvalue singlet), NOT degree `2` (which
  would omit the singlet's charge-`0` direction).

  The anchor is that genuine degree, packaged as the clean equality
  `min 274 (natDegree (minpoly ℚ chargeOp)) = 3` (which holds precisely BECAUSE
  `minpoly ℚ chargeOp = X³ + X`, whose `natDegree` is `3`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the whole-7 spectrum is only degree 2 / the
  singlet's charge-`0` direction is missing / the minimal polynomial of the whole 7 coincides with
  the V-restriction's `X² + 1` / the complete spectrum is not `{0, ±i}`): that
  `min 274 (natDegree (minpoly ℚ chargeOp))` equals `274`. It GENUINELY equals `3`
  (`charge_spectrum_degree_true`). Rewriting the banked value reduces the bogus claim to the false
  numeric `3 = 274` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the minimal
  polynomial of `crossOp u1` on `ImO` is `X³ + X` (`natDegree` `3`), so
  `min 274 (natDegree (minpoly ℚ chargeOp)) = 3`, and claiming it equals `274` is genuinely
  FALSE (3 ≠ 274).

  DISTINCT from the banked battery (… C272 = 0=272, C273 = 2=273): the pair (274, 3) is fresh
  (RHS 274 distinct from every prior right-hand value; the LHS anchor is the NEW N243 whole-7
  charge-spectrum minimal-polynomial degree, the complete `{0, ±i}` spectrum witness — the degree
  `3` that DISTINGUISHES the whole 7 from the degree-2 V-restriction of N242).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherForcedChargeSpectrum

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Polynomial

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- The banked degree: `natDegree (X³ + X) = 3`. -/
theorem cube_poly_natDegree_val : (X ^ 3 + X : ℚ[X]).natDegree = 3 := by compute_degree!

/-- TRUE: `min 274 (natDegree (minpoly ℚ chargeOp)) = 3`, holding precisely because the minimal
    polynomial of the forced charge operator on the WHOLE fundamental 7 is `X³ + X` (banked
    `chargeOp_minpoly`), a degree-3 polynomial whose three roots `{0, ±i}` are the complete charge
    spectrum. -/
theorem charge_spectrum_degree_true :
    min 274 (natDegree (minpoly ℚ chargeOp)) = 3 := by
  rw [chargeOp_minpoly, cube_poly_natDegree_val]; decide

/-- BOGUS: claims `min 274 (natDegree (minpoly ℚ chargeOp)) = 274`. It GENUINELY equals `3`
    (`charge_spectrum_degree_true`). The WRONG claim (the whole-7 spectrum is only degree 2 / the
    singlet's charge-`0` direction is missing / the complete spectrum is not `{0, ±i}`) reduces —
    through the banked value — to the false numeric `3 = 274`, so this must NOT compile. -/
theorem charge_spectrum_degree_wrong_BOGUS :
    min 274 (natDegree (minpoly ℚ chargeOp)) = 274 := by
  rw [charge_spectrum_degree_true]
  -- ⊢ (3 : ℕ) = 274  (FALSE — the costume bites)

end Counterexamples
