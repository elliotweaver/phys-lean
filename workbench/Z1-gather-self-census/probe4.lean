import Phys.Algebra.TowerGatherChargeIsospinRatio
import Phys.Algebra.FineStructureRunningExact
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.Tactic

open Matrix
open scoped BigOperators

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

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
  apply Finset.sum_congr rfl; intro i _
  rw [← Finset.sum_neg_distrib]
  apply Finset.sum_congr rfl; intro j _
  rw [hentry i j]; ring

-- Cmat viewed as a Mathlib matrix over ℤ.  Is it skew?
example : (Cmat : Matrix (Fin 7) (Fin 7) ℤ)ᵀ = -(Cmat : Matrix (Fin 7) (Fin 7) ℤ) := by decide

-- traceSq of Cmat over ℤ (should be -6)
example : traceSq (Cmat : Matrix (Fin 7) (Fin 7) ℤ) = -6 := by
  rw [traceSq_skew _ (by decide)]
  unfold hsCensus
  decide

-- hsCensus Cmat = 6
example : hsCensus (Cmat : Matrix (Fin 7) (Fin 7) ℤ) = 6 := by unfold hsCensus; decide

-- does the banked tr7(mul7) equal the Mathlib traceSq?
-- tr7 M = M 0 0 + ... ; mul7 A B i k = ∑ j A i j * B j k
example : tr7 (mul7 Cmat Cmat) = traceSq (Cmat : Matrix (Fin 7) (Fin 7) ℤ) := by
  unfold traceSq
  rw [Matrix.trace]
  simp only [tr7, mul7, Matrix.diag_apply, Matrix.mul_apply, Fin.sum_univ_seven]

end

end Phys.Algebra
