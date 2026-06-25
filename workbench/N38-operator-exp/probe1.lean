import Phys.Algebra.DerivationAutCompactTopo
import Mathlib.Data.Matrix.Basic

namespace Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- PROBE 0: does Matrix (Fin 8) (Fin 8) Cut carry a Ring (so M*N, M^n typecheck)?
example (M N : Matrix (Fin 8) (Fin 8) Cut) : Matrix (Fin 8) (Fin 8) Cut := M * N
example (M : Matrix (Fin 8) (Fin 8) Cut) (n : ℕ) : Matrix (Fin 8) (Fin 8) Cut := M ^ n

def opNorm (M : Matrix (Fin 8) (Fin 8) Cut) : Cut := ∑ i, ∑ j, |M i j|

-- row sum ≤ total (helper)
example (N : Matrix (Fin 8) (Fin 8) Cut) (j : Fin 8) : ∑ k, |N j k| ≤ opNorm N := by
  unfold opNorm
  exact Finset.single_le_sum (f := fun j' => ∑ k, |N j' k|)
    (fun j' _ => Finset.sum_nonneg (fun _ _ => abs_nonneg _)) (Finset.mem_univ j)

-- PROBE 4 (THE LOAD-BEARING ONE): submultiplicativity via sum_comm + mul_sum (no sum_mul_sum)
example (M N : Matrix (Fin 8) (Fin 8) Cut) : opNorm (M * N) ≤ opNorm M * opNorm N := by
  have hrow : ∀ j : Fin 8, ∑ k, |N j k| ≤ opNorm N := by
    intro j
    exact Finset.single_le_sum (f := fun j' => ∑ k, |N j' k|)
      (fun j' _ => Finset.sum_nonneg (fun _ _ => abs_nonneg _)) (Finset.mem_univ j)
  -- step 1: |(MN)ᵢₖ| ≤ ∑ⱼ |Mᵢⱼ||Nⱼₖ|
  have step1 : opNorm (M * N) ≤ ∑ i, ∑ k, ∑ j, |M i j| * |N j k| := by
    unfold opNorm
    apply Finset.sum_le_sum; intro i _
    apply Finset.sum_le_sum; intro k _
    rw [Matrix.mul_apply]
    calc |∑ j, M i j * N j k| ≤ ∑ j, |M i j * N j k| := Finset.abs_sum_le_sum_abs _ _
      _ = ∑ j, |M i j| * |N j k| := by simp [abs_mul]
  refine step1.trans ?_
  -- reorder k,j then factor; bound row sum; collapse to opNorm M * opNorm N
  calc ∑ i, ∑ k, ∑ j, |M i j| * |N j k|
      = ∑ i, ∑ j, ∑ k, |M i j| * |N j k| := by
        apply Finset.sum_congr rfl; intro i _; exact Finset.sum_comm
    _ = ∑ i, ∑ j, |M i j| * (∑ k, |N j k|) := by
        apply Finset.sum_congr rfl; intro i _
        apply Finset.sum_congr rfl; intro j _
        rw [Finset.mul_sum]
    _ ≤ ∑ i, ∑ j, |M i j| * opNorm N := by
        apply Finset.sum_le_sum; intro i _
        apply Finset.sum_le_sum; intro j _
        exact mul_le_mul_of_nonneg_left (hrow j) (abs_nonneg _)
    _ = (∑ i, ∑ j, |M i j|) * opNorm N := by
        rw [Finset.sum_mul]; apply Finset.sum_congr rfl; intro i _; rw [Finset.sum_mul]
    _ = opNorm M * opNorm N := by unfold opNorm; rfl

end
end Phys.Algebra
