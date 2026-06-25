import Phys.Foundation.ContinuumSummable
import Mathlib.Topology.Algebra.InfiniteSum.Order
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Ring
import Mathlib.Topology.Order.Basic

namespace Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology BigOperators
noncomputable section

-- PROBE 2: abs of tsum ≤ tsum of abs over Cut (assuming Summable |f|).
example (f : ℕ → Cut) (hf : Summable (fun n => |f n|)) : |∑' n, f n| ≤ ∑' n, |f n| := by
  have hfs : Summable f := cut_summable_of_abs hf
  have hub : ∑' n, f n ≤ ∑' n, |f n| := hfs.tsum_le_tsum (fun n => le_abs_self _) hf
  have hlb : -(∑' n, |f n|) ≤ ∑' n, f n := by
    rw [← tsum_neg]
    exact hf.neg.tsum_le_tsum (fun n => neg_abs_le _) hfs
  exact abs_le.mpr ⟨hlb, hub⟩

-- PROBE 3: the series decomposition g(0) + ∑' g(n+1).
example (g : ℕ → Cut) (hg : Summable g) : ∑' n, g n = g 0 + ∑' n, g (n+1) := by
  exact hg.tsum_eq_zero_add

-- PROBE 4: tsum_mul_left.
example (t : Cut) (g : ℕ → Cut) : ∑' n, t^2 * g n = t^2 * ∑' n, g n := by
  exact tsum_mul_left

end
end Phys.Foundation.ContinuumQ
