import Phys.Algebra.TowerWorldMapCliffordModule
import Phys.Algebra.TowerGatherJointChargeIsospinWeights
import Phys.Algebra.Alternative

open Phys.Algebra

namespace Phys.Algebra.N279Probe

/-- The associator as a ℚ-linear endomorphism in the third slot. -/
noncomputable def assocOp (a b : O ℚ) : O ℚ →ₗ[ℚ] O ℚ where
  toFun z := assoc a b z
  map_add' z w := by simp only [assoc, mul_add, add_mul]; abel
  map_smul' c z := by
    simp only [assoc, RingHom.id_apply]
    rw [mul_smul_comm, smul_mul_assoc, mul_smul_comm, smul_mul_assoc, smul_sub]

/-- ★ THE GENERIC OBSTRUCTION IDENTITY (coordinate-free, from `assoc_swap12` alone):
    `⁅L_a, L_b⁆ - L_{a*b-b*a} = -2 • assocOp a b` (pointwise). -/
theorem leftmul_comm_obstruction (a b y : O ℚ) :
    a * (b * y) - b * (a * y) - (a * b - b * a) * y = (-2 : ℚ) • assoc a b y := by
  have h : assoc b a y = - assoc a b y := eq_neg_of_add_eq_zero_left (assoc_swap12 a b y)
  have key : a * (b * y) - b * (a * y) - (a * b - b * a) * y
      = - assoc a b y + assoc b a y := by
    simp only [assoc, sub_mul]; abel
  rw [key, h]; module

/-- gForm on e2I = 1 (e2O = u2). -/
example : gForm (e2I : O ℚ) (e2I : O ℚ) = 1 := by
  show gForm u2 u2 = 1
  exact gForm_u2_u2

/-- gForm on e3I = 1? measure. -/
example : gForm (e3I : O ℚ) (e3I : O ℚ) = 1 := by
  show gForm e3O e3O = 1
  simp only [gForm, e3O, reQ]
  norm_num

/-- The Casimir sum via leftReg_sq: (leftReg u1M)² + (leftReg e2I)² + (leftReg e3I)² = -3•id. -/
example :
    (leftReg u1M).comp (leftReg u1M) + (leftReg e2I).comp (leftReg e2I)
      + (leftReg e3I).comp (leftReg e3I) = (-3 : ℚ) • LinearMap.id := by
  rw [leftReg_sq u1M, leftReg_sq e2I, leftReg_sq e3I]
  have h1 : gForm (u1M : O ℚ) (u1M : O ℚ) = 1 := gForm_u1
  have h2 : gForm (e2I : O ℚ) (e2I : O ℚ) = 1 := gForm_u2_u2
  have h3 : gForm (e3I : O ℚ) (e3I : O ℚ) = 1 := by
    show gForm e3O e3O = 1; simp only [gForm, e3O, reQ]; norm_num
  rw [h1, h2, h3]
  module

end Phys.Algebra.N279Probe
