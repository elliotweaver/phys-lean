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

/-- W8 non-vacuity: elemRot of a frame pair genuinely rotates. elemRot(e_i,e_j) applied to e_j
    is -e_i ≠ 0 (orthonormal frame). -/
theorem elemRot_frame_ne_zero {i j : Fin 7} (hij : i ≠ j) :
    elemRot ⟨imBasis i, imBasis_mem_ImO i⟩ ⟨imBasis j, imBasis_mem_ImO j⟩ ≠ 0 := by
  intro h0
  -- apply to e_j : elemRot e_i e_j (e_j) = g(e_i,e_j)e_j - g(e_j,e_j)e_i = -e_i
  have hval := congrArg (fun (f : Module.End ℚ ImO) => f ⟨imBasis j, imBasis_mem_ImO j⟩) h0
  simp only [elemRot_apply, LinearMap.zero_apply] at hval
  rw [gForm_imBasis i j, gForm_imBasis j j, if_neg hij, if_pos rfl] at hval
  simp only [zero_smul, one_smul, zero_sub, neg_eq_zero] at hval
  -- hval : (⟨imBasis i, _⟩ : ImO) = 0
  have : imBasis i = (0 : O ℚ) := congrArg Subtype.val hval
  have hg := gForm_imBasis i i
  rw [if_pos rfl, this] at hg
  rw [gForm] at hg
  simp only [star_zero, mul_zero] at hg
  rw [show reQ (0 : O ℚ) = 0 by simp [reQ]] at hg
  norm_num at hg
end
end Phys.Algebra
