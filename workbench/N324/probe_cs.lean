import Phys.Foundation.ContinuumTrig
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Topology.Algebra.InfiniteSum.NatInt

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

def csCoeff (a b : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, cosTermC a kl.1 * sinTermC b kl.2

/-- cs factored: cos a^(2k), sin b^(2(N-k)+1) → power 2N+1, sign (-1)^N, denom (2N+1)!, C(2N+1,2k). -/
theorem csCoeff_factored (a b : Cut) (N : ℕ) :
    csCoeff a b N = (-1) ^ N / ((2 * N + 1).factorial : Cut) *
      (∑ k ∈ range (N + 1), ((2 * N + 1).choose (2 * k) : Cut)
        * (a ^ (2 * k) * b ^ (2 * (N - k) + 1))) := by
  unfold csCoeff
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Finset.mem_range] at hk
  have hk' : k ≤ N := by omega
  unfold cosTermC sinTermC
  have hsign : (-1 : Cut) ^ k * (-1) ^ (N - k) = (-1) ^ N := by rw [← pow_add]; congr 1; omega
  have hchoose : (2 * N + 1).choose (2 * k) * (2 * k).factorial * (2 * (N - k) + 1).factorial
      = (2 * N + 1).factorial := by
    have hle : 2 * k ≤ 2 * N + 1 := by omega
    have := Nat.choose_mul_factorial_mul_factorial hle
    rw [show 2 * N + 1 - 2 * k = 2 * (N - k) + 1 from by omega] at this
    exact this
  have hk0 : ((2 * k).factorial : Cut) ≠ 0 := by positivity
  have hl0 : ((2 * (N - k) + 1).factorial : Cut) ≠ 0 := by positivity
  have hn0 : ((2 * N + 1).factorial : Cut) ≠ 0 := by positivity
  have hden : ((2 * k).factorial : Cut) * ((2 * (N - k) + 1).factorial : Cut) ≠ 0 :=
    mul_ne_zero hk0 hl0
  have hcast : ((2 * N + 1).choose (2 * k) : Cut) * ((2 * k).factorial : Cut)
      * ((2 * (N - k) + 1).factorial : Cut) = ((2 * N + 1).factorial : Cut) := by
    have := congrArg (fun z : ℕ => (z : Cut)) hchoose
    push_cast at this ⊢; linarith [this]
  rw [div_mul_div_comm]
  have hnum : (-1 : Cut) ^ k * a ^ (2 * k) * ((-1) ^ (N - k) * b ^ (2 * (N - k) + 1))
      = (-1) ^ N * (a ^ (2 * k) * b ^ (2 * (N - k) + 1)) := by
    have h : (-1 : Cut) ^ k * a ^ (2 * k) * ((-1) ^ (N - k) * b ^ (2 * (N - k) + 1))
        = ((-1) ^ k * (-1) ^ (N - k)) * (a ^ (2 * k) * b ^ (2 * (N - k) + 1)) := by ring
    rw [h, hsign]
  show (-1 : Cut) ^ k * a ^ (2 * k) * ((-1) ^ (N - k) * b ^ (2 * (N - k) + 1))
        / (((2 * k).factorial : Cut) * ((2 * (N - k) + 1).factorial : Cut))
      = (-1) ^ N / ((2 * N + 1).factorial : Cut)
          * (((2 * N + 1).choose (2 * k) : Cut) * (a ^ (2 * k) * b ^ (2 * (N - k) + 1)))
  rw [hnum]
  rw [show (-1 : Cut) ^ N / ((2 * N + 1).factorial : Cut)
      * (((2 * N + 1).choose (2 * k) : Cut) * (a ^ (2 * k) * b ^ (2 * (N - k) + 1)))
      = ((2 * N + 1).choose (2 * k) : Cut) * ((-1) ^ N * (a ^ (2 * k) * b ^ (2 * (N - k) + 1)))
        / ((2 * N + 1).factorial : Cut) by ring]
  rw [div_eq_div_iff hden hn0]
  linear_combination (-(-1 : Cut) ^ N * (a ^ (2 * k) * b ^ (2 * (N - k) + 1))) * hcast

end
end ContinuumQ
end Phys.Foundation
