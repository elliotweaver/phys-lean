import Phys.Algebra.TowerGatherFFTPeirceReduction

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Submodule
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 1000000
noncomputable section

example (i : Fin 4) (hi : i ≠ 3)
    (W : Submodule ℚ (Module.End ℚ ImO)) (hWle : W ≤ fourSummands i)
    (hdlt : Module.finrank ℚ W < Module.finrank ℚ (fourSummands i)) :
    W ≤ trivialLine ∨ W ≤ LinearMap.range crossEmb ∨ W ≤ LinearMap.range imRepL := by
  fin_cases i
  · left
    -- test: does trivialLine reduction work via change / rfl?
    have h : fourSummands (⟨0, by omega⟩ : Fin 4) = trivialLine := rfl
    rw [h] at hWle; exact hWle
  · right; left
    have h : fourSummands (⟨1, by omega⟩ : Fin 4) = LinearMap.range crossEmb := rfl
    rw [h] at hWle; exact hWle
  · right; right
    have h : fourSummands (⟨2, by omega⟩ : Fin 4) = LinearMap.range imRepL := rfl
    rw [h] at hWle; exact hWle
  · exact absurd rfl hi

end
end Phys.Algebra
