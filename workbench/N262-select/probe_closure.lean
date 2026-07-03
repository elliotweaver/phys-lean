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

-- so(7) CLOSURE via Leibniz + spinGen_act
theorem spinGen_bracket (a b c d : ImO) :
    spinGen a b * spinGen c d - spinGen c d * spinGen a b
      = (4 * gForm (a:O ℚ) c) • spinGen b d - (4 * gForm (b:O ℚ) c) • spinGen a d
        - (4 * gForm (a:O ℚ) d) • spinGen b c + (4 * gForm (b:O ℚ) d) • spinGen a c := by
  have hc := spinGen_act a b c
  have hd := spinGen_act a b d
  simp only [spinGen] at hc hd ⊢
  set La := leftReg a; set Lb := leftReg b; set Lc := leftReg c; set Ld := leftReg d
  have key : (La*Lb-Lb*La)*(Lc*Ld-Ld*Lc) - (Lc*Ld-Ld*Lc)*(La*Lb-Lb*La)
      = ((La*Lb-Lb*La)*Lc - Lc*(La*Lb-Lb*La))*Ld - Ld*((La*Lb-Lb*La)*Lc - Lc*(La*Lb-Lb*La))
        + Lc*((La*Lb-Lb*La)*Ld - Ld*(La*Lb-Lb*La)) - ((La*Lb-Lb*La)*Ld - Ld*(La*Lb-Lb*La))*Lc := by
    noncomm_ring
  rw [key, hc, hd]
  simp only [smul_mul_assoc, mul_smul_comm, smul_sub, mul_sub, sub_mul]
  module

end
end Phys.Algebra
