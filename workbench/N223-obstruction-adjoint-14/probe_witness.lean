import Phys.Algebra.OctonionCrossProductContraction
import Phys.Algebra.OctonionAssociative3Form
import Phys.Algebra.DerivationRep7

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- witness: gForm (octCross u1 u2)(octCross u1 u2) + gForm u2 (octCross u1 (octCross u1 u2)) = 0
-- term1 = 1 (banked), term2 = gForm u2 (-u2) = -1
example : gForm (octCross u1 u2) (octCross u1 u2)
    + gForm u2 (octCross u1 (octCross u1 u2)) = (0 : ℚ) := by
  have h1 : gForm (octCross u1 u2) (octCross u1 u2) = 1 := octCross_lagrange_u1_u2
  have h2 : octCross u1 (octCross u1 u2) = - u2 := octCross_contraction_witness
  rw [h1, h2, gForm_neg_right, gForm_u2_u2]; ring

end
end Phys.Algebra
