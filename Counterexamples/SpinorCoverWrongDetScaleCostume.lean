import Phys.Algebra.SpinorCover

namespace Counterexamples

open Phys.Cascade Phys.Algebra

-- WRONG: claiming the spinor action SCALES the determinant by p² (the naive `|det A|²` formula
-- misread as if det boostMat = p, when in fact det boostMat = p·p⁻¹ = 1, so mdet is PRESERVED).
-- This is FALSE: mdet (actBy (boostMat p) (herm2 t x v)) = Qform t x v (mdet_act), NOT p²·Qform.
-- Trying to discharge the p²-scaling claim from the banked mdet_act forces a mismatch
-- (Qform t x v vs p² * Qform t x v); the term FAILS to compile. Must FAIL.
theorem spinor_det_scales_BOGUS (p t x : ℚ) (hp : p ≠ 0) (v : O ℚ) :
    mdet (actBy (boostMat p) (herm2 t x v)) = p^2 * Qform t x v := mdet_act p t x hp v

end Counterexamples
