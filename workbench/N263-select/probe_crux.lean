import Phys.Algebra.TowerWorldMapSpinGenerators
import Phys.Algebra.TowerGatherObstructionAdjointSo7

open scoped Classical BigOperators

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

def elemRot (a b : ImO) : Module.End ℚ ImO where
  toFun c := (gForm (a : O ℚ) (c : O ℚ)) • b - (gForm (b : O ℚ) (c : O ℚ)) • a
  map_add' c₁ c₂ := by
    simp only [Submodule.coe_add, gForm_add_right]; module
  map_smul' r c := by
    simp only [SetLike.val_smul, gForm_smul_right, RingHom.id_apply]; module

@[simp] theorem elemRot_apply (a b c : ImO) :
    elemRot a b c = (gForm (a : O ℚ) (c : O ℚ)) • b - (gForm (b : O ℚ) (c : O ℚ)) • a := rfl

theorem elemRot_skew (a b : ImO) :
    elemRot a b ∈ skewAdjointLieSubalgebra bornBil := by
  show elemRot a b ∈ bornBil.skewAdjointSubmodule
  rw [LinearMap.mem_skewAdjointSubmodule]
  intro y z
  show bornBil (elemRot a b y) z = bornBil y ((-elemRot a b) z)
  simp only [elemRot_apply, LinearMap.neg_apply, map_sub, map_smul, map_neg,
    LinearMap.sub_apply, LinearMap.smul_apply, smul_eq_mul, bornBil_apply]
  rw [gForm_symm (b : O ℚ) (y : O ℚ), gForm_symm (a : O ℚ) (y : O ℚ)]
  ring

theorem spinGen_vector_action (a b c : ImO) :
    spinGen a b * leftReg c - leftReg c * spinGen a b
      = leftReg ((4 : ℚ) • elemRot a b c) := by
  rw [spinGen_act a b c]
  simp only [elemRot_apply, smul_sub, smul_smul, map_sub, map_smul]


end
end Phys.Algebra
