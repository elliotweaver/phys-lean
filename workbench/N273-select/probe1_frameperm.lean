import Phys.Algebra.OctonionJordanGaugeUniversality
import Phys.Algebra.OctonionJordanGenerationCoupling
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

/-- The family action: reindex rows and columns by the permutation σ of the three frame positions. -/
noncomputable def framePerm (σ : Equiv.Perm (Fin 3)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := M.submatrix σ σ

-- PROBE 1: ring-hom (multiplicative) for free via submatrix_mul_equiv
example (σ : Equiv.Perm (Fin 3)) (M N : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    framePerm σ (M * N) = framePerm σ M * framePerm σ N := by
  unfold framePerm
  rw [Matrix.submatrix_mul_equiv M N σ σ σ]

-- PROBE 2: additive
example (σ : Equiv.Perm (Fin 3)) (M N : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    framePerm σ (M + N) = framePerm σ M + framePerm σ N := by
  unfold framePerm; rfl

-- PROBE 3: Jordan automorphism (preserves jb)
example (σ : Equiv.Perm (Fin 3)) (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    framePerm σ (jb A B) = jb (framePerm σ A) (framePerm σ B) := by
  unfold jb framePerm
  rw [Matrix.submatrix_add, Matrix.submatrix_mul_equiv A B σ σ σ,
      Matrix.submatrix_mul_equiv B A σ σ σ]

-- PROBE 4 (THE HEADLINE): commutes with the entrywise gauge jAct
example (σ : Equiv.Perm (Fin 3)) (D : Module.End ℚ (O ℚ)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    framePerm σ (jAct D M) = jAct D (framePerm σ M) := by
  unfold framePerm jAct
  rfl

end Phys.Algebra.HJ
