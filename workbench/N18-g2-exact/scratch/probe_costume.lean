import Phys.Algebra.DerivationTraceFree
import Mathlib.Tactic

namespace Counterexamples
open Phys.Algebra Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD

-- PROBE the costume: claim the nonzero derivation has reQ output 1 (violating trace-free).
theorem witnessDeriv_trace_BOGUS :
    reQ (witnessDeriv (CD.iota (ιJ ℚ) : O ℚ)) = (1 : ℚ) := by
  rw [witnessDeriv_reQ_zero]

end Counterexamples
