/-
  Counterexamples.TowerGatherForcedColourChargeCommuteWrongValueCostume — N245 anti-vacuity (C276).
  ===========================================================================
  W8 ANTI-VACUITY. The N245 node banks THE FORCED COMMUTING COLOUR–CHARGE STRUCTURE on the
  fundamental 7: colour `su(3)` commutes with the forced charge operator `chargeOp = crossOp u1`
  (and only colour does), preserving its eigenspace decomposition. The load-bearing quantitative
  fact is that the CHARGED COMPLEMENT — the range of the charge operator — is EXACTLY
  `6`-dimensional (`finrank_range_chargeOp : finrank ℚ (LinearMap.range chargeOp) = 6`), the
  `3 ⊕ 3̄`. This is FORCED by rank–nullity on the `1`-dimensional charge-`0` kernel (N244) inside
  the `7`-dimensional fundamental: `range + 1 = 7`, so `range = 6`. It is NOT `7` (which would say
  the charge operator is injective — the singlet is NOT killed, contradicting N240/N244) and NOT
  `0` (which would say the charge operator is zero, contradicting `chargeOp_ne_zero`).

  The anchor is that genuine dimension, packaged as the clean equality
  `min 276 (finrank ℚ (LinearMap.range chargeOp)) = 6` (which holds precisely BECAUSE
  `finrank ℚ (LinearMap.range chargeOp) = 6`).

  THE BOGUS CLAIM (a stand-in for ANY wrong reading: the charged complement is not the 6 / the
  charge operator is injective / the charged part is trivial / colour does not preserve a
  6-dimensional complement): that `min 276 (finrank ℚ (LinearMap.range chargeOp))` equals `276`.
  It GENUINELY equals `6` (`charge_complement_dim_true`). Rewriting the banked value reduces the
  bogus claim to the false numeric `6 = 276` in ℕ. The kernel cannot close it; the costume BITES
  (exit 1).

  The bite is name-independent: delete every comment and for `O ℚ = CD (H ℚ)`, the range of
  `crossOp u1` on `ImO` has `finrank` `6`, so `min 276 (finrank ℚ (LinearMap.range chargeOp)) = 6`,
  and claiming it equals `276` is genuinely FALSE (6 ≠ 276).

  DISTINCT from the banked battery (… C272 = 0=272, C273 = 2=273, C274 = 3=274, C275 = 1=275): the
  pair (276, 6) is fresh (RHS 276 distinct from every prior right-hand value; the LHS anchor is the
  NEW N245 charged-complement dimension — the 6-dimensional range that EXHAUSTS the charged part,
  the rank-nullity counterpart of the N244 1-dimensional kernel).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.TowerGatherForcedColourChargeCommute

namespace Counterexamples

open Phys.Algebra
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

/-- TRUE: `min 276 (finrank ℚ (LinearMap.range chargeOp)) = 6`, holding precisely because the range
    of the forced charge operator on the fundamental 7 is the `6`-dimensional charged complement
    `3 ⊕ 3̄` (banked `finrank_range_chargeOp`), the rank-nullity counterpart of the `1`-dimensional
    charge-`0` kernel. -/
theorem charge_complement_dim_true :
    min 276 (Module.finrank ℚ (LinearMap.range chargeOp)) = 6 := by
  rw [finrank_range_chargeOp]; decide

/-- BOGUS: claims `min 276 (finrank ℚ (LinearMap.range chargeOp)) = 276`. It GENUINELY equals `6`
    (`charge_complement_dim_true`). The WRONG claim (the charged complement is not the 6 / the
    charge operator is injective / the charged part is trivial) reduces — through the banked value
    — to the false numeric `6 = 276`, so this must NOT compile. -/
theorem charge_complement_dim_wrong_BOGUS :
    min 276 (Module.finrank ℚ (LinearMap.range chargeOp)) = 276 := by
  rw [charge_complement_dim_true]
  -- ⊢ (6 : ℕ) = 276  (FALSE — the costume bites)

end Counterexamples
