import Phys.Algebra.ChiralityBlock
import Phys.Algebra.OctonionCrossProductContraction
import Phys.Algebra.TowerGatherIsometry

open scoped Classical BigOperators

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000

noncomputable section

-- KEY: for x ∈ ImO, x*(x*y) = (-gForm x x)•y (left-alternativity + imaginary square)
theorem key_sq {x : O ℚ} (hx : x ∈ ImO) (y : O ℚ) :
    x * (x * y) = (- gForm x x) • y := by
  rw [mul_mul_left, octSq_ImO hx, qsmul_mul_left, one_mul]

-- leftReg the linear map ImO → End(O ℚ)
def leftReg : ImO →ₗ[ℚ] Module.End ℚ (O ℚ) where
  toFun a := LeftMul (a : O ℚ)
  map_add' a b := by
    apply LinearMap.ext; intro y
    simp only [LinearMap.add_apply, LeftMul_apply, Submodule.coe_add, add_mul_na]
  map_smul' c a := by
    apply LinearMap.ext; intro y
    simp only [LinearMap.smul_apply, LeftMul_apply, SetLike.val_smul, qsmul_mul_left,
      RingHom.id_apply, smul_eq_mul]

@[simp] theorem leftReg_apply (a : ImO) (y : O ℚ) : leftReg a y = (a : O ℚ) * y := rfl

-- DIAGONAL: (leftReg a).comp (leftReg a) = (-gForm a a) • id
theorem leftReg_sq (a : ImO) :
    (leftReg a).comp (leftReg a) = (- gForm (a : O ℚ) (a : O ℚ)) • LinearMap.id := by
  apply LinearMap.ext; intro y
  simp only [LinearMap.comp_apply, leftReg_apply, LinearMap.smul_apply, LinearMap.id_apply,
    smul_eq_mul]
  exact key_sq a.2 y

-- HEADLINE: the Clifford anticommutation relation via polarization
theorem leftReg_clifford (a b : ImO) :
    (leftReg a).comp (leftReg b) + (leftReg b).comp (leftReg a)
      = (-(2 * gForm (a : O ℚ) (b : O ℚ))) • LinearMap.id := by
  apply LinearMap.ext; intro y
  -- pointwise: a*(b*y) + b*(a*y) = -(2 gForm a b) • y
  -- use key_sq at (a+b): (a+b)*((a+b)*y) = (-gForm (a+b) (a+b))•y
  have hab : ((a : O ℚ) + b) ∈ ImO := add_mem a.2 b.2
  have hk := key_sq hab y
  have hka := key_sq a.2 y
  have hkb := key_sq b.2 y
  -- expand LHS of hk
  have hexp : ((a : O ℚ) + b) * (((a : O ℚ) + b) * y)
      = (a : O ℚ)*((a:O ℚ)*y) + (a:O ℚ)*((b:O ℚ)*y) + ((b:O ℚ)*((a:O ℚ)*y) + (b:O ℚ)*((b:O ℚ)*y)) := by
    simp only [add_mul_na, mul_add_na]; abel
  rw [hexp, hka, hkb] at hk
  -- gForm (a+b)(a+b) = gForm a a + 2 gForm a b + gForm b b
  have hg : gForm ((a:O ℚ)+b) ((a:O ℚ)+b)
      = gForm (a:O ℚ) a + 2 * gForm (a:O ℚ) b + gForm (b:O ℚ) b := by
    rw [gForm_add_left, gForm_add_right, gForm_add_right, gForm_symm (b:O ℚ) a]; ring
  simp only [LinearMap.add_apply, LinearMap.comp_apply, leftReg_apply, LinearMap.smul_apply,
    LinearMap.id_apply, smul_eq_mul]
  rw [hg] at hk
  -- now solve for a*(b*y) + b*(a*y)
  linear_combination (norm := module) hk

end

end Phys.Algebra
