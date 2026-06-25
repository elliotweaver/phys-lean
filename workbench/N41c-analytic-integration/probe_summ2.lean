import Phys.Cascade.OctonionTopology
import Mathlib.Topology.Algebra.InfiniteSum.Ring
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD
-- The CD.toProd is an additive embedding that is a homeomorphism onto its (full) range.
-- Approach: Summable f ↔ Summable (toProd ∘ f) via the additive equiv CD A ≃ A × A.
-- Build the AddEquiv + Homeomorph, then summable_iff via the continuous additive equiv.
section
variable {A : Type*} [Add A] [UniformSpace A]
-- toProd is additive
example (z w : CD A) : CD.toProd (z + w) = CD.toProd z + CD.toProd w := by
  simp [CD.toProd, Prod.ext_iff]
end
end
