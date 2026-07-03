import Phys.Algebra.DerivationIrreducible
import Mathlib.Tactic
namespace Phys.Algebra
open scoped Classical
open Phys.Cascade
open LinearMap (BilinForm)
noncomputable def bImO : BilinForm ℚ ImO := gBil.restrict ImO
end Phys.Algebra
