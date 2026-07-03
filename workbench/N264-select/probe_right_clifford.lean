import Phys.Algebra.TowerWorldMapCliffordModule
open scoped Classical BigOperators
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000
noncomputable section

-- CRUX 1: the RIGHT key square via right-alternativity mul_mul_right (mirror of key_sq)
theorem key_sq_right {x : O ℚ} (hx : x ∈ ImO) (y : O ℚ) :
    (y * x) * x = (- gForm x x) • y := by
  rw [mul_mul_right, octSq_ImO hx, qsmul_mul_right, mul_one]

-- the RIGHT-regular action assembled as a linear map (mirror of leftReg, uses RightMul from N44)
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

theorem rightReg_sq (a : ImO) :
    (rightReg a).comp (rightReg a) = (- gForm (a : O ℚ) (a : O ℚ)) • LinearMap.id := by
  apply LinearMap.ext; intro y
  simp only [LinearMap.comp_apply, rightReg_apply, LinearMap.smul_apply, LinearMap.id_apply]
  exact key_sq_right a.2 y

-- CRUX 2: THE RIGHT CLIFFORD RELATION (mirror of leftReg_clifford)
theorem rightReg_clifford (a b : ImO) :
    (rightReg a).comp (rightReg b) + (rightReg b).comp (rightReg a)
      = (-(2 * gForm (a : O ℚ) (b : O ℚ))) • LinearMap.id := by
  apply LinearMap.ext; intro y
  have hab : ((a : O ℚ) + b) ∈ ImO := add_mem a.2 b.2
  have hk := key_sq_right hab y
  have hka := key_sq_right a.2 y
  have hkb := key_sq_right b.2 y
  have hexp : (y * ((a : O ℚ) + b)) * ((a : O ℚ) + b)
      = (y * (a : O ℚ)) * (a : O ℚ) + (y * (b : O ℚ)) * (a : O ℚ)
        + ((y * (a : O ℚ)) * (b : O ℚ) + (y * (b : O ℚ)) * (b : O ℚ)) := by
    simp only [add_mul_na, mul_add_na]
  rw [hexp, hka, hkb] at hk
  have hg : gForm ((a : O ℚ) + b) ((a : O ℚ) + b)
      = gForm (a : O ℚ) a + 2 * gForm (a : O ℚ) b + gForm (b : O ℚ) b := by
    rw [gForm_add_left, gForm_add_right, gForm_add_right, gForm_symm (b : O ℚ) a]; ring
  simp only [LinearMap.add_apply, LinearMap.comp_apply, rightReg_apply, LinearMap.smul_apply,
    LinearMap.id_apply, smul_eq_mul]
  rw [hg] at hk
  linear_combination (norm := module) hk

end
end Phys.Algebra
