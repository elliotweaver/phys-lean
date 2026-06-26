import Phys.Algebra.SpinorRotation

namespace Counterexamples

open Phys.Cascade Phys.Algebra

-- WRONG: claiming the spinor ROTATION conjugation preserves the determinant for an ARBITRARY `u`,
-- DROPPING the Born-unit condition `gForm u u = 1`. This is FALSE: the determinant is preserved
-- ONLY when `u` is a Born-unit (`mdet_act_rot` REQUIRES `gForm u u = 1`); for a general `u` the
-- rotated form scales by `gForm u u` (`gForm (u·v)(u·v) = gForm u u · gForm v v`), so a non-unit `u`
-- does NOT preserve the determinant. Trying to discharge the unconditional claim from the banked
-- `mdet_act_rot` fails: the theorem demands the missing hypothesis `gForm u u = 1`, so the term
-- does NOT type-check. Must FAIL to compile.
theorem rot_preserves_det_without_unit_BOGUS (u : O ℚ) (t x : ℚ) (v : O ℚ) :
    mdet (actBy (rotMat u) (herm2 t x v)) = Qform t x v := mdet_act_rot u t x v

end Counterexamples
