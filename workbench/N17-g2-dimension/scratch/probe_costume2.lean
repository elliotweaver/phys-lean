import Phys.Algebra.DerivationSkew
import Mathlib.Tactic
namespace Probe
open Phys.Algebra Phys.Cascade Phys.Cascade.CD
attribute [local instance] CD.narCD CD.srCD

-- Costume candidate: the derivation kills the Born self-overlap u * star u.
-- Garbage claim: it equals 1 instead of 0. After rw [deriv_real_zero ...] the
-- LHS becomes 0, leaving the false numeric goal `0 = 1`. Must FAIL to compile.
theorem witnessDeriv_selfoverlap_BOGUS :
    witnessDeriv (CD.iota (ιJ ℚ) * star (CD.iota (ιJ ℚ)) : O ℚ) = (1 : O ℚ) := by
  rw [deriv_real_zero witnessDeriv witnessDeriv_isDeriv _ (selfMul_selfconj _)]

end Probe
