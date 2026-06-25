/-
  N32 W9 MEASUREMENT PROBE (bounded — #synth/#check fail fast, no unbounded compile).
  GOAL: decide increment-2 scope. What analytic structure does the DERIVED ℝ `Cut`
  carry, what does Mathlib's exp require, does `O Cut` form, can a ℚ-derivation be
  base-changed to `Cut`?
-/
import Phys.Algebra.DerivationCompact
import Phys.Foundation.ContinuumFieldInverse
import Mathlib.Analysis.SpecialFunctions.Exponential
import Mathlib.Analysis.Normed.Algebra.Exponential

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ

noncomputable section

-- (1) What does the derived ℝ `Cut` carry?
#check (inferInstance : Field Cut)
#check (inferInstance : LinearOrder Cut)
#check (inferInstance : IsStrictOrderedRing Cut)

-- (2) Does Cut carry any Mathlib analytic/topology structure? (EXPECT: none.)
-- #synth TopologicalSpace Cut         -- expect FAIL
-- #synth MetricSpace Cut              -- expect FAIL
-- #synth NormedField Cut              -- expect FAIL
-- #synth RCLike Cut                   -- expect FAIL

-- (3) Does `O Cut` form (Cayley-Dickson over the derived ℝ)? Cut is a CommRing.
attribute [local instance] CD.narCD CD.srCD
#check (O Cut)
#check (inferInstance : CommRing Cut)

end
end Phys.Algebra
