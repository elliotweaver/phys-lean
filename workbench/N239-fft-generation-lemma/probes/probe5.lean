import Phys.Algebra.TowerGatherFFTKnownSummandsIrreducible
import Mathlib.RingTheory.Adjoin.Basic
import Mathlib.Algebra.Algebra.Subalgebra.Centralizer

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 1000000
set_option maxHeartbeats 800000
noncomputable section

example (T : Module.End ℚ ImO)
    [NoZeroDivisors (Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO)))] :
    IsDomain (Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO))) := by
  haveI : Nontrivial ImO := by
    have hpos : 0 < Module.finrank ℚ ImO := by rw [finrank_ImO]; norm_num
    exact Module.finrank_pos_iff.mp hpos
  haveI : Nontrivial (Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO))) := by
    refine ⟨0, 1, ?_⟩
    intro h
    have := congrArg (Subtype.val) h
    simp only [ZeroMemClass.coe_zero, OneMemClass.coe_one] at this
    exact zero_ne_one this
  apply NoZeroDivisors.to_isDomain

end
end Phys.Algebra
