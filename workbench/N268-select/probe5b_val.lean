import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.DerivationStabilizerSplit
import Mathlib.Tactic
namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
-- Find a nonzero coordinate: probe several (basis elt, deep coord) combinations.
example : (witnessDerivQ (imBasis 0)) = 0 := by decide
end Phys.Algebra.HJ
