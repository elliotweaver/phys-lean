import Phys.Algebra.LorentzContinuumRotationSubgroup

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C84): claiming the rotation one-parameter subgroup closes with the WRONG SIGN on the
-- cross term — the NON-COMPACT boost/hyperbola law `+ s*s'` (as in the N52 `boostParam_hyp_mul`,
-- `(aa'+bb')²−(ab'+ba')²=(a²−b²)(a'²−b'²)`) instead of the COMPACT circle law `− s*s'`. The banked
-- `circParam_circle_mul` proves the CORRECT compact closure `(c*c' − s*s')² + (c*s'+s*c')² =
-- (c²+s²)(c'²+s'²)`: the sign of the cross term is EXACTLY what distinguishes the rotation
-- one-parameter subgroup (compact circle group, this node N53) from the boost one-parameter subgroup
-- (non-compact hyperbola group, N52). The WRONG `+ s*s'` claim asserts the boost cross-term sign for
-- the rotation closure, so the product would NOT land back on the unit circle. Evaluated at the
-- concrete circle/scalar point c = s = c' = s' = 1:
--   WRONG LHS: (1*1 + 1*1)² + (1*1 + 1*1)² = 2² + 2² = 4 + 4 = 8.
--   RHS:       (1² + 1²)·(1² + 1²) = 2·2 = 4.
-- So the WRONG claim reduces to the false numeric `8 = 4` and MUST FAIL to compile. (The CORRECT
-- compact law gives LHS = (1−1)² + (1+1)² = 0 + 4 = 4 = RHS, as `circParam_circle_mul` proves.)
theorem rotCirc_closure_wrong_sign_BOGUS :
    ((1 : Cut)*1 + 1*1)^2 + ((1 : Cut)*1 + 1*1)^2 = ((1 : Cut)^2 + 1^2) * ((1 : Cut)^2 + 1^2) := by
  ring_nf

end

end Counterexamples
