import Phys.Algebra.OctonionJordanInnerMultiplication
import Phys.Algebra.OctonionJordanHermDerivationAlgebra
import Phys.Algebra.OctonionJordanInnerDerivationLeibniz
import Phys.Algebra.OctonionJordanFormallyReal
import Phys.Algebra.OctonionJordanFamilyRotationGenerators
import Mathlib.Tactic

/-! N295 de-risk probe 2: the KEY derivation `derH3_kills_one` (T 1 = 0) proof. -/
namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- jb 1 1 = 1*1 + 1*1 = 1 + 1 = 2•1 ; the identity matrix (1 : Matrix) is Hermitian.
example : ((1:Matrix (Fin 3) (Fin 3) (O ℚ)))ᴴ = (1:Matrix (Fin 3) (Fin 3) (O ℚ)) :=
  Matrix.conjTranspose_one

-- KEY: every T ∈ derH3 kills the identity.
-- Leibniz at A=B=1: T(jb 1 1) = jb (T 1) 1 + jb 1 (T 1).
-- jb 1 1 = 2 • 1, jb X 1 = X*1 + 1*X = X + X = 2•X, jb 1 X = 2•X.
-- So T(2•1) = 2•(T1) [LHS by linearity], RHS = 2•(T1) + 2•(T1) = 4•(T1).
-- Hence 2•(T1) = 4•(T1) ⟹ 2•(T1) = 0 ⟹ T1 = 0.
example (T : Module.End ℚ (Matrix (Fin 3) (Fin 3) (O ℚ))) (hT : T ∈ derH3) : T 1 = 0 := by
  have hone : ((1:Matrix (Fin 3) (Fin 3) (O ℚ)))ᴴ = (1:Matrix (Fin 3) (Fin 3) (O ℚ)) :=
    Matrix.conjTranspose_one
  have hleib := hT.2 1 1 hone hone
  -- jb 1 1 = 1 + 1
  have hjb11 : jb (1:Matrix (Fin 3) (Fin 3) (O ℚ)) 1 = (1:Matrix (Fin 3) (Fin 3) (O ℚ)) + 1 := by
    unfold jb; rw [mul_one]
  -- jb (T 1) 1 = T 1 + T 1
  have hjbL : jb (T 1) (1:Matrix (Fin 3) (Fin 3) (O ℚ)) = T 1 + T 1 := by
    unfold jb; rw [mul_one, one_mul]
  -- jb 1 (T 1) = T 1 + T 1
  have hjbR : jb (1:Matrix (Fin 3) (Fin 3) (O ℚ)) (T 1) = T 1 + T 1 := by
    unfold jb; rw [mul_one, one_mul, add_comm]
  rw [hjb11, map_add, hjbL, hjbR] at hleib
  -- hleib : T 1 + T 1 = (T 1 + T 1) + (T 1 + T 1)
  -- ⟹ T 1 = 0
  have : T 1 + T 1 = 0 := by
    have h2 := hleib
    -- (T1+T1) = (T1+T1)+(T1+T1) ⟹ 0 = (T1+T1)
    linear_combination (norm := abel) -h2
  -- T1 + T1 = 0 ⟹ T1 = 0  (2 • T1 = 0 in a ℚ-vector space)
  have h2 : (2:ℚ) • T 1 = 0 := by rw [two_smul]; exact this
  exact (smul_eq_zero.mp h2).resolve_left (by norm_num)

#print axioms Matrix.conjTranspose_one
end
end Phys.Algebra.HJ
