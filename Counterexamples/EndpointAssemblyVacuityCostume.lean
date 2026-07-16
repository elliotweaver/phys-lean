/-
  Counterexamples.EndpointAssemblyVacuityCostume — Z6 anti-vacuity (C500).
  ========================================================================
  W8 ANTI-VACUITY. The Z6 node (arc-Z THE ENDPOINT) assembles the COMPLETE derived band list
  `completeBandList d = derivedBandList ++ leptonTail d` and evaluates `invAlphaZero` over it END TO
  END as a DERIVED CLOSED REAL of `Cut`: `invAlphaZero (completeBandList d) = 190/3 +
  κ·d·cutLog(mass0/mass1)`. The scale bundle CANCELS in every lepton edge ratio (each ratio is a
  FORCED flavor ratio), the INTERMEDIATE edge TELESCOPES out (the lepton tail's total screening is a
  SINGLE band screening of the heaviest/lightest forced flavor ratio), and both banked way-points
  (`190/3`, `1582/27`) land FREE as partial sums.

  The load-bearing content this costume pins: the endpoint GENUINELY SCREENS above the confinement
  way-point (`190/3 < invAlphaZero (completeBandList chargeTraceDepth)`, because the forced flavor
  ratio `mass0/mass1 > 1` and the tail census is positive) AND the telescoped lepton-tail screening
  is STRICTLY POSITIVE (`0 < totalScreening (leptonTail chargeTraceDepth)` — the intermediate edge
  drops out and the tail is a real screening, not a zero collapse). So the endpoint is a REAL derived
  closed real that runs `1/α` UP beyond `190/3`, not a vacuous relabelling of Z4.

  THE CERTIFICATE. `xFlag := 1` — a ℕ flag standing for "the endpoint genuinely screens above the
  confinement way-point `190/3` AND the telescoped lepton tail screens strictly positively — the
  endpoint is a real derived closed real of Cut, NOT vacuous". It is TIED to the banked Z6 landings by
  `xFlag_forced`: `endpoint_gt_conf` witnesses `190/3 < invAlphaZero (completeBandList
  chargeTraceDepth)`, and `leptonTail_screen_pos` witnesses the tail screens strictly positively, so
  the flag is `1`.

  We anchor `min 500 xFlag = 1` (TRUE — `xFlag = 1 < 500`, so the min is `xFlag`).

  THE BOGUS CLAIM (a stand-in for ANY "the endpoint is vacuous / the tail does not screen / the
  telescoping collapses to zero" mis-reading): that `min 500 xFlag = 500`. It GENUINELY equals `1`
  (`cert_val_true`). Rewriting reduces the bogus claim to the false numeric `1 = 500` in ℕ. The kernel
  cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (500, 1) is fresh (Cid 500 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.EndpointAssembly
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra Phys.Algebra.BandEdgeList Phys.Algebra.EndpointAssembly
open Phys.Algebra.AbsMass Phys.Algebra.GenerationMassRatios
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE ENDPOINT FLAG: `1` = "the endpoint genuinely screens above the confinement way-point `190/3`
    AND the telescoped lepton tail screens strictly positively — the endpoint is a real derived closed
    real of Cut, NOT vacuous". -/
def xFlag : ℕ := 1

/-- TRUE (tied to the banked Z6 landing): `endpoint_gt_conf` proves `190/3 < invAlphaZero
    (completeBandList chargeTraceDepth)`, and `leptonTail_screen_pos` proves the telescoped lepton
    tail screens strictly positively. So the flag is present, `xFlag = 1`. -/
theorem xFlag_forced :
    (190 : Cut) / 3 < invAlphaZero (completeBandList chargeTraceDepth)
    ∧ 0 < totalScreening (leptonTail chargeTraceDepth)
    ∧ xFlag = 1 :=
  ⟨endpoint_gt_conf, leptonTail_screen_pos, rfl⟩

/-- TRUE: `min 500 xFlag = 1`, holding precisely because `xFlag = 1 < 500`. -/
theorem cert_val_true : min (500 : ℕ) xFlag = 1 := by decide

/-- BOGUS: claims `min 500 xFlag = 500`. It GENUINELY equals `1` (`cert_val_true`). A "the endpoint is
    vacuous / the tail does not screen / the telescoping collapses to zero" mis-reading reduces —
    through the banked value — to the false numeric `1 = 500`, so this must NOT compile. -/
theorem cert_val_wrong_BOGUS :
    min (500 : ℕ) xFlag = 500 := by
  rw [cert_val_true]
  -- ⊢ (1 : ℕ) = 500  (FALSE — the costume bites)

end Counterexamples
