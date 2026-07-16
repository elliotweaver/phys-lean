import Phys.Algebra.FineStructureLoopNormalization
import Phys.Algebra.WeinbergAngleRunning
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
noncomputable section

-- CRUX 1: cutLog_div from banked cutLog_mul
theorem cutLog_div_probe {a b : Cut} (ha : 0 < a) (hb : 0 < b) :
    cutLog (a / b) = cutLog a - cutLog b := by
  have hab : 0 < a / b := div_pos ha hb
  have h : cutLog ((a / b) * b) = cutLog (a / b) + cutLog b := cutLog_mul hab hb
  rw [div_mul_cancel₀ a (ne_of_gt hb)] at h
  linarith

-- CRUX 2: betaCensus value
def betaCensus_probe : Cut := kappaLeading * chargeTraceDepth
theorem betaCensus_eq_probe : betaCensus_probe = 16 / (9 * cutPi) := by
  unfold betaCensus_probe
  rw [kappaLeading_eq, chargeTraceDepth_eq]
  have hne : cutPi ≠ 0 := ne_of_gt cutPi_pos
  field_simp
  ring

theorem betaCensus_pos_probe : 0 < betaCensus_probe := by
  unfold betaCensus_probe
  exact mul_pos kappaLeading_pos chargeTraceDepth_pos

-- parameter-free running form
def invAlphaRunExact_probe (M μ : Cut) : Cut := invAlphaRun kappaLeading M μ
theorem invAlphaRunExact_eq_probe (M μ : Cut) :
    invAlphaRunExact_probe M μ = 42 + betaCensus_probe * cutLog (M / μ) := by
  unfold invAlphaRunExact_probe invAlphaRun betaCensus_probe
  rw [invAlphaHigh_eq]

-- CRUX 3: the cocycle (autonomous-flow, not-truncated)
theorem cocycle_probe (M μ1 μ2 : Cut) (hM : 0 < M) (h1 : 0 < μ1) (h2 : 0 < μ2) :
    invAlphaRunExact_probe M μ1 - invAlphaRunExact_probe M μ2
      = betaCensus_probe * cutLog (μ2 / μ1) := by
  rw [invAlphaRunExact_eq_probe, invAlphaRunExact_eq_probe]
  have e1 : cutLog (M / μ1) = cutLog M - cutLog μ1 := cutLog_div_probe hM h1
  have e2 : cutLog (M / μ2) = cutLog M - cutLog μ2 := cutLog_div_probe hM h2
  have e3 : cutLog (μ2 / μ1) = cutLog μ2 - cutLog μ1 := cutLog_div_probe h2 h1
  rw [e1, e2, e3]; ring

-- CRUX 4: closed-form exp-invertibility (the marquee exactness)
theorem invert_probe (M μ : Cut) (hM : 0 < M) (hμ : 0 < μ) :
    cutExp ((invAlphaRunExact_probe M μ - 42) / betaCensus_probe) = M / μ := by
  rw [invAlphaRunExact_eq_probe]
  have hbne : betaCensus_probe ≠ 0 := ne_of_gt betaCensus_pos_probe
  have hsimp : (42 + betaCensus_probe * cutLog (M / μ) - 42) / betaCensus_probe
      = cutLog (M / μ) := by field_simp; ring
  rw [hsimp]
  exact cutExp_cutLog (div_pos hM hμ)

-- sinSqRun tie
def sinSqRunExact_probe (d2 M μ : Cut) : Cut := sinSqRun d2 kappaLeading M μ
theorem sinSqRunExact_stationary_probe (M μ : Cut)
    (h2 : invAlpha2 isoDepth kappaLeading M μ ≠ 0) :
    sinSqRunExact_probe isoDepth M μ = 3 / 8 :=
  sinSqRun_matter_stationary kappaLeading M μ h2

end
end Phys.Algebra
