import Phys.Algebra.LeptonMassTower
import Phys.Algebra.QuarkHadronTower
import Phys.Algebra.FineStructureMZReadings
import Mathlib.Tactic

namespace ProbeX10b

open Phys.Algebra
open Phys.Algebra.LeptonMassTower
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.AbsMass
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section
attribute [local instance] Phys.Cascade.CD.narCD Phys.Cascade.CD.srCD

structure XPrediction where
  ceiling : Cut
  topBandScreen : Cut
  topBandCoupling : Cut
  sharedEdge : Cut
  ewEdge : Cut
  leptonWeld : Cut
  confWeld : Cut

def xPrediction : XPrediction :=
  { ceiling := invAlphaHigh
    topBandScreen := bandScreen chargeTraceDepth topBandRatio
    topBandCoupling := invAlphaZero [(chargeTraceDepth, topBandRatio)]
    sharedEdge := topBandRatio
    ewEdge := ewClosureRatio
    leptonWeld := leptonBundle
    confWeld := confBundle }

-- CRUX: structure-projection defeq lets banked theorems close weld conjuncts directly.
example :
    invAlphaZero [(chargeTraceDepth, xPrediction.sharedEdge)] = 1582 / 27
    ∧ massScale = xPrediction.ewEdge * xPrediction.leptonWeld
    ∧ confinementScaleRatio = xPrediction.ewEdge * xPrediction.confWeld
    ∧ xPrediction.ewEdge * xPrediction.sharedEdge = 1 := by
  refine ⟨QuarkHadronTower.coupling_reading, massScale_eq_edge_bundle,
          confinement_eq_edge_bundle, ?_⟩
  show ewClosureRatio * topBandRatio = 1
  unfold topBandRatio; exact mul_inv_cancel₀ (ne_of_gt ewClosureRatio_pos)

-- value facts via projection:
example : xPrediction.ceiling = 42 := invAlphaHigh_eq
example : xPrediction.topBandScreen = 448 / 27 := bandScreen_topBand_exact
example : xPrediction.topBandCoupling = 1582 / 27 := invAlphaZero_topBand_value
example : xPrediction.confWeld = cutExp (-(8 * cutPi / 3)) := confBundle_eq
example : (0:Cut) < xPrediction.leptonWeld ∧ xPrediction.leptonWeld < 1 :=
  ⟨leptonBundle_pos, leptonBundle_lt_one⟩
example : (0:Cut) < xPrediction.confWeld ∧ xPrediction.confWeld < 1 :=
  ⟨confBundle_pos, confBundle_lt_one⟩

-- Weinberg high value at μ=M (needs only M ≠ 0):
example (M : Cut) (hM : M ≠ 0) : sinSqRun isoDepth kappaLeading M M = 3 / 8 :=
  sinSqRun_at_high isoDepth kappaLeading M hM

end

end ProbeX10b
