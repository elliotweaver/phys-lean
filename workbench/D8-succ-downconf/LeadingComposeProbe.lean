import Phys.Algebra.DressingSeamResolved
import Mathlib.Tactic

namespace Phys.Algebra.LeadingComposeProbe

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.DepthTowerDescent
open Phys.Algebra.DepthWeight
open Phys.Algebra.RecombinedEndpoint
open Phys.Algebra.PerChannelDressing
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.CasimirProjectionSelectsS
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.SubBandCompletion
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- (1) the leading-kappa anti-screened tower = dressedInvAlphaEM at w=0
example :
    invAlphaEM (completeBandList chargeTraceDepth)
      - projectedS * totalScreeningWith 1 (completeBandList chargeTraceDepth)
    = dressedInvAlphaEM 0 projectedS (completeBandList chargeTraceDepth) := by
  rw [dressedInvAlphaEM_closed 0 projectedS (le_refl 0) (by norm_num)
        (completeBandList chargeTraceDepth),
      invAlphaEM_closed_charge, totalScreeningWith_homog chargeTraceDepth]
  ring

-- (2) THE ASSEMBLED LEADING-K COMPOSED OBJECT = determined closed form
example (Mu Md Mlam : Cut) (hu : Mu ≠ 0) (hd : Md ≠ 0) (hl : Mlam ≠ 0)
    (hud : (Md / Mu) ^ 2 = mbRatioDerived)
    (huc : (Mu / Mlam) ^ 2 = 1 / confBundle) :
    invAlphaEM (completeBandList chargeTraceDepth)
      - projectedS * totalScreeningWith 1 (completeBandList chargeTraceDepth)
      + totalScreening
          (freezeoutTail (edgeBottom Mu Md) (edgeCharm Mu Md) (edgeLight Md (Mlam ^ 2)))
    = 112
      + (chargeTraceDepth - projectedS) * totalScreeningWith 1 (completeBandList chargeTraceDepth)
      + (16 / 9
        + kappaLeading * ((7 / 3) * cutLog mbRatioDerived + (11 / 3) * cutLog (bMass 0)
          - (5 / 3) * cutLog (bMass 2))) := by
  rw [invAlphaEM_closed_charge, totalScreeningWith_homog chargeTraceDepth,
      freezeout_at_pinned_dissolved Mu Md Mlam hu hd hl hud huc]
  ring

-- (3) fully numeric with projectedS = 1/8 and chargeTraceDepth (leave chargeTraceDepth symbolic;
--     just substitute projectedS)
example :
    (chargeTraceDepth - projectedS) = chargeTraceDepth - 1 / 8 := by
  rw [projectedS_eq]

end

end Phys.Algebra.LeadingComposeProbe
