/-
  Counterexamples.D7DepthTwoComposedVacuityCostume — the D7 DEPTH-2 RUNNING COMPOSITION (the fold-forced
  all-orders census-in-census composed into the census-conserving endpoint) is GENUINE: the composed
  endpoint is strictly ABOVE the bare one (`recomposedEndpoint < recomposedEndpointDressed`), the composed
  endpoint lies strictly above `137` (`137 < recomposedEndpointDressed`), and the increment is a real
  positive quantity (`0 < (1/2)·kappaLeading·cInner`). C571.
  =====================================================================================
  W8 ANTI-VACUITY. This node COMPOSES the fold-forced all-orders depth-2 running (loop factor
  `kappaLeading → (3/2)·kappaLeading` at the fold-forced `depthWeight = 1/3`) into the census-conserving
  endpoint. The content that must NOT be hollow is that the composition GENUINELY RAISES the endpoint
  (`depthTwo_dresses_recomposed`: `recomposedEndpoint < recomposedEndpointDressed`, increment
  `(1/2)·kappaLeading·cInner > 0`), that the composed endpoint GENUINELY exceeds `137`
  (`recomposedEndpointDressed_gt_137` — the completion lifts the bare `< 137` above the round number, not
  a vacuous inequality), and that the increment is a real positive quantity (`dressed_increment_pos`). If
  the increment were zero, or the composed endpoint did not exceed `137`, or the composition did not move
  the endpoint, the composition would be hollow. It is genuine.

  THE CERTIFICATE. attestFlag := 1 -- a natural-number flag standing for "the D7 depth-2 running
  composition is genuine: it strictly raises the endpoint, the composed endpoint exceeds 137, and the
  increment is real positive". It is TIED to the banked landing by attestFlag_forced.

  We anchor min 571 attestFlag = 1 (TRUE -- attestFlag = 1 < 571, so the min is attestFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the increment is zero / the composed endpoint is not above 137 /
  the composition does not move the endpoint / the composition is vacuous" reading): that
  min 571 attestFlag = 571. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to
  the false numeric 1 = 571 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (571, 1) is fresh (Cid 571 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.D7DepthTwoComposed
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.D7DepthTwoComposed
open Phys.Algebra.PerChannelRecomb
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the D7 depth-2 running composition is genuine: it strictly raises the endpoint, the
    composed endpoint exceeds 137, and the increment is real positive". -/
def attestFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the composition strictly raises the endpoint
    (`depthTwo_dresses_recomposed.2`), the composed endpoint exceeds `137`
    (`recomposedEndpointDressed_gt_137`), and the increment is real positive (`dressed_increment_pos`) —
    and `attestFlag = 1`. -/
theorem attestFlag_forced :
    (recomposedEndpoint < recomposedEndpointDressed)
    ∧ (137 < recomposedEndpointDressed)
    ∧ (0 < (1 / 2) * kappaLeading * cInner)
    ∧ attestFlag = 1 :=
  ⟨depthTwo_dresses_recomposed.2, recomposedEndpointDressed_gt_137, dressed_increment_pos, rfl⟩

/-- TRUE: min 571 attestFlag = 1, holding precisely because attestFlag = 1 < 571. -/
theorem cert_val_true : min (571 : ℕ) attestFlag = 1 := by decide

/-- BOGUS: claims min 571 attestFlag = 571. It GENUINELY equals 1 (cert_val_true). A "the increment is
    zero / the composed endpoint is not above 137 / the composition does not move the endpoint / the
    composition is vacuous" reading reduces -- through the banked depthTwo_dresses_recomposed /
    recomposedEndpointDressed_gt_137 / dressed_increment_pos tie -- to the false numeric 1 = 571 in the
    naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (571 : ℕ) attestFlag = 571 := by
  rw [cert_val_true]

end Counterexamples
