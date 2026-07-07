import Phys.Algebra.ScaleTowerWindingQuantization
import Phys.Algebra.ScaleTowerGearDecomposition
import Phys.Algebra.ScaleTowerLadder
import Mathlib.Tactic

open scoped BigOperators

namespace Phys.Algebra.ScaleChainProbe

open Phys.Algebra Phys.Algebra.Gear Phys.Algebra.Winding Phys.Algebra.HJ
open Phys.Foundation Phys.Foundation.ContinuumQ
open Matrix

noncomputable section

/-- Probe A: the electroweak anchor is the banked n=9 tower rung = e^(−28π/3). -/
example : ewClosureRatio = cutExp (-(28 * cutPi / 3)) := ewClosureRatio_eq

/-- Probe B: the anchor locks to the 84π budget. -/
example : rungExponent (Module.finrank ℚ spaceSub) * (Module.finrank ℚ spaceSub : Cut)
    = criticalPhaseNumerator := lock_spaceSub

/-- Probe C: cast the m_b gear factor (ℚ) into Cut and use its value. -/
example (phaseBorn : ℚ) : ((mbBornRatio phaseBorn : ℚ) : Cut) = ((phaseBorn * (2/3) : ℚ) : Cut) := by
  rw [mbBornRatio_value]

/-- Probe D: define the chain as a product of banked links (structural skeleton).
    absScaleChain = ewClosureRatio · (m_b gear factor cast to Cut) · (further deferred link). -/
def absScaleChain (phaseBorn topLink lightLink : ℚ) : Cut :=
  ewClosureRatio * ((mbBornRatio phaseBorn : ℚ) : Cut)
    * ((topLink : ℚ) : Cut) * ((lightLink : ℚ) : Cut)

/-- Probe E: the chain factors through the banked EW rung e^(−28π/3). -/
example (phaseBorn topLink lightLink : ℚ) :
    absScaleChain phaseBorn topLink lightLink
      = cutExp (-(28 * cutPi / 3)) * ((mbBornRatio phaseBorn : ℚ) : Cut)
          * ((topLink : ℚ) : Cut) * ((lightLink : ℚ) : Cut) := by
  unfold absScaleChain; rw [ewClosureRatio_eq]

/-- Probe F: the m_b link IS the banked self-blind survival at phaseBorn. -/
example (phaseBorn : ℚ) :
    ((mbBornRatio phaseBorn : ℚ) : Cut) = ((phaseBorn * (Matrix.trace Poth / 3) : ℚ) : Cut) := by
  rw [mbBornRatio_decomp]

/-- Probe G: the m_e link sits at the M1 w=−1 winding boundary rung. -/
example : windingRungIndex boundaryRungIndex = 1 - (Module.finrank ℚ Uhol : ℤ) :=
  windingRung_boundary

/-- Probe H: positivity of the anchor (Born-positive). -/
example : 0 < ewClosureRatio := ewClosureRatio_pos

/-- Probe I: suppression of the anchor. -/
example : ewClosureRatio < 1 := ewClosureRatio_lt_one

/-- Probe J: can we get positivity of the whole chain when links are positive rationals? -/
example (phaseBorn topLink lightLink : ℚ) (hp : 0 < phaseBorn) (ht : 0 < topLink) (hl : 0 < lightLink) :
    0 < absScaleChain phaseBorn topLink lightLink := by
  unfold absScaleChain
  have h1 : 0 < ewClosureRatio := ewClosureRatio_pos
  have h2 : (0 : Cut) < ((mbBornRatio phaseBorn : ℚ) : Cut) := by
    rw [mbBornRatio_value]
    have : (0 : ℚ) < phaseBorn * (2/3) := by positivity
    exact_mod_cast this
  have h3 : (0 : Cut) < ((topLink : ℚ) : Cut) := by exact_mod_cast ht
  have h4 : (0 : Cut) < ((lightLink : ℚ) : Cut) := by exact_mod_cast hl
  positivity

end

end Phys.Algebra.ScaleChainProbe
