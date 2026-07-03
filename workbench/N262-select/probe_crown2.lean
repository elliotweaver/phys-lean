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

-- THE CROWN: [spinGen a b, L_c] = 4 gForm(a,c) L_b - 4 gForm(b,c) L_a
theorem spinGen_act (a b c : ImO) :
    spinGen a b * leftReg c - leftReg c * spinGen a b
      = (4 * gForm (a : O ℚ) (c : O ℚ)) • leftReg b
        - (4 * gForm (b : O ℚ) (c : O ℚ)) • leftReg a := by
  have hac := cliff_mul a c
  have hbc := cliff_mul b c
  -- {L_a,L_c} = α • 1, {L_b,L_c} = β • 1 with α = -(2 gForm a c), β = -(2 gForm b c)
  set La := leftReg a
  set Lb := leftReg b
  set Lc := leftReg c
  -- expand the commutator via the ring identity, then substitute anticommutators
  unfold spinGen
  -- (La Lb - Lb La) Lc - Lc (La Lb - Lb La)
  --   = La (Lb Lc + Lc Lb) - (La Lc + Lc La) Lb - [ Lb (La Lc + Lc La) - (Lb Lc + Lc Lb) La ]
  have key : (La*Lb - Lb*La)*Lc - Lc*(La*Lb - Lb*La)
      = La*(Lb*Lc+Lc*Lb) - (La*Lc+Lc*La)*Lb
        - (Lb*(La*Lc+Lc*La) - (Lb*Lc+Lc*Lb)*La) := by noncomm_ring
  rw [key, hbc, hac]
  -- now everything is scalar • 1 times La/Lb
  -- La * (β•1) = β • La, (α•1) * Lb = α • Lb, etc.
  simp only [smul_mul_assoc, mul_smul_comm, mul_one, one_mul]
  -- goal now in terms of α,β,La,Lb; α=-(2 gForm a c), β=-(2 gForm b c)
  module

end
end Phys.Algebra
