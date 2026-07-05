import Phys.Foundation.ContinuumTrigAdd
import Mathlib.Topology.Algebra.InfiniteSum.NatInt
import Mathlib.Topology.Algebra.InfiniteSum.Order

namespace Phys.Foundation
namespace ContinuumQ
open Filter Set Finset
open scoped Topology BigOperators
noncomputable section

example (f : ℕ → Cut) (hf : Summable f) :
    (∑ i ∈ range 2, f i) + ∑' n, f (n + 2) = ∑' n, f n := by
  exact hf.sum_add_tsum_nat_add 2

end
end ContinuumQ
end Phys.Foundation
