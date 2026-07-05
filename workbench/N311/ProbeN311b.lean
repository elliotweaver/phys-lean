/-
PROBE N311b — nail the if-reduction tactic on Fin literals.
-/
import Phys.Algebra.OctonionJordanGenerationAssociatorDeviation
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

def coupl (M A p r : ℚ) (i j : Fin 3) : ℚ := genVec M A p r i * genVec M A p r j

noncomputable def mixMat (M A p r : ℚ) : Matrix (Fin 3) (Fin 3) ℚ :=
  Matrix.of (fun i j =>
    if i = j then massVec M A p r i
    else if (i = 0 ∧ j = 2) ∨ (i = 2 ∧ j = 0) then 0
    else coupl M A p r i j)

theorem mixMat_01 (M A p r : ℚ) : mixMat M A p r 0 1 = genVec M A p r 0 * genVec M A p r 1 := by
  simp [mixMat, coupl]

theorem mixMat_geomean_01 (M A p r : ℚ) :
    (mixMat M A p r 0 1) ^ 2 = massVec M A p r 0 * massVec M A p r 1 := by
  rw [mixMat_01]; simp only [massVec]; ring

theorem mixMat_geomean_12 (M A p r : ℚ) :
    (mixMat M A p r 1 2) ^ 2 = massVec M A p r 1 * massVec M A p r 2 := by
  have h : mixMat M A p r 1 2 = genVec M A p r 1 * genVec M A p r 2 := by simp [mixMat, coupl]
  rw [h]; simp only [massVec]; ring

theorem mixMat_13_zero (M A p r : ℚ) : mixMat M A p r 0 2 = 0 ∧ mixMat M A p r 2 0 = 0 := by
  constructor <;> simp [mixMat]

theorem gst_relation_01 (M A p r : ℚ) (h1 : massVec M A p r 1 ≠ 0) :
    (mixMat M A p r 0 1 / massVec M A p r 1) ^ 2 * massVec M A p r 1 = massVec M A p r 0 := by
  rw [mixMat_01]; simp only [massVec] at *; field_simp; ring

end Phys.Algebra.HJ
