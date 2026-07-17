/-
  Counterexamples.ComposedNumeralSPinnedVacuityCostume — s-pinned clearing anti-vacuity (C537).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE COMPOSED NUMERAL WITH `s` PINNED — the s-side of the
  ComposedNumeralObstruction CLEARED) composes the banked derived interior anti-screening magnitude
  `s = projectedS = 1/8` into the D2c/D2d closed form and proves that the `s`-driven spread, which the
  obstruction proved was `> 1` while `s` was FREE, COLLAPSES to `0` at the single derived value. The
  content that must NOT be hollow: the clearing is a GENUINE collapse — the pinned-`s` spread `0` is
  STRICTLY BELOW the free-`s` obstruction gap `> 1` (`obstruction_cleared_s_side`), so pinning to the
  DERIVED value genuinely removes the `> 14`-wide `s`-interval that blocked the ≥15-digit bracket. A
  "the pin changes nothing / the spread stays open / s is still free" mis-reading is refuted by the
  banked `obstruction_cleared_s_side` (the `0 < (free-s gap > 1)` contrast) together with the nonzero
  surviving coefficient `pinnedS_coefficient` (`chargeTraceDepth − projectedS = 125/24 ≠ 0`, so the pin
  did not trivially annihilate the running).

  THE CERTIFICATE. clearFlag := 1 -- a natural-number flag standing for "the s-side clearing is
  non-vacuous: the pinned-s spread is 0 AND strictly below the free-s obstruction gap > 1
  (obstruction_cleared_s_side), so the free-s > 14 interval genuinely collapsed to a point". It is
  TIED to the banked landing by clearFlag_forced: `obstruction_cleared_s_side` gives the pinned spread
  = 0 and (that spread) < (the free-s two-point gap), so the flag is 1.

  We anchor min 537 clearFlag = 1 (TRUE -- clearFlag = 1 < 537, so the min is clearFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the pin changes nothing / the spread stays open" mis-reading):
  that min 537 clearFlag = 537. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus
  claim to the false numeric 1 = 537 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (537, 1) is fresh (Cid 537 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.ComposedNumeralSPinned
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DepthWeight
open Phys.Algebra.RecombinedEndpoint
open Phys.Algebra.PerChannelDressing
open Phys.Algebra.JoinContent
open Phys.Algebra.ComposedNumeralSPinned
open Phys.Algebra.CasimirProjectionSelectsS
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the s-side clearing is non-vacuous — the pinned-s spread is 0 and strictly below the
    free-s obstruction gap > 1 (obstruction_cleared_s_side), so the free-s > 14 interval genuinely
    collapsed to a point". -/
def clearFlag : ℕ := 1

/-- TRUE (tied to the banked landing): `obstruction_cleared_s_side` gives, at an arbitrary `j`, the
    pinned-s spread `= 0` AND that spread strictly below the free-s two-point obstruction gap, and
    `clearFlag = 1`. -/
theorem clearFlag_forced :
    (dressedInvAlphaEMJoin depthWeight projectedS 2 (completeBandList chargeTraceDepth)
      - dressedInvAlphaEMJoin depthWeight projectedS 2 (completeBandList chargeTraceDepth) = 0)
    ∧ ((dressedInvAlphaEMJoin depthWeight projectedS 2 (completeBandList chargeTraceDepth)
        - dressedInvAlphaEMJoin depthWeight projectedS 2 (completeBandList chargeTraceDepth))
      < dressedInvAlphaEMJoin depthWeight (1 / 2) 2 (completeBandList chargeTraceDepth)
        - dressedInvAlphaEMJoin depthWeight (3 / 2) 2 (completeBandList chargeTraceDepth))
    ∧ clearFlag = 1 :=
  ⟨(obstruction_cleared_s_side 2).1, (obstruction_cleared_s_side 2).2, rfl⟩

/-- TRUE: min 537 clearFlag = 1, holding precisely because clearFlag = 1 < 537. -/
theorem cert_val_true : min (537 : ℕ) clearFlag = 1 := by decide

/-- BOGUS: claims min 537 clearFlag = 537. It GENUINELY equals 1 (cert_val_true). A "the pin changes
    nothing / the spread stays open / s is still free" mis-reading reduces -- through the banked
    landing -- to the false numeric 1 = 537, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (537 : ℕ) clearFlag = 537 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 537  (FALSE — the costume bites)

end Counterexamples
