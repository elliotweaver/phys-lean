import Phys.Algebra.ArcMConsolidation
import Phys.Algebra.CascadeFoldPhase
import Phys.Foundation.ContinuumTrigEval
import Mathlib.Tactic

open scoped BigOperators

namespace Phys.Algebra.ScaleChainDischargeProbe

open Phys.Algebra Phys.Algebra.Gear Phys.Algebra.Winding Phys.Algebra.ScaleChain
open Phys.Algebra.ArcMConsolidation Phys.Algebra.FoldPhase
open Phys.Foundation Phys.Foundation.ContinuumQ

noncomputable section

/-- The Cut-domain chain extending the banked ℚ-chain; gear survival cites the banked s1BornProb. -/
def absScaleChainR (phaseBorn topLink lightLink : Cut) : Cut :=
  ewClosureRatio * (phaseBorn * ((s1BornProb : ℚ) : Cut)) * topLink * lightLink

theorem absScaleChainR_restrict (q t l : ℚ) :
    absScaleChainR ((q : ℚ) : Cut) ((t : ℚ) : Cut) ((l : ℚ) : Cut)
      = absScaleChain q t l := by
  unfold absScaleChainR absScaleChain
  rw [mbBornRatio, s1BornProb]
  push_cast
  ring

def absScaleChainDerived : Cut :=
  absScaleChainR (cutCos foldPhase) 1 (cutCos (2 / 3))

theorem absScaleChainDerived_factors :
    absScaleChainDerived
      = cutExp (-(28 * cutPi / 3)) * (cutCos foldPhase * ((s1BornProb : ℚ) : Cut)) * 1
          * cutCos (2 / 3) := by
  unfold absScaleChainDerived absScaleChainR
  rw [ewClosureRatio_eq]

theorem survival_cast_pos : (0 : Cut) < ((s1BornProb : ℚ) : Cut) := by
  rw [s1BornProb_value]; norm_num

theorem survival_cast_lt_one : ((s1BornProb : ℚ) : Cut) < 1 := by
  rw [s1BornProb_value]; norm_num

theorem absScaleChainDerived_pos : 0 < absScaleChainDerived := by
  unfold absScaleChainDerived absScaleChainR
  have h1 : 0 < ewClosureRatio := ewClosureRatio_pos
  have h2 : 0 < cutCos foldPhase := by unfold foldPhase; exact cutCos_eighth_pos
  have h3 : 0 < cutCos (2 / 3 : Cut) := cutCos_two_thirds_pos
  have hs := survival_cast_pos
  positivity

theorem absScaleChainDerived_eq_anchor_mul :
    absScaleChainDerived
      = ewClosureRatio * ((cutCos foldPhase * ((s1BornProb : ℚ) : Cut)) * 1 * cutCos (2 / 3)) := by
  unfold absScaleChainDerived absScaleChainR
  ring

theorem absScaleChainDerived_lt_anchor : absScaleChainDerived < ewClosureRatio := by
  rw [absScaleChainDerived_eq_anchor_mul]
  have h1 : 0 < ewClosureRatio := ewClosureRatio_pos
  have hsv : ((s1BornProb : ℚ) : Cut) = 2 / 3 := by rw [s1BornProb_value]; norm_num
  have hfac_lt1 :
      (cutCos foldPhase * ((s1BornProb : ℚ) : Cut)) * 1 * cutCos (2 / 3) < 1 := by
    rw [hsv]
    have hcle : cutCos foldPhase ≤ 1 := cutCos_le_one foldPhase
    have hcpos : 0 < cutCos foldPhase := by unfold foldPhase; exact cutCos_eighth_pos
    have hlle : cutCos (2 / 3 : Cut) ≤ 787 / 1000 := cutCos_two_thirds_bracket.2
    have hlpos : 0 < cutCos (2 / 3 : Cut) := cutCos_two_thirds_pos
    nlinarith [hcle, hcpos, hlle, hlpos]
  exact mul_lt_of_lt_one_right h1 hfac_lt1

theorem absScaleChainDerived_lt_one : absScaleChainDerived < 1 :=
  lt_trans absScaleChainDerived_lt_anchor ewClosureRatio_lt_one

theorem absScaleChainDerived_ne_zero : absScaleChainDerived ≠ 0 :=
  ne_of_gt absScaleChainDerived_pos

theorem absScaleChainDerived_ne_anchor : absScaleChainDerived ≠ ewClosureRatio :=
  ne_of_lt absScaleChainDerived_lt_anchor

theorem phaseSlot_is_banked_amplitude :
    0 < cutCos foldPhase
    ∧ cutCos foldPhase * cutCos foldPhase = (1 + cutCos (cutPi / 4)) / 2 :=
  foldPhase_amplitude

theorem leptonLink_at_winding_boundary :
    windingRungIndex boundaryRungIndex = 1 - (Module.finrank ℚ Uhol : ℤ) :=
  meLink_at_winding_boundary

theorem conditional_dissolved :
    (∃ pb pb' : ℚ, absScaleChain pb 1 1 ≠ absScaleChain pb' 1 1)
    ∧ (absScaleChainDerived
        = ewClosureRatio * (cutCos foldPhase * ((s1BornProb : ℚ) : Cut)) * 1 * cutCos (2 / 3))
    ∧ 0 < absScaleChainDerived := by
  refine ⟨absScaleChain_parameter_dependent, ?_, absScaleChainDerived_pos⟩
  rw [absScaleChainDerived_eq_anchor_mul]; ring

end

end Phys.Algebra.ScaleChainDischargeProbe
