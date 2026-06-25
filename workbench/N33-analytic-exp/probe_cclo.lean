/-
  N33 W9 MEASUREMENT PROBE 3b (bounded — #check / #print fail fast).
  GOAL: confirm the order-topology Heine-Borel machinery is reachable and size the
  ConditionallyCompleteLinearOrder assembly.
-/
import Mathlib.Order.ConditionallyCompleteLattice.Basic
import Mathlib.Topology.Order.Compact

#print ConditionallyCompleteLinearOrder
#check @isCompact_Icc
#check @CompactIccSpace
-- ConditionallyCompleteLinearOrder + OrderTopology ⟹ CompactIccSpace (the Heine-Borel we want)
#check @ConditionallyCompleteLinearOrder.toCompactIccSpace
#check @OrderTopology
#check @Preorder.topology
