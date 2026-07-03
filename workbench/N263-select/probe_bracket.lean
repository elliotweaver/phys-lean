import Phys.Algebra.TowerWorldMapSpinGenerators
import Phys.Algebra.TowerGatherObstructionAdjointSo7

open scoped Classical BigOperators
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000
noncomputable section

def elemRot (a b : ImO) : Module.End ℚ ImO where
  toFun c := (gForm (a : O ℚ) (c : O ℚ)) • b - (gForm (b : O ℚ) (c : O ℚ)) • a
  map_add' c₁ c₂ := by simp only [Submodule.coe_add, gForm_add_right]; module
  map_smul' r c := by simp only [SetLike.val_smul, gForm_smul_right, RingHom.id_apply]; module

@[simp] theorem elemRot_apply (a b c : ImO) :
    elemRot a b c = (gForm (a : O ℚ) (c : O ℚ)) • b - (gForm (b : O ℚ) (c : O ℚ)) • a := rfl

theorem elemRot_bracket (a b c d : ImO) :
    elemRot a b * elemRot c d - elemRot c d * elemRot a b
      = (gForm (a : O ℚ) (c : O ℚ)) • elemRot b d
        - (gForm (b : O ℚ) (c : O ℚ)) • elemRot a d
        - (gForm (a : O ℚ) (d : O ℚ)) • elemRot b c
        + (gForm (b : O ℚ) (d : O ℚ)) • elemRot a c := by
  apply LinearMap.ext; intro x
  simp only [LinearMap.sub_apply, Module.End.mul_apply, LinearMap.add_apply,
    LinearMap.smul_apply, elemRot_apply, map_sub, map_smul, gForm_add_right, gForm_smul_right,
    Submodule.coe_sub, SetLike.val_smul, gForm_neg_right, gForm_smul_left, gForm_add_left]
  rw [gForm_symm (d:O ℚ) (b:O ℚ), gForm_symm (d:O ℚ) (a:O ℚ)]
  rw [gForm_symm (c:O ℚ) (b:O ℚ), gForm_symm (c:O ℚ) (a:O ℚ)]
  module
end
end Phys.Algebra
