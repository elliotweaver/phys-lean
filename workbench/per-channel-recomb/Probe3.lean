import Phys.Algebra.RecomposedRunningEndpoint
import Phys.Algebra.CensusCompletenessClosure
import Phys.Algebra.ComposedFreezeoutDissolved
import Phys.Algebra.FreezeoutEdgeNumerals
import Mathlib.Tactic

/-! PROBE 3 — the endpoint-level direction theorem (freeze-out staircase < additive coloured slice). -/

namespace Phys.Algebra.PerChannelRecomb3

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.EndpointAssembly
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.CensusCompletenessClosure
open Phys.Algebra.RecomposedRunningEndpoint
open Phys.Algebra.RecombinedEndpoint
open Phys.Algebra.CasimirProjectionSelectsS
open Phys.Algebra.ComposedFreezeoutDissolved
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.FreezeoutEdgeNumerals
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

def freezeoutStaircaseSummand : Cut :=
  16 / 9
    + kappaLeading * ((7 / 3) * cutLog mbRatioDerived + (11 / 3) * cutLog (bMass 0)
      - (5 / 3) * cutLog (bMass 2))

/-- L_lep = cutLog(mass0/mass1) has a banked lower bracket. From EndpointAssembly m01_bracket_lo:
    mass0/mass1 ≥ 1e9/288575 ≈ 3465. So cutLog(mass0/mass1) ≥ cutLog(1e9/288575).
    We need L_lep ≥ 8 (clean). Let me certify cutLog(mass0/mass1) ≥ 8 via the exp instrument. -/
-- Probe: is there a banked bracket for cutLog(mass0/mass1)?
-- Check what's available.

/-- The additive coloured slice: bandScreen colouredCensus (mass0/mass1) = κ·(10/3)·cutLog(mass0/mass1). -/
def additiveColouredSlice : Cut := bandScreen colouredCensus (mass0 / mass1)

/-- Numerically additiveColouredSlice ≈ 2.884; freezeoutStaircaseSummand ≈ 1.65.
    The DIRECTION: freezeoutStaircaseSummand < additiveColouredSlice.
    We need: an UPPER bound on freezeoutStaircaseSummand and a LOWER bound on additiveColouredSlice,
    with the upper < lower.
    Upper on fz: from FreezeoutEdgeNumerals brackets:
      cutLog mbRatioDerived ≤ -4 (charmEdgeLog: cutLog(1/mbRatioDerived) ≥ 4 ⟹ cutLog mbRatioDerived ≤ -4)
      cutLog (bMass 0) ≤ 18/10
      cutLog (bMass 2) ≥ -12/10  (⟹ -(5/3)cutLog(bMass2) ≤ (5/3)(12/10) = 2)
    So fz ≤ 16/9 + κ·[(7/3)(-4) + (11/3)(18/10) + (5/3)(12/10)]  (κ>0)
    Lower on additive: cutLog(mass0/mass1) ≥ 8 (needs certification). -/

-- First: what's the sign structure? kappaLeading > 0.
example : (0:Cut) < kappaLeading := kappaLeading_pos

-- charm edge: cutLog(1/mbRatioDerived) ≥ 4. And cutLog(1/mbRatioDerived) = -cutLog mbRatioDerived.
#check @charmEdgeLog_bracket_reexport
#check @Lb0_bracket
#check @Lb2_bracket

end

end Phys.Algebra.PerChannelRecomb3
