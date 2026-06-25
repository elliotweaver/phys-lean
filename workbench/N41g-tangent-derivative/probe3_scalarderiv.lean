import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Topology.Order.Basic

namespace Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- THE SQUEEZE (probe1 confirmed).
theorem cut_tendsto_zero_of_abs_le {l : Filter Cut} (h u : Cut → Cut)
    (hu : Tendsto u l (𝓝 0)) (hb : ∀ᶠ t in l, |h t| ≤ u t) :
    Tendsto h l (𝓝 0) := by
  have hneg : Tendsto (fun t => -u t) l (𝓝 0) := by simpa using hu.neg
  refine tendsto_of_tendsto_of_tendsto_of_le_of_le' hneg hu ?_ ?_
  · filter_upwards [hb] with t ht; linarith [(abs_le.mp ht).1]
  · filter_upwards [hb] with t ht; linarith [(abs_le.mp ht).2]

-- abs of tsum ≤ tsum of abs (probe2 confirmed).
theorem cut_abs_tsum_le {f : ℕ → Cut} (hf : Summable (fun n => |f n|)) :
    |∑' n, f n| ≤ ∑' n, |f n| := by
  have hfs : Summable f := cut_summable_of_abs hf
  have hub : ∑' n, f n ≤ ∑' n, |f n| := hfs.tsum_le_tsum (fun n => le_abs_self _) hf
  have hlb : -(∑' n, |f n|) ≤ ∑' n, f n := by
    rw [← tsum_neg]; exact hf.neg.tsum_le_tsum (fun n => neg_abs_le _) hfs
  exact abs_le.mpr ⟨hlb, hub⟩

/-- THE SCALAR POWER-SERIES DERIVATIVE AT 0, entire-majorant hypothesis. -/
theorem cut_powerseries_deriv (a : ℕ → Cut)
    (hmaj : ∀ ρ : Cut, 0 ≤ ρ → Summable (fun n => |a n| * ρ ^ n)) :
    Tendsto (fun t : Cut => t⁻¹ * ((∑' n, t ^ n * a n) - a 0)) (𝓝[≠] (0 : Cut)) (𝓝 (a 1)) := by
  -- The remainder constant C := ∑' n, |a (n+2)| (the ρ=1 tail majorant).
  -- f(t) = a0 + a1 t + t^2 R(t), R(t) = ∑' n, t^n a(n+2).
  -- For |t| ≤ 1 and t ≠ 0: t⁻¹(f(t)-a0) - a1 = t R(t), and |t R(t)| ≤ C |t|.
  -- Squeeze → 0, hence the limit is a1.
  sorry

end
end Phys.Foundation.ContinuumQ
