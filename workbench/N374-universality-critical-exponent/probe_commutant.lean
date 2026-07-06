import Mathlib.Tactic
import Mathlib.LinearAlgebra.Matrix.Permutation
import Mathlib.LinearAlgebra.Matrix.Trace

open scoped BigOperators
open Matrix

noncomputable section

/-! MEASURE: the commutant step. Equivariance ⟹ M = aI + bJ, entrywise:
    M i j = if i = j then (M 0 0) else (M 0 1). Risk = 2-transitivity via hand-built perm. -/

variable {N : ℕ}

-- the all-ones matrix
def Jall (N : ℕ) : Matrix (Fin N) (Fin N) ℚ := fun _ _ => 1

-- Equivariance hypothesis in elementary form
-- hM : ∀ σ i j, M (σ i) (σ j) = M i j

/-- diagonal constant: M i i = M j j via swap. -/
example (M : Matrix (Fin N) (Fin N) ℚ)
    (hM : ∀ (σ : Equiv.Perm (Fin N)) i j, M (σ i) (σ j) = M i j)
    (i j : Fin N) : M i i = M j j := by
  have := hM (Equiv.swap i j) i i
  rw [Equiv.swap_apply_left] at this
  -- this : M j j = M i i
  exact this.symm

/-- off-diagonal constant: M i j = M k l for i≠j, k≠l. Build σ with σ i = k, σ j = l. -/
example (M : Matrix (Fin N) (Fin N) ℚ)
    (hM : ∀ (σ : Equiv.Perm (Fin N)) i j, M (σ i) (σ j) = M i j)
    (i j k l : Fin N) (hij : i ≠ j) (hkl : k ≠ l) : M i j = M k l := by
  -- σ := swap ((swap i k) j) l * (swap i k)
  set a := Equiv.swap i k with ha
  -- a i = k, a j ≠ k (since a j = k ⟺ j = i, false)
  have haj : a j ≠ k := by
    rw [ha]
    intro h
    -- swap i k j = k  ⟹ j = i
    by_cases hji : j = i
    · exact hij hji.symm
    · by_cases hjk : j = k
      · rw [hjk, Equiv.swap_apply_right] at h; exact hij (by rw [hjk]; exact h.symm ▸ rfl)
      · rw [Equiv.swap_apply_of_ne_of_ne hji hjk] at h; exact hjk h
  set σ := (Equiv.swap (a j) l) * a with hσ
  have hσi : σ i = k := by
    simp only [hσ, Equiv.Perm.mul_apply]
    rw [ha, Equiv.swap_apply_left]
    -- swap (a j) l k = k  since k ≠ a j and k ≠ l
    rw [Equiv.swap_apply_of_ne_of_ne (Ne.symm haj) hkl]
  have hσj : σ j = l := by
    simp only [hσ, Equiv.Perm.mul_apply]
    rw [Equiv.swap_apply_left]
  have := hM σ i j
  rw [hσi, hσj] at this
  exact this.symm

end
