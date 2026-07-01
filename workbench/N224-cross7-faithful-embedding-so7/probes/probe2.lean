import Phys.Algebra.TowerGatherObstructionAdjointSo7
import Phys.Algebra.OctonionCrossProductContraction
import Phys.Algebra.DerivationCompact
import Phys.Algebra.DerivationFinrank

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- the linear embedding ImO →ₗ End ℚ ImO, bundled (imRep-style)
noncomputable def crossEmb : ImO →ₗ[ℚ] Module.End ℚ ImO where
  toFun a := crossOp (a : O ℚ)
  map_add' a b := by
    refine LinearMap.ext fun y => Subtype.ext ?_
    simp only [Submodule.coe_add, crossOp_coe, LinearMap.add_apply, Submodule.coe_add]
    unfold octCross
    rw [add_mul, gForm_add_left, add_smul]; abel
  map_smul' c a := by
    refine LinearMap.ext fun y => Subtype.ext ?_
    simp only [SetLike.val_smul, crossOp_coe, RingHom.id_apply, LinearMap.smul_apply,
      Submodule.coe_smul]
    unfold octCross
    rw [qsmul_mul_left, gForm_smul_left, smul_add, smul_smul]

@[simp] theorem crossEmb_apply (a : ImO) : crossEmb a = crossOp (a : O ℚ) := rfl

#print axioms crossEmb

end
end Phys.Algebra
