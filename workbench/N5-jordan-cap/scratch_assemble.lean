import Phys.Algebra.HermitianJordan.Setup

open Phys.Cascade
open Phys.Cascade.CD
open Phys.Algebra
open Phys.Algebra.HJ
open Matrix

attribute [local instance] CD.narCD CD.srCD

-- Proxy entry lemmas (cheap: assert the entries of the ZERO matrix vanish, provable by rfl/simp),
-- ONLY to validate the assembler index-dispatch plumbing (ext + fin_cases + exact).
-- Uses the SAME shape as the real entry lemmas: a scalar equation `M i j = 0`.
theorem px00 : (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 0 = 0 := by simp
theorem px01 : (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 1 = 0 := by simp
theorem px02 : (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 2 = 0 := by simp
theorem px10 : (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1 0 = 0 := by simp
theorem px11 : (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1 1 = 0 := by simp
theorem px12 : (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 1 2 = 0 := by simp
theorem px20 : (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 2 0 = 0 := by simp
theorem px21 : (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 2 1 = 0 := by simp
theorem px22 : (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 2 2 = 0 := by simp

-- Now: can we assemble a matrix = 0 from the 9 entry equations via ext + fin_cases + exact?
example : (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) = 0 := by
  ext i j
  fin_cases i <;> fin_cases j
  · exact px00
  · exact px01
  · exact px02
  · exact px10
  · exact px11
  · exact px12
  · exact px20
  · exact px21
  · exact px22
