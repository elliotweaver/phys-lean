import Phys.Algebra.SterileNeutrinoDarkMatter
import Mathlib.Tactic

namespace Phys.Algebra.Probe

open Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra
open Matrix

noncomputable section

-- (1) demProj idempotent
theorem demProj_idem : (demProj * demProj : Matrix (Fin 3) (Fin 3) Cut) = demProj := by
  funext i k
  simp only [demProj, Matrix.mul_apply, Matrix.of_apply, Fin.sum_univ_three]
  norm_num

-- (2) othersProj idempotent
theorem othersProj_idem : (othersProj * othersProj : Matrix (Fin 3) (Fin 3) Cut) = othersProj := by
  simp only [othersProj, sub_mul, one_mul, mul_sub, mul_one, demProj_idem]
  abel

-- (3) orthogonality
theorem demProj_othersProj : (demProj * othersProj : Matrix (Fin 3) (Fin 3) Cut) = 0 := by
  simp only [othersProj, mul_sub, mul_one, demProj_idem, sub_self]

theorem othersProj_demProj : (othersProj * demProj : Matrix (Fin 3) (Fin 3) Cut) = 0 := by
  simp only [othersProj, sub_mul, one_mul, demProj_idem, sub_self]

-- (4) resolution of identity
theorem generation_resolution_of_identity :
    (demProj + othersProj : Matrix (Fin 3) (Fin 3) Cut) = 1 := by
  rw [othersProj]; abel

-- (5) mass operator vanishes on self block
theorem mass_operator_self_block_zero (D0 : Matrix (Fin 3) (Fin 3) Cut) :
    demProj * ((othersProj * D0) * (othersProj * D0)ᵀ) = 0 := by
  rw [Matrix.transpose_mul, othersProj_symm]
  simp only [← Matrix.mul_assoc, demProj_othersProj, Matrix.zero_mul]

-- (6) mass operator supported on others block
theorem mass_operator_others_block (D0 : Matrix (Fin 3) (Fin 3) Cut) :
    othersProj * ((othersProj * D0) * (othersProj * D0)ᵀ)
      = (othersProj * D0) * (othersProj * D0)ᵀ := by
  rw [Matrix.transpose_mul, othersProj_symm]
  simp only [← Matrix.mul_assoc, othersProj_idem]

-- capstone bundling
theorem cosmology_contact_consolidated :
    (demProj + othersProj = (1 : Matrix (Fin 3) (Fin 3) Cut))
    ∧ (demProj * othersProj = (0 : Matrix (Fin 3) (Fin 3) Cut))
    ∧ ((demProj * demProj : Matrix (Fin 3) (Fin 3) Cut) = demProj)
    ∧ ((othersProj * othersProj : Matrix (Fin 3) (Fin 3) Cut) = othersProj)
    ∧ (Matrix.trace demProj = (1 : Cut))
    ∧ (Matrix.trace othersProj = (2 : Cut))
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut),
        demProj * ((othersProj * D0) * (othersProj * D0)ᵀ) = 0)
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut),
        othersProj * ((othersProj * D0) * (othersProj * D0)ᵀ)
          = (othersProj * D0) * (othersProj * D0)ᵀ)
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut),
        massOfDir (othersProj * D0) M selfDir = 0)
    ∧ (∀ (M : Cut), (heavyMajorana M).mulVec selfDir = M • selfDir)
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut),
        neutrinoMassSum (othersProj * D0) M = diracSelfOverlap (othersProj * D0) / M) :=
  ⟨generation_resolution_of_identity, demProj_othersProj, demProj_idem, othersProj_idem,
   demProj_trace_one, othersProj_trace_two, mass_operator_self_block_zero,
   mass_operator_others_block, self_generation_massless, heavyMajorana_selfDir_eigen,
   fun D0 M => sum_rides_on_two_massive D0 M⟩

end

-- axiom checks
#print axioms demProj_idem
#print axioms othersProj_idem
#print axioms demProj_othersProj
#print axioms othersProj_demProj
#print axioms generation_resolution_of_identity
#print axioms mass_operator_self_block_zero
#print axioms mass_operator_others_block
#print axioms cosmology_contact_consolidated

end Phys.Algebra.Probe
