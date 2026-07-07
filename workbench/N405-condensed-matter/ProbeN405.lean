import Phys.Algebra.UniversalityCriticalExponent
import Phys.Algebra.MaxEntArrowOfTime
import Mathlib.Tactic

/-!  N405 PROBE — de-risk the L4 route BEFORE production.
     Weld: the universality fixed point (G2, chanProj / criticalProjector_unique) has as its rows the
     maxent equilibrium (G3, uniformState); the order parameter = the deviation self-datum. -/

namespace N405Probe

open Phys.Algebra.Universality
open Phys.Algebra.MaxEnt
open Phys.Foundation Module
open Phys.Foundation.ContinuumQ
open Phys.Algebra
open Matrix

-- 1. uniform entries of the totalization projector (both diag and off give 1/n)
theorem chanProj_entry_uniform (n : ℕ) (i j : Fin n) :
    chanProj n i j = 1 / (n : ℚ) := by
  simp only [chanProj, chanTot, Matrix.smul_apply, smul_eq_mul, mul_one]

-- 2. THE CAST WELD: the ℚ-entry 1/n casts to the Cut equilibrium (n:Cut)⁻¹
theorem cast_weld (n : ℕ) (j : Fin n) :
    (((1 : ℚ) / (n : ℚ) : ℚ) : Cut) = uniformState n j := by
  unfold uniformState
  push_cast
  rw [one_div]

-- 3. row of the fixed point = equilibrium
theorem critProjRow_eq_equilibrium (n : ℕ) (i j : Fin n) :
    ((chanProj n i j : ℚ) : Cut) = uniformState n j := by
  rw [chanProj_entry_uniform]; exact cast_weld n j

-- 4. ★★ THE ABSTRACT WELD via criticalProjector_unique
theorem equilibrium_is_universality_fixedpoint {n : ℕ} (hN : 2 ≤ n)
    {M : Matrix (Fin n) (Fin n) ℚ}
    (hEq : Equivariant M) (hSR : SumReading M) (hIdem : M * M = M) (hNe : M ≠ 0)
    (i j : Fin n) :
    ((M i j : ℚ) : Cut) = uniformState n j := by
  rw [criticalProjector_unique hN hEq hSR hIdem hNe]
  exact critProjRow_eq_equilibrium n i j

-- 5. qWit = uniformState 2
theorem qWit_eq_uniform : qWit = uniformState 2 := by
  funext i
  unfold qWit uniformState
  fin_cases i <;> · norm_num

-- 6. order parameter def + vanishing pattern
noncomputable def orderParam {n : ℕ} (p : Fin n → Cut) : Cut := relInfo p (uniformState n)

theorem orderParam_disordered_zero (n : ℕ) :
    orderParam (uniformState n) = 0 := relInfo_self _

theorem orderParam_zero_iff_symmetric {n : ℕ} [NeZero n] (p : Fin n → Cut)
    (hp : ∀ i, 0 < p i) (hsp : ∑ i, p i = 1) :
    orderParam p = 0 ↔ p = uniformState n := by
  unfold orderParam
  exact relInfo_zero_iff p (uniformState n) hp uniformState_pos hsp uniformState_sum_one

-- 7. ★ ordered phase strictly deviates
theorem orderParam_ordered_pos : 0 < orderParam pWit := by
  unfold orderParam
  rw [← qWit_eq_uniform]
  exact maxent_deviation_pos

-- 8. two-regime cross-tie
theorem universality_two_regime :
    (84 : ℚ) = 2 / alphaStar
      ∧ (84 : ℚ) = 2 * (imChannelCount (Module.finrank ℚ ImO) : ℚ) :=
  scaleTowerNumerator_eq

-- 9. W8 tooth: a real transition
theorem orderParam_ordered_ne_disordered :
    orderParam pWit ≠ orderParam (uniformState 2) := by
  rw [orderParam_disordered_zero]
  exact ne_of_gt orderParam_ordered_pos

end N405Probe
