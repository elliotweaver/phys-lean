/-
  N32 W9 MEASUREMENT PROBE 2 — what is ABSENT on Cut and what does exp REQUIRE.
-/
import Phys.Algebra.DerivationCompact
import Phys.Foundation.ContinuumFieldInverse
import Mathlib.Analysis.Normed.Algebra.Exponential

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation.ContinuumQ

noncomputable section

-- What does NormedSpace.exp require? Check its signature.
#check @NormedSpace.exp

-- Probe: does Cut carry topology/uniformity/norm? (each on its own line; expect errors)
#synth TopologicalSpace Cut
#synth UniformSpace Cut
#synth NormedField Cut
#synth Archimedean Cut

end
end Phys.Algebra
