import Phys.Algebra.TowerGatherSymAntisymDecomp
import Mathlib.LinearAlgebra.TensorProduct.Basic

namespace Phys.Algebra.ProbeSub
open Phys.Cascade Phys.Cascade.CD
open scoped TensorProduct
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section
abbrev Two := ImO ⊗[ℚ] ImO
def flipV : Module.End ℚ Two := (TensorProduct.comm ℚ ImO ImO).toLinearMap
theorem flipV_involutive : flipV * flipV = 1 := by ext x; simp [flipV, Module.End.mul_apply]

-- explicit-arg version
theorem flip_one_sub : flipV * (1 - flipV) = -(1 - flipV) := by
  have h := mul_sub flipV 1 flipV
  rw [mul_one, flipV_involutive] at h
  rw [h]; abel

theorem smul_neg_test : (2⁻¹:ℚ) • (-(1 - flipV) : Module.End ℚ Two) = -((2⁻¹:ℚ) • (1 - flipV)) := by
  exact smul_neg (2⁻¹:ℚ) ((1:Module.End ℚ Two) - flipV)

theorem sub_prod_zero : ((1:Module.End ℚ Two) + flipV) * (1 - flipV) = 0 := by
  have h := mul_sub (1 + flipV) 1 flipV
  rw [mul_one] at h
  have h2 : ((1:Module.End ℚ Two) + flipV) * flipV = flipV + 1 := by
    rw [add_mul, one_mul, flipV_involutive]
  rw [h2] at h
  rw [h]; abel

theorem sub_smul_test : (2⁻¹:ℚ) • ((1:Module.End ℚ Two) + flipV) - (2⁻¹:ℚ) • (1 - flipV) = flipV := by
  have h := smul_sub (2⁻¹:ℚ) ((1:Module.End ℚ Two) + flipV) (1 - flipV)
  rw [← h]
  have h2 : ((1:Module.End ℚ Two) + flipV) - (1 - flipV) = (2:ℚ) • flipV := by
    have := sub_sub_sub_cancel_left flipV (-flipV) (1:Module.End ℚ Two)
    rw [add_comm]; rw [two_smul]; abel
  rw [h2, smul_smul]; norm_num

end
end Phys.Algebra.ProbeSub
