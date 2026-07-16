import Mathlib.Tactic
import Mathlib.LinearAlgebra.Matrix.Trace

open Matrix
open scoped BigOperators

noncomputable section

variable {n : ℕ}

def hsCensus {R : Type*} [CommRing R] (M : Matrix (Fin n) (Fin n) R) : R :=
  ∑ i, ∑ j, (M i j)^2

def traceSq {R : Type*} [CommRing R] (M : Matrix (Fin n) (Fin n) R) : R :=
  (M * M).trace

theorem traceSq_skew {R : Type*} [CommRing R] (M : Matrix (Fin n) (Fin n) R) (hM : Mᵀ = -M) :
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
  rw [hentry i j]; ring

-- census nonneg over ordered field
theorem hsCensus_nonneg {R : Type*} [Field R] [LinearOrder R] [IsStrictOrderedRing R]
    (M : Matrix (Fin n) (Fin n) R) : 0 ≤ hsCensus M := by
  unfold hsCensus
  apply Finset.sum_nonneg; intro i _
  apply Finset.sum_nonneg; intro j _
  positivity

-- census = 0 iff M = 0
theorem hsCensus_eq_zero_iff {R : Type*} [Field R] [LinearOrder R] [IsStrictOrderedRing R]
    (M : Matrix (Fin n) (Fin n) R) : hsCensus M = 0 ↔ M = 0 := by
  unfold hsCensus
  constructor
  · intro h
    have hz : ∀ i ∈ Finset.univ, ∑ j, (M i j)^2 = 0 := by
      apply (Finset.sum_eq_zero_iff_of_nonneg _).mp h
      intro i _; apply Finset.sum_nonneg; intro j _; positivity
    ext i j
    have hi := hz i (Finset.mem_univ i)
    have hj : ∀ j ∈ Finset.univ, (M i j)^2 = 0 := by
      apply (Finset.sum_eq_zero_iff_of_nonneg _).mp hi
      intro j _; positivity
    have := hj j (Finset.mem_univ j)
    simpa using pow_eq_zero_iff (by norm_num) |>.mp this
  · intro h; subst h; simp

-- skew ⟹ traceSq ≤ 0, and < 0 for M ≠ 0
theorem traceSq_skew_nonpos {R : Type*} [Field R] [LinearOrder R] [IsStrictOrderedRing R]
    (M : Matrix (Fin n) (Fin n) R) (hM : Mᵀ = -M) : traceSq M ≤ 0 := by
  rw [traceSq_skew M hM]; linarith [hsCensus_nonneg M]

theorem traceSq_skew_neg {R : Type*} [Field R] [LinearOrder R] [IsStrictOrderedRing R]
    (M : Matrix (Fin n) (Fin n) R) (hM : Mᵀ = -M) (hne : M ≠ 0) : traceSq M < 0 := by
  rw [traceSq_skew M hM]
  have h1 : 0 ≤ hsCensus M := hsCensus_nonneg M
  have h2 : hsCensus M ≠ 0 := fun h => hne ((hsCensus_eq_zero_iff M).mp h)
  have : 0 < hsCensus M := lt_of_le_of_ne h1 (Ne.symm h2)
  linarith

-- garbage witness: a 2x2 matrix neither skew nor symm has traceSq > 0
example : traceSq (!![(1:ℚ),1;0,0]) = 1 := by
  unfold traceSq
  simp [Matrix.trace, Matrix.mul_apply, Fin.sum_univ_two]

-- the garbage matrix is NOT skew (transpose ≠ neg)
example : (!![(1:ℚ),1;0,0])ᵀ ≠ -(!![(1:ℚ),1;0,0]) := by decide

end
