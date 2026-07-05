import Phys.Foundation.ContinuumTrigPi
import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Order

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

/-- PROBE 1: the head `∑ i ∈ range 3, cosTermC (2/3) i = 191/243`. -/
theorem probe_head :
    (∑ i ∈ Finset.range 3, cosTermC (2 / 3 : Cut) i) = 191 / 243 := by
  rw [Finset.sum_range_succ, Finset.sum_range_succ, Finset.sum_range_one]
  unfold cosTermC
  norm_num [Nat.factorial]

/-- PROBE 2: the geometric termbound (mirror of cos2_tail_termbound, x=2/3, split at 3). -/
theorem probe_termbound (n : ℕ) :
    |cosTermC (2 / 3 : Cut) (n + 3)| ≤ (4 / 32805) * (1 / 126) ^ n := by
  rw [cosTermC_abs_eq]
  have habs : |(2 / 3 : Cut)| = 2 / 3 := by norm_num
  rw [habs]
  induction n with
  | zero => norm_num [Nat.factorial]
  | succ k ih =>
    have hfk : (0 : Cut) < ((2 * (k + 3)).factorial : Cut) := by positivity
    have hstep : (2 / 3 : Cut) ^ (2 * (k + 1 + 3)) / ((2 * (k + 1 + 3)).factorial : Cut)
        = ((2 / 3 : Cut) ^ (2 * (k + 3)) / ((2 * (k + 3)).factorial : Cut))
          * ((4 / 9) / (((2 * k + 7) * (2 * k + 8) : ℕ) : Cut)) := by
      have he : 2 * (k + 1 + 3) = 2 * (k + 3) + 2 := by ring
      have hfe : (2 * (k + 3) + 2).factorial
          = (2 * (k + 3)).factorial * ((2 * k + 7) * (2 * k + 8)) := by
        rw [Nat.factorial_succ, Nat.factorial_succ]; ring_nf
      rw [he, hfe]
      push_cast
      have hne : ((2 * (k + 3)).factorial : Cut) ≠ 0 := ne_of_gt hfk
      have hne2 : ((2 * k + 7 : ℕ) : Cut) ≠ 0 := by positivity
      have hne3 : ((2 * k + 8 : ℕ) : Cut) ≠ 0 := by positivity
      push_cast at hne2 hne3
      field_simp
      ring
    rw [hstep]
    have hratio : (4 / 9 : Cut) / (((2 * k + 7) * (2 * k + 8) : ℕ) : Cut) ≤ 1 / 126 := by
      rw [div_le_div_iff₀ (by positivity) (by norm_num)]
      have hge : ((2 * k + 7 : ℕ) : Cut) * ((2 * k + 8 : ℕ) : Cut) ≥ 7 * 8 := by
        have h7 : (7 : Cut) ≤ ((2 * k + 7 : ℕ) : Cut) := by push_cast; nlinarith [Nat.zero_le k]
        have h8 : (8 : Cut) ≤ ((2 * k + 8 : ℕ) : Cut) := by push_cast; nlinarith [Nat.zero_le k]
        nlinarith [h7, h8, (by positivity : (0 : Cut) ≤ ((2 * k + 7 : ℕ) : Cut))]
      push_cast at hge ⊢
      nlinarith [hge]
    have htermnn : (0 : Cut) ≤ (2 / 3 : Cut) ^ (2 * (k + 3)) / ((2 * (k + 3)).factorial : Cut) := by
      positivity
    calc ((2 / 3 : Cut) ^ (2 * (k + 3)) / ((2 * (k + 3)).factorial : Cut))
          * ((4 / 9) / (((2 * k + 7) * (2 * k + 8) : ℕ) : Cut))
        ≤ ((2 / 3 : Cut) ^ (2 * (k + 3)) / ((2 * (k + 3)).factorial : Cut)) * (1 / 126) :=
          mul_le_mul_of_nonneg_left hratio htermnn
      _ ≤ ((4 / 32805) * (1 / 126) ^ k) * (1 / 126) := by
          apply mul_le_mul_of_nonneg_right _ (by norm_num); exact ih
      _ = (4 / 32805) * (1 / 126) ^ (k + 1) := by rw [pow_succ]; ring

/-- PROBE 3: the geometric-majorant value bound (mirror cos2_geo_value). -/
theorem probe_geo_value : (∑' n, (4 / 32805 : Cut) * (1 / 126) ^ n) ≤ 56 / 455625 := by
  have hgeo : Summable (fun n => (1 / 126 : Cut) ^ n) :=
    cut_summable_geometric (by norm_num) (by norm_num)
  rw [hgeo.tsum_mul_left]
  have hgv : (∑' n, (1 / 126 : Cut) ^ n) ≤ 126 / 125 := by
    apply hgeo.tsum_le_of_sum_le
    intro s
    obtain ⟨N, hN⟩ : ∃ N, s ⊆ Finset.range N :=
      ⟨(s.sup id) + 1, fun a ha => Finset.mem_range.2 (Nat.lt_succ_of_le (Finset.le_sup (f := id) ha))⟩
    have hmono : ∑ i ∈ s, (1 / 126 : Cut) ^ i ≤ ∑ i ∈ range N, (1 / 126 : Cut) ^ i :=
      Finset.sum_le_sum_of_subset_of_nonneg hN (fun i _ _ => by positivity)
    have htel := cut_geom_telescope (1 / 126 : Cut) N
    have hpow : (0 : Cut) ≤ (1 / 126 : Cut) ^ N := by positivity
    have hle1 : (1 - 1 / 126) * ∑ i ∈ range N, (1 / 126 : Cut) ^ i ≤ 1 := by
      rw [htel]; nlinarith [hpow]
    nlinarith [hmono, hle1]
  nlinarith [hgv]

end
end ContinuumQ
end Phys.Foundation
