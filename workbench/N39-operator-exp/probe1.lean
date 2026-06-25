/- PROBE 1 (N39): the trunk-native SUMMABILITY criterion over the derived ℝ.
   Q: does `nonneg f + BddAbove (range of partial sums) ⟹ Summable f` close over Cut
   WITHOUT an ℝ-valued norm, via hasSum_of_isLUB_of_nonneg + N33 ConditionallyCompleteLinearOrder? -/
import Phys.Foundation.ContinuumComplete
import Mathlib.Topology.Algebra.InfiniteSum.Order

namespace Phys.Foundation.ContinuumQ
open Filter Set
open scoped Topology BigOperators

noncomputable section

-- Cut is a ConditionallyCompleteLinearOrder (N33), so isLUB_csSup gives the LUB directly.
example (f : ℕ → Cut) (hf : ∀ n, 0 ≤ f n)
    (hbdd : BddAbove (Set.range (fun s : Finset ℕ => ∑ i ∈ s, f i))) : Summable f := by
  have hne : (Set.range (fun s : Finset ℕ => ∑ i ∈ s, f i)).Nonempty := ⟨0, ⟨∅, by simp⟩⟩
  exact ⟨_, hasSum_of_isLUB_of_nonneg hf (isLUB_csSup hne hbdd)⟩

end
end Phys.Foundation.ContinuumQ
