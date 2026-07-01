import Phys.Algebra.TowerGatherAmbientProjection1And27

namespace N233Probe

open Phys.Algebra Phys.Cascade Phys.Cascade.CD
open LinearMap (BilinForm)
open Submodule

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

set_option synthInstance.maxHeartbeats 1000000

noncomputable section

def fourSummands : Fin 4 → Submodule ℚ (Module.End ℚ ImO) :=
  ![trivialLine, LinearMap.range crossEmb, LinearMap.range imRepL, tracelessSym]

-- Dimension identity: 1 + 7 + 14 + 27 = 49 = finrank (End ℚ ImO).
theorem fourSummands_finrank_sum :
    Module.finrank ℚ (fourSummands 0) + Module.finrank ℚ (fourSummands 1)
      + Module.finrank ℚ (fourSummands 2) + Module.finrank ℚ (fourSummands 3)
    = Module.finrank ℚ (Module.End ℚ ImO) := by
  show Module.finrank ℚ trivialLine + Module.finrank ℚ (LinearMap.range crossEmb)
      + Module.finrank ℚ (LinearMap.range imRepL) + Module.finrank ℚ tracelessSym
    = Module.finrank ℚ (Module.End ℚ ImO)
  rw [finrank_trivialLine, finrank_crossEmb_range, finrank_imRep_range,
      finrank_tracelessSym_eq_27, finrank_end_eq_49]

theorem fourSummands_finrank_values :
    Module.finrank ℚ (fourSummands 0) = 1 ∧ Module.finrank ℚ (fourSummands 1) = 7
      ∧ Module.finrank ℚ (fourSummands 2) = 14 ∧ Module.finrank ℚ (fourSummands 3) = 27 :=
  ⟨finrank_trivialLine, finrank_crossEmb_range, finrank_imRep_range, finrank_tracelessSym_eq_27⟩

-- g₂-stability per summand under adEnd D.
theorem fourSummands_adEnd_inv :
    ∀ (i : Fin 4) (D : derivationLieQ) (X : Module.End ℚ ImO),
      X ∈ fourSummands i → adEnd D X ∈ fourSummands i := by
  intro i D X hX
  fin_cases i
  · exact trivialLine_adEnd_inv D X hX
  · rw [adEnd_apply]; exact crossEmb_range_g2_invariant D hX
  · rw [adEnd_apply]; exact imRep_range_g2_invariant D hX
  · exact tracelessSym_adEnd_inv D X hX

end

end N233Probe
