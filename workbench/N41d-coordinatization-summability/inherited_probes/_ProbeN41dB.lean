import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom
import Mathlib.Topology.Algebra.InfiniteSum.Module

open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Phys.Algebra Matrix
open scoped BigOperators

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- LEMMA B: basis expansion of the product. a = ∑_j (e_j a)•u_j where u_j = coordOCut.symm (single j 1).
-- So a*b = ∑_j ∑_m (e_j a * e_m b) • (u_j * u_m), using smulCompat_oCut bilinearity.
-- First: a = ∑_j (coordOCut a j) • coordOCut.symm (Pi.single j 1)
example (a : O Cut) :
    a = ∑ j, (coordOCut a j) • coordOCut.symm (Pi.single j 1) := by
  have : a = coordOCut.symm (coordOCut a) := by rw [LinearEquiv.symm_apply_apply]
  rw [this]
  conv_lhs => rw [← LinearEquiv.symm_apply_apply coordOCut a]  -- noop, just expand coordOCut a as pi sum
  sorry

end
