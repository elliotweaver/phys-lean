import Mathlib.Tactic
import Mathlib.LinearAlgebra.Matrix.Trace

open Matrix
open scoped BigOperators

noncomputable section

variable {n : ℕ}

/-- Hilbert–Schmidt census: the sum of squares of the entries. -/
def hsCensus {R : Type*} [CommRing R] (M : Matrix (Fin n) (Fin n) R) : R :=
  ∑ i, ∑ j, (M i j)^2

/-- trace of M*M. -/
def traceSq {R : Type*} [CommRing R] (M : Matrix (Fin n) (Fin n) R) : R :=
  (M * M).trace

-- Probe 1: trace(M*M) = ∑ i, ∑ j, M i j * M j i   (general commring)
example {R : Type*} [CommRing R] (M : Matrix (Fin n) (Fin n) R) :
    traceSq M = ∑ i, ∑ j, M i j * M j i := by
  unfold traceSq
  rw [Matrix.trace]
  simp only [Matrix.diag_apply, Matrix.mul_apply]

-- Probe 2: skew case  Mᵀ = -M  ⟹  traceSq M = - hsCensus M
example {R : Type*} [CommRing R] (M : Matrix (Fin n) (Fin n) R) (hM : Mᵀ = -M) :
    traceSq M = - hsCensus M := by
  have hentry : ∀ i j, M j i = -(M i j) := by
    intro i j
    have := congrArg (fun (A : Matrix (Fin n) (Fin n) R) => A i j) hM
    simpa [Matrix.transpose_apply] using this
  unfold traceSq hsCensus
  rw [Matrix.trace]
  simp only [Matrix.diag_apply, Matrix.mul_apply]
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro i _
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl
  intro j _
  rw [hentry i j]
  ring

-- Probe 3: symm case  Mᵀ = M  ⟹  traceSq M = hsCensus M
example {R : Type*} [CommRing R] (M : Matrix (Fin n) (Fin n) R) (hM : Mᵀ = M) :
    traceSq M = hsCensus M := by
  have hentry : ∀ i j, M j i = M i j := by
    intro i j
    have := congrArg (fun (A : Matrix (Fin n) (Fin n) R) => A i j) hM
    simpa [Matrix.transpose_apply] using this
  unfold traceSq hsCensus
  rw [Matrix.trace]
  simp only [Matrix.diag_apply, Matrix.mul_apply]
  apply Finset.sum_congr rfl
  intro i _
  apply Finset.sum_congr rfl
  intro j _
  rw [hentry i j]
  ring

end
