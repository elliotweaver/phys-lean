import Phys.Algebra.OctonionJordanSpectrumMovingSector
import Mathlib.Tactic
namespace Counterexamples
open Phys.Algebra Phys.Algebra.HJ Phys.Cascade Phys.Cascade.CD Matrix
attribute [local instance] CD.narCD CD.srCD

example : ((Lmul (slotA (1 : O ℚ)) 1) 0 1).re.re.re = 2 := by
  rw [Lmul_one, Matrix.add_apply, slotA_entry]
  simp only [CD.add_re, CD.one_re, Dbl.add_re, Dbl.one_re]
  norm_num

end Counterexamples
