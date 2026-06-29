import Phys.Foundation.ContinuumExp
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Order

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- Reuse the seed (from probe1, proven)
theorem one_add_le_cutExp (t : Cut) (ht : 0 ≤ t) : 1 + t ≤ cutExp t := by
  have hnn : ∀ n, 0 ≤ expTermC t n := by intro n; unfold expTermC; positivity
  have hle := sum_le_hasSum (Finset.range 2) (fun i _ => hnn i) (cutExp_hasSum t)
  have hfin : ∑ i ∈ Finset.range 2, expTermC t i = 1 + t := by
    rw [Finset.sum_range_succ, Finset.sum_range_one]; unfold expTermC; simp
  rw [hfin] at hle; exact hle

-- CRUX upper bound at 0: for 0 ≤ h ≤ 1,  cutExp h ≤ 1 + h * cutExp 1
-- via cutExp h = expTermC h 0 + ∑' n, expTermC h (n+1), and expTermC h (n+1) ≤ h * expTermC 1 n
theorem cutExp_le_at_zero (h : Cut) (h0 : 0 ≤ h) (h1 : h ≤ 1) :
    cutExp h ≤ 1 + h * cutExp 1 := by
  -- split off the n=0 term
  have hsplit : cutExp h = expTermC h 0 + ∑' n, expTermC h (n+1) := by
    unfold cutExp
    exact (expTermC_summable h).tsum_eq_zero_add
  -- expTermC h 0 = 1
  have h00 : expTermC h 0 = 1 := by unfold expTermC; simp
  -- tail termwise bound:  expTermC h (n+1) ≤ h * expTermC 1 n
  have htermle : ∀ n, expTermC h (n+1) ≤ h * expTermC 1 n := by
    intro n
    unfold expTermC
    -- h^(n+1)/(n+1)! ≤ h * (1^n / n!)
    rw [pow_succ]
    -- h^n * h / (n+1)! ≤ h * (1/n!)
    have hpow : h ^ n ≤ 1 := pow_le_one₀ h0 h1
    have hfac_pos : (0:Cut) < ((n+1).factorial : Cut) := by positivity
    have hnfac_pos : (0:Cut) < (n.factorial : Cut) := by positivity
    have hfac_ge : (n.factorial : Cut) ≤ ((n+1).factorial : Cut) := by
      have : (n.factorial : ℕ) ≤ ((n+1).factorial : ℕ) := Nat.factorial_le (Nat.le_succ n)
      exact_mod_cast this
    rw [one_pow]
    rw [div_le_iff₀ hfac_pos]
    -- goal: h^n * h ≤ h * (1 / n!) * (n+1)!
    have : h * (1 / (n.factorial : Cut)) * ((n+1).factorial : Cut)
         = h * (((n+1).factorial : Cut) / (n.factorial : Cut)) := by ring
    rw [this]
    have hratio : (1:Cut) ≤ ((n+1).factorial : Cut) / (n.factorial : Cut) := by
      rw [le_div_iff₀ hnfac_pos]; simpa using hfac_ge
    calc h ^ n * h ≤ 1 * h := by
            apply mul_le_mul_of_nonneg_right hpow h0
      _ = h := one_mul h
      _ = h * 1 := (mul_one h).symm
      _ ≤ h * (((n+1).factorial : Cut) / (n.factorial : Cut)) :=
            mul_le_mul_of_nonneg_left hratio h0
  -- summability of the shifted family
  have hshift_summ : Summable (fun n => expTermC h (n+1)) := by
    have := (expTermC_summable h)
    exact (summable_nat_add_iff 1).mpr this
  have hrhs_summ : Summable (fun n => h * expTermC 1 n) :=
    (expTermC_summable 1).mul_left h
  have htail_le : ∑' n, expTermC h (n+1) ≤ ∑' n, h * expTermC 1 n :=
    hshift_summ.tsum_le_tsum htermle hrhs_summ
  have hmul : ∑' n, h * expTermC 1 n = h * cutExp 1 := by
    rw [(expTermC_summable 1).tsum_mul_left]; rfl
  rw [hmul] at htail_le
  rw [hsplit, h00]
  linarith [htail_le]

end
end ContinuumQ
end Phys.Foundation
