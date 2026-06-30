import Phys.Foundation.ContinuumScalarDeriv

namespace Phys.Foundation.ContinuumQ

open Filter Set
open scoped Topology BigOperators

noncomputable section

/-- PROBE: the scalar 2nd-order power-series derivative at 0 over the derived ℝ. -/
theorem cut_powerseries_deriv2 (a : ℕ → Cut) (hsum1 : Summable (fun n => |a n|)) :
    Tendsto (fun t : Cut => (t ^ 2)⁻¹ * ((∑' n, t ^ n * a n) - a 0 - t * a 1))
      (𝓝[≠] (0 : Cut)) (𝓝 (a 2)) := by
  set C : Cut := ∑' n, |a (n + 3)| with hC
  have hsum3 : Summable (fun n => |a (n + 3)|) := (summable_nat_add_iff 3).2 hsum1
  have key : Tendsto (fun t : Cut => ((t ^ 2)⁻¹ * ((∑' n, t ^ n * a n) - a 0 - t * a 1)) - a 2)
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
      have hsumf : Summable (fun n => t ^ n * a n) :=
        cut_summable_of_abs (cut_geomdom_abssummable hsum1 htle)
      have hRsum : Summable (fun n => t ^ n * a (n+3)) :=
        cut_summable_of_abs (cut_geomdom_abssummable hsum3 htle)
      -- peel `range 3`
      have hpeel : (∑ i ∈ Finset.range 3, t ^ i * a i)
          + ∑' n, t ^ (n+3) * a (n+3) = ∑' n, t ^ n * a n :=
        Summable.sum_add_tsum_nat_add (f := fun n => t ^ n * a n) 3 hsumf
      have htail_eq : (∑' n, t ^ (n+3) * a (n+3)) = t ^ 3 * ∑' n, t ^ n * a (n+3) := by
        rw [← tsum_mul_left]; apply tsum_congr; intro n; ring
      have hf : (∑' n, t ^ n * a n)
          = a 0 + t * a 1 + t ^ 2 * a 2 + t ^ 3 * ∑' n, t ^ n * a (n+3) := by
        rw [← hpeel, htail_eq]
        simp only [Finset.sum_range_succ, Finset.sum_range_zero]
        ring
      have hquot : ((t ^ 2)⁻¹ * ((∑' n, t ^ n * a n) - a 0 - t * a 1)) - a 2
          = t * ∑' n, t ^ n * a (n+3) := by
        rw [hf]; field_simp; ring
      rw [hquot, abs_mul]
      have hRbound : |∑' n, t ^ n * a (n+3)| ≤ C := by
        calc |∑' n, t ^ n * a (n+3)| ≤ ∑' n, |t ^ n * a (n+3)| :=
              cut_abs_tsum_le (cut_geomdom_abssummable hsum3 htle)
          _ ≤ ∑' n, |a (n+3)| := cut_geomdom_tsum_le hsum3 htle
          _ = C := by rw [hC]
      calc |t| * |∑' n, t ^ n * a (n+3)|
          ≤ |t| * C := mul_le_mul_of_nonneg_left hRbound (abs_nonneg _)
        _ = C * |t| := by ring
  have := key.add_const (a 2)
  simpa using this

end

end Phys.Foundation.ContinuumQ
