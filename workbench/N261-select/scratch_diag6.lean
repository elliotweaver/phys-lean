import Phys.Algebra.DerivationIrreducible
import Mathlib.Tactic
namespace Phys.Algebra
open scoped Classical
open LinearMap (BilinForm)
noncomputable def bImO6 : BilinForm ℚ ImO := gBil.restrict ImO
end Phys.Algebra
