import Phys.Algebra.ScaleTowerWindingQuantization
import Phys.Algebra.ScaleTowerGearDecomposition
import Phys.Algebra.ScaleTowerLadder
import Mathlib.Tactic

open scoped BigOperators

namespace Phys.Algebra.ScaleChainProbe2

open Phys.Algebra Phys.Algebra.Gear Phys.Algebra.Winding Phys.Algebra.HJ
open Phys.Foundation Phys.Foundation.ContinuumQ
open Matrix

noncomputable section

/-- WELD probe: the anchor's 84π budget lock EQUALS the winding phase's budget form.
    LHS = criticalPhaseNumerator (lock_spaceSub, arc-B v-anchor);
    RHS = criticalPhaseNumerator (criticalBudget_channelform, arc-M winding). One budget. -/
example :
    rungExponent (Module.finrank ℚ spaceSub) * (Module.finrank ℚ spaceSub : Cut)
      = azimuthalTurn * channelCount := by
  rw [lock_spaceSub]; exact criticalBudget_channelform

/-- WELD probe 2: the winding phase step references the SAME azimuthalTurn as the budget. -/
example (k : ℤ) :
    windingPhase (k + 1) - windingPhase k = (Module.finrank ℚ Uhol : Cut) * azimuthalTurn :=
  windingPhase_step k

/-- The candidate lepton-rung value (re-export, inception-flagged). -/
example :
    (9 : ℚ) / 4
      = ((Module.finrank ℚ Uhol : ℚ) / (Module.finrank ContinuumQ.Cut Phys.Quantum.StateFibre : ℚ)) ^ 2 :=
  candidate_boundary_expressible

/-- Suppression of the chain: anchor·survival < 1 when phaseBorn ≤ some bound. Simple witness:
    at phaseBorn = 1 the m_b link is 2/3 < 1, and anchor < 1, so the two-link chain < 1. -/
example :
    ewClosureRatio * ((mbBornRatio 1 : ℚ) : Cut) < 1 := by
  have ha : ewClosureRatio < 1 := ewClosureRatio_lt_one
  have ha0 : 0 < ewClosureRatio := ewClosureRatio_pos
  have hb : ((mbBornRatio 1 : ℚ) : Cut) = ((2/3 : ℚ) : Cut) := by
    rw [mbBornRatio_value]; norm_num
  rw [hb]
  have hb1 : ((2/3 : ℚ) : Cut) < 1 := by
    have : ((2/3 : ℚ) : Cut) < ((1 : ℚ) : Cut) := by exact_mod_cast (by norm_num : (2/3 : ℚ) < 1)
    simpa using this
  have hb0 : (0 : Cut) < ((2/3 : ℚ) : Cut) := by
    have : ((0 : ℚ) : Cut) < ((2/3 : ℚ) : Cut) := by exact_mod_cast (by norm_num : (0 : ℚ) < 2/3)
    simpa using this
  calc ewClosureRatio * ((2/3 : ℚ) : Cut)
      < 1 * ((2/3 : ℚ) : Cut) := by
        apply mul_lt_mul_of_pos_right ha hb0
    _ = ((2/3 : ℚ) : Cut) := by rw [one_mul]
    _ < 1 := hb1

end

end Phys.Algebra.ScaleChainProbe2
