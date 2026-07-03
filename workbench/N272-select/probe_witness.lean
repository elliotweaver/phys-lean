import Phys.Algebra.OctonionJordanGenerationCoupling
import Mathlib.Tactic

namespace Counterexamples
open Phys.Algebra.HJ Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
attribute [local instance] qMod
noncomputable section

theorem witness_true :
    reQ (Matrix.trace (jb (slotC (1 : O ℚ)) (slotC (1 : O ℚ)))) = 4 := by
  rw [trace_coupling_reQ, star_one, mul_one, reQ_one]
  norm_num

end
end Counterexamples
