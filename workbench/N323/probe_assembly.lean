import Phys.Foundation.ContinuumExp
import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Algebra.Ring.Parity

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

def cosTermC (x : Cut) (n : ℕ) : Cut := (-1)^n * x ^ (2*n) / ((2*n).factorial : Cut)
def sinTermC (x : Cut) (n : ℕ) : Cut := (-1)^n * x ^ (2*n+1) / ((2*n+1).factorial : Cut)

theorem cosTermC_abs_eq (x : Cut) (n : ℕ) :
    |cosTermC x n| = |x| ^ (2*n) / ((2*n).factorial : Cut) := by
  unfold cosTermC
  simp only [abs_div, abs_mul, abs_pow, abs_neg, abs_one, one_pow, one_mul]
  rw [abs_of_nonneg (show (0:Cut) ≤ ((2*n).factorial:Cut) by positivity)]
theorem sinTermC_abs_eq (x : Cut) (n : ℕ) :
    |sinTermC x n| = |x| ^ (2*n+1) / ((2*n+1).factorial : Cut) := by
  unfold sinTermC
  simp only [abs_div, abs_mul, abs_pow, abs_neg, abs_one, one_pow, one_mul]
  rw [abs_of_nonneg (show (0:Cut) ≤ ((2*n+1).factorial:Cut) by positivity)]
theorem inj_two_mul : Function.Injective (fun n : ℕ => 2*n) := by intro a b h; simpa using h
theorem inj_two_mul_add_one : Function.Injective (fun n : ℕ => 2*n+1) := by intro a b h; simp only at h; omega
theorem cosTermC_abs_summable (x : Cut) : Summable (fun n => |cosTermC x n|) := by
  have hmaj := cut_summable_pow_div_factorial (abs_nonneg x)
  have hcomp := hmaj.comp_injective inj_two_mul
  refine hcomp.congr ?_; intro n; rw [cosTermC_abs_eq]; rfl
theorem sinTermC_abs_summable (x : Cut) : Summable (fun n => |sinTermC x n|) := by
  have hmaj := cut_summable_pow_div_factorial (abs_nonneg x)
  have hcomp := hmaj.comp_injective inj_two_mul_add_one
  refine hcomp.congr ?_; intro n; rw [sinTermC_abs_eq]; rfl
theorem cosTermC_summable (x : Cut) : Summable (cosTermC x) := cut_summable_of_abs (cosTermC_abs_summable x)
theorem sinTermC_summable (x : Cut) : Summable (sinTermC x) := cut_summable_of_abs (sinTermC_abs_summable x)

def cutCos (x : Cut) : Cut := ∑' n, cosTermC x n
def cutSin (x : Cut) : Cut := ∑' n, sinTermC x n

-- product families summable (needed for the Cauchy product)
theorem cosProd_summable (x : Cut) : Summable (fun p : ℕ × ℕ => cosTermC x p.1 * cosTermC x p.2) :=
  cut_summable_mul_of_abs (cosTermC_abs_summable x) (cosTermC_abs_summable x)
theorem sinProd_summable (x : Cut) : Summable (fun p : ℕ × ℕ => sinTermC x p.1 * sinTermC x p.2) :=
  cut_summable_mul_of_abs (sinTermC_abs_summable x) (sinTermC_abs_summable x)

-- the two closed forms (proven in probes, assumed here as axioms to measure the ASSEMBLY only)
axiom cosCauchy_closed (x : Cut) (N : ℕ) :
    (∑ kl ∈ Finset.antidiagonal N, cosTermC x kl.1 * cosTermC x kl.2)
      = (-1)^N * x^(2*N) / ((2*N).factorial : Cut) * (∑ k ∈ range (N+1), ((2*N).choose (2*k) : Cut))
axiom sinCauchy_closed (x : Cut) (N : ℕ) :
    (∑ kl ∈ Finset.antidiagonal N, sinTermC x kl.1 * sinTermC x kl.2)
      = (-1)^N * x^(2*N+2) / ((2*N+2).factorial : Cut) * (∑ k ∈ range (N+1), ((2*N+2).choose (2*k+1) : Cut))

-- cos² as a tsum over N of the antidiagonal
theorem cutCos_sq_tsum (x : Cut) :
    cutCos x * cutCos x = ∑' N, (∑ kl ∈ Finset.antidiagonal N, cosTermC x kl.1 * cosTermC x kl.2) := by
  unfold cutCos
  rw [(cosTermC_summable x).tsum_mul_tsum_eq_tsum_sum_antidiagonal (cosTermC_summable x) (cosProd_summable x)]
theorem cutSin_sq_tsum (x : Cut) :
    cutSin x * cutSin x = ∑' N, (∑ kl ∈ Finset.antidiagonal N, sinTermC x kl.1 * sinTermC x kl.2) := by
  unfold cutSin
  rw [(sinTermC_summable x).tsum_mul_tsum_eq_tsum_sum_antidiagonal (sinTermC_summable x) (sinProd_summable x)]

end
end ContinuumQ
end Phys.Foundation
