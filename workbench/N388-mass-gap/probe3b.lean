import Phys.Algebra.ConfinementAreaLaw
import Phys.Algebra.DerivationLowerBound
import Mathlib.Tactic

namespace Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ
open Phys.Cascade Phys.Cascade.CD
noncomputable section
attribute [local instance] CD.narCD CD.srCD

-- test smul coordinate reduction
example (q : ℚ) : gForm (q • (1 : O ℚ)) (q • (1 : O ℚ)) = q^2 := by
  rw [gForm_self_sum_sq]
  simp only [c0, c1, c2, c3, c4, c5, c6, c7, CD.smul_re, CD.smul_im,
    Dbl.smul_re, Dbl.smul_im, CD.one_re, CD.one_im, Dbl.one_re, Dbl.one_im,
    CD.zero_re, CD.zero_im, Dbl.zero_re, Dbl.zero_im, mul_zero, mul_one]
  ring

end
end Phys.Algebra
