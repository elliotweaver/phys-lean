import Phys.Foundation.ContinuumCCLO
import Mathlib.Topology.Order.Compact

open Phys.Foundation ContinuumQ

#check @Preorder.topology
#check @OrderTopology
#check @OrderTopology.mk
-- Can we put the order topology on Cut and prove OrderTopology by rfl?
noncomputable instance : TopologicalSpace Cut := Preorder.topology Cut
instance : OrderTopology Cut := by
  letI := Preorder.topology Cut
  exact ⟨rfl⟩
-- now Heine-Borel:
example (a b : Cut) : IsCompact (Set.Icc a b) := isCompact_Icc
