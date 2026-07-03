import Phys.Algebra.TowerGatherForcedSecondNeutral
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000

/-- The forced hypercharge operator: the gather cross-product of the isospin-neutral branching
    singlet `κO 1`. The twin of `chargeOp = crossOp u1`. -/
noncomputable def hyperOpProbe : Module.End ℚ ImO := crossOp (kappaO 1)

/-- The Cartan DI annihilates the singlet κO 1 as an O ℚ endomorphism (N189/N254). -/
theorem DI_kappaO_zero : (DI : Module.End ℚ (O ℚ)) (kappaO 1) = 0 := by
  have h2 : ((imRep DI kap1 : ImO) : O ℚ) = ((0 : ImO) : O ℚ) := congrArg Subtype.val imRep_DI_kappaO
  rw [imRep_coe] at h2; simpa using h2

/-- CRUX (bracket form) for the Cartan DI. -/
theorem hyperOp_bracket_DI_probe : ⁅imRep DI, hyperOpProbe⁆ = 0 := by
  rw [hyperOpProbe, crossOp_imRep_intertwine DI (kappaO 1), DI_kappaO_zero, crossOp_zero]

/-- CRUX (Commute form) for the Cartan DI. -/
theorem hyperOp_commute_DI_probe : Commute (imRep DI) hyperOpProbe :=
  sub_eq_zero.mp hyperOp_bracket_DI_probe

#print axioms hyperOp_bracket_DI_probe
#print axioms hyperOp_commute_DI_probe

end Phys.Algebra
