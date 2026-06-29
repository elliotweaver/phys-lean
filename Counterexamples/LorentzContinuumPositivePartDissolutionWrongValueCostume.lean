import Phys.Algebra.LorentzContinuumPositivePartDissolution

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C198): A BOGUS POSITIVE-PART / ISOMETRY / JoinedIdQvC CLAIM — "THE POSITIVE-PART
-- FACTOR p OF THE CONVERSE POLAR DECOMPOSITION OF A BvC-ISOMETRY IS A GENERIC POSITIVE OPERATOR
-- THAT DOES NOT PRESERVE THE INDEFINITE FORM, SO ITS BOOST/HYPERBOLA READ-OFF FAILS THE ISOMETRY
-- CONDITION".
-- N166 banks THE POSITIVE-PART DISSOLUTION: the general isometry-group cancellation
-- isQvIsomC_of_mul_eq (k, S QvC-isometries and k·p = S ⟹ p a QvC-isometry), the characterization
-- bvIsomLin_polar_part_isQvIsomC (the positive part p of the converse polar decomposition of a
-- BvC-isometry is itself a QvC-isometry — a positive self-adjoint boost, NOT a generic positive
-- operator), and the strengthened polar reduction bvIsomLin_polar_reduction_isom. The concrete
-- positive part of the boost (5/3,4/3) preserves the indefinite self-overlap of the timelike axis
-- (polarPart_isom_self_overlap).
--   THE BOGUS claim that the unit-hyperbola read-off (cutSqrt(1+(4/3)²))² − (4/3)² of the boost
-- parameter b = 4/3 (a stand-in for ANY wrong positive-part / isometry / JoinedIdQvC value: the
-- positive part is a generic positive operator that leaves the form / the isometry-group
-- cancellation fails / the dissolution does not hold) equals 166 forces, after rewriting by the
-- genuine isometry identity boostPath_iso at m = 4/3 (which is exactly 1), the false numeric
-- `(1 : Cut) = 166` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the genuine hyperbola value at m = 4/3 is
-- (cutSqrt(1+(4/3)²))² − (4/3)² = 1 (boostPath_iso (4/3)), so the claim of 166 is genuinely FALSE
-- (1 ≠ 166 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 166` is DISTINCT from the banked battery (… C195 1=163, C196 1=164,
-- C197 1=165).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/hyperbola/hyperbolic/isometry/positive-part/
-- self-adjoint/polar/JoinedIdQvC/dissolution": over the derived complete ordered field Cut, the
-- value (cutSqrt(1+(4/3)²))² − (4/3)² equals 1; claiming it equals 166 forces the false numeric.
-- The bite is a false NUMERIC, name-independent.

/-- BOGUS: the unit-hyperbola read-off `(cutSqrt(1+m²))² − m²` of the positive-part / boost
    factor at parameter `m = 4/3` equals `166`. It GENUINELY equals `1` (`boostPath_iso (4/3)`:
    `(cutSqrt(1+(4/3)²))² − (4/3)² = 1`, by `cutSqrt_sq`). The WRONG claim that it is `166` (the
    positive part is a generic positive operator that leaves the form / the isometry-group
    cancellation fails) reduces, after rewriting by the genuine isometry identity, to the false
    numeric `(1 : Cut) = 166`, so this must NOT compile. -/
theorem positivePart_dissolution_wrong_value_BOGUS :
    (cutSqrt (1 + ((4:Cut)/3)^2))^2 - ((4:Cut)/3)^2 = (166 : Cut) := by
  rw [boostPath_iso ((4:Cut)/3)]

end

end Counterexamples
