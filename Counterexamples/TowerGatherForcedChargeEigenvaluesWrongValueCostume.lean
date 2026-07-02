/-
  Counterexamples.TowerGatherForcedChargeEigenvaluesWrongValueCostume — N242 anti-vacuity (C273).
  ===========================================================================
  W8 ANTI-VACUITY. The N242 node banks THE EXPLICIT OPPOSITE CHARGE EIGENVALUES `±i` of the two
  triplets: the minimal polynomial of the forced charge operator on the branching complement
  `V`, `chargeOpV := (crossOpO u1)|_V`, is exactly `X² + 1` (`chargeOpV_minpoly`) — a degree-2
  polynomial whose two roots are the OPPOSITE imaginary pair `±i`. The load-bearing fact — the
  one that makes the eigenvalues the imaginary pair `±i` and not a real value — is that the
  minimal polynomial has DEGREE `2` (an irreducible quadratic on the imaginary axis), NOT degree
  `1` (which would be a single real eigenvalue).

  The anchor is that genuine degree, packaged as the clean equality
  `min 273 (natDegree (minpoly ℚ chargeOpV)) = 2` (which holds precisely BECAUSE
  `minpoly ℚ chargeOpV = X² + 1`, whose `natDegree` is `2`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the charge operator has a real eigenvalue /
  the minimal polynomial is degree 1 / the two triplets do NOT carry opposite imaginary `±i`
  eigenvalues / the spectrum is not on the imaginary axis): that
  `min 273 (natDegree (minpoly ℚ chargeOpV))` equals `273`. It GENUINELY equals `2`
  (`charge_minpoly_degree_true`). Rewriting the banked value reduces the bogus claim to the false
  numeric `2 = 273` in ℕ. The kernel cannot close it; the costume BITES (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the minimal
  polynomial of `(crossOpO u1)|_Vsub` is `X² + 1` (`natDegree` `2`), so
  `min 273 (natDegree (minpoly ℚ chargeOpV)) = 2`, and claiming it equals `273` is genuinely
  FALSE (2 ≠ 273).

  DISTINCT from the banked battery (… C271 = 8=271, C272 = 0=272): the pair (273, 2) is fresh
  (RHS 273 distinct from every prior right-hand value; the LHS anchor is the NEW N242
  charge-eigenvalue minimal-polynomial degree, the `±i` imaginary-spectrum witness).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherForcedChargeEigenvalues

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Polynomial

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 273 (natDegree (minpoly ℚ chargeOpV)) = 2`, holding precisely because the minimal
    polynomial of the forced charge operator on the two triplets is `X² + 1` (banked
    `chargeOpV_minpoly`), an irreducible quadratic whose roots are the opposite pair `±i`. -/
theorem charge_minpoly_degree_true :
    min 273 (natDegree (minpoly ℚ chargeOpV)) = 2 := by
  rw [chargeOpV_minpoly, charge_poly_natDegree]; decide

/-- BOGUS: claims `min 273 (natDegree (minpoly ℚ chargeOpV)) = 273`. It GENUINELY equals `2`
    (`charge_minpoly_degree_true`). The WRONG claim (the charge operator has a real eigenvalue /
    the two triplets do NOT carry opposite imaginary `±i` eigenvalues) reduces — through the
    banked value — to the false numeric `2 = 273`, so this must NOT compile. -/
theorem charge_minpoly_degree_wrong_BOGUS :
    min 273 (natDegree (minpoly ℚ chargeOpV)) = 273 := by
  rw [charge_minpoly_degree_true]
  -- ⊢ (2 : ℕ) = 273  (FALSE — the costume bites)

end Counterexamples
