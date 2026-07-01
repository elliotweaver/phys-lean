import Phys.Algebra.TowerGatherCanonicalDirectSum
import Phys.Algebra.TowerGatherInvariantFormsG2

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

/-- The g₂-EQUIVARIANT endomorphism space of `End ℚ ImO` = the COMMUTANT of the adjoint
    g₂-action `adEnd`: all `T : End ℚ (End ℚ ImO)` commuting with every `adEnd D`. -/
def commutantG2 : Submodule ℚ (Module.End ℚ (Module.End ℚ ImO)) where
  carrier := {T | ∀ D : derivationLieQ, adEnd D * T = T * adEnd D}
  zero_mem' := by intro D; rw [mul_zero, zero_mul]
  add_mem' := by
    intro S T hS hT D
    rw [mul_add, add_mul, hS D, hT D]
  smul_mem' := by
    intro c T hT D
    rw [mul_smul_comm, smul_mul_assoc, hT D]

theorem mem_commutantG2 {T : Module.End ℚ (Module.End ℚ ImO)} :
    T ∈ commutantG2 ↔ ∀ D : derivationLieQ, adEnd D * T = T * adEnd D := Iff.rfl

/-- Each of the four banked projectors lies in the commutant (banked equivariance). -/
theorem projTrivial_mem_commutantG2 : projTrivial ∈ commutantG2 := by
  intro D; apply LinearMap.ext; intro X
  rw [Module.End.mul_apply, Module.End.mul_apply, projTrivial_equivariant]

theorem proj7_mem_commutantG2 : proj7 ∈ commutantG2 := by
  intro D; apply LinearMap.ext; intro X
  rw [Module.End.mul_apply, Module.End.mul_apply, proj7_equivariant]

theorem proj14_mem_commutantG2 : proj14 ∈ commutantG2 := by
  intro D; apply LinearMap.ext; intro X
  rw [Module.End.mul_apply, Module.End.mul_apply, proj14_equivariant]

theorem proj27_mem_commutantG2 : proj27 ∈ commutantG2 := by
  intro D; apply LinearMap.ext; intro X
  rw [Module.End.mul_apply, Module.End.mul_apply, proj27_equivariant]

/-- Product of two projectors is the diagonal or zero (idempotency + orthogonality). -/
theorem fourProj_mul_self : ∀ j : Fin 4, fourProj j * fourProj j = fourProj j := by
  intro j
  apply LinearMap.ext; intro X
  rw [Module.End.mul_apply]
  fin_cases j
  · exact projTrivial_projTrivial X
  · exact proj7_proj7 X
  · exact proj14_proj14 X
  · exact proj27_proj27 X

theorem fourProj_mul_ne : ∀ i j : Fin 4, i ≠ j → fourProj i * fourProj j = 0 := by
  intro i j hij
  apply LinearMap.ext; intro X
  rw [Module.End.mul_apply, LinearMap.zero_apply]
  fin_cases i <;> fin_cases j
  all_goals first
    | exact absurd rfl hij
    | (show projTrivial (proj7 X) = 0; exact projTrivial_proj7 X)
    | (show projTrivial (proj14 X) = 0; exact projTrivial_proj14 X)
    | (show projTrivial (proj27 X) = 0; exact projTrivial_proj27 X)
    | (show proj7 (projTrivial X) = 0; exact proj7_projTrivial X)
    | (show proj7 (proj14 X) = 0; exact proj7_proj14 X)
    | (show proj7 (proj27 X) = 0; exact proj7_proj27 X)
    | (show proj14 (projTrivial X) = 0; exact proj14_projTrivial X)
    | (show proj14 (proj7 X) = 0; exact proj14_proj7 X)
    | (show proj14 (proj27 X) = 0; exact proj14_proj27 X)
    | (show proj27 (projTrivial X) = 0; exact proj27_projTrivial X)
    | (show proj27 (proj7 X) = 0; exact proj27_proj7 X)
    | (show proj27 (proj14 X) = 0; exact proj27_proj14 X)

theorem fourProj_ne_zero : ∀ j : Fin 4, fourProj j ≠ 0 := by
  intro j
  fin_cases j
  · show projTrivial ≠ 0
    intro hj
    have : Module.finrank ℚ (LinearMap.range projTrivial) = 1 := finrank_projTrivial_range
    rw [hj, LinearMap.range_zero, finrank_bot] at this; exact absurd this (by norm_num)
  · show proj7 ≠ 0
    intro hj
    have : Module.finrank ℚ (LinearMap.range proj7) = 7 := finrank_proj7_range
    rw [hj, LinearMap.range_zero, finrank_bot] at this; exact absurd this (by norm_num)
  · show proj14 ≠ 0
    intro hj
    have : Module.finrank ℚ (LinearMap.range proj14) = 14 := finrank_proj14_range
    rw [hj, LinearMap.range_zero, finrank_bot] at this; exact absurd this (by norm_num)
  · show proj27 ≠ 0
    intro hj
    have : Module.finrank ℚ (LinearMap.range proj27) = 27 := finrank_proj27_range
    rw [hj, LinearMap.range_zero, finrank_bot] at this; exact absurd this (by norm_num)

/-- The four projectors are ℚ-linearly independent (orthogonal idempotents). -/
theorem fourProj_linearIndependent : LinearIndependent ℚ fourProj := by
  apply Fintype.linearIndependent_iff.mpr
  intro g hsum j
  -- Right-multiply the vanishing combination by fourProj j.
  have hmul : (∑ i, g i • fourProj i) * fourProj j = 0 := by rw [hsum, zero_mul]
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

/-- ★ LOWER BOUND: `4 ≤ dim End_{g₂}(End ℚ ImO)`. The four banked g₂-equivariant projectors
    are four ℚ-linearly-independent elements of the commutant. -/
theorem four_le_finrank_commutantG2 : 4 ≤ Module.finrank ℚ commutantG2 := by
  -- Lift the four projectors into the commutant subtype.
  set b : Fin 4 → commutantG2 := fun i =>
    ⟨fourProj i, by
      fin_cases i
      · exact projTrivial_mem_commutantG2
      · exact proj7_mem_commutantG2
      · exact proj14_mem_commutantG2
      · exact proj27_mem_commutantG2⟩ with hb
  have hli : LinearIndependent ℚ b := by
    have hcomp : (commutantG2.subtype) ∘ b = fourProj := by
      funext i; simp [hb]
    have := fourProj_linearIndependent
    rw [← hcomp] at this
    exact this.of_comp commutantG2.subtype
  have := hli.fintype_card_le_finrank
  simpa using this

end

end Phys.Algebra
