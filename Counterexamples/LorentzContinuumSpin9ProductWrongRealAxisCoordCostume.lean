import Phys.Algebra.LorentzContinuumSpin9Product

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C127): A BOGUS FINITE-PRODUCT CLAIM — "THE PRODUCT OF TWO ANTICOMMUTING HALF-TURNS
-- NEGATES THE REAL AXIS LIKE A SINGLE HALF-TURN: ITS re.re.re COORDINATE READS 12".
-- N95 banks `biMulComp_e2_je2_fixes_one`: the CONCRETE finite product `biMulFun ιe₂ ιe₂ ∘ biMulFun
-- e₂ e₂` of two half-turns about the anticommuting unit-imaginaries e₂, ιe₂ FIXES the real axis —
-- `biMulFun ιe₂ ιe₂ (biMulFun e₂ e₂ (0,0,1)) = (0,0,1)`. The structural NOVELTY over a single
-- half-turn (which NEGATES the real axis, sending (0,0,1) ↦ (0,0,−1)): the PRODUCT of two distinct
-- anticommuting half-turns fixes it, so the composite is a 2-plane rotation in the PURELY-IMAGINARY
-- plane span{e₂,ιe₂}, a plane that does NOT meet the real axis. The fixed real unit 1 has re.re.re
-- coordinate 1, so the FIXED image's re.re.re coordinate is 1. The BOGUS claim that this coordinate
-- is 12 (a stand-in for ANY wrong "the product still negates / distorts the real axis like a single
-- half-turn" — the single half-turn would read −1, a whole-block rescaling any other value) forces
-- 1 = 12, and must NOT compile.
--   The bite is a true counterexample, not vacuous: `biMulComp_e2_je2_fixes_one` is a banked theorem,
-- so the coordinate genuinely IS 1, and the costume's claim of 12 is genuinely FALSE.
--   The false numeric `1 = 12` is DISTINCT from the banked battery (… C122 2=8, C123 4=64, C124 7=8,
-- C125 6=5, C126 1=9).
--   PHYSICS-WORDS-REMOVABLE: delete "half-turn/rotation/plane/isometry/Spin/SO(9)/2-plane/
-- bimultiplication/anticommuting/product/exhaustion/real-axis/imaginary-plane": over the derived
-- complete ordered field `Cut` and `O Cut := CD(H Cut)`, for the units e₂ (e₂·e₂ = −1) and
-- ιe₂ := iota(e₂:H Cut) (ιe₂·ιe₂ = −1) with e₂·ιe₂ = −(ιe₂·e₂), the map composing (t,x,v) ↦
-- (t,x, e₂·(v·e₂)) then (t,x,v) ↦ (t,x, ιe₂·(v·ιe₂)) sends (0,0,1) to (0,0,1), whose re.re.re
-- coordinate is 1; claiming 12 forces 1 = 12. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the finite product `biMulFun ιe₂ ιe₂ ∘ biMulFun e₂ e₂` FIXES the real axis
    (`biMulComp_e2_je2_fixes_one`), so the `re.re.re` coordinate of its image of the real unit `1`
    is `1`; the WRONG claim that this coordinate is `12` (the product still distorts the real axis
    like a single half-turn) forces the false numeric `1 = 12`, so this must NOT compile. -/
theorem product_fixes_real_axis_wrong_coord_BOGUS :
    (biMulFun (je2 : O Cut) (je2 : O Cut)
        (biMulFun (CD.e2 : O Cut) (CD.e2 : O Cut)
          ((0 : Cut), (0 : Cut), (1 : O Cut)))).2.2.re.re.re = 12 := by
  rw [biMulComp_e2_je2_fixes_one]
  show (1 : O Cut).re.re.re = 12
  rw [show (1 : O Cut).re.re.re = 1 from by simp]

end

end Counterexamples
