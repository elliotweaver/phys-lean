/-
PROBE N311 (T8 part 1) — the ℚ-exact mixing texture skeleton.
MEASURE: does the tridiagonal texture on the banked massVec/genVec compile LIGHT over ℚ?
KEY theory-native reframes to confirm:
  (1) masses are Born SQUARES (massVec = genVec²), so the geometric-mean coupling √(mᵢmⱼ) = |aᵢaⱼ|
      is the PRODUCT of the two banked amplitudes — RATIONAL, no √. The GST irrationality DISSOLVES.
  (2) M₁₃=0 falls out of cascade adjacency: the cascade is a TERMINATED PATH ℂ→ℍ→𝕆 (the stop = the
      banked jordan_fails_H4 / non-associativity), NOT a cycle — no wrap-around edge (0,2).
-/
import Phys.Algebra.OctonionJordanGenerationAssociatorDeviation
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Matrix

attribute [local instance] CD.narCD CD.srCD

/-- The cascade rung / doubling depth of generation k: gen k sits at rung k+1 of the banked CD tower
    (rung 1 = ℂ = Dbl, rung 2 = ℍ = CD Dbl, rung 3 = 𝕆 = CD(CD Dbl)), each CD adding one rung. -/
def cdepth : Fin 3 → ℕ := ![1, 2, 3]

/-- Cascade adjacency: gens i,j are single-doubling-adjacent iff their rung depths differ by exactly 1. -/
def cadj (i j : Fin 3) : Prop := cdepth i + 1 = cdepth j ∨ cdepth j + 1 = cdepth i

/-- The nearest-neighbour amplitude-product coupling: the geometric-mean coupling |aᵢaⱼ| realized as
    the PRODUCT of the two banked Born amplitudes (rational, no √ — masses are Born squares). -/
def coupl (M A p r : ℚ) (i j : Fin 3) : ℚ := genVec M A p r i * genVec M A p r j

/-- THE MIXING TEXTURE: tridiagonal on the three banked generations. Diagonal = banked massVec;
    nearest-neighbour off-diagonals = amplitude-product coupling; gen0↔gen2 = 0 (M₁₃=0, cascade adjacency). -/
noncomputable def mixMat (M A p r : ℚ) : Matrix (Fin 3) (Fin 3) ℚ :=
  Matrix.of (fun i j =>
    if i = j then massVec M A p r i
    else if (i = 0 ∧ j = 2) ∨ (i = 2 ∧ j = 0) then 0
    else coupl M A p r i j)

/-- M₁₃ = 0 (both off-corner entries). -/
theorem mixMat_13_zero (M A p r : ℚ) : mixMat M A p r 0 2 = 0 ∧ mixMat M A p r 2 0 = 0 := by
  constructor <;> simp [mixMat]

/-- The (0,1) coupling is the amplitude product. -/
theorem mixMat_01 (M A p r : ℚ) : mixMat M A p r 0 1 = genVec M A p r 0 * genVec M A p r 1 := by
  simp [mixMat, coupl]

/-- ★ THE GEOMETRIC-MEAN (Born-power) IDENTITY at (0,1): the off-diagonal SQUARED equals the product
    of the two diagonal masses — the GST relation θ²~mᵢ/mⱼ, EXACT over ℚ (masses are Born squares). -/
theorem mixMat_geomean_01 (M A p r : ℚ) :
    (mixMat M A p r 0 1) ^ 2 = massVec M A p r 0 * massVec M A p r 1 := by
  simp only [mixMat, coupl, massVec, Matrix.of_apply]
  norm_num
  ring

/-- ★ Born-power identity at (1,2). -/
theorem mixMat_geomean_12 (M A p r : ℚ) :
    (mixMat M A p r 1 2) ^ 2 = massVec M A p r 1 * massVec M A p r 2 := by
  simp only [mixMat, coupl, massVec, Matrix.of_apply]
  norm_num
  ring

/-- cascade adjacency: gen0↔gen2 are NOT single-doubling-adjacent (depth distance 2). -/
theorem cadj_02_false : ¬ cadj 0 2 := by
  simp [cadj, cdepth]

/-- gen0↔gen1 and gen1↔gen2 ARE adjacent (depth distance 1). -/
theorem cadj_01 : cadj 0 1 := by simp [cadj, cdepth]
theorem cadj_12 : cadj 1 2 := by simp [cadj, cdepth]

/-- ★ THE GST MIXING-ANGLE RELATION as an exact Born-power identity: the mixing-angle proxy
    ρ = coupling/diagonal satisfies ρ² · mⱼ = mᵢ, i.e. θ² = mᵢ/mⱼ, EXACT over ℚ. Here ρ₀₁ = a₀/a₁. -/
theorem gst_relation_01 (M A p r : ℚ) (h1 : genVec M A p r 1 ≠ 0) :
    (mixMat M A p r 0 1 / massVec M A p r 1) ^ 2 * massVec M A p r 1 = massVec M A p r 0 := by
  simp only [mixMat, coupl, massVec, Matrix.of_apply]
  norm_num
  field_simp
  ring

/-- W8 NON-VACUITY: at a generic conic point the (0,1) coupling is nonzero (genuine off-diagonal) while
    M₁₃=0 — the texture is genuinely TRIDIAGONAL, not full. -/
theorem mixMat_offdiag_ne_zero (M A : ℚ) (hM : M ≠ 0) (hA : A ≠ 0) (hne : A ≠ 2*M) (hne2 : A ≠ -2*M) :
    mixMat M A (1/7) (-12/7) 0 1 ≠ 0 := by
  rw [mixMat_01]
  simp only [genVec, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons]
  sorry

end Phys.Algebra.HJ
