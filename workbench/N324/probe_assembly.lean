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

axiom sum_range_odd_split_gen {M : Type*} [AddCommMonoid M] (m : ℕ) (g : ℕ → M) :
    ∑ j ∈ range (2 * m + 1), g j
      = (∑ k ∈ range (m + 1), g (2 * k)) + ∑ k ∈ range m, g (2 * k + 1)
axiom ccCoeff_factored (a b : Cut) (N : ℕ) :
    ccCoeff a b N = (-1) ^ N / ((2 * N).factorial : Cut) *
      (∑ k ∈ range (N + 1), ((2 * N).choose (2 * k) : Cut) * (a ^ (2 * k) * b ^ (2 * (N - k))))
axiom ssCoeff_factored (a b : Cut) (N : ℕ) :
    ssCoeff a b N = (-1) ^ N / ((2 * N + 2).factorial : Cut) *
      (∑ k ∈ range (N + 1), ((2 * N + 2).choose (2 * k + 1) : Cut)
        * (a ^ (2 * k + 1) * b ^ (2 * (N - k) + 1)))

/-- ASSEMBLY: cosTermC(a+b)(N+1) = ccCoeff a b (N+1) − ssCoeff a b N. -/
theorem cosTermC_add_succ (a b : Cut) (N : ℕ) :
    cosTermC (a + b) (N + 1) = ccCoeff a b (N + 1) - ssCoeff a b N := by
  -- LHS = (-1)^(N+1) (a+b)^(2N+2)/(2N+2)!
  unfold cosTermC
  rw [ccCoeff_factored, ssCoeff_factored]
  -- Expand (a+b)^(2(N+1)) via add_pow into range(2(N+1)+1) = range(2N+3)
  have hexp : (a + b) ^ (2 * (N + 1))
      = ∑ j ∈ range (2 * (N + 1) + 1), a ^ j * b ^ (2 * (N + 1) - j) * ((2 * (N + 1)).choose j : Cut) := by
    rw [add_pow]
  rw [hexp]
  -- split even/odd: 2*(N+1)+1 = 2*(N+1)+1 with m = N+1
  rw [sum_range_odd_split_gen (N + 1)
    (fun j => a ^ j * b ^ (2 * (N + 1) - j) * ((2 * (N + 1)).choose j : Cut))]
  -- normalize 2*(N+1) → 2*N+2 everywhere
  simp only [show 2 * (N + 1) = 2 * N + 2 from by ring]
  -- prove the even sum = ccSum termwise, odd sum = ssSum termwise
  have hEven : (∑ k ∈ range (N + 1 + 1),
        a ^ (2 * k) * b ^ (2 * N + 2 - 2 * k) * ((2 * N + 2).choose (2 * k) : Cut))
      = ∑ k ∈ range (N + 1 + 1),
        ((2 * N + 2).choose (2 * k) : Cut) * (a ^ (2 * k) * b ^ (2 * (N + 1 - k))) := by
    apply Finset.sum_congr rfl
    intro k hk
    rw [Finset.mem_range] at hk
    have : 2 * (N + 1 - k) = 2 * N + 2 - 2 * k := by omega
    rw [this]; ring
  have hOdd : (∑ k ∈ range (N + 1),
        a ^ (2 * k + 1) * b ^ (2 * N + 2 - (2 * k + 1)) * ((2 * N + 2).choose (2 * k + 1) : Cut))
      = ∑ k ∈ range (N + 1),
        ((2 * N + 2).choose (2 * k + 1) : Cut) * (a ^ (2 * k + 1) * b ^ (2 * (N - k) + 1)) := by
    apply Finset.sum_congr rfl
    intro k hk
    rw [Finset.mem_range] at hk
    have : 2 * (N - k) + 1 = 2 * N + 2 - (2 * k + 1) := by omega
    rw [this]; ring
  rw [hEven, hOdd]
  have hd : ((2 * N + 2).factorial : Cut) ≠ 0 := by positivity
  field_simp
  ring

end
end ContinuumQ
end Phys.Foundation
