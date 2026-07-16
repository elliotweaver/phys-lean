import Phys.Foundation.ContinuumLog
import Mathlib.Topology.Algebra.InfiniteSum.NatInt

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

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

def partialExp (q : Cut) (N : ℕ) : Cut := ∑ i ∈ Finset.range N, expTermC q i
def expRemBound (q : Cut) (N : ℕ) : Cut :=
  (q ^ N / (N.factorial : Cut)) * (1 - q / (N + 1))⁻¹

theorem tail_termwise_le (q : Cut) (hq : 0 ≤ q) (N : ℕ) (m : ℕ) :
    expTermC q (m + N) ≤ (q ^ N / (N.factorial : Cut)) * (q / (N + 1)) ^ m := by
  induction m with
  | zero => simp [expTermC]
  | succ j ih =>
    have hfacj : (0 : Cut) < (((j + N).factorial : ℕ) : Cut) := by exact_mod_cast (j + N).factorial_pos
    have hsucc : expTermC q ((j + 1) + N) = expTermC q (j + N) * (q / ((j + N + 1 : ℕ) : Cut)) := by
      unfold expTermC
      have he : (j + 1) + N = (j + N) + 1 := by ring
      rw [he, pow_succ, Nat.factorial_succ, Nat.cast_mul, Nat.cast_add, Nat.cast_one]
      have hfne : (((j + N).factorial : ℕ) : Cut) ≠ 0 := ne_of_gt hfacj
      push_cast; field_simp
    rw [hsucc]
    have hden : (0 : Cut) < ((j + N + 1 : ℕ) : Cut) := by exact_mod_cast Nat.succ_pos _
    have hNden : (0 : Cut) < ((N : Cut) + 1) := by positivity
    have hratio : q / ((j + N + 1 : ℕ) : Cut) ≤ q / ((N : Cut) + 1) := by
      apply div_le_div_of_nonneg_left hq hNden
      have : ((N : Cut) + 1) ≤ ((j + N + 1 : ℕ) : Cut) := by
        push_cast; linarith [Nat.cast_nonneg (α := Cut) j]
      exact this
    calc expTermC q (j + N) * (q / ((j + N + 1 : ℕ) : Cut))
        ≤ ((q ^ N / (N.factorial : Cut)) * (q / ((N:Cut) + 1)) ^ j) * (q / ((N:Cut)+1)) := by
          apply mul_le_mul ih hratio (div_nonneg hq (le_of_lt hden)); positivity
      _ = (q ^ N / (N.factorial : Cut)) * (q / ((N:Cut) + 1)) ^ (j + 1) := by rw [pow_succ]; ring

-- Now: tail summable, and tail tsum ≤ expRemBound
theorem expTail_summable (q : Cut) (N : ℕ) : Summable (fun m => expTermC q (m + N)) :=
  (summable_nat_add_iff N).mpr (expTermC_summable q)

/-- THE TAIL BOUND: `∑' m, q^{m+N}/(m+N)! ≤ expRemBound q N`, for `0 ≤ q < N+1`. -/
theorem expTail_le (q : Cut) (hq : 0 ≤ q) (N : ℕ) (hqN : q < (N + 1)) :
    ∑' m, expTermC q (m + N) ≤ expRemBound q N := by
  set r : Cut := q / ((N:Cut) + 1) with hr
  have hNden : (0 : Cut) < ((N : Cut) + 1) := by positivity
  have hr0 : 0 ≤ r := div_nonneg hq (le_of_lt hNden)
  have hr1 : r < 1 := by rw [hr, div_lt_one hNden]; exact_mod_cast hqN
  -- majorant family
  have hmaj_summ : Summable (fun m => (q ^ N / (N.factorial : Cut)) * r ^ m) :=
    (cut_summable_geometric hr0 hr1).mul_left _
  have hle : ∀ m, expTermC q (m + N) ≤ (q ^ N / (N.factorial : Cut)) * r ^ m := by
    intro m; rw [hr]; exact tail_termwise_le q hq N m
  have hstep : ∑' m, expTermC q (m + N) ≤ ∑' m, (q ^ N / (N.factorial : Cut)) * r ^ m :=
    (expTail_summable q N).tsum_le_tsum hle hmaj_summ
  have hgeo : ∑' m, (q ^ N / (N.factorial : Cut)) * r ^ m
      = (q ^ N / (N.factorial : Cut)) * ∑' m, r ^ m := tsum_mul_left
  have hgeobound : ∑' m, r ^ m ≤ (1 - r)⁻¹ := geom_tsum_le r hr0 hr1
  have hcoef : (0:Cut) ≤ q ^ N / (N.factorial : Cut) := by positivity
  calc ∑' m, expTermC q (m + N)
      ≤ (q ^ N / (N.factorial : Cut)) * ∑' m, r ^ m := by rw [← hgeo]; exact hstep
    _ ≤ (q ^ N / (N.factorial : Cut)) * (1 - r)⁻¹ := by
        apply mul_le_mul_of_nonneg_left hgeobound hcoef
    _ = expRemBound q N := by rw [expRemBound, hr]

end
end ContinuumQ
end Phys.Foundation
