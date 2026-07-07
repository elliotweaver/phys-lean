import Phys.Algebra.ScaleTowerLadder
import Phys.Algebra.ConfinementMassGap
import Mathlib.Tactic

namespace Phys.Algebra.ProbeN389

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra

noncomputable section

attribute [local instance] CD.narCD CD.srCD

/-- Λ/M, the n=7 = dim ImO octonion (colour) rung of the 84π grammar. -/
def confinementScaleRatio : Cut :=
  cutExp (-(rungExponent (Module.finrank ℚ ImO)))

theorem confinementScaleRatio_eq : confinementScaleRatio = cutExp (-(12 * cutPi)) := by
  unfold confinementScaleRatio; rw [rungExponent_at_imO]

theorem confinementScaleRatio_pos : 0 < confinementScaleRatio := by
  unfold confinementScaleRatio; exact cutExp_pos _

theorem confinementScaleRatio_lt_one : confinementScaleRatio < 1 := by
  rw [confinementScaleRatio_eq]
  have hneg : -(12 * cutPi) < 0 := by have := cutPi_pos; linarith
  have := cutExp_strictMono hneg
  rwa [cutExp_zero] at this

/-- Λ < v: the confinement scale is BELOW the electroweak scale (12π > 28π/3). -/
theorem confinementScaleRatio_lt_ewClosureRatio :
    confinementScaleRatio < ewClosureRatio := by
  rw [confinementScaleRatio_eq, ewClosureRatio_eq]
  apply cutExp_strictMono
  have := cutPi_pos
  -- want: -(12*cutPi) < -(28*cutPi/3), i.e. 28*cutPi/3 < 12*cutPi
  nlinarith [this]

/-- Λ ≠ v: the hadron mass scale is NOT the electroweak/Higgs scale. -/
theorem confinementScaleRatio_ne_ewClosureRatio :
    confinementScaleRatio ≠ ewClosureRatio :=
  ne_of_lt confinementScaleRatio_lt_ewClosureRatio

/-- Λ ≠ M: genuine suppression (W8). -/
theorem confinementScaleRatio_ne_one : confinementScaleRatio ≠ 1 := by
  have := confinementScaleRatio_lt_one; intro h; rw [h] at this; linarith

/-- The confinement scale Λ = M·e^(−12π), keeping M the single anchor. -/
def confinementScale (M : Cut) : Cut := M * confinementScaleRatio

theorem confinementScale_pos (M : Cut) (hM : 0 < M) : 0 < confinementScale M := by
  unfold confinementScale; exact mul_pos hM confinementScaleRatio_pos

/-- Λ < v as scales, for M > 0. -/
theorem confinementScale_lt_vev (M g2 : Cut) (hM : 0 < M) (hg : g2 ≠ 0) :
    confinementScale M
      < transmutationScale M (rungExponent (Module.finrank ℚ spaceSub) * g2) g2 := by
  have hv : transmutationScale M (rungExponent (Module.finrank ℚ spaceSub) * g2) g2
          = M * ewClosureRatio := by
    unfold transmutationScale; rw [ewClosureRatio_eq_transmutation g2 hg]
  rw [hv]; unfold confinementScale
  exact mul_lt_mul_of_pos_left confinementScaleRatio_lt_ewClosureRatio hM

/-- The 84π budget lock: the confinement exponent times the octonion (colour) count 7
    returns the SAME critical-phase budget that fixed α. -/
theorem confinementRung_budget_lock :
    rungExponent (Module.finrank ℚ ImO) * (Module.finrank ℚ ImO : Cut)
      = criticalPhaseNumerator :=
  lock_imO

/-- The confinement Born action floor (N388) is POSITIVE and survives massless
    constituents: the bound coloured curvature has bornAction ≥ 4 > 0. -/
theorem confinement_mass_floor_pos :
    (0:Cut) < bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) := by
  have h4 : (4:Cut) ≤ bornAction (CD.iota (ιJ ℚ) : O ℚ) (CD.iota (CD.e2 : H ℚ)) (CD.e2 : O ℚ) :=
    bornAction_witness_floor
  linarith

end

end Phys.Algebra.ProbeN389
