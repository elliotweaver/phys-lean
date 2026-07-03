import Phys.Algebra.OctonionJordanFamilySymmetry
import Mathlib.Tactic
namespace Test
open Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
noncomputable section
set_option linter.unusedSimpArgs true
-- find the minimal simp set that closes without unused warnings
theorem witness_true :
    ((framePerm (Equiv.swap 1 2) (jb (slotA (1 : O ℚ)) (slotB u1))) 1 2).re.re.im = (-1 : ℚ) := by
  rw [framePerm_swap12_coupling, mul_one, slotC_entry]
  simp only [u1, CD.star_re, Dbl.star_im']
end
end Test
