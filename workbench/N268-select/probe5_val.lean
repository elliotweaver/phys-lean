import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.DerivationStabilizerSplit
import Mathlib.Tactic
namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
-- Try to find a clean nonzero coordinate of witnessDerivQ on some basis element.
-- witnessDerivQ = innerDeriv e2 (ad_{e2}). Test on u1,e2O..e7O.
example : witnessDerivQ (imBasis 2) = witnessDerivQ (imBasis 2) := rfl
-- probe: is witnessDerivQ (imBasis 0) (=u1) computable to a clean value?
example : (witnessDerivQ (imBasis 3)).re.re.re = 0 := by
  simp [witnessDerivQ, imBasis]; sorry
end Phys.Algebra.HJ
