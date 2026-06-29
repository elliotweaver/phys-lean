import Phys.Algebra.LorentzContinuumGeneralAxisBoostPath

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C200): A BOGUS GENERAL-AXIS-BOOST / EIGENFRAME / JoinedIdQvC CLAIM — "THE
-- GENERAL-AXIS BOOST genBoostLin wx wv a b IN THE t–ŵ PLANE FAILS THE UNIT-HYPERBOLA ISOMETRY
-- CONDITION, SO IT IS NOT A QvC-ISOMETRY AND NOT JoinedIdQvC AT THE GENERAL SPATIAL DIRECTION ŵ".
-- N168 banks THE GENERAL-AXIS BOOST FACTOR: genBoostLin wx wv a b (the boost in the t–ŵ plane for
-- an arbitrary spatial unit direction ŵ = (wx, wv), the hyperbolic mirror of axisRotLin) is a
-- QvC-isometry for a unit ŵ (wx²+gFormC wv wv = 1) and a²−b² = 1 (genBoostLin_isQvIsomC), reached
-- by the cutSqrt-steered hyperbolic path genBoostPath staying IN the isometry group
-- (genBoostPath_isQvIsomC), hence the NON-VACUOUS JoinedIdQvC (joinedIdQvC_genBoostLin) —
-- generalizing N164's t–x-only boostEndC to ANY spatial direction. The path parameter b lands on
-- the unit hyperbola: (cutSqrt(1+b²))² − b² = 1 EXACTLY (genBoostPath_iso) — the isometry
-- condition for every point of the general-axis boost path.
--   THE BOGUS claim that the unit-hyperbola read-off (cutSqrt(1+b²))² − b² of the boost parameter
-- b = 4/3 (a stand-in for ANY wrong general-axis-boost / eigenframe / JoinedIdQvC value: the boost
-- fails the isometry condition / is not JoinedIdQvC at the general direction) equals 168 forces,
-- after rewriting by the genuine isometry identity (which is exactly (cutSqrt(1+b²))² − b² = 1,
-- genBoostPath_iso), the false numeric `(1 : Cut) = 168` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the genuine unit-hyperbola read-off at b = 4/3
-- is (cutSqrt(1+(4/3)²))² − (4/3)² = 1 (genBoostPath_iso (4/3)), so the claim of 168 is genuinely
-- FALSE (1 ≠ 168 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 168` is DISTINCT from the banked battery (… C197 1=165, C198 1=166,
-- C199 1=167).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/axis/eigenframe/isometry/hyperbola/JoinedIdQvC/
-- timelike/spatial/rapidity": over the derived complete ordered field Cut, the value
-- (cutSqrt(1+(4/3)²))² − (4/3)² equals 1; claiming it equals 168 forces the false numeric. The
-- bite is a false NUMERIC, name-independent.

/-- BOGUS: the unit-hyperbola read-off `(cutSqrt(1+b²))² − b²` of the general-axis boost path
    parameter `b = 4/3` equals `168`. It GENUINELY equals `1` (`genBoostPath_iso (4/3)`). The WRONG
    claim that it is `168` (the general-axis boost fails the isometry condition / is not
    `JoinedIdQvC` at the general spatial direction) reduces, after rewriting by the genuine isometry
    identity, to the false numeric `(1 : Cut) = 168`, so this must NOT compile. -/
theorem genAxisBoost_wrong_value_BOGUS :
    (cutSqrt (1 + ((4:Cut)/3) ^ 2)) ^ 2 - ((4:Cut)/3) ^ 2 = (168 : Cut) := by
  rw [genBoostPath_iso]

end

end Counterexamples
