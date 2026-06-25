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

/-- Majorant transfer: for |t| ≤ 1 (and ρ used = 1), the series `n ↦ t^n * a n` is abs-summable. -/
theorem cut_powerseries_abssummable (a : ℕ → Cut)
    (hmaj : ∀ ρ : Cut, 0 ≤ ρ → Summable (fun n => |a n| * ρ ^ n))
    {t : Cut} (ht : |t| ≤ 1) :
    Summable (fun n => |t ^ n * a n|) := by
  have h1 := hmaj 1 zero_le_one
  -- |t^n * a n| = |t|^n * |a n| ≤ 1^n * |a n| = |a n| * 1^n
  apply cut_summable_of_nonneg_of_le (fun n => abs_nonneg _) _ h1
  intro n
  rw [abs_mul, abs_pow, one_pow, mul_one]
  have htn : |t| ^ n ≤ 1 := by
    calc |t| ^ n ≤ 1 ^ n := pow_le_pow_left₀ (abs_nonneg _) ht n
      _ = 1 := one_pow n
  nlinarith [abs_nonneg (a n), abs_nonneg (t ^ n), pow_nonneg (abs_nonneg t) n]

end
end Phys.Foundation.ContinuumQ
