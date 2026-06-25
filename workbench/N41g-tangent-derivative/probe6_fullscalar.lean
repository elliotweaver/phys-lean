import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Topology.Order.Basic

namespace Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

theorem cut_tendsto_zero_of_abs_le {l : Filter Cut} (h u : Cut → Cut)
    (hu : Tendsto u l (𝓝 0)) (hb : ∀ᶠ t in l, |h t| ≤ u t) :
    Tendsto h l (𝓝 0) := by
  have hneg : Tendsto (fun t => -u t) l (𝓝 0) := by simpa using hu.neg
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le' hneg hu ?_ ?_
  · filter_upwards [hb] with t ht; linarith [(abs_le.mp ht).1]
  · filter_upwards [hb] with t ht; linarith [(abs_le.mp ht).2]

theorem cut_abs_tsum_le {f : ℕ → Cut} (hf : Summable (fun n => |f n|)) :
    |∑' n, f n| ≤ ∑' n, |f n| := by
  have hfs : Summable f := cut_summable_of_abs hf
  have hub : ∑' n, f n ≤ ∑' n, |f n| := hfs.tsum_le_tsum (fun n => le_abs_self _) hf
  have hlb : -(∑' n, |f n|) ≤ ∑' n, f n := by
    rw [← tsum_neg]; exact hf.neg.tsum_le_tsum (fun n => neg_abs_le _) hfs
  exact abs_le.mpr ⟨hlb, hub⟩

/-- For `|t| ≤ 1` and `∑|b|` summable, the geometric-dominated series `∑|t^n b n|` is summable. -/
theorem cut_geomdom_abssummable {b : ℕ → Cut} (hb : Summable (fun n => |b n|))
    {t : Cut} (ht : |t| ≤ 1) :
    Summable (fun n => |t ^ n * b n|) := by
  apply cut_summable_of_nonneg_of_le (fun n => abs_nonneg _) _ hb
  intro n
  rw [abs_mul, abs_pow]
  have htn : |t| ^ n ≤ 1 := by
    calc |t| ^ n ≤ 1 ^ n := pow_le_pow_left₀ (abs_nonneg _) ht n
      _ = 1 := one_pow n
  nlinarith [abs_nonneg (b n), pow_nonneg (abs_nonneg t) n]

/-- For `|t| ≤ 1`, `∑'|t^n b n| ≤ ∑'|b n|`. -/
theorem cut_geomdom_tsum_le {b : ℕ → Cut} (hb : Summable (fun n => |b n|))
    {t : Cut} (ht : |t| ≤ 1) :
    ∑' n, |t ^ n * b n| ≤ ∑' n, |b n| := by
  apply (cut_geomdom_abssummable hb ht).tsum_le_tsum _ hb
  intro n
  rw [abs_mul, abs_pow]
  have htn : |t| ^ n ≤ 1 := by
    calc |t| ^ n ≤ 1 ^ n := pow_le_pow_left₀ (abs_nonneg _) ht n
      _ = 1 := one_pow n
  nlinarith [abs_nonneg (b n), pow_nonneg (abs_nonneg t) n]

/-- ★ THE SCALAR POWER-SERIES DERIVATIVE AT 0 over the derived ℝ. Hypothesis: `∑|a n|` summable
    (entire of radius ≥ 1, exactly the exponential setting). The difference quotient
    `t⁻¹ ((∑' tⁿ aₙ) − a₀)` tends to `a₁` as `t → 0` (punctured). Trunk-native `Tendsto` over the
    N34 order topology — NO `HasDerivAt`, NO `NormedField`. -/
theorem cut_powerseries_deriv (a : ℕ → Cut) (hsum1 : Summable (fun n => |a n|)) :
    Tendsto (fun t : Cut => t⁻¹ * ((∑' n, t ^ n * a n) - a 0)) (𝓝[≠] (0 : Cut)) (𝓝 (a 1)) := by
  set C : Cut := ∑' n, |a (n + 2)| with hC
  -- the shifted-summability facts
  have hsum2 : Summable (fun n => |a (n + 2)|) := (summable_nat_add_iff 2).2 hsum1
  have key : Tendsto (fun t : Cut => (t⁻¹ * ((∑' n, t ^ n * a n) - a 0)) - a 1)
      (𝓝[≠] (0 : Cut)) (𝓝 0) := by
    apply cut_tendsto_zero_of_abs_le _ (fun t => C * |t|)
    · have habs : Tendsto (fun t : Cut => |t|) (𝓝[≠] (0:Cut)) (𝓝 0) := by
        have h := (continuous_abs (G := Cut)).tendsto (0:Cut)
        rw [abs_zero] at h
        exact h.mono_left nhdsWithin_le_nhds
      have := habs.const_mul C
      simpa using this
    · have hmem : ∀ᶠ t : Cut in 𝓝[≠] (0:Cut), |t| ≤ 1 ∧ t ≠ 0 := by
        have hIcc : Set.Icc (-1 : Cut) 1 ∈ 𝓝 (0:Cut) :=
          Icc_mem_nhds (by norm_num) (by norm_num)
        have h1 : ∀ᶠ t : Cut in 𝓝[≠] (0:Cut), |t| ≤ 1 := by
          have : ∀ᶠ t : Cut in 𝓝 (0:Cut), |t| ≤ 1 := by
            filter_upwards [hIcc] with t ht; rw [abs_le]; exact ⟨ht.1, ht.2⟩
          exact this.filter_mono nhdsWithin_le_nhds
        have h2 : ∀ᶠ t : Cut in 𝓝[≠] (0:Cut), t ≠ 0 :=
          eventually_mem_nhdsWithin.mono (fun t ht => ht)
        exact h1.and h2
      filter_upwards [hmem] with t ht
      obtain ⟨htle, htne⟩ := ht
      -- f := the power series summand, explicit (avoids higher-order unification, RUNBOOK W9)
      have hsumf : Summable (fun n => t ^ n * a n) :=
        cut_summable_of_abs (cut_geomdom_abssummable hsum1 htle)
      have hRsum : Summable (fun n => t ^ n * a (n+2)) :=
        cut_summable_of_abs (cut_geomdom_abssummable hsum2 htle)
      -- peel range 2 in ONE step:  ∑ i∈range 2, fᵢ + ∑' n, f(n+2) = ∑' n, fₙ
      have hpeel : (∑ i ∈ Finset.range 2, t ^ i * a i)
          + ∑' n, t ^ (n+2) * a (n+2) = ∑' n, t ^ n * a n :=
        Summable.sum_add_tsum_nat_add (f := fun n => t ^ n * a n) 2 hsumf
      have htail_eq : (∑' n, t ^ (n+2) * a (n+2)) = t ^ 2 * ∑' n, t ^ n * a (n+2) := by
        rw [← tsum_mul_left]; apply tsum_congr; intro n; ring
      -- assemble: f(t) = a0 + t*a1 + t^2 * R(t)
      have hf : (∑' n, t ^ n * a n) = a 0 + t * a 1 + t ^ 2 * ∑' n, t ^ n * a (n+2) := by
        rw [← hpeel, htail_eq]
        simp only [Finset.sum_range_succ, Finset.sum_range_zero]
        ring
      have hquot : (t⁻¹ * ((∑' n, t ^ n * a n) - a 0)) - a 1
          = t * ∑' n, t ^ n * a (n+2) := by
        rw [hf]; field_simp; ring
      rw [hquot, abs_mul]
      have hRbound : |∑' n, t ^ n * a (n+2)| ≤ C := by
        calc |∑' n, t ^ n * a (n+2)| ≤ ∑' n, |t ^ n * a (n+2)| :=
              cut_abs_tsum_le (cut_geomdom_abssummable hsum2 htle)
          _ ≤ ∑' n, |a (n+2)| := cut_geomdom_tsum_le hsum2 htle
          _ = C := by rw [hC]
      calc |t| * |∑' n, t ^ n * a (n+2)|
          ≤ |t| * C := mul_le_mul_of_nonneg_left hRbound (abs_nonneg _)
        _ = C * |t| := by ring
  have := key.add_const (a 1)
  simpa using this

end
end Phys.Foundation.ContinuumQ
