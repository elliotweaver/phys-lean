import Phys.Algebra.LorentzContinuumOctBlockSO8ClosureWord

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C193): A BOGUS GENERAL-BIREFLECTION / SO(8)-CLOSURE-WORD / JoinedIdQvC READ-OFF —
-- "THE GENERAL (NON-ORTHONORMAL) BIREFLECTION houseHolder e₂ · houseHolder (e₂+je2) DOES NOT EQUAL
-- AN octPlaneRot, ITS LIFT DOES NOT GENUINELY MOVE THE OCTONION AXIS, AND THE FINITE PRODUCT OF
-- GENERAL BIREFLECTIONS DOES NOT LAND IN THE NON-VACUOUS JoinedIdQvC".
-- N161 banks THE GENERAL BIREFLECTION = octPlaneRot WORD, removing N160's orthonormality
-- restriction: houseHolder is scale-invariant (houseHolder_smul); every nonzero-Born-norm vector
-- normalizes to a unit vector with the same reflection (normalize_unit); the GENERAL two-axis
-- identity houseHolder e · houseHolder (k•e + μ•f) = octPlaneRot e f (2k²−1) (−2kμ)
-- (bireflection_eq_octPlaneRot_gen); the lifted plane rotation is JoinedIdQvC for ANY circle point
-- including the antipode (joinedIdQvC_octBlockEndC_octPlaneRot_circle); the lifted GENERAL
-- bireflection of ANY two nonzero-Born-norm vectors is JoinedIdQvC
-- (joinedIdQvC_octBlockEndC_bireflection); and any finite product of general bireflections lifts to
-- JoinedIdQvC (joinedIdQvC_octBlockEndC_bireflectionWord — the full octonion-block SO(8) identity
-- component by even reflection words). The W8 NON-VACUITY anchor: the GENUINELY NON-orthonormal pair
-- e₂, e₂+je2 (gFormC e₂ (e₂+je2) = 1 ≠ 0) bireflection octBlockEndC (houseHolder e₂ · houseHolder
-- (e₂+je2)) GENUINELY MOVES the octonion vector e₂+je2 ↦ e₂−je2 (bireflection_e2je2plus_moves),
-- whose Born overlap with e₂ reads
--   gFormC (e₂−je2) e₂ = gFormC e₂ e₂ − gFormC je2 e₂ = 1 − 0 = 1
-- (e2_gFormC_self, octDeflate_e2_je2_gFormC_zero), exercising the GENERAL — not the N160 orthonormal
-- — path, AND is JoinedIdQvC (joinedIdQvC_octBlockEndC_bireflection_e2je2plus).
--   THE BOGUS claim that this overlap reads 161 (a stand-in for ANY wrong general-bireflection /
-- closure-word / JoinedIdQvC value: the general bireflection is not the octPlaneRot / the lift does
-- not move the axis / the bireflection word is not JoinedIdQvC) forces, after rewriting by the
-- genuine value, the false numeric `(1 : Cut) = 161` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the lifted general bireflection genuinely sends
-- e₂+je2 to e₂−je2, whose Born overlap with e₂ is 1 (banked read-offs over the derived field Cut),
-- so the claim of 161 is genuinely FALSE (1 ≠ 161 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 161` is DISTINCT from the banked battery (… C191 1=159, C192 1=160).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/reflection/Householder/bireflection/isometry/
-- SO(8)/closure/word/JoinedIdQvC/octonion/block/Gram-Schmidt": over the derived complete ordered
-- field Cut, the explicit linear operator octBlockEndC (houseHolder e₂ · houseHolder (e₂+je2))
-- applied to (0,0,e₂+je2) has octonion-block overlap 1 with e₂; claiming it equals 161 forces the
-- false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the lifted general (non-orthonormal) bireflection `octBlockEndC (houseHolder e₂ ·
    houseHolder (e₂+je2))` applied to `(0,0,e₂+je2)` has octonion-block overlap `161` with `e₂`. It
    GENUINELY equals `1` (the general bireflection sends `e₂+je2 ↦ e₂−je2`, whose Born overlap with
    `e₂` is `gFormC e₂ e₂ − gFormC je2 e₂ = 1 − 0 = 1`). The WRONG claim that it is `161` (the
    general bireflection is not the `octPlaneRot` / the lift does not move the axis / the
    bireflection word is not `JoinedIdQvC`) reduces, after rewriting by the genuine value, to the
    false numeric `(1 : Cut) = 161`, so this must NOT compile. -/
theorem octBlockSO8ClosureWord_wrong_value_BOGUS :
    gFormC ((octBlockEndC (houseHolder (CD.e2 : O Cut)
              * houseHolder ((CD.e2 : O Cut) + (je2 : O Cut)))
              ((0:Cut), (0:Cut), (CD.e2 : O Cut) + (je2 : O Cut))).2.2)
           (CD.e2 : O Cut) = (161 : Cut) := by
  have h1 : gFormC (je2 : O Cut) (CD.e2 : O Cut) = 0 := by
    rw [gFormC_symm]; exact octDeflate_e2_je2_gFormC_zero
  rw [octBlockEndC_apply]
  show gFormC ((houseHolder (CD.e2 : O Cut) * houseHolder ((CD.e2 : O Cut) + (je2 : O Cut)))
              ((CD.e2 : O Cut) + (je2 : O Cut))) (CD.e2 : O Cut) = 161
  rw [bireflection_e2je2plus_moves, gFormC_sub_left, e2_gFormC_self, h1, sub_zero]

end

end Counterexamples
