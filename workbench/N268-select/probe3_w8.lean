import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationFinrank
import Mathlib.Tactic
namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
noncomputable def jAct (D : Module.End ℚ (O ℚ)) (M : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    Matrix (Fin 3) (Fin 3) (O ℚ) := M.map (fun x => D x)

-- candidate A: the diagonal is gauge-fixed → entry is 0 (clean numeric anchor)
theorem jAct_Dg_entry (d0 d1 d2 : ℚ) :
    ((jAct witnessDerivQ (Dg d0 d1 d2)) 0 0) = 0 := by
  have h1 : witnessDerivQ 1 = 0 := derivQ_one witnessDerivQ witnessDerivQ_isDerivQ
  have hkill : ∀ r : ℚ, witnessDerivQ (ocR r) = 0 := by
    intro r
    have hr : ocR r = r • (1 : O ℚ) := by ext <;> simp [ocR]
    rw [hr, map_smul, h1, smul_zero]
  simp [jAct, Dg, Matrix.map_apply, Matrix.diagonal_apply, hkill]

example : ((jAct witnessDerivQ (Dg 5 0 0)) 0 0).re.re.re = 0 := by
  rw [jAct_Dg_entry]; simp
end Phys.Algebra.HJ
