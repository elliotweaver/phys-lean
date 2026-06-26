import Phys.Algebra.DerivationStabilizerDim
import Phys.Algebra.Alternative

open Phys.Cascade Phys.Cascade.CD Phys.Algebra
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

namespace N42cProbe2
noncomputable section

-- (1) J as ℚ-linear left-mult by u1.
def JO : O ℚ →ₗ[ℚ] O ℚ where
  toFun x := u1 * x
  map_add' x y := CD.mul_add_na u1 x y
  map_smul' c x := by
    show u1 * (c • x) = c • (u1 * x)
    ext <;> simp [u1] <;> ring

-- (2) J² = -id, trunk-native via mul_mul_left + complexUnit_sq.
example : JO.comp JO = -LinearMap.id := by
  ext x
  show u1 * (u1 * x) = -x
  rw [CD.mul_mul_left, complexUnit_sq, neg_one_mul]

-- (3) e2..e7 ∈ ImO (imaginary). Test e2 and e7.
example : e2O ∈ ImO := by
  rw [mem_ImO]; ext <;> simp [e2O, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']
example : e7O ∈ ImO := by
  rw [mem_ImO]; ext <;> simp [e7O, CD.star_re, CD.star_im, Dbl.star_re', Dbl.star_im']

-- (4) u1 ∉ span{e2..e7}: c1 u1 = 1 but c1 vanishes on each e_k. (for singlet ⊓ V = ⊥)
example : c1 u1 = 1 := by simp [u1, c1]
example : c1 e2O = 0 ∧ c1 e3O = 0 ∧ c1 e4O = 0 ∧ c1 e5O = 0 ∧ c1 e6O = 0 ∧ c1 e7O = 0 := by
  refine ⟨?_,?_,?_,?_,?_,?_⟩ <;> simp [e2O,e3O,e4O,e5O,e6O,e7O,c1]

-- (5) J on the pairs: J e3 = -e2, J e5 = -e4, J e7 = -e6 (the other half of each plane).
example : u1 * e3O = -e2O := by ext <;> simp [u1, e2O, e3O]
example : u1 * e5O = -e4O := by ext <;> simp [u1, e4O, e5O]
example : u1 * e7O = -e6O := by ext <;> simp [u1, e6O, e7O]

end
end N42cProbe2
