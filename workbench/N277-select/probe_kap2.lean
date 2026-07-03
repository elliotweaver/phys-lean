import Phys.Algebra.TowerGatherIsospinMultiplet
import Phys.Algebra.TowerGatherUniqueIsospinFixedAxis
import Mathlib.Tactic
open Phys.Cascade Phys.Cascade.CD
namespace Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section
theorem kappaO_one_eq_e4O : (kappaO (1 : H ℚ) : O ℚ) = e4O := rfl
-- hence kap1' = e4I as ImO elements
theorem kap1'_eq_e4I : kap1' = e4I := by
  apply Subtype.ext; show (kappaO (1:H ℚ) : O ℚ) = e4O; rfl
end
end Phys.Algebra
