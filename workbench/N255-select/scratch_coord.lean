import Phys.Algebra.TowerGatherForcedSecondNeutral
import Phys.Algebra.TowerGatherObstructionCrossSevenFaithful
import Phys.Algebra.DerivationUpperBound
import Mathlib.Tactic

open Phys.Cascade Phys.Cascade.CD

namespace Phys.Algebra

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 400000

noncomputable def hyperOpProbe : Module.End ℚ ImO := crossOp (kappaO 1)

-- coordinate witness: hyperOpProbe ⟨u1⟩ = octCross (kappaO 1) u1 = -e5, c5 = -1
theorem hyper_u1_coord :
    ((hyperOpProbe ⟨u1, u1_mem_ImO⟩ : ImO) : O ℚ).im.re.im = -1 := by
  show (octCross (kappaO 1) u1).im.re.im = -1
  simp only [octCross, kappaO_apply, u1, gForm, reQ]
  norm_num

#print axioms hyper_u1_coord
