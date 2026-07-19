import Phys.Algebra.RecomposedRunningEndpoint

namespace Phys.Algebra.FrameAuditProbe

open Phys.Algebra
open Phys.Algebra.BandEdgeList
open Phys.Algebra.CasimirProjectionSelectsS
open Phys.Algebra.RecombinedEndpoint
open Phys.Algebra.RecomposedRunningEndpoint
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-- The single-parameter recombination family: 112 (= 42+70, the two ceilings, COMMON to both
    architectures) plus the tower screening at the recombined census netIsoDepth t + hyperDepth. -/
def recombArch (t : Cut) (bands : List (Cut × Cut)) : Cut :=
  112 + totalScreeningWith (netIsoDepth t + hyperDepth) bands

/-- t=0 gives the recombined census = full charge census (the switch-off). -/
theorem netIsoDepth_zero_add_hyper : netIsoDepth 0 + hyperDepth = chargeTraceDepth := by
  rw [census_additive]; unfold netIsoDepth; ring

/-- ARCH-A: recombArch 0 = the additive object invAlphaEM. -/
theorem recombArch_zero_eq_additive (bands : List (Cut × Cut)) :
    recombArch 0 bands = invAlphaEM bands := by
  unfold recombArch
  rw [netIsoDepth_zero_add_hyper, ← invAlphaEM_closed_charge]

/-- ARCH-B: recombArch projectedS = recomposedInvAlphaEM. -/
theorem recombArch_projectedS_eq_recomposed (bands : List (Cut × Cut)) :
    recombArch projectedS bands = recomposedInvAlphaEM bands := by
  unfold recombArch
  rw [recomposedInvAlphaEM_closed]
  rfl

/-- The two architectures differ at the top band by exactly the Z1 anti-screening 7/18. -/
theorem architecture_shift_exact :
    recombArch 0 [(chargeTraceDepth, topBandRatio)]
        - recombArch projectedS [(chargeTraceDepth, topBandRatio)]
      = bandScreen projectedS topBandRatio := by
  rw [recombArch_zero_eq_additive, recombArch_projectedS_eq_recomposed]
  exact recomposed_shift_exact

/-- The forced parameter is nonzero (Z1 forbids the s=0 switch-off). -/
theorem forced_param_ne_zero : projectedS ≠ 0 := by
  have := projectedS_admissible.1; intro h; rw [h] at this; exact lt_irrefl 0 this

/-- ARCH-A (s=0) FREEZES the mixing at 3/8. -/
theorem archA_freezes_mixing (κ M μ : Cut) (h2 : invAlpha2 isoDepth κ M μ ≠ 0) :
    sinSqRun (netIsoDepth 0) κ M μ = 3 / 8 :=
  (twoChannel_switchoff κ M μ h2).2

/-- ARCH-B (derived s>0) DEPARTS the mixing strictly below 3/8. -/
theorem archB_departs_mixing (κ M μ : Cut) (hκ : 0 < κ) (hμ : 0 < μ) (hμM : μ < M) :
    sinSqRun (netIsoDepth projectedS) κ M μ < 3 / 8 :=
  twoChannel_mixing_departs projectedS κ M μ hκ projectedS_admissible.1
    projectedS_admissible.2 hμ hμM

end

end Phys.Algebra.FrameAuditProbe
