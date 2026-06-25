import Phys.Foundation.ContinuumCCLO
import Mathlib.Topology.Order.Compact
import Mathlib.Topology.Algebra.Order.Field

open Phys.Foundation ContinuumQ

noncomputable instance instTopCut : TopologicalSpace Cut := Preorder.topology Cut
instance instOrdTopCut : OrderTopology Cut := ⟨rfl⟩

-- Does the order topology make Cut a topological ring (continuous +, *, neg)?
-- Mathlib: LinearOrderedField + OrderTopology ⟹ continuous field ops (TopologicalDivisionRing / OrderTopology gives it)
example : IsTopologicalRing Cut := inferInstance
example : ContinuousMul Cut := inferInstance
example : ContinuousAdd Cut := inferInstance
example : T2Space Cut := inferInstance
