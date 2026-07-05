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

/-- cc closed form (two-variable), copying N323 cosCoeff_closed verbatim but keeping a,b separate. -/
theorem ccCoeff_closed (a b : Cut) (N : ℕ) :
    ccCoeff a b N = ∑ k ∈ range (N + 1),
      (-1) ^ N * (a ^ (2 * k) * b ^ (2 * (N - k))) / ((2 * N).factorial : Cut)
        * ((2 * N).choose (2 * k) : Cut) := by
  unfold ccCoeff
  rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
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
      = (-1) ^ N * (a ^ (2 * k) * b ^ (2 * (N - k))) / ((2 * N).factorial : Cut)
          * ((2 * N).choose (2 * k) : Cut)
  rw [hnum, div_mul_eq_mul_div, div_eq_div_iff hden hn0]
  linear_combination (-((-1 : Cut) ^ N * (a ^ (2 * k) * b ^ (2 * (N - k))))) * hcast

end
end ContinuumQ
end Phys.Foundation
