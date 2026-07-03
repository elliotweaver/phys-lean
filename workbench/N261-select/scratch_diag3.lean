import Phys.Algebra.DerivationIrreducible
import Phys.Algebra.DerivationStabilizerSplit
import Mathlib.Tactic
namespace Phys.Algebra
open scoped Classical
open Phys.Cascade
open LinearMap (BilinForm)
noncomputable def bV3 : BilinForm ℚ Vsub := gBil.restrict Vsub
end Phys.Algebra
