import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- Per-coordinate bound, structured: |coord m| ≤ ∑ over 8 abs-products ≤ grid.
-- Try just coord 0 with abs_le split + nlinarith with explicit product nonneg hints.
set_option linter.unusedSimpArgs false in
example (u v : O Cut) :
    |coordOCut (u * v) 0| ≤ (∑ i, |coordOCut u i|) * (∑ j, |coordOCut v j|) := by
  rw [Fin.sum_univ_eight, Fin.sum_univ_eight, Finset.sum_mul_sum]
  sorry

end
end Phys.Algebra
