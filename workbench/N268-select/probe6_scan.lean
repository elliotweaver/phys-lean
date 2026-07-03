import Phys.Algebra.OctonionJordanThreeMatterSlots
import Phys.Algebra.DerivationRep7
import Phys.Algebra.DerivationFinrank
import Phys.Algebra.DerivationStabilizerSplit
import Phys.Algebra.DerivationUpperBound
import Mathlib.Tactic
namespace Phys.Algebra.HJ
open Phys.Cascade Phys.Cascade.CD Phys.Algebra Matrix
attribute [local instance] CD.narCD CD.srCD
-- scan witnessDerivQ on u2..u7 deep coords; find a clean nonzero via simp+norm_num
example : (witnessDerivQ u2).re.re.re = 0 ∧ (witnessDerivQ u2).im.re.re = 0
  ∧ (witnessDerivQ u2).re.im.re = 0 := by
  refine ⟨?_, ?_, ?_⟩ <;>
    · simp only [witnessDerivQ, toEndQ_apply, witnessDeriv, innerDeriv_apply]
      norm_num [adHom_apply, CD.mul_re, CD.mul_im, CD.e2] <;> sorry
end Phys.Algebra.HJ
