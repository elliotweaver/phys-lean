import Phys.Algebra.LorentzContinuumSO9DetReduction

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C203): A BOGUS DET-REDUCTION / DET-PARITY / ANTIPODE / SO-vs-O / UNCONDITIONAL-CLOSURE
-- / JoinedIdQvC CLAIM — "THE 10-dim DETERMINANT OF A (t,x)-FIXING ISOMETRY DOES NOT REDUCE TO ITS
-- v-BLOCK / THE KEYSTONE COLLAPSES TO A WRONG VALUE / THE AXIS-MOVING det-+1 WITNESS HAS det ≠ 1".
-- N171 banks THE DETERMINANT-REDUCTION KEYSTONE: a QvC-isometry g fixing BOTH the timelike axis
-- (1,0,0) AND the x-axis (0,1,0) has its 10-dim LinearMap.det over STVC EQUAL to its 8-dim v-block
-- determinant over O Cut (det_fixingTX_eq_vBlock) — because g = octBlockEndC (vBlockEndC g) (N163)
-- and the block-diagonal octBlockEndC R has det = det R (det_octBlockEndC, via LinearMap.det_prodMap).
-- The W8 witness octBlockEndC so9WitnessR (so9WitnessR = houseHolder e₂ · houseHolder (e₂+je2), a
-- GENUINE NON-orthonormal axis-MOVING det-+1 isometry that moves e₂+je2 ↦ e₂−je2) has its 10-dim
-- determinant reduced BY THE KEYSTONE to its v-block determinant (−1)·(−1) = 1 EXACTLY
-- (det_fixingTX_eq_vBlock_witness, via det_e2je2_product and vBlockEndC_octBlockEndC).
--   THE BOGUS claim that the keystone's reduced determinant LinearMap.det (octBlockEndC so9WitnessR)
-- (a stand-in for ANY wrong det-reduction / det-parity / antipode / SO-vs-O / unconditional-closure /
-- JoinedIdQvC value: the 10-dim det fails to collapse to the v-block / the keystone gives a wrong
-- value / the axis-moving det-+1 element is improper) equals 171 forces, after evaluating the genuine
-- determinant (which is exactly (−1)·(−1) = 1), the false numeric `(1 : Cut) = 171` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the genuine 10-dim determinant of the moving
-- witness is 1 (the keystone reduces it to the v-block det of a product of two Householder reflections,
-- (−1)² = 1), so the claim of 171 is genuinely FALSE (1 ≠ 171 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 171` is DISTINCT from the banked battery (… C200 1=168, C201 1=169, C202 1=170).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/rotation/isometry/octonion-block/det/determinant/
-- parity/SO/JoinedIdQvC/Householder/reflection": over the derived ordered field Cut and the terminal
-- algebra O Cut, the value LinearMap.det (octBlockEndC so9WitnessR) equals 1; claiming it equals 171
-- forces the false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the keystone-reduced 10-dim determinant `LinearMap.det (octBlockEndC so9WitnessR)` of the
    axis-moving det-`+1` witness equals `171`. It GENUINELY equals `1` (the keystone
    `det_fixingTX_eq_vBlock` reduces the 10-dim det to the `v`-block det of a product of two Householder
    reflections, `(−1)·(−1) = 1`, `det_fixingTX_eq_vBlock_witness`). The WRONG claim that it is `171`
    (the 10-dim det fails to collapse to the `v`-block / the keystone gives a wrong value / the
    axis-moving det-`+1` element is improper) reduces to the false numeric `(1 : Cut) = 171`, so this
    must NOT compile. -/
theorem so9DetReduction_wrong_value_BOGUS :
    LinearMap.det (octBlockEndC so9WitnessR) = (171 : Cut) := by
  rw [det_fixingTX_eq_vBlock_witness]

end

end Counterexamples
