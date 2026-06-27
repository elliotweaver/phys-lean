import Phys.Algebra.LorentzContinuumGenerationWordMembershipObstruction

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C137): A BOGUS WORD-MEMBERSHIP / NINTH-DIRECTION-ROTATION COORDINATE CLAIM —
-- "THE GENUINE SO(2) NINTH-DIRECTION ROTATION planeRotLin (3/5) (4/5) FIXES THE x-COORDINATE,
-- READING x' = 59 AT THE INPUT (0,1,0)".
-- N105 banks the biMulLin-word RIGIDITY (every word in genIsomMonoidLin FIXES the x-coordinate,
-- reaching at most the octonion-block SO(8) sector) and the OBSTRUCTION: the concrete genuine SO(2)
-- ninth-direction rotation planeRotLin c s = (t,x,v) ↦ (t, c·x − s·reQC v, v + (s·x + (c−1)·reQC v)•1)
-- MOVES the x-coordinate — applied to (0,1,0) (reQC 0 = 0) its x-image is c (planeRotLin_moves_x), so
-- for the circle point (c,s) = (3/5, 4/5) the genuine x-image is 3/5. Since 3/5 ≠ 1 (= the input
-- x-coordinate) the rotation is NOT a biMulLin word (planeRotLin_not_mem_genIsomMonoidLin) — the
-- missing x↔𝕆 ninth-direction generator. The BOGUS claim that this x-image is 59 (a stand-in for
-- ANY wrong "the ninth-direction rotation fixes x / reads a different x-image / is a biMulLin word"
-- reading) forces 3 / 5 = 59, and must NOT compile.
--   The bite is a true counterexample, not vacuous: `planeRotLin_moves_x` is a banked theorem, so the
-- x-image genuinely IS 3/5, and the costume's claim of 59 is genuinely FALSE.
--   The false numeric `3 / 5 = 59` is DISTINCT from the banked battery (… C128 3/2=13, C129 4/3=40,
-- C135 1=47, C136 −1=53).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/rotation/isometry/compact/orthogonal/word/
-- generation/generator/2-plane/ninth-direction/Spin/SO(9)/SO(2)/octonion-block": over the derived
-- complete ordered field `Cut` and `O Cut := CD(H Cut)`, the Cut-linear operator planeRotLin (3/5)
-- (4/5) applied to (0,1,0) reads second coordinate 3/5; claiming 59 forces 3 / 5 = 59. The bite is a
-- false NUMERIC, name-independent.

/-- BOGUS: the genuine `SO(2)` ninth-direction rotation `planeRotLin (3/5) (4/5)` MOVES the
    `x`-coordinate — applied to `(0,1,0)` the `x`-image is `c = 3/5` (`planeRotLin_moves_x`); the WRONG
    claim that this `x`-image is `59` (the rotation fixes `x` / is a `biMulLin` word) forces the false
    numeric `3 / 5 = 59`, so this must NOT compile. -/
theorem word_membership_ninth_direction_wrong_x_coord_BOGUS :
    (planeRotLin ((3:Cut)/5) ((4:Cut)/5) ((0:Cut), (1:Cut), (0:O Cut))).2.1 = (59 : Cut) := by
  rw [planeRotLin_moves_x ((3:Cut)/5) ((4:Cut)/5)]

end

end Counterexamples
