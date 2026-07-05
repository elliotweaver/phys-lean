import Phys.Foundation.ContinuumTrig
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Topology.Algebra.InfiniteSum.NatInt

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

def ccCoeff (a b : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, cosTermC a kl.1 * cosTermC b kl.2

def ssCoeff (a b : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, sinTermC a kl.1 * sinTermC b kl.2

def scCoeff (a b : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, sinTermC a kl.1 * cosTermC b kl.2

def csCoeff (a b : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, cosTermC a kl.1 * sinTermC b kl.2

/-- generic even/odd range split (length 2m+1), any add comm monoid. -/
theorem sum_range_odd_split_gen {M : Type*} [AddCommMonoid M] (m : ℕ) (g : ℕ → M) :
    ∑ j ∈ range (2 * m + 1), g j
      = (∑ k ∈ range (m + 1), g (2 * k)) + ∑ k ∈ range m, g (2 * k + 1) := by
  induction m with
  | zero => simp
  | succ p ih =>
    have e : 2 * (p + 1) + 1 = (2 * p + 1) + 1 + 1 := by ring
    rw [e, sum_range_succ _ ((2 * p + 1) + 1), sum_range_succ _ (2 * p + 1), ih]
    rw [sum_range_succ (fun k => g (2 * k)) (p + 1), sum_range_succ (fun k => g (2 * k + 1)) p]
    simp only [show 2 * (p + 1) = 2 * p + 1 + 1 from by ring]
    ring

/-- ccCoeff as an even-index binomial sum over range(N+1). -/
theorem ccCoeff_eq (a b : Cut) (N : ℕ) :
    ccCoeff a b N = (-1) ^ N / ((2 * N).factorial : Cut) *
      (∑ k ∈ range (N + 1), ((2 * N).choose (2 * k) : Cut) * (a ^ (2 * k) * b ^ (2 * (N - k)))) := by
  unfold ccCoeff
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Finset.mem_range] at hk
  have hk' : k ≤ N := by omega
  unfold cosTermC
  have hsign : (-1 : Cut) ^ k * (-1) ^ (N - k) = (-1) ^ N := by rw [← pow_add]; congr 1; omega
  have hchoose : (2 * N).choose (2 * k) * (2 * k).factorial * (2 * (N - k)).factorial
      = (2 * N).factorial := by
    have h2k : 2 * k ≤ 2 * N := by omega
    have := Nat.choose_mul_factorial_mul_factorial h2k
    rw [show 2 * N - 2 * k = 2 * (N - k) from by omega] at this
    exact this
  have hk0 : ((2 * k).factorial : Cut) ≠ 0 := by positivity
  have hl0 : ((2 * (N - k)).factorial : Cut) ≠ 0 := by positivity
  have hn0 : ((2 * N).factorial : Cut) ≠ 0 := by positivity
  have hden : ((2 * k).factorial : Cut) * ((2 * (N - k)).factorial : Cut) ≠ 0 := mul_ne_zero hk0 hl0
  have hcast : ((2 * N).choose (2 * k) : Cut) * ((2 * k).factorial : Cut)
      * ((2 * (N - k)).factorial : Cut) = ((2 * N).factorial : Cut) := by
    have := congrArg (fun z : ℕ => (z : Cut)) hchoose
    push_cast at this ⊢; linarith [this]
  rw [div_mul_div_comm]
  have hnum : (-1 : Cut) ^ k * a ^ (2 * k) * ((-1) ^ (N - k) * b ^ (2 * (N - k)))
      = (-1) ^ N * (a ^ (2 * k) * b ^ (2 * (N - k))) := by
    have h : (-1 : Cut) ^ k * a ^ (2 * k) * ((-1) ^ (N - k) * b ^ (2 * (N - k)))
        = ((-1) ^ k * (-1) ^ (N - k)) * (a ^ (2 * k) * b ^ (2 * (N - k))) := by ring
    rw [h, hsign]
  show (-1 : Cut) ^ k * a ^ (2 * k) * ((-1) ^ (N - k) * b ^ (2 * (N - k)))
        / (((2 * k).factorial : Cut) * ((2 * (N - k)).factorial : Cut))
      = (-1) ^ N / ((2 * N).factorial : Cut) * ((2 * N).choose (2 * k) : Cut)
          * (a ^ (2 * k) * b ^ (2 * (N - k)))
  rw [hnum, mul_comm ((-1 : Cut) ^ N / ((2 * N).factorial : Cut)) ((2 * N).choose (2 * k) : Cut),
      div_mul_eq_mul_div, mul_div_assoc]
  rw [mul_comm ((2 * N).choose (2 * k) : Cut) ((-1:Cut)^N), mul_assoc, mul_div_assoc]
  rw [div_eq_div_iff hden hn0]
  ring_nf
  linear_combination (((-1:Cut)^N * (a ^ (2 * k) * b ^ (2 * (N - k))))) * hcast

end
end ContinuumQ
end Phys.Foundation
