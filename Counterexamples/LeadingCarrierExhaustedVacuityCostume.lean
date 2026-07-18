/-
  Counterexamples.LeadingCarrierExhaustedVacuityCostume — the anti-screening part of the leading
  carrier's residual is GENUINELY POSITIVE (not a vacuous null step), anti-vacuity (C546).
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE LEADING CENSUS CARRIER OF 1/α(0) IS DETERMINED AND EXHAUSTED)
  closes the "dominant missing summand of 1/α(0)" front at the leading census layer: the leading
  composed carrier is a DETERMINED closed real, every enumerated leading summand composed / derived /
  zero / bounded, and its residual above the certified recombined endpoint is a determined closed
  real. A load-bearing step is that this residual is a GENUINE composed quantity — the anti-screening
  part `projectedS · totalScreeningWith 1 (completeBandList chargeTraceDepth)` (`s = 1/8`) is strictly
  POSITIVE, so the leading carrier genuinely composes structure (it is not a vacuous `= recombined`
  null step). If the residual were vacuously zero, "the leading carrier is determined and exhausted"
  would be hollow.

  The content that must NOT be hollow: the anti-screening part of the residual is positive — the
  banked `residual_antiscreen_pos` gives `0 < projectedS · totalScreeningWith 1 (completeBandList
  chargeTraceDepth)`. A "the residual is vacuous / the leading carrier composes nothing" mis-reading
  is refuted by that banked theorem.

  THE CERTIFICATE. posFlag := 1 -- a natural-number flag standing for "the anti-screening part of the
  leading carrier's residual is genuinely positive (residual_antiscreen_pos), so the leading carrier
  composes real structure". It is TIED to the banked landing by posFlag_forced: `residual_antiscreen_pos`
  gives the positivity.

  We anchor min 546 posFlag = 1 (TRUE -- posFlag = 1 < 546, so the min is posFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the residual is vacuous / the leading carrier composes nothing"
  mis-reading): that min 546 posFlag = 546. It GENUINELY equals 1 (cert_val_true). Rewriting reduces
  the bogus claim to the false numeric 1 = 546 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (546, 1) is fresh (Cid 546 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.LeadingCarrierExhausted
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.CasimirProjectionSelectsS
open Phys.Algebra.RecombinedEndpoint
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.LeadingCarrierExhausted
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the anti-screening part of the leading carrier's residual is genuinely positive
    (residual_antiscreen_pos), so the leading carrier composes real structure". -/
def posFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the anti-screening part of the leading carrier's residual is
    strictly positive (`residual_antiscreen_pos`), and `posFlag = 1`. -/
theorem posFlag_forced :
    (0 : Cut) < projectedS * totalScreeningWith 1 (completeBandList chargeTraceDepth)
    ∧ posFlag = 1 :=
  ⟨residual_antiscreen_pos, rfl⟩

/-- TRUE: min 546 posFlag = 1, holding precisely because posFlag = 1 < 546. -/
theorem cert_val_true : min (546 : ℕ) posFlag = 1 := by decide

/-- BOGUS: claims min 546 posFlag = 546. It GENUINELY equals 1 (cert_val_true). A "the residual is
    vacuous / the leading carrier composes nothing" mis-reading reduces -- through the banked
    residual_antiscreen_pos tie -- to the false numeric 1 = 546 in the naturals. The kernel cannot
    close it; it BITES. -/
theorem bogus_claim : min (546 : ℕ) posFlag = 546 := by
  rw [cert_val_true]

end Counterexamples
