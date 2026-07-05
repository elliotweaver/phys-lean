import Phys.Foundation.ContinuumTrig
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Topology.Algebra.InfiniteSum.NatInt

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

def scCoeff (a b : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, sinTermC a kl.1 * cosTermC b kl.2
def csCoeff (a b : Cut) (N : ℕ) : Cut :=
  ∑ kl ∈ Finset.antidiagonal N, cosTermC a kl.1 * sinTermC b kl.2

/-- even/odd split of a range of EVEN length 2m+2: derived from the odd-length split + last term. -/
theorem sum_range_even_split_gen {M : Type*} [AddCommMonoid M] (m : ℕ) (g : ℕ → M) :
    ∑ j ∈ range (2 * m + 2), g j
      = (∑ k ∈ range (m + 1), g (2 * k)) + ∑ k ∈ range (m + 1), g (2 * k + 1) := by
  induction m with
  | zero => simp [Finset.sum_range_succ]
  | succ p ih =>
    have e : 2 * (p + 1) + 2 = (2 * p + 2) + 1 + 1 := by ring
    rw [e, sum_range_succ _ ((2 * p + 2) + 1), sum_range_succ _ (2 * p + 2), ih]
    rw [sum_range_succ (fun k => g (2 * k)) (p + 1), sum_range_succ (fun k => g (2 * k + 1)) (p + 1)]
    abel

axiom scCoeff_factored (a b : Cut) (N : ℕ) :
    scCoeff a b N = (-1) ^ N / ((2 * N + 1).factorial : Cut) *
      (∑ k ∈ range (N + 1), ((2 * N + 1).choose (2 * k + 1) : Cut)
        * (a ^ (2 * k + 1) * b ^ (2 * (N - k))))
axiom csCoeff_factored (a b : Cut) (N : ℕ) :
    csCoeff a b N = (-1) ^ N / ((2 * N + 1).factorial : Cut) *
      (∑ k ∈ range (N + 1), ((2 * N + 1).choose (2 * k) : Cut)
        * (a ^ (2 * k) * b ^ (2 * (N - k) + 1)))

/-- sin assembly per-N: sinTermC(a+b) N = scCoeff a b N + csCoeff a b N. -/
theorem sinTermC_add (a b : Cut) (N : ℕ) :
    sinTermC (a + b) N = scCoeff a b N + csCoeff a b N := by
  unfold sinTermC
  rw [scCoeff_factored, csCoeff_factored]
  have hexp : (a + b) ^ (2 * N + 1)
      = ∑ j ∈ range (2 * N + 1 + 1), a ^ j * b ^ (2 * N + 1 - j) * ((2 * N + 1).choose j : Cut) := by
    rw [add_pow]
  rw [show 2 * N + 1 + 1 = 2 * N + 2 from by ring] at hexp
  rw [hexp]
  rw [sum_range_even_split_gen N
    (fun j => a ^ j * b ^ (2 * N + 1 - j) * ((2 * N + 1).choose j : Cut))]
  -- even part (index 2k) → csCoeff part (a^(2k)); odd part (2k+1) → scCoeff part (a^(2k+1))
  have hEven : (∑ k ∈ range (N + 1),
        a ^ (2 * k) * b ^ (2 * N + 1 - 2 * k) * ((2 * N + 1).choose (2 * k) : Cut))
      = ∑ k ∈ range (N + 1),
        ((2 * N + 1).choose (2 * k) : Cut) * (a ^ (2 * k) * b ^ (2 * (N - k) + 1)) := by
    apply Finset.sum_congr rfl
    intro k hk; rw [Finset.mem_range] at hk
    have : 2 * (N - k) + 1 = 2 * N + 1 - 2 * k := by omega
    rw [this]; ring
  have hOdd : (∑ k ∈ range (N + 1),
        a ^ (2 * k + 1) * b ^ (2 * N + 1 - (2 * k + 1)) * ((2 * N + 1).choose (2 * k + 1) : Cut))
      = ∑ k ∈ range (N + 1),
        ((2 * N + 1).choose (2 * k + 1) : Cut) * (a ^ (2 * k + 1) * b ^ (2 * (N - k))) := by
    apply Finset.sum_congr rfl
    intro k hk; rw [Finset.mem_range] at hk
    have : 2 * (N - k) = 2 * N + 1 - (2 * k + 1) := by omega
    rw [this]; ring
  rw [hEven, hOdd]
  have hd : ((2 * N + 1).factorial : Cut) ≠ 0 := by positivity
  field_simp
  ring

end
end ContinuumQ
end Phys.Foundation
