import Phys.Algebra.DerivationAutCompactTopo
import Mathlib.Data.Matrix.Basic

namespace Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

def opNorm (M : Matrix (Fin 8) (Fin 8) Cut) : Cut := ∑ i, ∑ j, |M i j|

theorem entry_abs_le_opNorm (M : Matrix (Fin 8) (Fin 8) Cut) (i j : Fin 8) :
    |M i j| ≤ opNorm M := by
  unfold opNorm
  calc |M i j| ≤ ∑ j', |M i j'| :=
        Finset.single_le_sum (f := fun j' => |M i j'|)
          (fun j' _ => abs_nonneg _) (Finset.mem_univ j)
    _ ≤ ∑ i', ∑ j', |M i' j'| :=
        Finset.single_le_sum (f := fun i' => ∑ j', |M i' j'|)
          (fun i' _ => Finset.sum_nonneg (fun _ _ => abs_nonneg _))
          (Finset.mem_univ i)

example (φ : AutO) : opNorm (autMatrix φ) ≤ 64 := by
  unfold opNorm autMatrix
  have hentry : ∀ i j : Fin 8,
      |((coordO ((φ : O ℚ ≃ₗ[ℚ] O ℚ) (bO j)) i : ℚ) : Cut)| ≤ 1 := by
    intro i j
    rw [← Rat.cast_abs]
    have h := AutO_entry_abs_le_one φ i j
    calc ((|coordO ((φ : O ℚ ≃ₗ[ℚ] O ℚ) (bO j)) i| : ℚ) : Cut)
        ≤ ((1 : ℚ) : Cut) := by exact_mod_cast h
      _ = 1 := by norm_num
  calc ∑ i : Fin 8, ∑ j : Fin 8, |((coordO ((φ : O ℚ ≃ₗ[ℚ] O ℚ) (bO j)) i : ℚ) : Cut)|
      ≤ ∑ _i : Fin 8, ∑ _j : Fin 8, (1 : Cut) := by
        apply Finset.sum_le_sum; intro i _
        apply Finset.sum_le_sum; intro j _
        exact hentry i j
    _ = 64 := by simp; norm_num

-- non-vacuity opNorm_one = 8
example : opNorm (1 : Matrix (Fin 8) (Fin 8) Cut) = 8 := by
  unfold opNorm
  have : ∀ i : Fin 8, ∑ j : Fin 8, |(1 : Matrix (Fin 8) (Fin 8) Cut) i j| = 1 := by
    intro i
    rw [Finset.sum_eq_single i]
    · simp [Matrix.one_apply]
    · intro j _ hj; simp [Matrix.one_apply, Ne.symm hj]
    · intro h; exact absurd (Finset.mem_univ i) h
  rw [Finset.sum_congr rfl (fun i _ => this i)]
  simp

end
end Phys.Algebra
