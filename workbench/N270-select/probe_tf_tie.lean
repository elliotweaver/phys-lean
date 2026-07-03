/- PROBE 2: tie jQ to the BANKED jTraceForm (N214), + a W8 positive witness. -/
import Phys.Algebra.OctonionJordanTraceForm
import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.DerivationAutGroup
import Phys.Algebra.DerivationCompact
import Phys.Algebra.OctonionAssociative3Form
import Mathlib.Tactic

namespace Phys.Algebra.HJ

open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix

attribute [local instance] CD.narCD CD.srCD

noncomputable def jQ (A : Matrix (Fin 3) (Fin 3) (O ℚ)) : ℚ := reQ (Matrix.trace (A * A))

/-- jb A A = A*A + A*A = 2•(A*A), so jTraceForm A A = trace(2•(A*A)) = 2•trace(A*A).
    Tie the real trace-square form jQ to the BANKED Cartan-Killing metric jTraceForm (N214):
    reQ (jTraceForm A A) = 2 * jQ A. -/
theorem reQ_jTraceForm_self (A : Matrix (Fin 3) (Fin 3) (O ℚ)) :
    reQ (jTraceForm A A) = 2 * jQ A := by
  unfold jTraceForm jb jQ
  rw [Matrix.trace_add]
  rw [reQ_add]
  ring

end Phys.Algebra.HJ
