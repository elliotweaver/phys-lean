import Phys.Algebra.NeutrinoMasslessGeneration
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Foundation Phys.Foundation.ContinuumQ
open Matrix

noncomputable section

-- (1) HEAVY EIGENVECTOR: the self-direction carries the FULL heavy scale M.
theorem heavyMajorana_selfDir_eigen (M : Cut) :
    (heavyMajorana M).mulVec selfDir = M • selfDir := by
  rw [heavyMajorana, smul_mulVec_eq, Matrix.one_mulVec]

-- (1b) heavy operator does NOT annihilate the self-direction for M ≠ 0 (contrast with light).
theorem heavyMajorana_selfDir_ne_zero (M : Cut) (hM : M ≠ 0) :
    (heavyMajorana M).mulVec selfDir ≠ 0 := by
  rw [heavyMajorana_selfDir_eigen]
  intro h
  -- (M • selfDir) 0 = M * 1 = M = 0
  have h0 := congrFun h 0
  simp only [Pi.smul_apply, selfDir, Matrix.cons_val_zero, smul_eq_mul, mul_one,
    Pi.zero_apply] at h0
  exact hM h0

-- (2) STABILITY / no decay portal: the Dirac portal annihilates the self-direction.
theorem dirac_portal_selfDir_zero (D0 : Matrix (Fin 3) (Fin 3) Cut) :
    ((othersProj * D0) * (othersProj * D0)ᵀ).mulVec selfDir = 0 := by
  rw [← Matrix.mulVec_mulVec, dirac_others_self_blind, Matrix.mulVec_zero]

-- (2b) every transition amplitude to an active direction vanishes (through the light operator).
theorem transition_to_active_vanishes (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut)
    (v : Fin 3 → Cut) :
    dotProduct v (((M⁻¹) • ((othersProj * D0) * (othersProj * D0)ᵀ)).mulVec selfDir) = 0 := by
  rw [selfDir_zero_mode, dotProduct_zero]

-- (2c) same, stated on the raw Dirac portal (no scale).
theorem dirac_transition_vanishes (D0 : Matrix (Fin 3) (Fin 3) Cut) (v : Fin 3 → Cut) :
    dotProduct v (((othersProj * D0) * (othersProj * D0)ᵀ).mulVec selfDir) = 0 := by
  rw [dirac_portal_selfDir_zero, dotProduct_zero]

-- (3) capstone bundle
theorem sterile_nu_dark_matter :
    (∀ (M : Cut), (heavyMajorana M).mulVec selfDir = M • selfDir)
    ∧ (∀ (M : Cut), M ≠ 0 → (heavyMajorana M).mulVec selfDir ≠ 0)
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut),
        massOfDir (othersProj * D0) M selfDir = 0)
    ∧ (∀ (D0 : Matrix (Fin 3) (Fin 3) Cut) (M : Cut) (v : Fin 3 → Cut),
        dotProduct v (((M⁻¹) • ((othersProj * D0) * (othersProj * D0)ᵀ)).mulVec selfDir) = 0) :=
  ⟨heavyMajorana_selfDir_eigen, heavyMajorana_selfDir_ne_zero,
   self_generation_massless, transition_to_active_vanishes⟩

-- W8 non-vacuity content: heavy operator is full-rank (no massless direction), unlike light.
theorem heavyMajorana_no_massless (M : Cut) (hM : M ≠ 0) (v : Fin 3 → Cut) (hv : v ≠ 0) :
    (heavyMajorana M).mulVec v ≠ 0 := by
  rw [heavyMajorana, smul_mulVec_eq, Matrix.one_mulVec]
  intro h
  apply hv
  funext i
  have hi := congrFun h i
  simp only [Pi.smul_apply, smul_eq_mul, Pi.zero_apply] at hi
  rcases mul_eq_zero.mp hi with hM0 | hv0
  · exact absurd hM0 hM
  · exact hv0

end

end Phys.Algebra
