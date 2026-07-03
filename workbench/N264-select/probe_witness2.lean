import Phys.Algebra.TowerWorldMapCliffordModule
open scoped Classical BigOperators
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000
noncomputable section

def rightReg : ImO →ₗ[ℚ] Module.End ℚ (O ℚ) where
  toFun a := RightMul (a : O ℚ)
  map_add' a b := by
    apply LinearMap.ext; intro y
    simp only [LinearMap.add_apply, RightMul_apply, Submodule.coe_add, mul_add_na]
  map_smul' c a := by
    apply LinearMap.ext; intro y
    simp only [LinearMap.smul_apply, RightMul_apply, SetLike.val_smul, qsmul_mul_right,
      RingHom.id_apply]
@[simp] theorem rightReg_apply (a : ImO) (y : O ℚ) : rightReg a y = y * (a : O ℚ) := rfl

-- the two witness elements, packaged as ImO members (as explicit membership proofs)
theorem wa_mem : (CD.iota (ιJ ℚ) : O ℚ) ∈ ImO := by rw [mem_ImO]; ext <;> simp [iota, ιJ, Dbl.J]
theorem wb_mem : (CD.e2 : O ℚ) ∈ ImO := by rw [mem_ImO]; ext <;> simp [e2]

-- W8 CRUX: the two spinor chiralities do NOT commute at a concrete IMAGINARY witness pair.
theorem chir_spinor_block_witness :
    (leftReg ⟨CD.iota (ιJ ℚ), wa_mem⟩).comp (rightReg ⟨(CD.e2 : O ℚ), wb_mem⟩)
      ≠ (rightReg ⟨(CD.e2 : O ℚ), wb_mem⟩).comp (leftReg ⟨CD.iota (ιJ ℚ), wa_mem⟩) := by
  intro h
  have hx := congrArg (fun f => f (CD.iota (CD.e2 : H ℚ))) h
  simp only [LinearMap.comp_apply, leftReg_apply, rightReg_apply] at hx
  exact not_associative_witness hx.symm

end
end Phys.Algebra
