import Phys.Algebra.TowerWorldMapCliffordModule
open scoped Classical BigOperators
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 400000
noncomputable section

-- Confirm the two N44 witness elements are imaginary (∈ ImO).
example : (CD.e2 : O ℚ) ∈ ImO := by
  rw [mem_ImO]; ext <;> simp [e2]

-- ι(ιJ): try several unfolding strategies
example : (CD.iota (ιJ ℚ) : O ℚ) ∈ ImO := by
  rw [mem_ImO]
  ext <;> simp [iota, ιJ, Dbl.J] <;> try ring

end
end Phys.Algebra
