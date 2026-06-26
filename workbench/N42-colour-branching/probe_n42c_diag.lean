import Phys.Algebra.DerivationStabilizerDim
import Phys.Algebra.Alternative

open Phys.Cascade Phys.Cascade.CD Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

namespace N42cDiag
noncomputable section

-- J² = -id as linear maps, via LinearMap.ext (NOT coordinate ext).
def JO : O ℚ →ₗ[ℚ] O ℚ where
  toFun x := u1 * x
  map_add' x y := CD.mul_add_na u1 x y
  map_smul' c x := by show u1 * (c • x) = c • (u1 * x); ext <;> simp [u1] <;> ring

example : JO.comp JO = -LinearMap.id := by
  refine LinearMap.ext (fun x => ?_)
  show u1 * (u1 * x) = -x
  rw [CD.mul_mul_left, complexUnit_sq, neg_one_mul]

-- Settle the actual products coordinate-wise (read each c_k of u1*e_k).
-- u1*e6O: which unit?
example : u1 * e6O = e7O := by ext <;> simp [u1, e6O, e7O]
-- so u1*e7O should be -e6O (J²). Check directly:
example : u1 * e7O = -e6O := by
  have : u1 * (u1 * e6O) = -e6O := by
    rw [CD.mul_mul_left, complexUnit_sq, neg_one_mul]
  have h6 : u1 * e6O = e7O := by ext <;> simp [u1, e6O, e7O]
  rwa [h6] at this

end
end N42cDiag
