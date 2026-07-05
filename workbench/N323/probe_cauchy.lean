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

/-- CRUX closed form (cos): the antidiagonal-N Cauchy sum of cos with itself
    = (-1)^N x^(2N)/(2N)! · (∑ k∈range(N+1) C(2N,2k)). Mirror of expTermC_antidiagonal. -/
theorem cosCauchy_closed (x : Cut) (N : ℕ) :
    (∑ kl ∈ Finset.antidiagonal N, cosTermC x kl.1 * cosTermC x kl.2)
      = (-1)^N * x^(2*N) / ((2*N).factorial : Cut) *
          (∑ k ∈ range (N+1), ((2*N).choose (2*k) : Cut)) := by
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro k hk
  rw [Finset.mem_range] at hk
  have hk' : k ≤ N := by omega
  unfold cosTermC
  -- k-th term: (-1)^k x^(2k)/(2k)! · (-1)^(N-k) x^(2(N-k))/(2(N-k))!
  -- target k-th term: (-1)^N x^(2N)/(2N)! · C(2N,2k)
  have hpow : (2*k) + (2*(N-k)) = 2*N := by omega
  have hsign : (-1:Cut)^k * (-1)^(N-k) = (-1)^N := by
    rw [← pow_add]; congr 1; omega
  have hx : x^(2*k) * x^(2*(N-k)) = x^(2*N) := by rw [← pow_add, hpow]
  -- binomial cast identity: C(2N,2k)·(2k)!·(2(N-k))! = (2N)!
  have hchoose : (2*N).choose (2*k) * (2*k).factorial * (2*(N-k)).factorial = (2*N).factorial := by
    have h2k : 2*k ≤ 2*N := by omega
    have := Nat.choose_mul_factorial_mul_factorial h2k
    rw [show 2*N - 2*k = 2*(N-k) from by omega] at this
    exact this
  have hk0 : ((2*k).factorial : Cut) ≠ 0 := by positivity
  have hl0 : ((2*(N-k)).factorial : Cut) ≠ 0 := by positivity
  have hn0 : ((2*N).factorial : Cut) ≠ 0 := by positivity
  have hden : ((2*k).factorial : Cut) * ((2*(N-k)).factorial : Cut) ≠ 0 := mul_ne_zero hk0 hl0
  have hcast : ((2*N).choose (2*k) : Cut) * ((2*k).factorial : Cut) * ((2*(N-k)).factorial : Cut)
      = ((2*N).factorial : Cut) := by
    have := congrArg (fun z : ℕ => (z : Cut)) hchoose
    push_cast at this ⊢
    linarith [this]
  -- collapse the product of the two terms into (-1)^N x^(2N) / ((2k)!·(2(N-k))!)
  rw [div_mul_div_comm]
  have hnum : (-1:Cut)^k * x^(2*k) * ((-1)^(N-k) * x^(2*(N-k))) = (-1)^N * x^(2*N) := by
    have h : (-1:Cut)^k * x^(2*k) * ((-1)^(N-k) * x^(2*(N-k)))
        = ((-1)^k * (-1)^(N-k)) * (x^(2*k) * x^(2*(N-k))) := by ring
    rw [h, hsign, hx]
  show (-1:Cut)^k * x^(2*k) * ((-1)^(N-k) * x^(2*(N-k))) / (((2*k).factorial : Cut) * ((2*(N-k)).factorial : Cut))
      = (-1)^N * x^(2*N) / ((2*N).factorial : Cut) * ((2*N).choose (2*k) : Cut)
  rw [hnum, div_mul_eq_mul_div, div_eq_div_iff hden hn0]
  linear_combination (-(((-1:Cut))^N * x^(2*N))) * hcast

end
end ContinuumQ
end Phys.Foundation
