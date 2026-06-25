import Phys.Algebra.DerivationAutCompactTopo
import Mathlib.Data.Matrix.Basic

namespace Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
open scoped BigOperators
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

def opNorm (M : Matrix (Fin 8) (Fin 8) Cut) : Cut := ∑ i, ∑ j, |M i j|

-- PROBE A: ℚ→Cut cast order/abs lemmas exist
example (q : ℚ) : |((q : ℚ) : Cut)| = ((|q| : ℚ) : Cut) := by rw [← Rat.cast_abs]
example (q : ℚ) (h : |q| ≤ 1) : ((|q| : ℚ) : Cut) ≤ 1 := by
  have : ((|q| : ℚ) : Cut) ≤ ((1 : ℚ) : Cut) := by exact_mod_cast h
  simpa using this

-- PROBE B: opNorm_smul
example (c : Cut) (M : Matrix (Fin 8) (Fin 8) Cut) : opNorm (c • M) = |c| * opNorm M := by
  unfold opNorm
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl; intro i _
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl; intro j _
  simp [Matrix.smul_apply, abs_mul, smul_eq_mul]

-- PROBE C: definiteness
example (M : Matrix (Fin 8) (Fin 8) Cut) : opNorm M = 0 ↔ M = 0 := by
  unfold opNorm
  rw [Finset.sum_eq_zero_iff_of_nonneg (fun i _ => Finset.sum_nonneg (fun _ _ => abs_nonneg _))]
  constructor
  · intro h
    ext i j
    have hi := h i (Finset.mem_univ i)
    rw [Finset.sum_eq_zero_iff_of_nonneg (fun _ _ => abs_nonneg _)] at hi
    have := hi j (Finset.mem_univ j)
    simpa [abs_eq_zero] using this
  · intro h i _
    apply Finset.sum_eq_zero; intro j _
    simp [h, Matrix.zero_apply]

-- PROBE D: opNorm_pow_le (n+1)
example (M : Matrix (Fin 8) (Fin 8) Cut)
    (hmul : ∀ A B : Matrix (Fin 8) (Fin 8) Cut, opNorm (A * B) ≤ opNorm A * opNorm B)
    (hnn : ∀ A : Matrix (Fin 8) (Fin 8) Cut, 0 ≤ opNorm A)
    (n : ℕ) : opNorm (M ^ (n+1)) ≤ opNorm M ^ (n+1) := by
  induction n with
  | zero => simp
  | succ k ih =>
    rw [pow_succ, pow_succ]
    calc opNorm (M ^ (k+1) * M) ≤ opNorm (M ^ (k+1)) * opNorm M := hmul _ _
      _ ≤ opNorm M ^ (k+1) * opNorm M :=
          mul_le_mul_of_nonneg_right ih (hnn M)

end
end Phys.Algebra
