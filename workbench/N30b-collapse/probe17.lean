import Phys.Algebra.DerivationSimpleCollapse

namespace Phys.Algebra

open Phys.Cascade Phys.Cascade.CD LieAlgebra
open LinearMap (BilinForm)

attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
attribute [local instance] derivationLieQ_semisimple

noncomputable section

example (I : LieIdeal ℚ derivationLieQ) (x : I) : (I.incl x : derivationLieQ) ∈ I := x.2
example (I : LieIdeal ℚ derivationLieQ) (x : I) : (I.incl x : derivationLieQ) ∈ I := by
  simpa using x.2

end
end Phys.Algebra
