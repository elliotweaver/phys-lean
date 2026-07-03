import Phys.Algebra.DerivationIrreducibleFull
import Phys.Algebra.DerivationStabilizerSplit
import Mathlib.Tactic

namespace Phys.Algebra
open scoped Classical
open Phys.Cascade
open LinearMap (BilinForm)

-- Without the colour tower: does gBil.restrict Vsub work?
noncomputable def bV1 : BilinForm ℚ Vsub := gBil.restrict Vsub

end Phys.Algebra
