import Phys.Algebra.TowerWorldMapCliffordModule
import Mathlib.Tactic

open scoped Classical BigOperators
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000
noncomputable section

theorem cliff_mul (a b : ImO) :
    leftReg a * leftReg b + leftReg b * leftReg a
      = (-(2 * gForm (a : O ℚ) (b : O ℚ))) • (1 : Module.End ℚ (O ℚ)) := by
  have h := leftReg_clifford a b
  simpa [Module.End.mul_eq_comp, Module.End.one_eq_id] using h

def spinGen (a b : ImO) : Module.End ℚ (O ℚ) :=
  leftReg a * leftReg b - leftReg b * leftReg a

theorem spinGen_act (a b c : ImO) :
    spinGen a b * leftReg c - leftReg c * spinGen a b
      = (4 * gForm (a : O ℚ) (c : O ℚ)) • leftReg b
        - (4 * gForm (b : O ℚ) (c : O ℚ)) • leftReg a := by
  have hac := cliff_mul a c
  have hbc := cliff_mul b c
  set La := leftReg a; set Lb := leftReg b; set Lc := leftReg c
  unfold spinGen
  have key : (La*Lb - Lb*La)*Lc - Lc*(La*Lb - Lb*La)
      = La*(Lb*Lc+Lc*Lb) - (La*Lc+Lc*La)*Lb
        - (Lb*(La*Lc+Lc*La) - (Lb*Lc+Lc*Lb)*La) := by noncomm_ring
  rw [key, hbc, hac]
  simp only [smul_mul_assoc, mul_smul_comm, mul_one, one_mul]
  module

-- leftReg on a frame vector is nonzero
theorem leftReg_frame_ne_zero (j : Fin 7) :
    leftReg ⟨imBasis j, imBasis_mem_ImO j⟩ ≠ 0 := by
  intro h0
  have hval := congrArg (fun (f : Module.End ℚ (O ℚ)) => f 1) h0
  simp only [leftReg_apply, mul_one, LinearMap.zero_apply] at hval
  -- hval : (imBasis j : O ℚ) = 0
  have hg := gForm_imBasis j j
  rw [if_pos rfl, hval] at hg
  rw [gForm] at hg
  simp only [star_zero, mul_zero] at hg
  rw [show reQ (0 : O ℚ) = 0 by simp [reQ]] at hg
  norm_num at hg

-- W8: a frame spin generator is nonzero, and genuinely rotates.
theorem spinGen_frame_ne_zero {i j : Fin 7} (hij : i ≠ j) :
    spinGen ⟨imBasis i, imBasis_mem_ImO i⟩ ⟨imBasis j, imBasis_mem_ImO j⟩ ≠ 0 := by
  intro h
  have hact := spinGen_act ⟨imBasis i, imBasis_mem_ImO i⟩ ⟨imBasis j, imBasis_mem_ImO j⟩
                 ⟨imBasis i, imBasis_mem_ImO i⟩
  rw [h] at hact
  simp only [zero_mul, mul_zero, sub_zero] at hact
  rw [gForm_imBasis, gForm_imBasis, if_pos rfl, if_neg (Ne.symm hij)] at hact
  simp only [mul_one, mul_zero, zero_smul, sub_zero] at hact
  -- hact : 0 = (4:ℚ) • leftReg ⟨imBasis j,_⟩
  have h4 : (4 : ℚ) • leftReg ⟨imBasis j, imBasis_mem_ImO j⟩ = 0 := hact.symm
  have : leftReg ⟨imBasis j, imBasis_mem_ImO j⟩ = 0 := by
    have := smul_eq_zero.mp h4
    rcases this with h | h
    · norm_num at h
    · exact h
  exact leftReg_frame_ne_zero j this

end
end Phys.Algebra
