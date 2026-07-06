import Phys.Foundation.ContinuumLog
import Mathlib.Tactic

namespace Phys.Foundation.ContinuumQ

open Filter Set
open scoped Topology BigOperators
noncomputable section

theorem cutExp_sub_one_lt (s : Cut) (hs : 0 < s) : cutExp s - 1 < s * cutExp s := by
  have hsplit : cutExp s = expTermC s 0 + ∑' n, expTermC s (n+1) := by
    unfold cutExp; exact (expTermC_summable s).tsum_eq_zero_add
  have h00 : expTermC s 0 = 1 := by unfold expTermC; simp
  have htermle : ∀ n, expTermC s (n+1) ≤ s * expTermC s n := by
    intro n
    unfold expTermC
    rw [pow_succ]
    have hfac_pos : (0:Cut) < ((n+1).factorial : Cut) := by positivity
    have hnfac_pos : (0:Cut) < (n.factorial : Cut) := by positivity
    have hfac_ge : (n.factorial : Cut) ≤ ((n+1).factorial : Cut) := by
      have : (n.factorial : ℕ) ≤ ((n+1).factorial : ℕ) := Nat.factorial_le (Nat.le_succ n)
      exact_mod_cast this
    rw [div_le_iff₀ hfac_pos]
    have hrw : s * (s ^ n / (n.factorial : Cut)) * ((n+1).factorial : Cut)
         = s ^ n * s * (((n+1).factorial : Cut) / (n.factorial : Cut)) := by
      ring
    rw [hrw]
    have hratio : (1:Cut) ≤ ((n+1).factorial : Cut) / (n.factorial : Cut) := by
      rw [le_div_iff₀ hnfac_pos]; simpa using hfac_ge
    have hsn : 0 ≤ s ^ n * s := by positivity
    nlinarith [hsn, hratio]
  have hshift_summ : Summable (fun n => expTermC s (n+1)) :=
    (summable_nat_add_iff 1).mpr (expTermC_summable s)
  have hrhs_summ : Summable (fun n => s * expTermC s n) := (expTermC_summable s).mul_left s
  have hstrict1 : expTermC s (1+1) < s * expTermC s 1 := by
    unfold expTermC
    have e1 : ((1+1).factorial : Cut) = 2 := by norm_num [Nat.factorial]
    have e2 : (((1:ℕ)).factorial : Cut) = 1 := by norm_num [Nat.factorial]
    rw [e1, e2]
    have : s ^ (1+1) / 2 < s * (s ^ 1 / 1) := by
      have hss : 0 < s * s := by positivity
      rw [pow_succ, pow_one, div_one]; nlinarith [hss]
    exact this
  have htail_lt : ∑' n, expTermC s (n+1) < ∑' n, s * expTermC s n :=
    Summable.tsum_lt_tsum (i := 1) htermle hstrict1 hshift_summ hrhs_summ
  have hmul : ∑' n, s * expTermC s n = s * cutExp s := by
    rw [(expTermC_summable s).tsum_mul_left]; rfl
  rw [hmul] at htail_lt
  have hcut : cutExp s - 1 = ∑' n, expTermC s (n+1) := by rw [hsplit, h00]; ring
  rw [hcut]; exact htail_lt

theorem one_add_lt_cutExp_pos (u : Cut) (hu : 0 < u) : 1 + u < cutExp u := by
  have hnn : ∀ n, 0 ≤ expTermC u n := by intro n; unfold expTermC; positivity
  have hle := sum_le_hasSum (Finset.range 3) (fun i _ => hnn i) (cutExp_hasSum u)
  have hfin : ∑ i ∈ Finset.range 3, expTermC u i = 1 + u + u^2/2 := by
    rw [Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_one]
    unfold expTermC
    norm_num [Nat.factorial]
  rw [hfin] at hle
  have : 0 < u^2/2 := by positivity
  linarith

theorem one_add_lt_cutExp (u : Cut) (hu : u ≠ 0) : 1 + u < cutExp u := by
  rcases lt_trichotomy u 0 with hneg | hz | hpos
  · set s := -u with hs_def
    have hspos : 0 < s := by rw [hs_def]; linarith
    have hkey : cutExp s - 1 < s * cutExp s := cutExp_sub_one_lt s hspos
    have hstep : (1 - s) * cutExp s < 1 := by nlinarith [hkey]
    have hpos : 0 < cutExp s := cutExp_pos s
    have hrecip : cutExp u * cutExp s = 1 := by
      have h := cutExp_mul_neg u
      rw [← hs_def] at h; exact h
    have hgap : (cutExp u - (1 - s)) * cutExp s = 1 - (1 - s) * cutExp s := by
      have : (cutExp u - (1 - s)) * cutExp s = cutExp u * cutExp s - (1 - s) * cutExp s := by ring
      rw [this, hrecip]
    have h2 : 0 < (cutExp u - (1 - s)) * cutExp s := by rw [hgap]; linarith [hstep]
    have h3 : 0 < cutExp u - (1 - s) := by
      by_contra hc; push_neg at hc
      nlinarith [mul_nonpos_of_nonpos_of_nonneg hc (le_of_lt hpos), h2]
    have : 1 - s < cutExp u := by linarith
    rw [hs_def] at this; linarith
  · exact absurd hz hu
  · exact one_add_lt_cutExp_pos u hpos

theorem cutLog_lt_sub_one (x : Cut) (hx : 0 < x) (hne : x ≠ 1) : cutLog x < x - 1 := by
  have hu : cutLog x ≠ 0 := by
    intro h
    have : cutExp (cutLog x) = cutExp 0 := by rw [h]
    rw [cutExp_cutLog hx, cutExp_zero] at this
    exact hne this
  have := one_add_lt_cutExp (cutLog x) hu
  rw [cutExp_cutLog hx] at this
  linarith

end
end Phys.Foundation.ContinuumQ
