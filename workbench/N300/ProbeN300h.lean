import Phys.Algebra.OctonionJordanHermTraceCommutator
import Mathlib.Tactic

/-! N300 PROBE H — the PERMUTATION lever (for φ(E_00)=φ(E_11)=φ(E_22)). -/

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD

-- permutation conjugation X ↦ X.submatrix σ σ
noncomputable def pconj (σ : Equiv.Perm (Fin 3)) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := X.submatrix σ σ

-- jb homomorphism (submatrix_mul_equiv, no associativity)
theorem pconj_jb (σ : Equiv.Perm (Fin 3)) (C X : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    pconj σ (jb C X) = jb (pconj σ C) (pconj σ X) := by
  unfold pconj jb
  rw [Matrix.submatrix_add, Matrix.submatrix_mul_equiv, Matrix.submatrix_mul_equiv]

-- involutive when σ∘σ = id (σ an involution, e.g. a transposition)
theorem pconj_invol (σ : Equiv.Perm (Fin 3)) (hσ : σ * σ = 1)
    (X : Matrix (Fin 3) (Fin 3) (O ℚ)) : pconj σ (pconj σ X) = X := by
  unfold pconj
  rw [Matrix.submatrix_submatrix]
  have : (σ ∘ σ : Fin 3 → Fin 3) = id := by
    funext i; simp only [Function.comp_apply]
    have := Equiv.Perm.mul_apply σ σ i
    rw [hσ] at this; simpa using this.symm
  rw [this, Matrix.submatrix_id_id]

-- hermSub preservation
theorem pconj_herm (σ : Equiv.Perm (Fin 3)) {X : Matrix (Fin 3) (Fin 3) (O ℚ)} (hX : Xᴴ = X) :
    (pconj σ X)ᴴ = pconj σ X := by
  unfold pconj
  rw [Matrix.conjTranspose_submatrix, hX]

-- linear
theorem pconj_add (σ) (X Y : Matrix (Fin 3) (Fin 3) (O ℚ)) : pconj σ (X + Y) = pconj σ X + pconj σ Y := by
  unfold pconj; rw [Matrix.submatrix_add]
theorem pconj_smul (σ) (r : ℚ) (X : Matrix (Fin 3) (Fin 3) (O ℚ)) : pconj σ (r • X) = r • pconj σ X := by
  unfold pconj; rw [Matrix.submatrix_smul]

end Phys.Algebra.HJ
