import Phys.Foundation.ContinuumComplete
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Algebra.InfiniteSum.Basic
namespace Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section
axiom cut_summable_of_nonneg_of_le {f g : ℕ → Cut} (hf : ∀ n, 0 ≤ f n)
    (hfg : ∀ n, f n ≤ g n) (hg : Summable g) : Summable f
axiom cut_summable_geometric {r : Cut} (hr0 : 0 ≤ r) (hr1 : r < 1) : Summable (fun n => r ^ n)

theorem cut_summable_pow_div_factorial {c : Cut} (hc : 0 ≤ c) :
    Summable (fun n => c ^ n / (n.factorial : Cut)) := by
  obtain ⟨M, hM⟩ := cut_exists_nat_gt c
  have hMpos : (0:Cut) < (M:Cut) := lt_of_le_of_lt hc hM
  set q : Cut := c / M with hqdef
  have hq0 : 0 ≤ q := div_nonneg hc (le_of_lt hMpos)
  have hq1 : q < 1 := by rw [hqdef, div_lt_one hMpos]; exact hM
  have htail : ∀ k, c ^ (k + M) / (((k+M).factorial : ℕ) : Cut)
      ≤ (c ^ M / ((M.factorial : ℕ) : Cut)) * q ^ k := by
    intro k
    induction k with
    | zero => simp
    | succ j ih =>
      have hfacj : (0:Cut) < (((j+M).factorial : ℕ) : Cut) := by exact_mod_cast (j+M).factorial_pos
      have hsucc : c ^ ((j+1) + M) / ((((j+1)+M).factorial : ℕ) : Cut)
          = (c ^ (j + M) / (((j+M).factorial : ℕ) : Cut)) * (c / ((j+M+1 : ℕ) : Cut)) := by
        have he : (j+1) + M = (j + M) + 1 := by ring
        rw [he, pow_succ, Nat.factorial_succ, Nat.cast_mul, Nat.cast_add, Nat.cast_one]
        have hfne : (((j+M).factorial : ℕ) : Cut) ≠ 0 := ne_of_gt hfacj
        push_cast
        field_simp
      rw [hsucc]
      have hden : (0:Cut) < ((j+M+1 : ℕ) : Cut) := by exact_mod_cast Nat.succ_pos _
      have hratio : c / ((j+M+1 : ℕ) : Cut) ≤ q := by
        rw [hqdef, div_le_div_iff₀ hden hMpos]
        have hle : (M:Cut) ≤ ((j+M+1 : ℕ) : Cut) := by exact_mod_cast (by omega : M ≤ j+M+1)
        nlinarith [hc, hle, hMpos]
      calc (c ^ (j + M) / (((j+M).factorial : ℕ) : Cut)) * (c / ((j+M+1 : ℕ) : Cut))
          ≤ (c ^ M / ((M.factorial : ℕ) : Cut) * q ^ j) * q :=
            mul_le_mul ih hratio (div_nonneg hc (le_of_lt hden))
              (by positivity)
        _ = c ^ M / ((M.factorial : ℕ) : Cut) * q ^ (j+1) := by rw [pow_succ]; ring
  apply (summable_nat_add_iff M).mp
  apply cut_summable_of_nonneg_of_le
    (fun k => div_nonneg (pow_nonneg hc _) (by exact_mod_cast (k+M).factorial_pos.le))
    htail
  exact (cut_summable_geometric hq0 hq1).mul_left _
end
end Phys.Foundation.ContinuumQ
