import Phys.Algebra.TowerGatherFFTKnownSummandsIrreducible
import Mathlib.RingTheory.Adjoin.Basic

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 1000000
set_option maxHeartbeats 800000
noncomputable section

example (T : Module.End ℚ ImO)
    (hnt : Nontrivial (Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO))))
    (hcancel : ∀ (a b : Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO))),
        a * b = 0 → a = 0 ∨ b = 0) :
    IsDomain (Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO))) := by
  haveI := hnt
  haveI hnzd : NoZeroDivisors (Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO))) :=
    { eq_zero_or_eq_zero_of_mul_eq_zero := fun {a b} h => hcancel a b h }
  exact NoZeroDivisors.to_isDomain (Algebra.adjoin ℚ ({T} : Set (Module.End ℚ ImO)))

end
end Phys.Algebra
