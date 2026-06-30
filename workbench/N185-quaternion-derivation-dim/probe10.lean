import Phys.Algebra.DerivationH
import Phys.Algebra.DerivationFinrank
import Mathlib.LinearAlgebra.Dimension.Constructions
import Mathlib.Tactic

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD Module

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

theorem H_qsmul_mul_left (c : ℚ) (x y : H ℚ) : (c • x) * y = c • (x * y) := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im] <;> ring
theorem H_qsmul_mul_right (c : ℚ) (x y : H ℚ) : x * (c • y) = c • (x * y) := by
  ext <;> simp [cd_qsmul_re, cd_qsmul_im] <;> ring

def adQ (q : H ℚ) : Module.End ℚ (H ℚ) where
  toFun x := q * x - x * q
  map_add' x y := by simp [mul_add, add_mul]; abel
  map_smul' c x := by simp only [RingHom.id_apply, H_qsmul_mul_right, H_qsmul_mul_left, smul_sub]

@[simp] theorem adQ_apply (q x : H ℚ) : adQ q x = q * x - x * q := rfl

def adL : H ℚ →ₗ[ℚ] Module.End ℚ (H ℚ) where
  toFun := adQ
  map_add' p q := by
    refine LinearMap.ext fun x => ?_
    simp only [adQ_apply, LinearMap.add_apply, add_mul, mul_add]; abel
  map_smul' c q := by
    refine LinearMap.ext fun x => ?_
    simp only [adQ_apply, RingHom.id_apply, LinearMap.smul_apply,
      H_qsmul_mul_left, H_qsmul_mul_right, smul_sub]

@[simp] theorem adL_apply (q x : H ℚ) : adL q x = q * x - x * q := rfl

-- Is H ℚ finite-dim known? finrank_H_eq_four is banked.
example : Module.finrank ℚ (H ℚ) = 4 := finrank_H_eq_four

-- rank-nullity for adL
example : Module.finrank ℚ (LinearMap.range adL) + Module.finrank ℚ (LinearMap.ker adL)
    = Module.finrank ℚ (H ℚ) := adL.finrank_range_add_finrank_ker

end Phys.Algebra
