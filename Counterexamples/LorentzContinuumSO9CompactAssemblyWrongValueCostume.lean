import Phys.Algebra.LorentzContinuumSO9CompactAssembly

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C195): A BOGUS SO(9)-COMPACT-ASSEMBLY / EXTRACTION / ROUND-TRIP / vBlockEndC /
-- JoinedIdQvC READ-OFF — "THE EXTRACTION vBlockEndC DOES NOT RECOVER THE OCTONION v-BLOCK OF THE
-- LIFT octBlockEndC R, SO THE det +1 SO(9)-COMPACT-FACTOR ASSEMBLY READS A WRONG DETERMINANT".
-- N163 banks THE FULL TIME-FIXING SO(9) COMPACT FACTOR ASSEMBLY: the N158 peel
-- (joinedIdQvC_peel_reduce) reduces a time-fixing, EvC-orthogonal, x-moving QvC-isometry k to its
-- x-fixing stabilizer; the EXTRACTION (qvIsom_fixingTX_eq_octBlockEndC) identifies a QvC-isometry
-- fixing BOTH the timelike axis and the x-axis with the octonion-block embedding octBlockEndC of
-- its v-block vBlockEndC (a gFormC-isometry, vBlockEndC_isGFormCIsom, by BvC-orthogonality), and the
-- det +1 octonion-block SO(8) closure (N162 joinedIdQvC_octBlockEndC_of_det_one) lifts it into the
-- NON-VACUOUS JoinedIdQvC. THE ROUND-TRIP vBlockEndC_octBlockEndC proves the extraction is a genuine
-- LEFT-INVERSE of octBlockEndC (vBlockEndC (octBlockEndC R) = R), so it is not lossy. The W8
-- NON-VACUITY anchor: the lift octBlockEndC (houseHolder e₂ · houseHolder (e₂+je2)) of N162's
-- genuinely NON-orthonormal axis-MOVING det +1 product is JoinedIdQvC by THIS NODE's x-fixing
-- assembly route (joinedIdQvC_so9Witness_via_assembly), with vBlockEndC recovering its v-block, of
-- LinearMap.det = (−1)·(−1) = 1 (det_e2je2_product).
--   THE BOGUS claim that the recovered v-block determinant reads 163 (a stand-in for ANY wrong
-- SO(9)-compact-assembly / extraction / round-trip / JoinedIdQvC value: the extraction does not
-- recover R / the round-trip is lossy / the assembly det is not 1) forces, after rewriting by the
-- genuine round-trip + value, the false numeric `(1 : Cut) = 163` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the round-trip genuinely recovers
-- so9WitnessR (vBlockEndC_octBlockEndC) whose det is genuinely 1 (det_e2je2_product over the derived
-- field Cut), so the claim of 163 is genuinely FALSE (1 ≠ 163 in the derived ordered field Cut,
-- char 0).
--   The false numeric `1 = 163` is DISTINCT from the banked battery (… C192 1=160, C193 1=161,
-- C194 1=162).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/reflection/Householder/isometry/SO(8)/SO(9)/
-- compact/determinant/extraction/round-trip/block/JoinedIdQvC/octonion/peel/deflation/time-fixing":
-- over the derived complete ordered field Cut, the octonion v-block of the explicit operator
-- octBlockEndC (houseHolder e₂ · houseHolder (e₂+je2)) recovered by vBlockEndC has LinearMap.det = 1;
-- claiming it equals 163 forces the false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the octonion `v`-block of the lift `octBlockEndC so9WitnessR` recovered by the extraction
    `vBlockEndC` has `LinearMap.det = 163`. It GENUINELY equals `1` (the round-trip
    `vBlockEndC_octBlockEndC` recovers `so9WitnessR`, whose `det` is `(−1)·(−1) = 1` —
    `det_e2je2_product`). The WRONG claim that it is `163` (the extraction does not recover the
    `v`-block / the round-trip is lossy / the assembly determinant is not 1) reduces, after
    rewriting by the genuine round-trip and value, to the false numeric `(1 : Cut) = 163`, so this
    must NOT compile. -/
theorem so9CompactAssembly_wrong_value_BOGUS :
    LinearMap.det (vBlockEndC (octBlockEndC so9WitnessR)) = (163 : Cut) := by
  rw [vBlockEndC_octBlockEndC, det_e2je2_product]

end

end Counterexamples
