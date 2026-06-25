import Phys.Foundation.ContinuumUniform
import Mathlib.Topology.Algebra.Order.Field
import Mathlib.Order.Filter.CountablyGenerated
import Mathlib.Topology.Order.IsLUB

namespace Phys.Foundation
namespace ContinuumQ

open Filter
open scoped Topology Uniformity

noncomputable section

-- P1a: does Cut have the order-density properties (from LinearOrderedField)?
example : DenselyOrdered Cut := by infer_instance
example : NoMaxOrder Cut := by infer_instance
example : NoMinOrder Cut := by infer_instance

-- P1b: is 𝓝 0 countably generated automatically? (task says first countable does NOT synth)
-- Try to synth directly:
example : IsCountablyGenerated (𝓝 (0 : Cut)) := by infer_instance

end

end ContinuumQ
end Phys.Foundation
