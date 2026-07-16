import Phys.Algebra.FineStructureMZReadings
import Phys.Algebra.GatherSelfCensus
import Mathlib.Tactic

open Matrix
open scoped BigOperators

namespace Phys.Algebra.Z2Probe

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

/-! Channel net depths. -/

def netIsoDepth (s : Cut) : Cut := isoDepth - s
def netHyperDepth : Cut := hyperDepth

theorem netHyperDepth_matterOnly : netHyperDepth = hyperDepth := rfl
theorem netHyperDepth_eq : netHyperDepth = 10 / 3 := by unfold netHyperDepth; exact hyperDepth_eq

theorem netIsoDepth_reduced (s : Cut) (hs : 0 < s) : netIsoDepth s < isoDepth := by
  unfold netIsoDepth; linarith

theorem netIsoDepth_pos (s : Cut) (hs : 0 < s) (hslt : s < isoDepth) : 0 < netIsoDepth s := by
  unfold netIsoDepth; linarith

/-! Z1 asymmetry. -/

theorem channel_gather_asymmetry :
    traceForm7 (imRep DI) (imRep DI) < 0 ∧
    traceSq (0 : Matrix (Fin 7) (Fin 7) ℚ) = 0 :=
  ⟨gatherIsospin_selfCensus_neg, abelian_no_selfCensus⟩

/-! Proportionality break. -/

theorem net_ratio_breaks_up (s : Cut) (hs : 0 < s) :
    (5 / 3) * netIsoDepth s < hyperDepth := by
  unfold netIsoDepth
  rw [depth_proportional]
  have hprod : (0 : Cut) < (5 / 3) * s := mul_pos (by norm_num) hs
  have hexp : (5 / 3 : Cut) * (isoDepth - s) = (5 / 3) * isoDepth - (5 / 3) * s := by ring
  rw [hexp]; linarith

/-! General proportional-mixing helper. -/

theorem sinSqRun_prop_general (a2 aY : Cut) (hprop : aY = (5 / 3) * a2) (h2 : a2 ≠ 0) :
    a2 / (a2 + aY) = 3 / 8 := by
  rw [hprop]
  have hne : a2 + (5 / 3) * a2 ≠ 0 := by
    have h : a2 + (5 / 3) * a2 = (8 / 3) * a2 := by ring
    rw [h]; exact mul_ne_zero (by norm_num) h2
  rw [div_eq_iff hne]; ring

/-! RECOMBINATION: the isospin-only reduction runs the mixing down. -/

theorem twoChannel_mixing_departs (s κ M μ : Cut) (hκ : 0 < κ) (hs : 0 < s)
    (hslt : s < isoDepth) (hμ : 0 < μ) (hμM : μ < M) :
    sinSqRun (netIsoDepth s) κ M μ < 3 / 8 :=
  sinSqRun_departs_down (netIsoDepth s) κ M μ hκ (netIsoDepth_pos s hs hslt)
    (netIsoDepth_reduced s hs) hμ hμM

/-! CONSISTENCY: switch the gather self-census off (s = 0) → matter-only stationary 3/8. -/

theorem twoChannel_switchoff (κ M μ : Cut) (h2 : invAlpha2 isoDepth κ M μ ≠ 0) :
    netIsoDepth 0 = isoDepth ∧ sinSqRun (netIsoDepth 0) κ M μ = 3 / 8 := by
  have hz : netIsoDepth 0 = isoDepth := by unfold netIsoDepth; ring
  refine ⟨hz, ?_⟩
  rw [hz]; exact sinSqRun_matter_stationary κ M μ h2

/-! LOAD-BEARING abelian-asymmetry tooth: reduce BOTH channels proportionally → mixing FREEZES at 3/8. -/

def invAlphaY_symmetric (s κ M μ : Cut) : Cut :=
  invAlphaYHigh + κ * (hyperDepth - (5 / 3) * s) * cutLog (M / μ)

def sinSqRun_symmetric (s κ M μ : Cut) : Cut :=
  invAlpha2 (netIsoDepth s) κ M μ /
    (invAlpha2 (netIsoDepth s) κ M μ + invAlphaY_symmetric s κ M μ)

theorem invAlphaY_symmetric_prop (s κ M μ : Cut) :
    invAlphaY_symmetric s κ M μ = (5 / 3) * invAlpha2 (netIsoDepth s) κ M μ := by
  unfold invAlphaY_symmetric invAlpha2 netIsoDepth
  rw [invAlpha2High_eq, invAlphaYHigh_eq, hyperDepth_eq, isoDepth_eq]
  ring

theorem symmetric_frozen (s κ M μ : Cut) (h2 : invAlpha2 (netIsoDepth s) κ M μ ≠ 0) :
    sinSqRun_symmetric s κ M μ = 3 / 8 := by
  unfold sinSqRun_symmetric
  exact sinSqRun_prop_general _ _ (invAlphaY_symmetric_prop s κ M μ) h2

/-! EM way-point consistency (X7, s-independent). -/

theorem em_waypoint_consistency :
    invAlphaZero [(chargeTraceDepth, topBandRatio)] = 1582 / 27 :=
  invAlphaZero_at_ew_edge

/-! W8 teeth. -/

theorem asymmetry_distinct :
    traceForm7 (imRep DI) (imRep DI) < 0 ∧
    ¬ (traceSq (0 : Matrix (Fin 7) (Fin 7) ℚ) < 0) := by
  refine ⟨gatherIsospin_selfCensus_neg, ?_⟩
  rw [abelian_no_selfCensus]; norm_num

theorem departure_needs_reduction (κ M μ : Cut) (h2 : invAlpha2 isoDepth κ M μ ≠ 0) :
    sinSqRun (netIsoDepth 0) κ M μ = 3 / 8 :=
  (twoChannel_switchoff κ M μ h2).2

theorem mixing_ne_wrong (κ M μ : Cut) (h2 : invAlpha2 isoDepth κ M μ ≠ 0) :
    sinSqRun (netIsoDepth 0) κ M μ ≠ 1 / 4 := by
  rw [departure_needs_reduction κ M μ h2]; norm_num

end

end Phys.Algebra.Z2Probe
