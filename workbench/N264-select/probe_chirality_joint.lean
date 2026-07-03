import Phys.Algebra.TowerWorldMapCliffordModule
open scoped Classical BigOperators
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000
noncomputable section

-- rightReg (from probe1, compiles)
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

-- CRUX 2a: the MIXED commutator of left & right spinor actions IS the associator middle-slot.
theorem chir_mixed_apply (a b : ImO) (x : O ℚ) :
    (leftReg a) ((rightReg b) x) - (rightReg b) ((leftReg a) x)
      = (a : O ℚ) * (x * b) - ((a : O ℚ) * x) * b := by
  simp only [leftReg_apply, rightReg_apply]

-- CRUX 2b: the two chiralities COMMUTE (∀ imaginary a,b) IF the algebra associates.
theorem chir_commute_of_assoc
    (h : ∀ x y z : O ℚ, (x * y) * z = x * (y * z)) (a b : ImO) :
    (leftReg a).comp (rightReg b) = (rightReg b).comp (leftReg a) := by
  apply LinearMap.ext; intro x
  simp only [LinearMap.comp_apply, leftReg_apply, rightReg_apply]
  exact (h (a : O ℚ) x b).symm

-- Is the N44 witness pair imaginary? Test membership in ImO.
example : (CD.iota (ιJ ℚ) : O ℚ) ∈ ImO := by
  rw [mem_ImO]; ext <;> simp [CD.iota, ιJ] <;> ring
example : (CD.e2 : O ℚ) ∈ ImO := by
  rw [mem_ImO]; ext <;> simp [CD.e2] <;> ring

end
end Phys.Algebra
