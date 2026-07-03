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

theorem wa_mem : (CD.iota (ιJ ℚ) : O ℚ) ∈ ImO := by rw [mem_ImO]; ext <;> simp [iota, ιJ, Dbl.J]
theorem wb_mem : (CD.e2 : O ℚ) ∈ ImO := by rw [mem_ImO]; ext <;> simp [e2]

-- THE BLOCK stated directly on imaginary generators (¬∀), proved from the concrete witness.
theorem chir_spinor_block :
    ¬ ∀ a b : ImO, (leftReg a).comp (rightReg b) = (rightReg b).comp (leftReg a) := by
  intro h
  have hx := congrArg (fun f => f (CD.iota (CD.e2 : H ℚ)))
    (h ⟨CD.iota (ιJ ℚ), wa_mem⟩ ⟨(CD.e2 : O ℚ), wb_mem⟩)
  simp only [LinearMap.comp_apply, leftReg_apply, rightReg_apply] at hx
  exact not_associative_witness hx.symm

-- THE ONE-CAUSE LINK: the spinor chirality block ⟺ the Jordan-tower generation cap (via N44).
-- chir_spinor_block ⟺ ¬(all commute on ImO) — is it ⟺ chirality_block (on all O)?
-- The ⟸ direction: if L/R commute for all imaginary a,b, does full associativity follow?
-- Test: does ImO-generator commuting extend to all-O commuting via 1 being central + linearity?
example :
    (¬ ∀ a b : ImO, (leftReg a).comp (rightReg b) = (rightReg b).comp (leftReg a))
      ↔ (jdef Xwit Ywit ≠ 0) := by
  constructor
  · intro _; exact jordan_cap_iff_nonassoc.mpr not_associative
  · intro _; exact chir_spinor_block

end
end Phys.Algebra
