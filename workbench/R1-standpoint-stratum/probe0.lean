import Phys.Algebra.TowerGatherPhysicalState
import Phys.Algebra.TowerWorldMapIndivisible

namespace Phys.R1Probe
open Phys.Algebra Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD

-- reachability checks
#check @GluesGlobally
#check @one_gluesGlobally
#check @o_not_all_physical
#check @o_worlds_not_glue
#check @worldMap
#check @WorldsGlue
#check @worldMap_injective
#check @octMul_ne_zero
#check @LeftMul
#check @LeftMul_apply

-- one_ne_zero on O ℚ ?
example : (1 : O ℚ) ≠ 0 := one_ne_zero

-- zero_mul on O ℚ ?
example (b x : O ℚ) : (0 : O ℚ) * x = 0 := zero_mul x

-- worldMap defeq LeftMul?
example (a x : O ℚ) : worldMap a x = LeftMul a x := rfl

end Phys.R1Probe
