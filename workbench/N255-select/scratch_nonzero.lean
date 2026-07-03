import Phys.Algebra.TowerGatherForcedSecondNeutral
import Phys.Algebra.OctonionCrossProduct
import Phys.Algebra.DerivationUpperBound
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000

noncomputable def hyperOpProbe : Module.End ℚ ImO := crossOp (kappaO 1)

theorem kappaO_one_eq_u2 : (kappaO (1 : H ℚ)) = u2 := by
  apply Prod.ext <;> rfl

theorem kappaO_one_mem_ImO' : kappaO (1 : H ℚ) ∈ ImO := kappaO_one_mem_ImO

theorem hyperOp_ne_zero_probe : hyperOpProbe ≠ 0 := by
  intro h
  have hz : (hyperOpProbe ⟨u1, u1_mem_ImO⟩ : ImO) = 0 := by rw [h]; rfl
  have hc : octCross (kappaO 1) u1 = 0 := by
    have := congrArg (Subtype.val) hz
    simpa [hyperOpProbe, crossOp_coe] using this
  have hswap : octCross (kappaO 1) u1 = - octCross u1 (kappaO 1) :=
    octCross_antisymm kappaO_one_mem_ImO' u1_mem_ImO
  rw [kappaO_one_eq_u2] at hc hswap
  rw [hswap, neg_eq_zero] at hc
  exact octCross_u1_u2_ne_zero hc

#print axioms hyperOp_ne_zero_probe
#print axioms kappaO_one_eq_u2
