import Phys.Algebra.TowerGatherForcedSecondNeutral
import Phys.Algebra.DerivationStabilizerSplit
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

-- ImO-level block basis vectors
theorem e4O_memI : e4O ∈ ImO := by have := imBasis_mem_ImO 3; simpa [imBasis] using this
theorem e5O_memI : e5O ∈ ImO := by have := imBasis_mem_ImO 4; simpa [imBasis] using this
theorem e2O_memI : e2O ∈ ImO := by have := imBasis_mem_ImO 1; simpa [imBasis] using this
theorem e3O_memI : e3O ∈ ImO := by have := imBasis_mem_ImO 2; simpa [imBasis] using this

noncomputable def e4I : ImO := ⟨e4O, e4O_memI⟩
noncomputable def e5I : ImO := ⟨e5O, e5O_memI⟩
noncomputable def e2I : ImO := ⟨e2O, e2O_memI⟩
noncomputable def e3I : ImO := ⟨e3O, e3O_memI⟩

-- isospin-Cartan inert:
theorem imRep_DI_e4I : imRep DI e4I = 0 := by
  apply Subtype.ext; rw [imRep_DI_eq_qI, qI_coe]
  show qZ Imat (e4O : O ℚ) = 0
  ext <;> simp [qZ, Imat, e4I, e4O, c1,c2,c3,c4,c5,c6,c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

theorem imRep_DI_e5I : imRep DI e5I = 0 := by
  apply Subtype.ext; rw [imRep_DI_eq_qI, qI_coe]
  show qZ Imat (e5O : O ℚ) = 0
  ext <;> simp [qZ, Imat, e5I, e5O, c1,c2,c3,c4,c5,c6,c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

-- charged (complex structure on the block):
theorem chargeOp_e4I : chargeOp e4I = e5I := by
  apply Subtype.ext; rw [chargeOp_eq_qI, qI_coe]
  show qZ Cmat (e4O : O ℚ) = (e5I : O ℚ)
  show qZ Cmat (e4O : O ℚ) = e5O
  ext <;> simp [qZ, Cmat, e4I, e5I, e4O, e5O, c1,c2,c3,c4,c5,c6,c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

theorem chargeOp_e5I : chargeOp e5I = -e4I := by
  apply Subtype.ext; rw [chargeOp_eq_qI, qI_coe]
  show qZ Cmat (e5O : O ℚ) = ((-e4I : ImO) : O ℚ)
  show qZ Cmat (e5O : O ℚ) = -e4O
  ext <;> simp [qZ, Cmat, e4I, e5I, e4O, e5O, c1,c2,c3,c4,c5,c6,c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

-- T3-active contrast: imRep DI e2I = 2 • e3I ≠ 0
theorem imRep_DI_e2I : imRep DI e2I = (2 : ℚ) • e3I := by
  apply Subtype.ext; rw [imRep_DI_eq_qI, qI_coe]
  show qZ Imat (e2O : O ℚ) = ((2 : ℚ) • e3I : ImO)
  show qZ Imat (e2O : O ℚ) = (2 : ℚ) • e3O
  ext <;> simp [qZ, Imat, e2I, e3I, e2O, e3O, c1,c2,c3,c4,c5,c6,c7,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val]

end Phys.Algebra
