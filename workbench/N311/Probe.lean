import Phys.Algebra.OctonionJordanGenerationMassRatios
import Mathlib.Tactic

namespace Phys.Algebra.HJ.ProbeN311

open Phys.Algebra Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Matrix

attribute [local instance] CD.narCD CD.srCD

/-! Probe: the cascade-path open adjacency (corner-zero), the tridiagonal mass-coupling matrix
    with amplitude-product off-diagonals, the geometric-mean = Born-squared relation, GST leading
    angle. All ℚ-exact. Confirm the route before production. -/

/-- Cascade-doubling adjacency: the OPEN PATH P₃ (ℂ→ℍ→𝕆), nearest-neighbour = 1, corner = 0. -/
def cascadePath : Matrix (Fin 3) (Fin 3) ℚ := !![0, 1, 0; 1, 0, 1; 0, 1, 0]

-- corner-zero (M₁₃ = 0)
example : cascadePath 0 2 = 0 := by decide
example : cascadePath 2 0 = 0 := by decide
-- nearest-neighbour couplings present
example : cascadePath 0 1 = 1 ∧ cascadePath 1 2 = 1 := by decide
-- diagonal zero
example : ∀ i : Fin 3, cascadePath i i = 0 := by decide

-- OPEN ≠ CLOSED: differ exactly at the corner (banked seeMat = closed cycle has corner 1)
example : seeMat 0 2 = 1 := by simp [seeMat, Jall, Matrix.one_apply, Matrix.sub_apply]
example : cascadePath ≠ seeMat := by
  intro h
  have h02 : cascadePath 0 2 = seeMat 0 2 := by rw [h]
  simp [cascadePath, seeMat, Jall, Matrix.one_apply, Matrix.sub_apply] at h02

/-- The tridiagonal mass-coupling matrix: diagonal = banked masses, nearest-neighbour off-diag =
    banked amplitude products aᵢaⱼ (= √(mᵢmⱼ) via Born squares), corner 0. -/
noncomputable def massMat (M A p r : ℚ) : Matrix (Fin 3) (Fin 3) ℚ :=
  !![ massVec M A p r 0,                  genVec M A p r 0 * genVec M A p r 1, 0;
      genVec M A p r 0 * genVec M A p r 1, massVec M A p r 1,                  genVec M A p r 1 * genVec M A p r 2;
      0,                                   genVec M A p r 1 * genVec M A p r 2, massVec M A p r 2 ]

-- diagonal = banked masses
example (M A p r : ℚ) : massMat M A p r 0 0 = massVec M A p r 0 := by simp [massMat]
example (M A p r : ℚ) : massMat M A p r 1 1 = massVec M A p r 1 := by simp [massMat]
-- corner zero
example (M A p r : ℚ) : massMat M A p r 0 2 = 0 := by simp [massMat]
example (M A p r : ℚ) : massMat M A p r 2 0 = 0 := by simp [massMat]
-- symmetric
example (M A p r : ℚ) : massMat M A p r 0 1 = massMat M A p r 1 0 := by simp [massMat]

-- geometric-mean coupling = Born-squared: (offdiag)² = product of adjacent masses
example (M A p r : ℚ) :
    (massMat M A p r 0 1) ^ 2 = massVec M A p r 0 * massVec M A p r 1 := by
  simp only [massMat, massVec, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.head_cons, Matrix.empty_val', Matrix.cons_val_fin_one,
    Matrix.head_fin_const]
  ring

-- GST leading-order angle: (aᵢ/aⱼ)² = mᵢ/mⱼ  (ℚ-exact)
example (M A p r : ℚ) (hj : genVec M A p r 2 ≠ 0) :
    (genVec M A p r 1 / genVec M A p r 2) ^ 2 = massVec M A p r 1 / massVec M A p r 2 := by
  simp only [massVec]
  rw [div_pow]

-- non-vacuity: massMat genuinely tridiagonal (corner 0) but nearest-neighbour nonzero for generic A
example (M A : ℚ) (hM : M ≠ 0) (hA : A ≠ 0) :
    massMat M A 1 0 0 1 ≠ 0 := by
  simp only [massMat, genVec, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
    Matrix.cons_val_one, Matrix.head_cons, Matrix.empty_val', Matrix.cons_val_fin_one]
  sorry -- placeholder to measure; will make concrete

end Phys.Algebra.HJ.ProbeN311
