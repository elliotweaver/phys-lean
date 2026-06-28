import Phys.Algebra.LorentzContinuumCliffordPinNondegenerate
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction
import Mathlib.LinearAlgebra.Dual.Basis
import Mathlib.LinearAlgebra.ExteriorAlgebra.Grading

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section
open scoped BigOperators

abbrev EXT := ExteriorAlgebra Cut STVC
abbrev IdxN := Module.Free.ChooseBasisIndex Cut STVC
noncomputable abbrev bST : Module.Basis IdxN Cut STVC := Module.Free.chooseBasis Cut STVC

local notation "ιe" => ExteriorAlgebra.ι (R := Cut)
local notation "ctr" => CliffordAlgebra.contractLeft (Q := (0 : QuadraticForm Cut STVC))

-- check: ExteriorAlgebra.ιMulti gives the generating products; what's the eigenvalue route
-- The grade-n submodule ⋀^n is spanned by ιMulti products. Let me check span / induction levers.

-- mem_span induction for grade-n elements
example (n : ℕ) (x : EXT) (hx : x ∈ (⋀[Cut]^n STVC : Submodule Cut EXT)) : True := by
  -- is there a clean recursor?
  trivial

-- KEY measurement: ⋀^n as a power of the range submodule
example (n : ℕ) : (⋀[Cut]^n STVC : Submodule Cut EXT)
    = (ExteriorAlgebra.ι (R := Cut) (M := STVC)).range ^ n := by
  exact?

end

end Phys.Algebra
