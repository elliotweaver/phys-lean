import Phys.Algebra.TowerGatherForcedSecondNeutral
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000

noncomputable def hyperOpProbe : Module.End ℚ ImO := crossOp (kappaO 1)

-- generic singlet-annihilation for any isospin generator DI/DJ/DK
theorem D_kappaO_zero (q : H ℚ) (hq : IsDerivQ (innerDerivQ q)) :
    ((⟨innerDerivQ q, hq⟩ : derivationLieQ) : Module.End ℚ (O ℚ)) (kappaO 1) = 0 := by
  change innerDerivQ q (kappaO 1) = 0
  rw [innerDerivQ_apply]; exact innerDeriv_kappaO_one q

theorem hyperOp_bracket_gen (q : H ℚ) (hq : IsDerivQ (innerDerivQ q)) :
    ⁅imRep (⟨innerDerivQ q, hq⟩ : derivationLieQ), hyperOpProbe⁆ = 0 := by
  rw [hyperOpProbe, crossOp_imRep_intertwine (⟨innerDerivQ q, hq⟩ : derivationLieQ) (kappaO 1),
    D_kappaO_zero q hq, crossOp_zero]

theorem hyperOp_commute_DI : Commute (imRep DI) hyperOpProbe := sub_eq_zero.mp (hyperOp_bracket_gen hI DI.2)
theorem hyperOp_commute_DJ : Commute (imRep DJ) hyperOpProbe := sub_eq_zero.mp (hyperOp_bracket_gen hJ DJ.2)
theorem hyperOp_commute_DK : Commute (imRep DK) hyperOpProbe := sub_eq_zero.mp (hyperOp_bracket_gen hK DK.2)

#print axioms hyperOp_commute_DI
#print axioms hyperOp_commute_DJ
#print axioms hyperOp_commute_DK
