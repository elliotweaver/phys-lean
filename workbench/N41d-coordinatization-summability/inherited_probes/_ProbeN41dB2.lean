import Phys.Algebra.DerivationOExpSummable
import Mathlib.Topology.Algebra.InfiniteSum.Module

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra Matrix
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- basis expansion via the LinearEquiv: v = ∑_j (v j) • Pi.single j 1 in (Fin 8 → Cut),
-- transport through coordOCut.symm.
example (a : O Cut) :
    a = ∑ j, (coordOCut a j) • coordOCut.symm (Pi.single j 1) := by
  have hpi : coordOCut a = ∑ j, (coordOCut a j) • (Pi.single j (1:Cut)) := by
    funext i
    simp only [Finset.sum_apply, Pi.smul_apply, Pi.single_apply, smul_eq_mul, mul_ite,
      mul_one, mul_zero, Finset.sum_ite_eq', Finset.mem_univ, if_true]
  calc a = coordOCut.symm (coordOCut a) := (LinearEquiv.symm_apply_apply _ _).symm
    _ = coordOCut.symm (∑ j, (coordOCut a j) • (Pi.single j (1:Cut))) := by rw [← hpi]
    _ = ∑ j, (coordOCut a j) • coordOCut.symm (Pi.single j 1) := by
        rw [map_sum]; apply Finset.sum_congr rfl; intro j _; rw [map_smul]

end
