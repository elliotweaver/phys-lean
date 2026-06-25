import Phys.Algebra.DerivationOExpSummable
import Mathlib.Topology.Algebra.InfiniteSum.Module

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra Matrix
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- use Pi.basisFun to avoid Pi.single elaboration issues
example (a : O Cut) :
    a = ∑ j : Fin 8, (coordOCut a j) • coordOCut.symm ((Pi.basisFun Cut (Fin 8)) j) := by
  have hpi : (coordOCut a) = ∑ j : Fin 8, (coordOCut a j) • (Pi.basisFun Cut (Fin 8)) j := by
    rw [← (Pi.basisFun Cut (Fin 8)).sum_repr (coordOCut a)]
    apply Finset.sum_congr rfl; intro j _
    congr 1
  calc a = coordOCut.symm (coordOCut a) := (LinearEquiv.symm_apply_apply _ _).symm
    _ = coordOCut.symm (∑ j : Fin 8, (coordOCut a j) • (Pi.basisFun Cut (Fin 8)) j) := by rw [← hpi]
    _ = ∑ j : Fin 8, (coordOCut a j) • coordOCut.symm ((Pi.basisFun Cut (Fin 8)) j) := by
        rw [map_sum]; apply Finset.sum_congr rfl; intro j _; rw [map_smul]

end
