import Phys.Foundation.ContinuumLog
import Mathlib.Topology.Algebra.InfiniteSum.NatInt

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- geometric partial sum + tsum bounds (from probe4, re-stated locally)
theorem geom_partial_le (r : Cut) (hr0 : 0 ≤ r) (hr1 : r < 1) (n : ℕ) :
    ∑ i ∈ Finset.range n, r ^ i ≤ (1 - r)⁻¹ := by
  have h1r : (0:Cut) < 1 - r := by linarith
  have htel := cut_geom_telescope r n
  have hbound : (1 - r) * ∑ i ∈ Finset.range n, r ^ i ≤ 1 := by
    rw [htel]; nlinarith [pow_nonneg hr0 n]
  rw [← le_div_iff₀' h1r] at hbound
  rwa [one_div] at hbound

theorem geom_tsum_le (r : Cut) (hr0 : 0 ≤ r) (hr1 : r < 1) :
    ∑' k, r ^ k ≤ (1 - r)⁻¹ :=
  le_of_tendsto' (cut_summable_geometric hr0 hr1).hasSum.tendsto_sum_nat (geom_partial_le r hr0 hr1)

/-- Partial exp sum. -/
def partialExp (q : Cut) (N : ℕ) : Cut := ∑ i ∈ Finset.range N, expTermC q i

/-- Explicit rational remainder bound. -/
def expRemBound (q : Cut) (N : ℕ) : Cut :=
  (q ^ N / (N.factorial : Cut)) * (1 - q / (N + 1))⁻¹

-- THE TERMWISE TAIL BOUND (ratio-test crux, mirror of cut_summable_pow_div_factorial htail)
theorem tail_termwise_le (q : Cut) (hq : 0 ≤ q) (N : ℕ) (m : ℕ) :
    expTermC q (m + N) ≤ (q ^ N / (N.factorial : Cut)) * (q / (N + 1)) ^ m := by
  induction m with
  | zero => simp [expTermC]
  | succ j ih =>
    have hfacj : (0 : Cut) < (((j + N).factorial : ℕ) : Cut) := by
      exact_mod_cast (j + N).factorial_pos
    have hsucc : expTermC q ((j + 1) + N)
        = expTermC q (j + N) * (q / ((j + N + 1 : ℕ) : Cut)) := by
      unfold expTermC
      have he : (j + 1) + N = (j + N) + 1 := by ring
      rw [he, pow_succ, Nat.factorial_succ, Nat.cast_mul, Nat.cast_add, Nat.cast_one]
      have hfne : (((j + N).factorial : ℕ) : Cut) ≠ 0 := ne_of_gt hfacj
      push_cast
      field_simp
    rw [hsucc]
    have hden : (0 : Cut) < ((j + N + 1 : ℕ) : Cut) := by exact_mod_cast Nat.succ_pos _
    have hNden : (0 : Cut) < ((N : Cut) + 1) := by positivity
    have hratio : q / ((j + N + 1 : ℕ) : Cut) ≤ q / ((N : Cut) + 1) := by
      apply div_le_div_of_nonneg_left hq hNden
      have : ((N : Cut) + 1) ≤ ((j + N + 1 : ℕ) : Cut) := by
        push_cast; linarith [Nat.cast_nonneg (α := Cut) j]
      exact this
    have hqrN : 0 ≤ q / ((N:Cut)+1) := div_nonneg hq (le_of_lt hNden)
    calc expTermC q (j + N) * (q / ((j + N + 1 : ℕ) : Cut))
        ≤ ((q ^ N / (N.factorial : Cut)) * (q / ((N:Cut) + 1)) ^ j) * (q / ((N:Cut)+1)) := by
          apply mul_le_mul ih hratio (div_nonneg hq (le_of_lt hden))
          positivity
      _ = (q ^ N / (N.factorial : Cut)) * (q / ((N:Cut) + 1)) ^ (j + 1) := by rw [pow_succ]; ring

end
end ContinuumQ
end Phys.Foundation
