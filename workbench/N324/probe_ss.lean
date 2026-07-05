import Phys.Foundation.ContinuumTrig
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Topology.Algebra.InfiniteSum.NatInt

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

def ssCoeff (a b : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, sinTermC a kl.1 * sinTermC b kl.2

/-- ss closed form (a,b separate) — N323 sinCoeff_closed shape verbatim. -/
theorem ssCoeff_closed (a b : Cut) (N : ℕ) :
    ssCoeff a b N = ∑ k ∈ range (N + 1),
      (-1) ^ N * (a ^ (2 * k + 1) * b ^ (2 * (N - k) + 1)) / ((2 * N + 2).factorial : Cut)
        * ((2 * N + 2).choose (2 * k + 1) : Cut) := by
  unfold ssCoeff
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Finset.mem_range] at hk
  have hk' : k ≤ N := by omega
  unfold sinTermC
  have hsign : (-1 : Cut) ^ k * (-1) ^ (N - k) = (-1) ^ N := by rw [← pow_add]; congr 1; omega
  have hchoose : (2 * N + 2).choose (2 * k + 1) * (2 * k + 1).factorial * (2 * (N - k) + 1).factorial
      = (2 * N + 2).factorial := by
    have hle : 2 * k + 1 ≤ 2 * N + 2 := by omega
    have := Nat.choose_mul_factorial_mul_factorial hle
    rw [show 2 * N + 2 - (2 * k + 1) = 2 * (N - k) + 1 from by omega] at this
    exact this
  have hk0 : ((2 * k + 1).factorial : Cut) ≠ 0 := by positivity
  have hl0 : ((2 * (N - k) + 1).factorial : Cut) ≠ 0 := by positivity
  have hn0 : ((2 * N + 2).factorial : Cut) ≠ 0 := by positivity
  have hden : ((2 * k + 1).factorial : Cut) * ((2 * (N - k) + 1).factorial : Cut) ≠ 0 :=
    mul_ne_zero hk0 hl0
  have hcast : ((2 * N + 2).choose (2 * k + 1) : Cut) * ((2 * k + 1).factorial : Cut)
      * ((2 * (N - k) + 1).factorial : Cut) = ((2 * N + 2).factorial : Cut) := by
    have := congrArg (fun z : ℕ => (z : Cut)) hchoose
    push_cast at this ⊢; linarith [this]
  rw [div_mul_div_comm]
  have hnum : (-1 : Cut) ^ k * a ^ (2 * k + 1) * ((-1) ^ (N - k) * b ^ (2 * (N - k) + 1))
      = (-1) ^ N * (a ^ (2 * k + 1) * b ^ (2 * (N - k) + 1)) := by
    have h : (-1 : Cut) ^ k * a ^ (2 * k + 1) * ((-1) ^ (N - k) * b ^ (2 * (N - k) + 1))
        = ((-1) ^ k * (-1) ^ (N - k)) * (a ^ (2 * k + 1) * b ^ (2 * (N - k) + 1)) := by ring
    rw [h, hsign]
  show (-1 : Cut) ^ k * a ^ (2 * k + 1) * ((-1) ^ (N - k) * b ^ (2 * (N - k) + 1))
        / (((2 * k + 1).factorial : Cut) * ((2 * (N - k) + 1).factorial : Cut))
      = (-1) ^ N * (a ^ (2 * k + 1) * b ^ (2 * (N - k) + 1)) / ((2 * N + 2).factorial : Cut)
          * ((2 * N + 2).choose (2 * k + 1) : Cut)
  rw [hnum, div_mul_eq_mul_div, div_eq_div_iff hden hn0]
  linear_combination (-((-1 : Cut) ^ N * (a ^ (2 * k + 1) * b ^ (2 * (N - k) + 1)))) * hcast

/-- ss factored form. -/
theorem ssCoeff_factored (a b : Cut) (N : ℕ) :
    ssCoeff a b N = (-1) ^ N / ((2 * N + 2).factorial : Cut) *
      (∑ k ∈ range (N + 1), ((2 * N + 2).choose (2 * k + 1) : Cut)
        * (a ^ (2 * k + 1) * b ^ (2 * (N - k) + 1))) := by
  rw [ssCoeff_closed, Finset.mul_sum]
  apply Finset.sum_congr rfl; intro k _; ring

end
end ContinuumQ
end Phys.Foundation
