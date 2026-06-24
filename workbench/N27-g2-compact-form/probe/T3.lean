import Phys.Algebra.DerivationIrreducible
import Phys.Algebra.DerivationLowerBound

namespace Phys.Algebra
open Phys.Cascade Phys.Cascade.CD LieAlgebra
attribute [local instance] CD.narCD CD.srCD dblModuleQ cdModuleQ
noncomputable section

-- T3: joint kernel of {D0E,D3E,D8E} ∩ ImO = 0  (the d=1 exclusion lever).
example (v : O ℚ) (hv : v ∈ ImO) (h0 : D0E v = 0) (h3 : D3E v = 0) (h8 : D8E v = 0) :
    v = 0 := by
  have hstar : star v = -v := mem_ImO.mp hv
  have q0 : c0 v = 0 := by
    have h := congrArg c0 hstar
    simp only [c0, CD.star_re, Dbl.star_re', CD.neg_re, Dbl.neg_re] at h
    simp only [c0]; linarith
  have q5 : c5 v = 0 := by have := congrArg c2 h0; simpa [D0E, c2, c5] using this
  have q4 : c4 v = 0 := by have := congrArg c3 h0; simpa [D0E, c3, c4] using this
  have q3 : c3 v = 0 := by have := congrArg c4 h0; simpa [D0E, c4, c3] using this
  have q2 : c2 v = 0 := by have := congrArg c5 h0; simpa [D0E, c5, c2] using this
  have q6 : c6 v = 0 := by have := congrArg c1 h3; simpa [D3E, c1, c6] using this
  have q1 : c1 v = 0 := by have := congrArg c6 h3; simpa [D3E, c6, c1] using this
  have q7 : c7 v = 0 := by have := congrArg c1 h8; simpa [D8E, c1, c7] using this
  apply CD.ext <;> apply CD.ext <;> apply Dbl.ext <;>
    first
    | (show v.re.re.re = _; simpa [c0] using q0)
    | (show v.re.re.im = _; simpa [c1] using q1)
    | (show v.re.im.re = _; simpa [c2] using q2)
    | (show v.re.im.im = _; simpa [c3] using q3)
    | (show v.im.re.re = _; simpa [c4] using q4)
    | (show v.im.re.im = _; simpa [c5] using q5)
    | (show v.im.im.re = _; simpa [c6] using q6)
    | (show v.im.im.im = _; simpa [c7] using q7)

end
end Phys.Algebra
