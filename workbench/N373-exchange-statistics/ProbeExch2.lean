import Phys.Algebra.TowerGatherSymAntisymDecomp
import Mathlib.LinearAlgebra.TensorProduct.Basic

namespace Phys.Algebra.ProbeExch2

open Phys.Cascade Phys.Cascade.CD
open scoped TensorProduct

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

abbrev Two := ImO ⊗[ℚ] ImO
def flipV : Module.End ℚ Two := (TensorProduct.comm ℚ ImO ImO).toLinearMap
theorem flipV_involutive : flipV * flipV = 1 := by ext x; simp [flipV, Module.End.mul_apply]
theorem flipV_tmul (a b : ImO) : flipV (a ⊗ₜ b) = b ⊗ₜ a := by simp [flipV, TensorProduct.comm_tmul]
def symProj : Module.End ℚ Two := (2⁻¹ : ℚ) • (1 + flipV)
def antisymProj : Module.End ℚ Two := (2⁻¹ : ℚ) • (1 - flipV)

theorem finrank_Two : Module.finrank ℚ Two = 49 := by
  rw [Module.finrank_tensorProduct, finrank_ImO]

instance : Nontrivial Two := Module.nontrivial_of_finrank_eq_succ (n := 48) (by rw [finrank_Two])

theorem flip_one_add : flipV * (1 + flipV) = 1 + flipV := by
  rw [mul_add, mul_one, flipV_involutive, add_comm]

theorem flip_one_sub : flipV * (1 - flipV) = -(1 - flipV) := by
  rw [sub_eq_add_neg, mul_add, mul_one, mul_neg, flipV_involutive, neg_sub, sub_eq_add_neg,
      add_comm]

theorem flip_symProj : flipV * symProj = symProj := by
  unfold symProj; rw [mul_smul_comm, flip_one_add]

theorem flip_antisymProj : flipV * antisymProj = - antisymProj := by
  unfold antisymProj; rw [mul_smul_comm, flip_one_sub, smul_neg]

theorem sym_mul_antisym : symProj * antisymProj = 0 := by
  unfold symProj antisymProj
  rw [smul_mul_smul_comm]
  have h : ((1:Module.End ℚ Two) + flipV) * (1 - flipV) = 0 := by
    rw [sub_eq_add_neg, mul_add, add_mul, add_mul, one_mul, one_mul, mul_neg, mul_neg,
        mul_one, one_mul, flipV_involutive]
    abel
  rw [h, smul_zero]

theorem flipV_ne_zero : flipV ≠ 0 := by
  intro h
  have h1 : (flipV * flipV) = (0 : Module.End ℚ Two) := by rw [h, mul_zero]
  rw [flipV_involutive] at h1
  exact one_ne_zero h1

theorem sym_sub_antisym : symProj - antisymProj = flipV := by
  unfold symProj antisymProj
  rw [← smul_sub, show ((1:Module.End ℚ Two) + flipV) - (1 - flipV) = (2:ℚ) • flipV by
        rw [two_smul]; abel, smul_smul]
  norm_num

theorem sym_ne_antisym : symProj ≠ antisymProj := by
  intro h
  have hz : symProj - antisymProj = 0 := by rw [h]; exact sub_self antisymProj
  rw [sym_sub_antisym] at hz
  exact flipV_ne_zero hz

theorem sym_identical (v : ImO) : symProj (v ⊗ₜ v) = v ⊗ₜ v := by
  unfold symProj
  rw [LinearMap.smul_apply, LinearMap.add_apply, Module.End.one_apply, flipV_tmul]
  rw [show (v ⊗ₜ v : Two) + v ⊗ₜ v = (2:ℚ) • (v ⊗ₜ v) by rw [two_smul], smul_smul]
  norm_num

end
end Phys.Algebra.ProbeExch2
