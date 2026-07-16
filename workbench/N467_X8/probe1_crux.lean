import Phys.Algebra.FineStructureZeroMomentum
import Phys.Algebra.AbsoluteMassSpectrum
import Mathlib.Tactic

open Phys.Algebra
open Phys.Algebra.AbsMass
open Phys.Algebra.DischargeArcM
open Phys.Algebra.GenerationMassRatios
open Phys.Algebra.FoldPhase
open Phys.Algebra.Gear
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

namespace Probe1

/-- leptonBundle = the mass scale measured in the coupling tower's electroweak-edge units. -/
def leptonBundle : Cut := massScale * topBandRatio

/-- topBandRatio positivity. -/
theorem topBandRatio_pos : (0 : Cut) < topBandRatio := by
  unfold topBandRatio; exact inv_pos.mpr ewClosureRatio_pos

/-- CRUX 1: the cancellation — leptonBundle = the derived factor bundle. -/
theorem leptonBundle_eq_bundle :
    leptonBundle
      = (cutCos foldPhase * ((s1BornProb : ℚ) : Cut)) * 1 * cutCos (2 / 3) := by
  unfold leptonBundle massScale topBandRatio
  rw [absScaleChainDerived_eq_anchor_mul]
  have hne : ewClosureRatio ≠ 0 := ne_of_gt ewClosureRatio_pos
  field_simp
  ring

/-- CRUX 2: massScale = electroweak band edge × leptonBundle. -/
theorem massScale_eq_edge_bundle : massScale = ewClosureRatio * leptonBundle := by
  unfold leptonBundle massScale topBandRatio
  have hne : ewClosureRatio ≠ 0 := ne_of_gt ewClosureRatio_pos
  field_simp

/-- CRUX 3: leptonBundle positive. -/
theorem leptonBundle_pos : (0 : Cut) < leptonBundle :=
  mul_pos massScale_pos topBandRatio_pos

/-- CRUX 4: leptonBundle < 1 (the suppression bites). -/
theorem leptonBundle_lt_one : leptonBundle < 1 := by
  have h1 : massScale < ewClosureRatio := absScaleChainDerived_lt_anchor
  have h2 : (0 : Cut) < topBandRatio := topBandRatio_pos
  have h3 : ewClosureRatio * topBandRatio = 1 := by
    unfold topBandRatio; exact mul_inv_cancel₀ (ne_of_gt ewClosureRatio_pos)
  calc leptonBundle = massScale * topBandRatio := rfl
    _ < ewClosureRatio * topBandRatio := mul_lt_mul_of_pos_right h1 h2
    _ = 1 := h3

/-- CRUX 5: the tower-frame absolute mass. -/
theorem absMass0_tower : absMass0 = ewClosureRatio * leptonBundle * mass0 := by
  unfold absMass0
  rw [massScale_eq_edge_bundle]

/-- CRUX 6: the coupling reading at the same edge (cited from X6). -/
theorem coupling_reading :
    invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27 :=
  invAlphaZero_topBand_value

/-- CRUX 7: leptonBundle ≠ 1 (teeth). -/
theorem leptonBundle_ne_one : leptonBundle ≠ 1 := ne_of_lt leptonBundle_lt_one

end Probe1
end
