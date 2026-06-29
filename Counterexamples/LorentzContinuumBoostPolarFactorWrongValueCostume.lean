import Phys.Algebra.LorentzContinuumBoostPolarFactor

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C196): A BOGUS BOOST-PATH / BOOST-ISOMETRY / JoinedIdQvC READ-OFF — "THE
-- SQUARE-ROOT-STEERED HYPERBOLIC BOOST PATH DOES NOT LAND ON THE UNIT HYPERBOLA, SO THE FORWARD
-- BOOST FAILS THE QvC-ISOMETRY CONDITION AND IS NOT JoinedIdQvC".
-- N164 banks THE BOOST / POLAR NON-COMPACT FACTOR: the square-root-steered hyperbolic path
-- boostPath m := boostEndC (cutSqrt(1+m²)) m lands on the unit hyperbola for EVERY parameter
-- (boostPath_iso: (cutSqrt(1+m²))² − m² = 1, by cutSqrt_sq on 1+m² ≥ 0), starts at the identity
-- (boostPath_zero: cutSqrt 1 = 1, boostEndC 1 0 = id), every point is a genuine QvC-isometry
-- (boostPath_isQvIsomC, the non-vacuity), reaches the forward boost at m = b (boostPath_reaches:
-- cutSqrt(1+b²) = cutSqrt(a²) = a for a²−b²=1, 0<a), and is continuous in the operator topology
-- endOpC (boostPath_cont, via the cosh-analogue cutSqrt(1+m²) continuous by the order-topology
-- squeeze cutSqrt_one_add_sq_cont). So a forward boost is the NON-VACUOUS JoinedIdQvC
-- (joinedIdQvC_boostEndC), and the polar assembly boost · (time-fixing SO(9) compact) is JoinedIdQvC
-- by the engine joinedIdQvC_mul (joinedIdQvC_boost_compact).
--   THE BOGUS claim that the hyperbola read-off (cutSqrt(1+m²))² − m² of the boost path at the base
-- point m = 0 equals 164 (a stand-in for ANY wrong boost-path / isometry / JoinedIdQvC value: the
-- path does not land on the hyperbola / the isometry condition fails / the determinant of the boost
-- is not 1) forces, after rewriting by the genuine isometry identity boostPath_iso at m = 0
-- (which is exactly 1), the false numeric `(1 : Cut) = 164` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the genuine hyperbola value at m = 0 is
-- (cutSqrt(1+0²))² − 0² = 1 (boostPath_iso 0), so the claim of 164 is genuinely FALSE
-- (1 ≠ 164 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 164` is DISTINCT from the banked battery (… C193 1=161, C194 1=162,
-- C195 1=163).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/hyperbola/hyperbolic/rapidity/cosh/sinh/KAK/
-- polar/compact/isometry/SO(9)/orthochronous/path/JoinedIdQvC/continuous": over the derived
-- complete ordered field Cut, the value (cutSqrt(1+0²))² − 0² equals 1; claiming it equals 164
-- forces the false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the hyperbola read-off `(cutSqrt(1+m²))² − m²` of the square-root-steered boost path at
    the base point `m = 0` equals `164`. It GENUINELY equals `1` (`boostPath_iso 0`:
    `(cutSqrt(1+0²))² − 0² = 1`, by `cutSqrt_sq`). The WRONG claim that it is `164` (the path does
    not land on the hyperbola / the isometry condition fails / the boost determinant is not 1)
    reduces, after rewriting by the genuine isometry identity, to the false numeric `(1 : Cut) = 164`,
    so this must NOT compile. -/
theorem boostPath_wrong_value_BOGUS :
    (cutSqrt (1 + (0:Cut)^2))^2 - (0:Cut)^2 = (164 : Cut) := by
  rw [boostPath_iso 0]

end

end Counterexamples
