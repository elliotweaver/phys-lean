import Phys.Algebra.CascadeFoldPhase
import Phys.Algebra.GenerationJarlskogInvariantNumeric
import Mathlib.Tactic

namespace Phys.Algebra.CKMProbe

open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open Phys.Algebra.GenerationMixingAngles
open Phys.Algebra.GenerationJarlskog

noncomputable section

-- The derived two-sector CP phase = 2·foldPhase = cutPi/4 (the Cabibbo-block relative phase in D)
theorem twoP_eq_quarter : (2 : Cut) * Phys.Algebra.FoldPhase.foldPhase = cutPi / 4 := by
  unfold Phys.Algebra.FoldPhase.foldPhase; ring

-- The derived CP factor: the CP-odd (imaginary) Born-weight of the derived phase 2P
def cpFactorDerived : Cut :=
  cutSin (2 * Phys.Algebra.FoldPhase.foldPhase) * cutSin (2 * Phys.Algebra.FoldPhase.foldPhase)

-- ★ = 1/2 (the self=other balance at the derived phase; N344's maximal 1 is replaced)
theorem cpFactorDerived_eq_half : cpFactorDerived = 1 / 2 := by
  unfold cpFactorDerived
  rw [twoP_eq_quarter]
  have hp := cutSin_sq_add_cutCos_sq (cutPi / 4)
  have hc := Phys.Algebra.FoldPhase.cutCos_quarter_sq
  linarith

-- ★ the self=other balance: sin²(2P) = cos²(2P) (the derived phase is exactly the CP-balance point)
theorem cpFactor_self_eq_other :
    cutSin (2 * Phys.Algebra.FoldPhase.foldPhase) * cutSin (2 * Phys.Algebra.FoldPhase.foldPhase)
      = cutCos (2 * Phys.Algebra.FoldPhase.foldPhase) * cutCos (2 * Phys.Algebra.FoldPhase.foldPhase) := by
  rw [twoP_eq_quarter]
  have hp := cutSin_sq_add_cutCos_sq (cutPi / 4)
  have hc := Phys.Algebra.FoldPhase.cutCos_quarter_sq
  linarith

-- non-maximal, non-trivial: 0 < cpFactorDerived < 1
theorem cpFactor_between : (0 : Cut) < cpFactorDerived ∧ cpFactorDerived < 1 := by
  rw [cpFactorDerived_eq_half]; constructor <;> norm_num

-- The corrected Jarlskog squared
def jarlskogSqCorrected : Cut := g12 * g23 * h13 * cpFactorDerived

theorem jarlskogSqCorrected_eq_half : jarlskogSqCorrected = (1 / 2) * jarlskogSq := by
  unfold jarlskogSqCorrected
  rw [cpFactorDerived_eq_half, jarlskogSq_eq]; ring

theorem jarlskogSqCorrected_pos : (0 : Cut) < jarlskogSqCorrected := by
  rw [jarlskogSqCorrected_eq_half]; have := jarlskogSq_pos; linarith

theorem jarlskogSqCorrected_nonneg : (0 : Cut) ≤ jarlskogSqCorrected := le_of_lt jarlskogSqCorrected_pos

-- ★ the correction is DOWNWARD: jarlskogSqCorrected < jarlskogSq
theorem jarlskogSqCorrected_lt : jarlskogSqCorrected < jarlskogSq := by
  rw [jarlskogSqCorrected_eq_half]; have := jarlskogSq_pos; linarith

-- bracket [36/1e9, 37/1e9]
theorem jarlskogSqCorrected_lo : (36 : Cut) / 1000000000 ≤ jarlskogSqCorrected := by
  rw [jarlskogSqCorrected_eq_half]; have := jarlskogSq_lo; linarith
theorem jarlskogSqCorrected_hi : jarlskogSqCorrected ≤ (37 : Cut) / 1000000000 := by
  rw [jarlskogSqCorrected_eq_half]; have := jarlskogSq_hi; linarith

-- The corrected Jarlskog invariant
def jarlskogCorrected : Cut := cutSqrt jarlskogSqCorrected

theorem jarlskogCorrected_lo : (189 : Cut) / 1000000 ≤ jarlskogCorrected := by
  unfold jarlskogCorrected
  apply le_cutSqrt_of_sq_le jarlskogSqCorrected_nonneg (by norm_num)
  have := jarlskogSqCorrected_lo; nlinarith [this]
theorem jarlskogCorrected_hi : jarlskogCorrected ≤ (193 : Cut) / 1000000 := by
  unfold jarlskogCorrected
  apply cutSqrt_le_of_sq_le (by norm_num)
  have := jarlskogSqCorrected_hi; nlinarith [this]

theorem jarlskogCorrected_pos : (0 : Cut) < jarlskogCorrected := by
  have := jarlskogCorrected_lo; linarith

-- ★ downward: jarlskogCorrected < jarlskog (N344), the direction toward the measured value
theorem jarlskogCorrected_lt : jarlskogCorrected < jarlskog := by
  have h1 := jarlskogCorrected_hi
  have h2 := jarlskog_lo
  linarith

end

end Phys.Algebra.CKMProbe
