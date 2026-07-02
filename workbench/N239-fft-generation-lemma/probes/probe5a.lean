import Phys.Algebra.TowerGatherFFTKnownSummandsIrreducible
import Mathlib.RingTheory.Adjoin.Basic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 1000000
set_option maxHeartbeats 800000
noncomputable section

-- PIECE A: Nontrivial ImO via finrank
example : Nontrivial ImO := by
  have hpos : 0 < Module.finrank ℚ ImO := by rw [finrank_ImO]; norm_num
  exact Module.finrank_pos_iff.mp hpos

end
end Phys.Algebra
