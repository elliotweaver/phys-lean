import Phys.Algebra.TowerGatherFFTCommutantG2

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD Submodule
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
set_option synthInstance.maxHeartbeats 1000000
noncomputable section

def probeSpan : Submodule ℚ (Module.End ℚ (Module.End ℚ ImO)) :=
  Submodule.span ℚ (Set.range fourProj)

theorem probe_span_finrank_le : Module.finrank ℚ probeSpan ≤ 4 := by
  have h := finrank_range_le_card (R := ℚ) fourProj
  rw [Fintype.card_fin] at h
  exact h

theorem probe_upper_of_span
    (H : commutantG2 ≤ probeSpan) : Module.finrank ℚ commutantG2 ≤ 4 :=
  (Submodule.finrank_mono H).trans probe_span_finrank_le

end
end Phys.Algebra
