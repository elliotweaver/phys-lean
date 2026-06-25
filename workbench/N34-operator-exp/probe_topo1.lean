import Phys.Foundation.ContinuumCCLO
import Mathlib.Topology.Order.Compact
import Mathlib.Topology.Algebra.Order.Compact

open Phys.Foundation ContinuumQ

-- What does toCompactIccSpace require?
#check @ConditionallyCompleteLinearOrder.toCompactIccSpace
#check @isCompact_Icc
-- order topology instance constructor
#check @Preorder.topology
#check @OrderTopology
-- check the CompactIccSpace -> isCompact_Icc path
#check @CompactIccSpace
