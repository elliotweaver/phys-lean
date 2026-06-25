import Phys.Algebra.DerivationOExpSummable
import Phys.Algebra.DerivationAutExpHom

namespace Phys.Algebra
open Phys.Cascade Phys.Foundation Phys.Foundation.ContinuumQ Matrix
open scoped BigOperators
noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- PROBE 1: what does coordOCut (u*v) 0 look like, and can we bound it?
-- First just measure the expansion of coordinate 0.
example (u v : O Cut) : coordOCut (u * v) 0 = (u * v).re.re.re := by
  simp [coordOCut, e0]

-- The bound for coordinate 0: |e0(u*v)| ≤ ∑i ∑j |coordOCut u i| * |coordOCut v j|
example (u v : O Cut) :
    |coordOCut (u * v) 0| ≤ ∑ i, ∑ j, |coordOCut u i| * |coordOCut v j| := by
  sorry

end
end Phys.Algebra
