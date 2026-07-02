import Phys.Algebra.TowerGatherForcedChargeEigenvalues

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Polynomial

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ

noncomputable section

abbrev sgl : ImO := ⟨u1, u1_mem_ImO⟩

theorem sgl_ne_zero : sgl ≠ 0 := fun h => u1_ne_zero (congrArg Subtype.val h)

-- RECON TEETH: chargeOp² = −id on the WHOLE ImO is FALSE — the singlet is KILLED, so
-- chargeOp²(sgl) = 0, whereas (−id)(sgl) = −sgl ≠ 0. This DISTINGUISHES the whole-7 spectrum
-- (X³+X, with the 0 root) from the V-restriction (X²+1, N242). Proving the FALSITY is the teeth:
-- if chargeOp² = −id held on ImO, the singlet would be nonzero AND zero.
theorem chargeOp_sq_ne_neg_id : chargeOp.comp chargeOp ≠ -LinearMap.id := by
  intro h
  have hval : chargeOp (chargeOp sgl) = (-LinearMap.id : Module.End ℚ ImO) sgl :=
    congrArg (fun f => f sgl) h
  rw [chargeOp_kills_singlet, map_zero, LinearMap.neg_apply, LinearMap.id_apply] at hval
  exact sgl_ne_zero (neg_eq_zero.mp hval.symm)

end

end Phys.Algebra
