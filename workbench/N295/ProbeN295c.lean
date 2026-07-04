import Phys.Algebra.OctonionJordanInnerMultiplication
import Phys.Algebra.OctonionJordanInnerDerivationLeibniz
import Phys.Algebra.OctonionJordanFamilyRotationGenerators
import Phys.Algebra.DerivationCompact
import Mathlib.Tactic

namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- bracket identity: try rfl
example (A B : Matrix (Fin 3) (Fin 3) (O ℚ)) : ⁅Lmul A, Lmul B⁆ = innerMul A B := by
  rfl

-- reQ_add fix
example (h : (slotA (1:O ℚ) + slotA 1) = 0) : False := by
  have hentry : (slotA (1:O ℚ) + slotA 1) 0 1 = (0 : Matrix (Fin 3) (Fin 3) (O ℚ)) 0 1 := by rw [h]
  rw [Matrix.add_apply, slotA_entry] at hentry
  simp only [Matrix.zero_apply] at hentry
  have : reQ ((1:O ℚ) + 1) = reQ (0 : O ℚ) := by rw [hentry]
  rw [reQ_add] at this
  simp only [reQ] at this; norm_num at this

end
end Phys.Algebra.HJ
