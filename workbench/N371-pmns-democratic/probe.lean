import Phys.Algebra.NeutrinoMasslessGeneration
import Phys.Algebra.GenerationMixingAnglesNumeric
import Mathlib.Tactic

/-! PROBE N371 — the trimaximal PMNS column from the self-blind massless ν direction.
    De-risk: the democratic column weight (component weight of the massless eigenvector selfDir)
    is 1/3 for each flavor (equipartition), sums to 1, and is LARGE vs each small CKM angle. -/

namespace Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Algebra.GenerationMixingAngles
open Matrix

noncomputable section

-- The democratic column weight: the normalized component weight of the massless ν eigenvector
-- selfDir=(1,1,1) (N336) — the analog of N343 sinSqMix_born but for the SELF-BLIND direction.
def demColumnWeight (α : Fin 3) : Cut := (selfDir α) ^ 2 / (∑ j, (selfDir j) ^ 2)

-- The Born-normalization of the democratic direction: ‖selfDir‖² = 3.
theorem selfDir_normSq : (∑ j, (selfDir j) ^ 2) = (3 : Cut) := by
  simp only [selfDir, Fin.sum_univ_three, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.head_cons, Matrix.cons_val_two, Matrix.tail_cons]
  norm_num

-- Each component of selfDir squared is 1.
theorem selfDir_comp_sq (α : Fin 3) : (selfDir α) ^ 2 = (1 : Cut) := by
  fin_cases α <;>
    simp only [selfDir, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_two, Matrix.tail_cons] <;> norm_num

-- ★ THE TRIMAXIMAL COLUMN: each flavor's democratic weight is EXACTLY 1/3 (equipartition).
theorem demColumnWeight_eq (α : Fin 3) : demColumnWeight α = (1 : Cut) / 3 := by
  unfold demColumnWeight
  rw [selfDir_normSq, selfDir_comp_sq]

-- ★ EQUIPARTITION: all three flavor weights are EQUAL — maximal non-hierarchy.
theorem demColumn_equipartition (α β : Fin 3) : demColumnWeight α = demColumnWeight β := by
  rw [demColumnWeight_eq, demColumnWeight_eq]

-- ★ THE COLUMN IS NORMALIZED: the three weights sum to 1 (unitarity of the column).
theorem demColumn_sum_one : (∑ α, demColumnWeight α) = (1 : Cut) := by
  simp only [Fin.sum_univ_three, demColumnWeight_eq]
  norm_num

-- ★★ THE MECHANISM SPLIT: the democratic (massless-ν) column weight 1/3 is LARGE compared
-- to each small hierarchical CKM angle (N343). Same frame-overlap machinery, different frame.
theorem demColumn_gt_ckm_12 : sinSqMix mass1 mass2 < demColumnWeight 0 := by
  rw [demColumnWeight_eq]
  have h := sinSq12_hi
  have : (482 : Cut) / 100000 < 1 / 3 := by norm_num
  linarith

theorem demColumn_gt_ckm_23 : sinSqMix mass2 mass0 < demColumnWeight 0 := by
  rw [demColumnWeight_eq]
  have h := sinSq23_hi
  have : (562 : Cut) / 10000 < 1 / 3 := by norm_num
  linarith

theorem demColumn_gt_ckm_13 : sinSqMix mass1 mass0 < demColumnWeight 0 := by
  rw [demColumnWeight_eq]
  have h := sinSq13_hi
  have : (288 : Cut) / 1000000 < 1 / 3 := by norm_num
  linarith

-- Re-export the masslessness tie: the democratic direction IS the massless zero-mode (N336).
theorem demColumn_is_massless_dir (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) :
    massOfDir (othersProj * D0) M selfDir = 0 :=
  self_generation_massless D0 M

-- Non-vacuity: the democratic weight is a genuine number in (0,1).
theorem demColumn_mem : (0 : Cut) < demColumnWeight 0 ∧ demColumnWeight 0 < 1 := by
  rw [demColumnWeight_eq]; constructor <;> norm_num

end

end Phys.Algebra
