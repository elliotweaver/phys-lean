import Phys.Algebra.TowerGatherFFTCommutantG2

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Submodule
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 1000000
noncomputable section

-- baseline: just the subalgebra facts (operator-level, no sums)
theorem probe_one_mem : (1 : Module.End ℚ (Module.End ℚ ImO)) ∈ commutantG2 := by
  intro D; rw [mul_one, one_mul]

theorem probe_mul_mem {S T : Module.End ℚ (Module.End ℚ ImO)}
    (hS : S ∈ commutantG2) (hT : T ∈ commutantG2) : S * T ∈ commutantG2 := by
  intro D
  calc adEnd D * (S * T) = (adEnd D * S) * T := by rw [mul_assoc]
    _ = (S * adEnd D) * T := by rw [hS D]
    _ = S * (adEnd D * T) := by rw [mul_assoc]
    _ = S * (T * adEnd D) := by rw [hT D]
    _ = (S * T) * adEnd D := by rw [mul_assoc]

end
end Phys.Algebra
