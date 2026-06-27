import Phys.Algebra.LorentzContinuumGenerationNinthFamily

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C145): A BOGUS NINTH-GENERATOR-FAMILY / NON-COMMUTATION COORD CLAIM — "THE ORDER
-- (x↔e₂ ROTATION)·(OCTONION-BLOCK WORD) axisRotLin e₂ (3/5)(4/5) · genTwoPlaneLin e₂ je2, APPLIED TO
-- (0,0,e₂), READS SECOND-COORDINATE x-SLOT .2.1 = 97".
-- N113 banks THE FULL NINTH-DIRECTION GENERATOR FAMILY x ↔ eᵢ (a GENERAL octonion axis e, not just
-- the real axis) AND THE NON-COMMUTATION with the octonion-block words — the structural complement to
-- N112's commuting single A-plane. axisRotLin e c s rotates span{x, e} reading the e-component
-- gFormC v e (the e = 1 case IS N105's planeRotLin); it is a QvC-isometry. THE JOINT (the structural
-- opposite of N112): the banked word genTwoPlaneLin e₂ je2 NEGATES e₂ (vTwoPlane_e2_je2_e2), so
-- axisRotLin e₂ c s does NOT commute with it (axisRotLin_word_not_commute). The W8 teeth: the two
-- orders read DIFFERENT x-slots at (0,0,e₂): (x↔e₂ rotation)·(word) reads +s (the word negates e₂
-- first, the rotation reads gFormC(−e₂)e₂ = −1, giving c·0 − s·(−1) = s), while (word)·(x↔e₂
-- rotation) reads −s (the rotation reads gFormC e₂ e₂ = 1, giving −s; the word then leaves x rigid).
-- For the concrete (c,s) = (3/5,4/5): the (rotation)·(word) order reads x-slot 4/5
-- (axisRot_word_e2_val), the opposite order reads −4/5 — they DIFFER (4/5 ≠ −4/5), the non-commutation
-- made concrete. The BOGUS claim that the (rotation)·(word) order's x-slot is 97 (a stand-in for ANY
-- wrong "the general-axis rotation commutes with the word / the word fixes e₂ / the orders agree / the
-- sector is not strictly higher") forces 4/5 = 97, and must NOT compile.
--   The bite is a true counterexample, not vacuous: `axisRot_word_e2_val` is a banked theorem (the
-- (rotation)·(word) order genuinely sends (0,0,e₂) to x-slot 4/5, via the proved negation of e₂ by
-- the word), so the coordinate genuinely IS 4/5, and the costume's claim of 97 is genuinely FALSE.
--   The false numeric `4 / 5 = 97` is DISTINCT from the banked battery (… C142 −1=79, C143 −1=83,
-- C144 3/5=89).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/axis/isometry/compact/orthogonal/word/
-- generation/generator/2-plane/block/octonion-block/Spin/SO(9)/SO(8)/A-torus/ninth-direction/commute/
-- family/quaternion": over the derived complete ordered field `Cut` and `O Cut := CD(H Cut)`, the
-- operator axisRotLin e₂ (3/5)(4/5) · (biMulLin je2 je2 · biMulLin e₂ e₂), applied to (0,0,e₂), reads
-- second coordinate slot .2.1 = 4/5; claiming 97 forces 4/5 = 97. The bite is a false NUMERIC,
-- name-independent.

/-- BOGUS: the order `(x↔e₂ rotation)·(octonion-block word)` `axisRotLin e₂ (3/5)(4/5) ·
    genTwoPlaneLin e₂ je2`, applied to `(0,0,e₂)`, reads second-coordinate `x`-slot `.2.1 = 4/5`
    (`axisRot_word_e2_val`, the non-commuting order — the word negates `e₂`, the rotation reads `−1`,
    giving `+s = 4/5`); the WRONG claim that this coordinate is `97` (the orders agree / the rotation
    commutes with the word) forces the false numeric `4 / 5 = 97`, so this must NOT compile. -/
theorem ninth_family_noncommute_wrong_coord_BOGUS :
    ((axisRotLin (CD.e2 : O Cut) ((3:Cut)/5) ((4:Cut)/5)
        * genTwoPlaneLin (CD.e2 : O Cut) (je2 : O Cut))
        ((0:Cut), (0:Cut), (CD.e2 : O Cut))).2.1 = (97 : Cut) := by
  rw [axisRot_word_e2_val]

end

end Counterexamples
