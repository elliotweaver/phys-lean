import Phys.Algebra.TowerGatherFFTCommutantG2

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Submodule
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 1000000
noncomputable section

def probeSpan : Submodule ℚ (Module.End ℚ (Module.End ℚ ImO)) :=
  Submodule.span ℚ (Set.range fourProj)

theorem probe_span_le_commutantG2 : probeSpan ≤ commutantG2 := by
  rw [probeSpan, Submodule.span_le]
  rintro T ⟨i, rfl⟩
  exact fourProj_mem_commutantG2 i

-- the lift into probeSpan
def bSpan : Fin 4 → probeSpan := fun i => ⟨fourProj i, Submodule.subset_span ⟨i, rfl⟩⟩
def liftSpan : (Fin 4 → ℚ) →ₗ[ℚ] probeSpan := Fintype.linearCombination ℚ bSpan

theorem liftSpan_injective : Function.Injective liftSpan := by
  rw [injective_iff_map_eq_zero]
  intro g hg
  have hval : (∑ i, g i • fourProj i) = 0 := by
    have := congrArg (Subtype.val) hg
    rw [ZeroMemClass.coe_zero] at this
    rw [← this, liftSpan, Fintype.linearCombination_apply, AddSubmonoidClass.coe_finset_sum]
    simp only [SetLike.val_smul, bSpan]
  funext j
  have hmul : (∑ i, g i • fourProj i) * fourProj j = 0 := by rw [hval, zero_mul]
  rw [Finset.sum_mul] at hmul
  have hsingle : ∑ i, g i • fourProj i * fourProj j = g j • fourProj j := by
    rw [Finset.sum_eq_single_of_mem j (Finset.mem_univ j)]
    · rw [smul_mul_assoc, fourProj_mul_self]
    · intro i _ hij
      rw [smul_mul_assoc, fourProj_mul_ne i j hij, smul_zero]
  rw [hsingle] at hmul
  rcases smul_eq_zero.1 hmul with h | h
  · exact h
  · exact absurd h (fourProj_ne_zero j)

theorem probe_span_finrank_eq : Module.finrank ℚ probeSpan = 4 := by
  refine le_antisymm ?_ ?_
  · have h := finrank_range_le_card (R := ℚ) fourProj
    rw [Fintype.card_fin] at h; exact h
  · have h1 : Module.finrank ℚ (Fin 4 → ℚ) ≤ Module.finrank ℚ probeSpan :=
      liftSpan.finrank_le_finrank_of_injective liftSpan_injective
    rwa [Module.finrank_fin_fun] at h1

end
end Phys.Algebra
