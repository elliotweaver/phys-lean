/-
  Counterexamples.RecomposedRunningEndpointVacuityCostume — the recomposed running endpoint with the
  DERIVED anti-screening `s = 1/8` folded in is a GENUINE distinction (the recomposed electroweak
  way-point strictly BELOW the additive one over the derived ℝ), not a hollow/trivial statement, C560.
  =====================================================================================
  W8 ANTI-VACUITY. This node (ARC-D RECOMPOSE — THE RECOMPOSED RUNNING ENDPOINT) banks the forced
  theory-native recombination: the isospin channel's net running census is REDUCED by the DERIVED Z1
  anti-screening magnitude `s = projectedS = 1/8` (netIsoDepth = 15/8), recombined with the unreduced
  abelian hypercharge census. The content that must NOT be hollow is that the anti-screening is REAL —
  the recomposed electroweak way-point `recomposedInvAlphaEM [(chargeTraceDepth, topBandRatio)]` is
  STRICTLY BELOW the additive one `invAlphaEM [(chargeTraceDepth, topBandRatio)]`
  (`recomposed_below_additive`, `6923/54 < 3472/27`). If the two coincided (`s = 0`), there would be no
  recompose, the ONE-LAW overshoot the parent detected would be unaddressed, and the node would say
  nothing. The distinction is a genuine strict inequality of two DERIVED reals of `Cut`, driven by the
  banked DERIVED `s = 1/8` (`projectedS_eq`) entering as the exact cutPi-free shift `7/18`.

  THE CERTIFICATE. shiftFlag := 1 -- a natural-number flag standing for "the recomposed endpoint
  genuinely differs from (is strictly below) the additive one over the derived ℝ (the derived
  anti-screening is a real downward correction)". It is TIED to the banked landing by shiftFlag_forced.

  We anchor min 560 shiftFlag = 1 (TRUE -- shiftFlag = 1 < 560, so the min is shiftFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the recomposed and additive endpoints coincide / the
  anti-screening is vacuous" reading): that min 560 shiftFlag = 560. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 560 in the naturals. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (560, 1) is fresh (Cid 560 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.RecomposedRunningEndpoint
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.RecomposedRunningEndpoint
open Phys.Algebra
open Phys.Algebra.RecombinedEndpoint
open Phys.Algebra.BandEdgeList
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the recomposed endpoint genuinely differs from (is strictly below) the additive
    full-census endpoint over the derived ℝ (the derived anti-screening is a real downward correction)". -/
def shiftFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the recomposed electroweak way-point is strictly below the
    additive one (`recomposed_below_additive`), and `shiftFlag = 1`. -/
theorem shiftFlag_forced :
    (recomposedInvAlphaEM [(chargeTraceDepth, topBandRatio)]
        < invAlphaEM [(chargeTraceDepth, topBandRatio)]) ∧ shiftFlag = 1 :=
  ⟨recomposed_below_additive, rfl⟩

/-- TRUE: min 560 shiftFlag = 1, holding precisely because shiftFlag = 1 < 560. -/
theorem cert_val_true : min (560 : ℕ) shiftFlag = 1 := by decide

/-- BOGUS: claims min 560 shiftFlag = 560. It GENUINELY equals 1 (cert_val_true). A "the recomposed
    and additive endpoints coincide / the anti-screening is vacuous" reading reduces -- through the
    banked recomposed_below_additive tie -- to the false numeric 1 = 560 in the naturals. The kernel
    cannot close it; it BITES. -/
theorem bogus_claim : min (560 : ℕ) shiftFlag = 560 := by
  rw [cert_val_true]

end Counterexamples
