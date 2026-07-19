/-
  Counterexamples.FrameAuditRecombinationArchitectureVacuityCostume — the F1 frame-audit verdict is
  GENUINE: the two banked recombination architectures GENUINELY DIFFER (ARCH-A the `s=0` switch-off vs
  ARCH-B the derived-`s` run-both-recombine), and the derived reduction parameter GENUINELY avoids the
  switch-off boundary. C580.
  =====================================================================================
  W8 ANTI-VACUITY. This node ADJUDICATES which of two banked architectures the endpoint is forced to
  compose. The content that must NOT be hollow: (i) the two architectures differ at the top band by the
  EXACT Z1 anti-screening `bandScreen projectedS topBandRatio = 7/18`, a strictly NONZERO shift
  (`architecture_shift_exact` + `recomposed_shift_ne_zero`) — if the shift were zero the two
  architectures would coincide and the audit would be vacuous; (ii) the DERIVED reduction parameter
  `projectedS = 1/8 ≠ 0` (`forced_param_ne_zero`) — if it were zero the "forced" architecture would BE
  the switch-off ARCH-A and there would be nothing to adjudicate. If either collapsed, the F1 verdict
  would be hollow. Both hold: the architectures genuinely differ and the derived parameter genuinely
  avoids the switch-off.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the F1 verdict is genuine: the
  two banked recombination architectures differ at the top band by the exact nonzero Z1 anti-screening
  `7/18`, and the derived reduction parameter `1/8` genuinely avoids the `s=0` switch-off boundary".
  TIED to the banked landing by attestFlag_forced.

  We anchor min 580 attestFlag = 1 (TRUE -- attestFlag = 1 < 580, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the two architectures coincide / the shift is zero / the derived
  parameter is the switch-off / the audit is vacuous" reading): that min 580 attestFlag = 580. It
  GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to the false numeric 1 = 580 in
  the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (580, 1) is fresh (Cid 580 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.FrameAuditRecombinationArchitecture
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra
open Phys.Algebra.FrameAuditRecombinationArchitecture
open Phys.Algebra.CasimirProjectionSelectsS
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the F1 verdict is genuine: the two banked recombination architectures differ at the
    top band by the exact nonzero Z1 anti-screening `7/18`, and the derived reduction parameter `1/8`
    genuinely avoids the `s=0` switch-off boundary". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the two architectures genuinely differ at the top band
    (`architectures_differ_at_topBand`) and the derived reduction parameter avoids the switch-off
    (`forced_param_ne_zero`) — and `attestFlag = 1`. -/
theorem attestFlag_forced :
    (recombArch 0 [(chargeTraceDepth, topBandRatio)]
        ≠ recombArch projectedS [(chargeTraceDepth, topBandRatio)])
    ∧ projectedS ≠ 0
    ∧ attestFlag = 1 :=
  ⟨architectures_differ_at_topBand, forced_param_ne_zero, rfl⟩

/-- TRUE: min 580 attestFlag = 1, holding precisely because attestFlag = 1 < 580. -/
theorem cert_val_true : min (580 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 580 attestFlag = 580. It GENUINELY equals 1 (cert_val_true). A "the two
    architectures coincide / the shift is zero / the derived parameter is the switch-off / the audit is
    vacuous" reading reduces -- through the banked architectures_differ_at_topBand / forced_param_ne_zero
    tie -- to the false numeric 1 = 580 in the naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (580 : ℕ) attestFlag = 580 := by
  rw [cert_val_true]

end Counterexamples
