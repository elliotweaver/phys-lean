import Phys.Algebra.D7DepthTwoComposed
import Phys.Algebra.DressingSeamResolved
import Phys.Algebra.LowTailFoldForcedWeight
import Phys.Algebra.BaseNormalFormAudit
import Phys.Algebra.PerChannelDressing
import Mathlib.Tactic

namespace FrameAuditF2Probe

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthWeight
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.DepthTwoBandVaryingRunning
open Phys.Algebra.DressingSeamResolved
open Phys.Algebra.LowTailFoldForcedWeight
open Phys.Algebra.BaseNormalFormAudit
open Phys.Algebra.PerChannelDressing
open Phys.Algebra.D7DepthTwoComposed
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- SCOPE-(a) moves the EM way-point (way-point-forbidden)
theorem probe_a_topBand :
    (42 : Cut) + totalScreening [(chargeTraceDepth, topBandRatio)] / (1 - depthWeight) = 602 / 9
    ∧ (602 / 9 : Cut) ≠ 1582 / 27 :=
  DressingSeamResolved.dressed_topBand_moves

-- SCOPE-(a) moves the confinement way-point
theorem probe_a_conf :
    dressedInvAlphaZero depthWeight derivedBandList = 74 ∧ (74 : Cut) ≠ 190 / 3 :=
  DressingSeamResolved.dressed_conf_moves

-- leading (w=0) reproduces both way-points (shared anchor)
theorem probe_leading :
    invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27
    ∧ invAlphaZero derivedBandList = 190 / 3 :=
  ⟨DressingSeamResolved.leading_topBand, DressingSeamResolved.leading_conf⟩

-- SCOPE-(b) collapses to the single fold constant
theorem probe_b_collapse (lowTail : List (Cut × Cut)) :
    bandVaryingScreen (withWeight depthWeight lowTail) = 3 / 2 * totalScreening lowTail :=
  LowTailFoldForcedWeight.foldForcedLowTailScreen lowTail

-- SCOPE-(b) per-band knob is real but fold-fixed
theorem probe_b_knob (b : Cut × Cut) (hb : bandScreen b.1 b.2 ≠ 0) :
    bandVaryingScreen [(0, b)] ≠ bandVaryingScreen [(depthWeight, b)] :=
  LowTailFoldForcedWeight.perBand_knob_real b hb

-- SCOPE-(c) closed form
theorem probe_c_closed :
    recomposedEndpointDressed = 2425 / 18 + (3 / 2) * kappaLeading * cInner :=
  D7DepthTwoComposed.recomposedEndpointDressed_closed

-- SCOPE-(c) exempts the resummed base
theorem probe_c_base :
    recomposedEndpointDressed - (3 / 2) * kappaLeading * cInner = 2425 / 18 :=
  D7DepthTwoComposed.dressed_offsets_base

-- the exempt base IS the way-point + census gem (resummed content)
theorem probe_base_resummed : (2425 : Cut) / 18 = 7179 / 54 + 16 / 9 :=
  BaseNormalFormAudit.base_eq_waypoint_plus_gem

-- the weight is channel-independent (F1 arena tie)
theorem probe_weight_shared :
    depthWeight = 1 / 3 ∧ depthWeight ≠ 0 ∧ depthWeight ≠ 1 :=
  PerChannelDressing.weight_derived_not_free

-- SCOPE-(c) genuinely dresses (teeth)
theorem probe_c_dresses : PerChannelRecomb.recomposedEndpoint < recomposedEndpointDressed :=
  (D7DepthTwoComposed.depthTwo_dresses_recomposed).2

end

end FrameAuditF2Probe
