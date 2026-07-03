import Phys.Algebra.TowerGatherIsospinMultiplet
import Mathlib.Tactic
open Phys.Cascade Phys.Cascade.CD
namespace Phys.Algebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section
-- Is kappaO 1 = e4O?
example : (kappaO (1 : H ℚ) : O ℚ) = e4O := by
  simp [kappaO, e4O]
-- Casimir as qI: define CasMat = add7 (add7 (mul7 Imat Imat) (mul7 Jmat Jmat)) (mul7 Kmat Kmat)
def CasMat : M7 := add7 (add7 (mul7 Imat Imat) (mul7 Jmat Jmat)) (mul7 Kmat Kmat)
-- casimirOp = qI Imat * qI Imat + ... via qI_comp + qI_add
def casimirOp : Module.End ℚ ImO :=
  (imRep DI).comp (imRep DI) + (imRep DJ).comp (imRep DJ) + (imRep DK).comp (imRep DK)
-- Show casimirOp = qI CasMat.
theorem casimirOp_eq_qI : casimirOp = qI CasMat := by
  unfold casimirOp CasMat
  rw [imRep_DI_eq_qI, imRep_DJ_eq_qI, imRep_DK_eq_qI]
  -- comp is *; qI_comp; then qI_add
  show qI Imat * qI Imat + qI Jmat * qI Jmat + qI Kmat * qI Kmat = _
  rw [qI_comp, qI_comp, qI_comp, ← qI_add, ← qI_add]
-- Now CasMat = the -8 diagonal (0 at position 3). decide?
theorem CasMat_val : ∀ i j : Fin 7, CasMat i j =
    (![![(-8:ℤ),0,0,0,0,0,0],![0,-8,0,0,0,0,0],![0,0,-8,0,0,0,0],
       ![0,0,0,0,0,0,0],![0,0,0,0,-8,0,0],![0,0,0,0,0,-8,0],![0,0,0,0,0,0,-8]] i j) := by
  decide
end
end Phys.Algebra
