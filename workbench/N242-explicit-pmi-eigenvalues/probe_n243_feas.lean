import Phys.Algebra.TowerGatherForcedChargeEigenvalues
import Mathlib.FieldTheory.Minpoly.Field

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Polynomial
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- feasibility: chargeOp³ = −chargeOp on the WHOLE 7 (chargeOp kills u1 + chargeOp²=⟨u1,y⟩u1−y)
-- chargeOp³(y) = chargeOp(⟨u1,y⟩•u1 − y) = ⟨u1,y⟩•chargeOp u1 − chargeOp y = 0 − chargeOp y
example (y : ImO) : ((chargeOp (chargeOp (chargeOp y)) : ImO) : O ℚ) = -((chargeOp y : ImO) : O ℚ) := by
  -- chargeOp (chargeOp y) has coe = ⟨u1,y⟩•u1 − y ... but that is in O ℚ, need chargeOp of a subtype
  sorry

-- Simpler: work at the End level. chargeOp.comp chargeOp = ? on ImO — not −id (only on V).
-- The clean statement: chargeOp^3 + chargeOp = 0 as End ℚ ImO.
#check @chargeOp
#check @chargeOp_sq_coe
#check @chargeOp_kills_singlet
end
end Phys.Algebra
