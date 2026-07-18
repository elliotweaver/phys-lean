import Phys.Algebra.QuarkHadronTower
import Phys.Algebra.ScaleTowerDischargeArcM
import Phys.Algebra.FreezeoutEdgeCrossSectorReduction
import Mathlib.Tactic

namespace Probe

open Phys.Algebra
open Phys.Algebra.DischargeArcM
open Phys.Algebra.QuarkHadronTower
open Phys.Algebra.FoldPhase
open Phys.Algebra.Gear
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] Phys.Cascade.CD.narCD Phys.Cascade.CD.srCD

noncomputable section

/-- The down/confinement relative-scale leg: Md/Λ = (Md/M)/(Λ/M). -/
def downConfLeg : Cut := absScaleChainDerived / confinementScaleRatio

example : 0 < downConfLeg := div_pos absScaleChainDerived_pos confinementScaleRatio_pos

/-- The WELD to the shared edge: the electroweak edge ewClosureRatio CANCELS in the ratio. -/
theorem downConfLeg_edge_cancel :
    downConfLeg
      = ((cutCos foldPhase * ((s1BornProb : ℚ) : Cut)) * 1 * cutCos (2 / 3)) / confBundle := by
  unfold downConfLeg
  rw [absScaleChainDerived_eq_anchor_mul, confinement_eq_edge_bundle]
  have hew : ewClosureRatio ≠ 0 := ne_of_gt ewClosureRatio_pos
  rw [mul_div_mul_left _ _ hew]

/-- Is the confinement floor genuinely below the down-sector cascade scale? confinementScaleRatio =
    cutExp(−12π); absScaleChainDerived is anchored near ewClosureRatio = cutExp(−28π/3), times a
    bundle < 1. Both < ewClosureRatio... need a genuine ordering. Check: is confinementScaleRatio <
    absScaleChainDerived provable, i.e. Md > Λ? Probe. -/
example : True := trivial

end

end Probe
