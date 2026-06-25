/-
  N33 W9 MEASUREMENT PROBE (bounded — #check/#synth fail fast, no unbounded compile).
  GOAL: re-verify the N32 measurement (W6) and survey what the DERIVED ℝ `Cut`
  provides toward BUILDING an analytic sub-tower (topology/Cauchy/operator-norm/exp).
  What does Cut carry? What is the completeness API? What does an exp need?
-/
import Phys.Algebra.DerivationAutCompact
import Phys.Foundation.ContinuumFieldInverse

namespace Phys.N33Probe
open Phys.Foundation.ContinuumQ

noncomputable section

-- (1) RE-VERIFY N32: what does the derived ℝ `Cut` carry as ordered field?
#check (inferInstance : Field Cut)
#check (inferInstance : LinearOrder Cut)
#check (inferInstance : IsStrictOrderedRing Cut)

-- (2) The COMPLETENESS API banked over Cut:
#check @completion_coherence_closed   -- ★ Dedekind completeness over the derived ground
#check @IsGatherC
#check @IsCoherentC
#check @Cut.S

end
end Phys.N33Probe
