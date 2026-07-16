import Phys.Algebra.OctonionJordanGenerationCycleBornSplit
import Phys.Algebra.OctonionJordanThreeMatterSlots

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

-- swap 0 1 swaps slotB <-> slotC (the clean vector<->spinor triality exchange, no conjugation)
example (u : O ℚ) : pconj (Equiv.swap (0:Fin 3) 1) (slotB u) = slotC u := by
  unfold pconj slotB slotC Xz
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.submatrix_apply, Equiv.swap_apply_def]

example (u : O ℚ) : pconj (Equiv.swap (0:Fin 3) 1) (slotC u) = slotB u := by
  unfold pconj slotB slotC Xz
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.submatrix_apply, Equiv.swap_apply_def]

-- swap 1 2 swaps slotA <-> slotB
example (u : O ℚ) : pconj (Equiv.swap (1:Fin 3) 2) (slotA u) = slotB u := by
  unfold pconj slotA slotB Xz
  apply Matrix.ext; intro i j
  fin_cases i <;> fin_cases j <;>
    simp [Matrix.submatrix_apply, Equiv.swap_apply_def]

end Phys.Algebra.HJ
