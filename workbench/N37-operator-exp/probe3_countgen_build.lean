import Phys.Foundation.ContinuumArchimedean
import Phys.Foundation.ContinuumUniform
import Mathlib.Topology.Algebra.Order.Field
import Mathlib.Order.Filter.CountablyGenerated
import Mathlib.Topology.Order.IsLUB

namespace Phys.Foundation
namespace ContinuumQ

open Filter
open scoped Topology Uniformity

noncomputable section

-- Build a ℕ-indexed nhds basis at 0 using 1/(n+1), then countable-generated.
example : IsCountablyGenerated (𝓝 (0:Cut)) := by
  have habs : (𝓝 (0:Cut)).HasBasis (fun ε:Cut => (0:Cut) < ε) (fun ε => {x | |x| < ε}) := by
    simpa using nhds_basis_abs_sub_lt (0 : Cut)
  -- reindex to ℕ via 1/(n+1)
  have hnat : (𝓝 (0:Cut)).HasBasis (fun _:ℕ => True) (fun n => {x:Cut | |x| < 1/(n+1)}) := by
    refine habs.to_hasBasis' ?_ ?_
    · intro ε hε
      obtain ⟨n, hn⟩ := exists_nat_one_div_lt hε
      exact ⟨n, trivial, fun x hx => lt_trans hx hn⟩
    · intro n _
      have : (0:Cut) < 1/(n+1) := by positivity
      exact (habs.mem_iff).2 ⟨1/(n+1), this, fun x hx => hx⟩
  exact hnat.isCountablyGenerated

end

end ContinuumQ
end Phys.Foundation
