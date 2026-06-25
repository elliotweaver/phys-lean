import Phys.Foundation.ContinuumCCLO
import Mathlib.Topology.Order.Compact

open Phys.Foundation ContinuumQ

#check @isCompact_Icc
#check @ConditionallyCompleteLinearOrder.toCompactIccSpace
#check @CompactIccSpace
-- Does the order topology instance exist for our Cut after CCLO?
-- We need an explicit TopologicalSpace. Check Preorder.topology / orderTopology setup.
#check @Topology.IsLowerSet
