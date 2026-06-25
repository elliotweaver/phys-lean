import Phys.Foundation.ContinuumUniform
import Mathlib.Topology.Algebra.Order.Field
import Mathlib.Order.Filter.CountablyGenerated
import Mathlib.Topology.Order.IsLUB

namespace Phys.Foundation
namespace ContinuumQ

open Filter
open scoped Topology Uniformity

noncomputable section

-- Does the abs-basis lemma exist & apply to Cut?
example : (𝓝 (0:Cut)).HasBasis (fun ε:Cut => (0:Cut) < ε) (fun ε => {x | |x| < ε}) := by
  simpa using nhds_basis_abs_sub_lt (0 : Cut)

end

end ContinuumQ
end Phys.Foundation
