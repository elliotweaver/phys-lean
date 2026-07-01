import Phys.Algebra.TowerGatherFFTCommutantG2

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

-- (1) commutantG2 is a UNITAL SUBALGEBRA: contains 1, closed under *.
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

-- (2) THE RESOLUTION OF IDENTITY as an End equation: ∑ fourProj i = 1.
theorem probe_fourProj_sum : ∑ i, fourProj i = (1 : Module.End ℚ (Module.End ℚ ImO)) := by
  apply LinearMap.ext; intro X
  rw [Fin.sum_univ_four]
  show fourProj 0 X + fourProj 1 X + fourProj 2 X + fourProj 3 X = X
  show projTrivial X + proj7 X + proj14 X + proj27 X = X
  have h := projTrivial_add_proj27_add_proj7_add_proj14 X
  -- h : projTrivial X + proj27 X + proj7 X + proj14 X = X
  rw [← h]; ring

-- (3) THE PEIRCE EXPANSION T = ∑ᵢ∑ⱼ eᵢ T eⱼ (true for ALL T, from ∑eᵢ = 1).
theorem probe_peirce_expand (T : Module.End ℚ (Module.End ℚ ImO)) :
    T = ∑ i, ∑ j, fourProj i * T * fourProj j := by
  have hsum : ∑ i, fourProj i = (1 : Module.End ℚ (Module.End ℚ ImO)) := probe_fourProj_sum
  calc T = (∑ i, fourProj i) * T * (∑ j, fourProj j) := by rw [hsum, one_mul, mul_one]
    _ = ∑ i, ∑ j, fourProj i * T * fourProj j := by
        rw [Finset.sum_mul, Finset.sum_mul]
        apply Finset.sum_congr rfl; intro i _
        rw [Finset.mul_sum]

-- (4) EACH PEIRCE CORNER lies in the commutant (subalgebra + banked membership).
theorem probe_corner_mem (T : Module.End ℚ (Module.End ℚ ImO)) (hT : T ∈ commutantG2)
    (i j : Fin 4) : fourProj i * T * fourProj j ∈ commutantG2 :=
  probe_mul_mem (probe_mul_mem (fourProj_mem_commutantG2 i) hT) (fourProj_mem_commutantG2 j)

end

end Phys.Algebra
