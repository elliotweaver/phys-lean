import Phys.Algebra.TowerGatherFFTCommutantG2

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Submodule
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 1000000
noncomputable section

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

theorem probe_fourProj_sum : ∑ i, fourProj i = (1 : Module.End ℚ (Module.End ℚ ImO)) := by
  apply LinearMap.ext; intro X
  rw [LinearMap.sum_apply, Fin.sum_univ_four, Module.End.one_apply]
  show projTrivial X + proj7 X + proj14 X + proj27 X = X
  have h := projTrivial_add_proj27_add_proj7_add_proj14 X
  have hperm : projTrivial X + proj7 X + proj14 X + proj27 X
      = projTrivial X + proj27 X + proj7 X + proj14 X := by abel
  rw [hperm, h]

-- THE PEIRCE EXPANSION (algebraic, ring identity from ∑eᵢ=1) — potential heavy sums.
theorem probe_peirce_expand (T : Module.End ℚ (Module.End ℚ ImO)) :
    T = ∑ i, ∑ j, fourProj i * T * fourProj j := by
  have hsum : ∑ i, fourProj i = (1 : Module.End ℚ (Module.End ℚ ImO)) := probe_fourProj_sum
  calc T = (∑ i, fourProj i) * T * (∑ j, fourProj j) := by rw [hsum, one_mul, mul_one]
    _ = ∑ i, ∑ j, fourProj i * T * fourProj j := by
        rw [Finset.sum_mul, Finset.sum_mul]
        apply Finset.sum_congr rfl; intro i _
        rw [Finset.mul_sum]

theorem probe_corner_mem (T : Module.End ℚ (Module.End ℚ ImO)) (hT : T ∈ commutantG2)
    (i j : Fin 4) : fourProj i * T * fourProj j ∈ commutantG2 :=
  probe_mul_mem (probe_mul_mem (fourProj_mem_commutantG2 i) hT) (fourProj_mem_commutantG2 j)

end
end Phys.Algebra
