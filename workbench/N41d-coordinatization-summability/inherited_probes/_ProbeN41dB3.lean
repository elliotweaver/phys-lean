import Phys.Algebra.DerivationOExpSummable
import Mathlib.Topology.Algebra.InfiniteSum.Module

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra Matrix
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD

noncomputable section

example (a : O Cut) :
    a = ∑ j : Fin 8, (coordOCut a j) • coordOCut.symm (Pi.single j (1:Cut)) := by
  have hpi : coordOCut a = ∑ j : Fin 8, (coordOCut a j) • (Pi.single j (1:Cut)) := by
    funext i
    rw [Finset.sum_apply]
    simp only [Pi.smul_apply, smul_eq_mul]
    rw [Finset.sum_eq_single i]
    · rw [Pi.single_eq_same, mul_one]
    · intro b _ hb; rw [Pi.single_eq_of_ne hb, mul_zero]
    · intro h; exact absurd (Finset.mem_univ i) h
  calc a = coordOCut.symm (coordOCut a) := (LinearEquiv.symm_apply_apply _ _).symm
    _ = coordOCut.symm (∑ j : Fin 8, (coordOCut a j) • (Pi.single j (1:Cut))) := by rw [← hpi]
    _ = ∑ j : Fin 8, (coordOCut a j) • coordOCut.symm (Pi.single j (1:Cut)) := by
        rw [map_sum]; apply Finset.sum_congr rfl; intro j _; rw [map_smul]

end
