import Phys.Foundation.ContinuumTrigAdd
import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Order

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

/-- termwise geometric majorant for the n≥2 cosine tail at x=2:
    |cosTermC 2 (n+2)| ≤ (2/3)·(2/15)^n. -/
theorem cos2_tail_termbound (n : ℕ) :
    |cosTermC (2:Cut) (n+2)| ≤ (2/3) * (2/15)^n := by
  rw [cosTermC_abs_eq]
  -- |2|^(2(n+2))/(2(n+2))! = 2^(2n+4)/(2n+4)!
  have habs2 : |(2:Cut)| = 2 := by norm_num
  rw [habs2]
  -- prove 2^(2*(n+2))/(2*(n+2))! ≤ (2/3)*(2/15)^n  by induction
  induction n with
  | zero => norm_num [Nat.factorial]
  | succ k ih =>
    -- ratio step: term(k+1)/term(k) = 2^2/((2k+5)(2k+6)) ≤ 2/15
    have hfk : (0:Cut) < ((2 * (k + 2)).factorial : Cut) := by positivity
    have hfk1 : (0:Cut) < ((2 * (k + 1 + 2)).factorial : Cut) := by positivity
    -- express term(k+1) = term(k) * 4 / ((2k+5)(2k+6))
    have hstep : (2:Cut) ^ (2 * (k + 1 + 2)) / ((2 * (k + 1 + 2)).factorial : Cut)
        = ((2:Cut) ^ (2 * (k + 2)) / ((2 * (k + 2)).factorial : Cut))
          * (4 / (((2*k+5) * (2*k+6) : ℕ) : Cut)) := by
      have he : 2 * (k + 1 + 2) = 2 * (k + 2) + 2 := by ring
      have hfe : (2 * (k + 2) + 2).factorial
          = (2 * (k + 2)).factorial * ((2*k+5) * (2*k+6)) := by
        rw [Nat.factorial_succ, Nat.factorial_succ]
        ring_nf
      rw [he, hfe]
      push_cast
      have hne : ((2 * (k + 2)).factorial : Cut) ≠ 0 := ne_of_gt hfk
      have hne2 : ((2*k+5 : ℕ):Cut) ≠ 0 := by positivity
      have hne3 : ((2*k+6 : ℕ):Cut) ≠ 0 := by positivity
      push_cast at hne2 hne3
      field_simp
      ring
    rw [hstep]
    have hratio : (4:Cut) / (((2*k+5) * (2*k+6) : ℕ) : Cut) ≤ 2/15 := by
      rw [div_le_div_iff₀ (by positivity) (by norm_num)]
      have : ((2*k+5 : ℕ):Cut) * ((2*k+6 : ℕ):Cut) ≥ 5 * 6 := by
        have h5 : (5:Cut) ≤ ((2*k+5 : ℕ):Cut) := by push_cast; nlinarith [Nat.zero_le k]
        have h6 : (6:Cut) ≤ ((2*k+6 : ℕ):Cut) := by push_cast; nlinarith [Nat.zero_le k]
        nlinarith [h5, h6, (by positivity : (0:Cut) ≤ ((2*k+5:ℕ):Cut))]
      push_cast at this ⊢
      nlinarith [this]
    have htermnn : (0:Cut) ≤ (2:Cut) ^ (2 * (k + 2)) / ((2 * (k + 2)).factorial : Cut) := by positivity
    calc ((2:Cut) ^ (2 * (k + 2)) / ((2 * (k + 2)).factorial : Cut)) * (4 / (((2*k+5) * (2*k+6) : ℕ) : Cut))
        ≤ ((2:Cut) ^ (2 * (k + 2)) / ((2 * (k + 2)).factorial : Cut)) * (2/15) :=
          mul_le_mul_of_nonneg_left hratio htermnn
      _ ≤ ((2/3) * (2/15)^k) * (2/15) := by
          apply mul_le_mul_of_nonneg_right _ (by norm_num); exact ih
      _ = (2/3) * (2/15)^(k+1) := by rw [pow_succ]; ring

/-- The geometric majorant value bound: `∑' n, (2/3)·(2/15)^n ≤ 10/13`. -/
theorem cos2_geo_value : (∑' n, (2/3 : Cut) * (2/15)^n) ≤ 10/13 := by
  have hgeo : Summable (fun n => (2/15 : Cut) ^ n) :=
    cut_summable_geometric (by norm_num) (by norm_num)
  rw [hgeo.tsum_mul_left]
  have hgv : (∑' n, (2/15 : Cut) ^ n) ≤ 15/13 := by
    apply hgeo.tsum_le_of_sum_le
    intro s
    obtain ⟨N, hN⟩ : ∃ N, s ⊆ Finset.range N :=
      ⟨(s.sup id) + 1, fun a ha => Finset.mem_range.2 (Nat.lt_succ_of_le (Finset.le_sup (f := id) ha))⟩
    have hmono : ∑ i ∈ s, (2/15:Cut)^i ≤ ∑ i ∈ range N, (2/15:Cut)^i :=
      Finset.sum_le_sum_of_subset_of_nonneg hN (fun i _ _ => by positivity)
    have htel := cut_geom_telescope (2/15 : Cut) N
    have hpow : (0:Cut) ≤ (2/15:Cut)^N := by positivity
    have hle1 : (1 - 2/15) * ∑ i ∈ range N, (2/15:Cut)^i ≤ 1 := by rw [htel]; nlinarith [hpow]
    nlinarith [hmono, hle1]
  nlinarith [hgv]

/-- SIGN CHANGE: `cutCos 2 < 0`. Head/tail split at n=2: the head `1 + (−2) = −1`, and the n≥2 tail is
    bounded in magnitude by the geometric majorant `≤ 10/13 < 1`, so `cutCos 2 ≤ −1 + 10/13 < 0`. -/
theorem cutCos_two_neg : cutCos (2:Cut) < 0 := by
  have hsplit : cutCos (2:Cut) = (∑ i ∈ range 2, cosTermC (2:Cut) i) + ∑' n, cosTermC (2:Cut) (n + 2) := by
    unfold cutCos
    exact ((cosTermC_summable 2).sum_add_tsum_nat_add 2).symm
  have hhead : (∑ i ∈ range 2, cosTermC (2:Cut) i) = -1 := by
    rw [Finset.sum_range_succ, Finset.sum_range_one]
    unfold cosTermC; norm_num
  have hshiftsumm : Summable (fun n => cosTermC (2:Cut) (n + 2)) :=
    (summable_nat_add_iff 2).mpr (cosTermC_summable 2)
  have habssumm : Summable (fun n => |cosTermC (2:Cut) (n + 2)|) :=
    (summable_nat_add_iff 2).mpr (cosTermC_abs_summable 2)
  have hgeomaj : Summable (fun n => (2/3 : Cut) * (2/15)^n) :=
    (cut_summable_geometric (by norm_num) (by norm_num)).mul_left _
  have htailbound : ∑' n, cosTermC (2:Cut) (n + 2) ≤ 10/13 := by
    calc ∑' n, cosTermC (2:Cut) (n + 2)
        ≤ ∑' n, |cosTermC (2:Cut) (n + 2)| :=
          hshiftsumm.tsum_le_tsum (fun n => le_abs_self _) habssumm
      _ ≤ ∑' n, (2/3 : Cut) * (2/15)^n := habssumm.tsum_le_tsum cos2_tail_termbound hgeomaj
      _ ≤ 10/13 := cos2_geo_value
  rw [hsplit, hhead]
  linarith [htailbound]

end
end ContinuumQ
end Phys.Foundation
