import Phys.Foundation.ContinuumCCLO
import Mathlib.Topology.Order.Compact
import Mathlib.Topology.Constructions
import Mathlib.Topology.Separation.Basic

open Phys.Foundation ContinuumQ

noncomputable instance instTopCut : TopologicalSpace Cut := Preorder.topology Cut
instance instOrdTopCut : OrderTopology Cut := ⟨rfl⟩

-- Hausdorff from a linear order topology (needed: closed subset of compact is compact)
example : T2Space Cut := inferInstance
-- order-closed topology
example : OrderClosedTopology Cut := inferInstance
-- closed subset of a compact set is compact
#check @IsCompact.of_isClosed_subset
-- a singleton point set is compact, closure facts
#check @IsClosed.isCompact
-- continuity of order: is Cut a TopologicalRing / does +,*,neg become continuous? (needed for exp/closedness of alg-aut conditions)
