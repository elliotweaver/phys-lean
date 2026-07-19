import Phys.Algebra.TopAnchorInsertionPinning
import Phys.Algebra.D7DepthTwoComposed

namespace Phys.Algebra.HucDischargeProbe2

open Phys.Algebra
open Phys.Algebra.UpDownRelativeScaleFoldPhase
open Phys.Algebra.FreezeoutEdgeCrossSectorReduction
open Phys.Algebra.DownConfinementRelativeScale
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.PerEdgeCensusRederived
open Phys.Algebra.DecouplingCensusRemoval
open Phys.Algebra.BandEdgeList
open Phys.Algebra.BaseNormalFormAudit
open Phys.Algebra.EdgeLogArgAudit
open Phys.Algebra.HucBornSquareAnchor
open Phys.Algebra.TopAnchorInsertionPinning
open Phys.Algebra.PerChannelRecomb
open Phys.Algebra.D7DepthTwoComposed
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

-- (B) THE ONE-CAUSE RE-ATTESTATION: the gem 40/27 IS bandScreen at the light census;
-- band 128/27 IS bandScreen at the full census; both screen the ONE derived ratio confBandRatio.
theorem gem_is_light_band_screen :
    bandScreen censusActiveLightSpan confBandRatio = 40 / 27 := by
  unfold bandScreen
  rw [censusActiveLightSpan_val, confRung_val]
  exact gem_active

theorem endpoint_conf_one_cause :
    bandScreen censusActiveLightSpan confBandRatio = 40 / 27
    ∧ bandScreen chargeTraceDepth confBandRatio = 128 / 27
    ∧ cutLog confBandRatio = 8 * cutPi / 3
    ∧ cutLog ((1 : Cut) / confBundle) = cutLog confBandRatio := by
  exact ⟨gem_is_light_band_screen, bandScreen_conf_exact, confRung_val,
    (rung_is_one_object).2⟩

-- (C) bracket re-export: bare + dressed
theorem bare_bracket :
    (1363071880 : Cut) / 10000000 ≤ recomposedEndpoint
      ∧ recomposedEndpoint ≤ 1363071883 / 10000000 :=
  D7NarrowingRung1.recomposedEndpoint_restated_sharp

theorem dressed_bracket :
    (1370984 / 10000 : Cut) ≤ recomposedEndpointDressed
      ∧ recomposedEndpointDressed ≤ 1371006 / 10000 :=
  recomposedEndpointDressed_restated

end

end Phys.Algebra.HucDischargeProbe2
