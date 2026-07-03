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

-- W8 NON-VACUITY via the imBasis frame. Route: the mixed commutator at a frame triple.
-- [L_(e_i), R_(e_j)] applied to e_k  =  e_i*(e_k*e_j) - (e_i*e_k)*e_j  = -assoc(e_i,e_k,e_j).
-- Find i,j,k with this nonzero. The banked octonion product is computable; test with decide-style.
-- Try i=0,j=1,k=2 style. Use imBasis; the product is via the CD structure. Check ≠ 0 by
-- evaluating a coordinate. First see whether the whole endo is nonzero via a chosen application.

-- probe: is there SOME frame triple where associativity fails? Use the banked not_associative_witness
-- exists form if available, else compute one frame triple.
example :
    (leftReg ⟨imBasis 0, imBasis_mem_ImO 0⟩) ((rightReg ⟨imBasis 1, imBasis_mem_ImO 1⟩) (imBasis 2))
      - (rightReg ⟨imBasis 1, imBasis_mem_ImO 1⟩) ((leftReg ⟨imBasis 0, imBasis_mem_ImO 0⟩) (imBasis 2))
      = imBasis 0 * (imBasis 2 * imBasis 1) - (imBasis 0 * imBasis 2) * imBasis 1 := by
  simp only [leftReg_apply, rightReg_apply]

-- Now the numeric: is that associator nonzero? decide on the coordinate.
example :
    (imBasis 0 * (imBasis 2 * imBasis 1) : O ℚ) - (imBasis 0 * imBasis 2) * imBasis 1 ≠ 0 := by
  decide

end
end Phys.Algebra
