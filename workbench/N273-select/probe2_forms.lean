import Phys.Algebra.OctonionJordanGaugeUniversality
import Phys.Algebra.OctonionJordanGenerationCoupling
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

noncomputable def framePerm (σ : Equiv.Perm (Fin 3)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := M.submatrix σ σ

-- group action: identity
example (M : Matrix (Fin 3) (Fin 3) (O ℚ)) : framePerm 1 M = M := by
  unfold framePerm; simp [Equiv.Perm.coe_one, Matrix.submatrix_id_id]

-- group action: composition law
example (σ τ : Equiv.Perm (Fin 3)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    framePerm σ (framePerm τ M) = framePerm (τ * σ) M := by
  unfold framePerm
  rw [Matrix.submatrix_submatrix]
  rfl

-- clean slot permutation laws (transposition (1 2) = swap slots A<->B, fixes C)
example (a : O ℚ) : framePerm (Equiv.swap 1 2) (slotA a) = slotB a := by
  unfold framePerm slotA slotB
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]

example (b : O ℚ) : framePerm (Equiv.swap 1 2) (slotB b) = slotA b := by
  unfold framePerm slotA slotB
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]

example (c : O ℚ) : framePerm (Equiv.swap 1 2) (slotC c) = slotC c := by
  unfold framePerm slotC
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]

-- transposition (0 2) = swap slots B<->C, fixes A
example (a : O ℚ) : framePerm (Equiv.swap 0 2) (slotA a) = slotC a := by
  unfold framePerm slotA slotC
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;> simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]

-- THE HEADLINE (commutes with gauge, all σ D) -- rfl
example (σ : Equiv.Perm (Fin 3)) (D : Module.End ℚ (O ℚ)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    framePerm σ (jAct D M) = jAct D (framePerm σ M) := rfl

-- Jordan automorphism
example (σ : Equiv.Perm (Fin 3)) (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    framePerm σ (jb A B) = jb (framePerm σ A) (framePerm σ B) := by
  unfold jb framePerm
  rw [Matrix.submatrix_mul_equiv A B σ σ σ, Matrix.submatrix_mul_equiv B A σ σ σ]; rfl

-- diagonal fixed? framePerm σ (Dg t t t) = Dg t t t only if constant diagonal; general Dg permutes diag.
-- W8: nontrivial family move (swap12 moves slotA to slotB, distinct)
example (a : O ℚ) (ha : a ≠ 0) : framePerm (Equiv.swap 1 2) (slotA a) ≠ slotA a := by
  intro h
  have : slotB a = slotA a := by rw [← h]; unfold framePerm slotA slotB;
                                  apply Matrix.ext; intro i j
                                  fin_cases i <;> fin_cases j <;> simp [Xz, Matrix.submatrix_apply, Equiv.swap_apply_def]
  exact absurd (slot_disjointAB a a this.symm).1 ha

end Phys.Algebra.HJ
