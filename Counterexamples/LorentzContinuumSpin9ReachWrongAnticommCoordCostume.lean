import Phys.Algebra.LorentzContinuumSpin9Reach

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C126): A BOGUS 2-PLANE-ROTATION CLAIM — "THE TWO-SIDED HALF-TURN biMulFun e₂ e₂
-- DOES NOT FIX THE ANTICOMMUTING UNIT ιe₂ := iota (e₂ : H Cut): ITS re.im.re COORDINATE READS 9".
-- N94 banks `biMulFun_e2_fixes_j`: the concrete two-sided half-turn around the cascade's terminal
-- imaginary generator e₂ FIXES the anticommuting unit ιe₂ (`biMulFun e₂ e₂ (0,0,ιe₂) = (0,0,ιe₂)`)
-- — the 2-plane structure: it negates the plane span{1,e₂} but FIXES the orthogonal complement. The
-- unit ιe₂ has re.im.re coordinate 1, so the FIXED image's re.im.re coordinate is 1. The BOGUS claim
-- that this coordinate is 9 (a stand-in for ANY whole-block distortion, e.g. the wrong "the half-turn
-- negates the whole space block like the single-unit −id" which would read −1, or any rescaling)
-- forces 1 = 9, and must NOT compile.
--   The bite is a true counterexample, not vacuous: `biMulFun_e2_fixes_j` is a banked theorem, so the
-- coordinate genuinely IS 1, and the costume's claim of 9 is genuinely FALSE.
--   The false numeric `1 = 9` is DISTINCT from the banked battery (… C121 5=1, C122 2=8, C123 4=64,
-- C124 7=8, C125 6=5).
--   PHYSICS-WORDS-REMOVABLE: delete "half-turn/rotation/plane/isometry/Spin/SO(9)/2-plane/
-- bimultiplication/anticommuting/orthogonal/complement": over the derived complete ordered field
-- `Cut` and `O Cut := CD(H Cut)`, for the unit e₂ (e₂·e₂ = −1) and ιe₂ := iota(e₂:H Cut) with
-- e₂·ιe₂ = −(ιe₂·e₂), the map (t,x,v) ↦ (t,x, e₂·(v·e₂)) sends (0,0,ιe₂) to (0,0,ιe₂), whose re.im.re
-- coordinate is 1; claiming 9 forces 1 = 9. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the two-sided half-turn `biMulFun e₂ e₂` FIXES the anticommuting unit `ιe₂`
    (`biMulFun_e2_fixes_j`), so the `re.im.re` coordinate of its image of `ιe₂` is `1`; the WRONG
    claim that this coordinate is `9` forces the false numeric `1 = 9`, so this must NOT compile. -/
theorem half_turn_anticomm_wrong_coord_BOGUS :
    (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut)
        ((0 : Cut), (0 : Cut), (CD.iota (CD.e2 : H Cut) : O Cut))).2.2.re.im.re = 9 := by
  rw [biMulFun_e2_fixes_j]
  show (CD.iota (CD.e2 : H Cut) : O Cut).re.im.re = 9
  rw [show (CD.iota (CD.e2 : H Cut) : O Cut).re.im.re = 1 from by simp [CD.iota, CD.e2]]

end

end Counterexamples
