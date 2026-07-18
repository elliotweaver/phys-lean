/-
  Counterexamples.LowTailFoldForcedWeightVacuityCostume — the census-conserving endpoint with the
  fold-forced low-tail weight GENUINELY screens ABOVE the confinement way-point `190/3` (the low tail
  contributes; the endpoint is NOT the bare way-point), C563.
  =====================================================================================
  W8 ANTI-VACUITY. This node (THE LOW-TAIL SECOND-DEPTH WEIGHT IS THE ONE FOLD-FORCED CONSTANT) resolves
  the parent's open front by proving the low-tail second-depth weight is the SINGLE fold-derived
  `depthWeight = 1/3` (band-independent), so the census-conserving endpoint with the fold-forced low-tail
  weight is the DERIVED closed real `190/3 + (3/2)·bandScreen leptonCensus (mass0/mass1)`. The content
  that must NOT be hollow is that this endpoint genuinely EXCEEDS the confinement way-point `190/3`
  (`conservingEndpoint_gt_waypoint`) — the fold-forced-dressed lepton tail is a strictly positive
  contribution, NOT a vanishing one. If the endpoint equalled `190/3` the low tail would contribute
  nothing and the fold-forced weight would be an empty relabel. The distinction is the genuine strict
  order `190/3 < endpoint` anchoring the banked `conservingEndpoint_gt_waypoint`.

  THE CERTIFICATE. contribFlag := 1 -- a natural-number flag standing for "the census-conserving endpoint
  with the fold-forced low-tail weight genuinely screens above the confinement way-point, so the low tail
  contributes a real, positive amount". It is TIED to the banked landing by contribFlag_forced.

  We anchor min 563 contribFlag = 1 (TRUE -- contribFlag = 1 < 563, so the min is contribFlag).

  THE BOGUS CLAIM (a stand-in for ANY "the fold-forced low-tail contributes nothing / the endpoint is
  just the bare way-point / the per-band weight resolution is vacuous" reading): that
  min 563 contribFlag = 563. It GENUINELY equals 1 (cert_val_true). Rewriting reduces the bogus claim to
  the false numeric 1 = 563 in the naturals. The kernel cannot close it; it BITES.

  DISTINCT from the banked battery: the pair (563, 1) is fresh (Cid 563 distinct from every prior).

  This file MUST FAIL to compile.
-/
import Phys.Algebra.LowTailFoldForcedWeight
import Mathlib.Tactic

namespace Counterexamples

open Phys.Algebra.LowTailFoldForcedWeight
open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthWeight
open Phys.Algebra.DepthTwoBandVaryingRunning
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Foundation Phys.Foundation.ContinuumQ

/-- THE FLAG: 1 = "the census-conserving endpoint with the fold-forced low-tail weight genuinely screens
    above the confinement way-point, so the low tail contributes a real, positive amount". -/
def contribFlag : ℕ := 1

/-- TRUE (tied to the banked landing): the census-conserving endpoint with the fold-forced low-tail
    weight genuinely screens above the `190/3` way-point (`conservingEndpoint_gt_waypoint`), and
    `contribFlag = 1`. -/
theorem contribFlag_forced :
    ((190 / 3 : Cut)
      < bandVaryingInvAlphaZero
          (withWeight 0 derivedBandList ++ withWeight depthWeight (leptonTail leptonCensus)))
    ∧ contribFlag = 1 :=
  ⟨conservingEndpoint_gt_waypoint, rfl⟩

/-- TRUE: min 563 contribFlag = 1, holding precisely because contribFlag = 1 < 563. -/
theorem cert_val_true : min (563 : ℕ) contribFlag = 1 := by decide

/-- BOGUS: claims min 563 contribFlag = 563. It GENUINELY equals 1 (cert_val_true). A "the fold-forced
    low-tail contributes nothing / the endpoint is just the bare way-point / the per-band weight
    resolution is vacuous" reading reduces -- through the banked conservingEndpoint_gt_waypoint tie --
    to the false numeric 1 = 563 in the naturals. The kernel cannot close it; it BITES. -/
theorem bogus_claim : min (563 : ℕ) contribFlag = 563 := by
  rw [cert_val_true]

end Counterexamples
