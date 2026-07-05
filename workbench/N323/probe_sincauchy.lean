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

/-- SIN crux closed form: antidiagonal-N Cauchy sum of sin with itself
    = (-1)^N x^(2N+2)/(2N+2)! · (∑ k∈range(N+1) C(2N+2, 2k+1)). Note the sign:
    (-1)^k·(-1)^(N-k) = (-1)^N, and the two odd exponents (2k+1)+(2(N-k)+1)=2N+2. -/
theorem sinCauchy_closed (x : Cut) (N : ℕ) :
    (∑ kl ∈ Finset.antidiagonal N, sinTermC x kl.1 * sinTermC x kl.2)
      = (-1)^N * x^(2*N+2) / ((2*N+2).factorial : Cut) *
          (∑ k ∈ range (N+1), ((2*N+2).choose (2*k+1) : Cut)) := by
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Finset.mem_range] at hk
  have hk' : k ≤ N := by omega
  unfold sinTermC
  have hpow : (2*k+1) + (2*(N-k)+1) = 2*N+2 := by omega
  have hsign : (-1:Cut)^k * (-1)^(N-k) = (-1)^N := by rw [← pow_add]; congr 1; omega
  have hx : x^(2*k+1) * x^(2*(N-k)+1) = x^(2*N+2) := by rw [← pow_add, hpow]
  have hchoose : (2*N+2).choose (2*k+1) * (2*k+1).factorial * (2*(N-k)+1).factorial = (2*N+2).factorial := by
    have hle : 2*k+1 ≤ 2*N+2 := by omega
    have := Nat.choose_mul_factorial_mul_factorial hle
    rw [show 2*N+2 - (2*k+1) = 2*(N-k)+1 from by omega] at this
    exact this
  have hk0 : ((2*k+1).factorial : Cut) ≠ 0 := by positivity
  have hl0 : ((2*(N-k)+1).factorial : Cut) ≠ 0 := by positivity
  have hn0 : ((2*N+2).factorial : Cut) ≠ 0 := by positivity
  have hden : ((2*k+1).factorial : Cut) * ((2*(N-k)+1).factorial : Cut) ≠ 0 := mul_ne_zero hk0 hl0
  have hcast : ((2*N+2).choose (2*k+1) : Cut) * ((2*k+1).factorial : Cut) * ((2*(N-k)+1).factorial : Cut)
      = ((2*N+2).factorial : Cut) := by
    have := congrArg (fun z : ℕ => (z : Cut)) hchoose
    push_cast at this ⊢; linarith [this]
  rw [div_mul_div_comm]
  have hnum : (-1:Cut)^k * x^(2*k+1) * ((-1)^(N-k) * x^(2*(N-k)+1)) = (-1)^N * x^(2*N+2) := by
    have h : (-1:Cut)^k * x^(2*k+1) * ((-1)^(N-k) * x^(2*(N-k)+1))
        = ((-1)^k * (-1)^(N-k)) * (x^(2*k+1) * x^(2*(N-k)+1)) := by ring
    rw [h, hsign, hx]
  show (-1:Cut)^k * x^(2*k+1) * ((-1)^(N-k) * x^(2*(N-k)+1)) / (((2*k+1).factorial : Cut) * ((2*(N-k)+1).factorial : Cut))
      = (-1)^N * x^(2*N+2) / ((2*N+2).factorial : Cut) * ((2*N+2).choose (2*k+1) : Cut)
  rw [hnum, div_mul_eq_mul_div, div_eq_div_iff hden hn0]
  linear_combination (-(((-1:Cut))^N * x^(2*N+2))) * hcast

end
end ContinuumQ
end Phys.Foundation
