import Phys.Algebra.TowerGatherChargeIsospinRatio
import Phys.Algebra.FineStructureRunningExact
import Mathlib.Tactic

open Matrix
open scoped BigOperators

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

-- Cmat / Imat are skew (transpose = neg)?  test via decide
example : (Cmat)ᵀ = -Cmat := by decide
example : (Imat)ᵀ = -Imat := by decide

-- the banked negative self-census values
example : traceForm7 chargeOp chargeOp = -6 := B_chargeOp_chargeOp
example : traceForm7 (imRep DI) (imRep DI) = -16 := B_imRep_DI

-- both are < 0
example : traceForm7 chargeOp chargeOp < 0 := by rw [B_chargeOp_chargeOp]; norm_num
example : traceForm7 (imRep DI) (imRep DI) < 0 := by rw [B_imRep_DI]; norm_num

-- the matter census is positive
example : (0 : Cut) < chargeTraceDepth := chargeTraceDepth_pos

-- chargeTraceDepth value
example : chargeTraceDepth = 16 / 3 := chargeTraceDepth_eq

end

end Phys.Algebra
