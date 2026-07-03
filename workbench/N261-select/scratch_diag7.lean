import Phys.Algebra.DerivationIrreducible
import Mathlib.Tactic
namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
open scoped Classical
open LinearMap (BilinForm)
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable def bImO7 : BilinForm ℚ ImO := gBil.restrict ImO
end Phys.Algebra
