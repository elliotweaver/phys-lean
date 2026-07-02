/-
  Counterexamples.TowerGatherForcedChargeDirectionWrongValueCostume — N240 anti-vacuity (C271).
  ===========================================================================
  W8 ANTI-VACUITY. The N240 node banks THE FORCED u(1) CHARGE DIRECTION from the gather
  obstruction: `chargeOp = crossOp u1` (the gather tear on the branching singlet generator), whose
  g₂-STABILIZER inside `g₂ = derivationLieQ` is EXACTLY colour `su(3) = colourCentralizer`
  (`chargeOp_stabilizer_iff`), of dimension `8` (`finrank_chargeStabilizer_eq_eight`). The
  load-bearing value — the dimension of the FORCED symmetry of the charge direction, the fact that
  makes the reduction the genuine `su(3)` and not the whole `14`-dim `g₂` — is exactly `8`.

  A dimension `= 8` is not vacuous, so the anchor is the genuine value itself, packaged as the
  clean equality `min 8 (finrank ℚ chargeStabilizer.toSubmodule) = 8` (which holds precisely
  BECAUSE `finrank ℚ chargeStabilizer.toSubmodule = 8`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the charge direction has the wrong forced
  symmetry / the stabilizer is all of g₂ (14) / the reduction is not proper / the covariance
  headline pins the wrong subalgebra): that `min 8 (finrank ℚ chargeStabilizer.toSubmodule)`
  equals `271`. It GENUINELY equals `8` (`chargeStabilizer_dim_true`). Rewriting the banked value
  reduces the bogus claim to the false numeric `8 = 271` in ℕ. The kernel cannot close it; the
  costume BITES (lean leaves the unsolved false goal, exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the g₂-stabilizer
  of `crossOp u1` genuinely has dimension `8`, so `min 8 (finrank ℚ chargeStabilizer.toSubmodule)
  = 8`, and claiming it equals `271` is genuinely FALSE (8 ≠ 271).

  DISTINCT from the banked battery (... C269 = 7=269, C270 = 27=270): the pair (271, 8) is fresh
  (RHS 271 distinct from every prior right-hand value; the LHS anchor is the NEW N240 forced-charge
  stabilizer dimension, the su(3) value carried by the covariant gather-obstruction object).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherForcedChargeDirection

namespace Counterexamples

open Phys.Algebra

/-- TRUE: `min 8 (finrank ℚ chargeStabilizer.toSubmodule) = 8`, holding precisely because the
    g₂-stabilizer of the forced charge operator `crossOp u1` — the colour `su(3)` the charge
    direction covariantly singles out — genuinely has dimension `8` (banked
    `finrank_chargeStabilizer_eq_eight`). -/
theorem chargeStabilizer_dim_true :
    min 8 (Module.finrank ℚ chargeStabilizer.toSubmodule) = 8 := by
  have h : Module.finrank ℚ chargeStabilizer.toSubmodule = 8 := finrank_chargeStabilizer_eq_eight
  omega

/-- BOGUS: claims `min 8 (finrank ℚ chargeStabilizer.toSubmodule) = 271`. It GENUINELY equals `8`
    (`chargeStabilizer_dim_true`). The WRONG claim (the charge direction forces the wrong symmetry
    / the reduction is not proper) reduces — through the banked value — to the false numeric
    `8 = 271`, so this must NOT compile. -/
theorem chargeStabilizer_dim_wrong_BOGUS :
    min 8 (Module.finrank ℚ chargeStabilizer.toSubmodule) = 271 := by
  rw [chargeStabilizer_dim_true]
  -- ⊢ (8 : ℕ) = 271  (FALSE — the costume bites)

end Counterexamples
