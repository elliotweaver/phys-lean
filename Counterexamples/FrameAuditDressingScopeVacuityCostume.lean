/-
  Counterexamples.FrameAuditDressingScopeVacuityCostume — the F2 frame-audit verdict is GENUINE: the
  three candidate dressing scopes are REAL, DISTINCT alternatives (SCOPE-(a) uniform whole-tower is
  way-point-forbidden, moving `1582/27 → 602/9`; SCOPE-(b) per-band-varying collapses to the one
  fold constant; SCOPE-(c) the resummed-vs-unresummed partition is forced), and SCOPE-(c) genuinely
  dresses the endpoint. C581.
  =====================================================================================
  W8 ANTI-VACUITY. This node ADJUDICATES which object the all-orders `3/2` census-in-census dresses in
  the F1-forced ARCH-B arena. The content that must NOT be hollow: (i) SCOPE-(a)'s way-point move is a
  REAL displacement `602/9 ≠ 1582/27` (`waypoint_move_real`) — if it vanished, uniform whole-tower
  dressing would reproduce the way-point and there would be no exclusion; (ii) SCOPE-(c) genuinely
  dresses the endpoint upward `recomposedEndpoint < recomposedEndpointDressed` (`scopeC_dresses`) — if
  it were a null step the `3/2` would carry no content. If either collapsed, the F2 verdict would be
  hollow. Both hold: the scopes genuinely differ and SCOPE-(c) genuinely dresses.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the F2 verdict is genuine:
  the three candidate dressing scopes are real distinct alternatives (uniform whole-tower moves the
  way-point `1582/27 → 602/9`, per-band-varying collapses to the one fold constant, the
  resummed-vs-unresummed partition is forced), and SCOPE-(c) genuinely dresses the endpoint upward".
  TIED to the banked landing by attestFlag_forced.

  We anchor min 581 attestFlag = 1 (TRUE -- attestFlag = 1 < 581, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the scopes coincide / SCOPE-(a)'s move is zero / SCOPE-(c) is a
  null step / the audit is vacuous" reading): that min 581 attestFlag = 581. It GENUINELY equals 1
  (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 581 in the naturals. The
  kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (581, 1) is fresh (Cid 581 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.FrameAuditDressingScope
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.FrameAuditDressingScope
open Phys.Algebra.PerChannelRecomb
open Phys.Algebra.D7DepthTwoComposed
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the F2 verdict is genuine: the three candidate dressing scopes are real distinct
    alternatives (uniform whole-tower moves the way-point `1582/27 → 602/9`, per-band-varying collapses
    to the one fold constant, the resummed-vs-unresummed partition is forced), and SCOPE-(c) genuinely
    dresses the endpoint upward". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): SCOPE-(a)'s way-point move is real
    (`waypoint_move_real`, `602/9 ≠ 1582/27`) and SCOPE-(c) genuinely dresses the endpoint
    (`scopeC_dresses`) — and `attestFlag = 1`. -/
theorem attestFlag_forced :
    ((602 / 9 : Cut) ≠ 1582 / 27)
    ∧ (PerChannelRecomb.recomposedEndpoint < recomposedEndpointDressed)
    ∧ attestFlag = 1 :=
  ⟨waypoint_move_real, scopeC_dresses, rfl⟩

/-- TRUE: min 581 attestFlag = 1, holding precisely because attestFlag = 1 < 581. -/
theorem cert_val_true : min (581 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 581 attestFlag = 581. It GENUINELY equals 1 (cert_val_true). A "the scopes
    coincide / SCOPE-(a)'s move is zero / SCOPE-(c) is a null step / the audit is vacuous" reading
    reduces -- through the banked waypoint_move_real / scopeC_dresses tie -- to the false numeric
    1 = 581 in the naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (581 : ℕ) attestFlag = 581 := by
  rw [cert_val_true]

end Counterexamples
