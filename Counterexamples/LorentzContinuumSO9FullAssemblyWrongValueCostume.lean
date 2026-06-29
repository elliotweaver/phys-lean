import Phys.Algebra.LorentzContinuumSO9FullAssembly

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C197): A BOGUS FULL SO⁺(1,9) IDENTITY-COMPONENT ASSEMBLY / KAK-PRODUCT / POLAR
-- READ-OFF — "THE KAK PRODUCT (FORWARD BOOST · TIME-FIXING SO(9) ROTATION) DOES NOT PRESERVE THE
-- UNIT HYPERBOLA OF ITS BOOST FACTOR, SO THE ASSEMBLED ELEMENT FAILS THE ISOMETRY / JoinedIdQvC
-- CONDITION".
-- N165 banks THE FULL SO⁺(1,9) IDENTITY-COMPONENT ASSEMBLY: the explicit KAK product
-- joinedIdQvC_boost_so9compact (a forward boost boostEndC a b, a²−b²=1, 0<a, times an N163-certified
-- time-fixing SO(9) compact factor k is the NON-VACUOUS JoinedIdQvC, via joinedIdQvC_boost_compact ∘
-- joinedIdQvC_of_timeFixing_evCOrth_SO9), and the polar reduction bvIsomLin_polar_reduction (an
-- arbitrary BvC-isometry S = k · p factors so that JoinedIdQvC k → JoinedIdQvC p → JoinedIdQvC S, via
-- joinedIdQvC_mul). The concrete witness boostEndC (5/3) (4/3) · octBlockEndC so9WitnessR is JoinedIdQvC
-- (joinedIdQvC_boostWitness_so9Witness) and MOVES the timelike axis (1,0,0) ↦ (5/3, 4/3, 0)
-- (boostWitness_so9Witness_moves_time).
--   THE BOGUS claim that the unit-hyperbola read-off (cutSqrt(1+(4/3)²))² − (4/3)² of the witness
-- boost factor's parameter b = 4/3 (a stand-in for ANY wrong assembly / KAK-product / polar / isometry
-- / JoinedIdQvC value: the assembled element does not preserve the form / the boost factor leaves the
-- hyperbola / the positive-part reduction fails) equals 165 forces, after rewriting by the genuine
-- isometry identity boostPath_iso at m = 4/3 (which is exactly 1), the false numeric `(1 : Cut) = 165`
-- and must NOT compile.
--   The bite is a true counterexample, not vacuous: the genuine hyperbola value at m = 4/3 is
-- (cutSqrt(1+(4/3)²))² − (4/3)² = 1 (boostPath_iso (4/3)), so the claim of 165 is genuinely FALSE
-- (1 ≠ 165 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 165` is DISTINCT from the banked battery (… C194 1=162, C195 1=163,
-- C196 1=164).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/hyperbola/hyperbolic/KAK/polar/compact/isometry/
-- SO(9)/orthochronous/proper/assembly/JoinedIdQvC/positive-part": over the derived complete ordered
-- field Cut, the value (cutSqrt(1+(4/3)²))² − (4/3)² equals 1; claiming it equals 165 forces the
-- false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the unit-hyperbola read-off `(cutSqrt(1+m²))² − m²` of the witness KAK product's boost
    factor at its parameter `m = 4/3` equals `165`. It GENUINELY equals `1` (`boostPath_iso (4/3)`:
    `(cutSqrt(1+(4/3)²))² − (4/3)² = 1`, by `cutSqrt_sq`). The WRONG claim that it is `165` (the
    assembled element leaves the hyperbola / the isometry or polar reduction fails) reduces, after
    rewriting by the genuine isometry identity, to the false numeric `(1 : Cut) = 165`, so this must
    NOT compile. -/
theorem so9FullAssembly_wrong_value_BOGUS :
    (cutSqrt (1 + ((4:Cut)/3)^2))^2 - ((4:Cut)/3)^2 = (165 : Cut) := by
  rw [boostPath_iso ((4:Cut)/3)]

end

end Counterexamples
