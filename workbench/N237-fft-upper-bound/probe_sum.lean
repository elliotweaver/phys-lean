import Phys.Algebra.TowerGatherFFTCommutantG2

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Submodule
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 1000000
noncomputable section

theorem probe_fourProj_sum : ∑ i, fourProj i = (1 : Module.End ℚ (Module.End ℚ ImO)) := by
  apply LinearMap.ext; intro X
  rw [LinearMap.sum_apply, Fin.sum_univ_four, Module.End.one_apply]
  show projTrivial X + proj7 X + proj14 X + proj27 X = X
  have h := projTrivial_add_proj27_add_proj7_add_proj14 X
  have hperm : projTrivial X + proj7 X + proj14 X + proj27 X
      = projTrivial X + proj27 X + proj7 X + proj14 X := by abel
  rw [hperm, h]

end
end Phys.Algebra
