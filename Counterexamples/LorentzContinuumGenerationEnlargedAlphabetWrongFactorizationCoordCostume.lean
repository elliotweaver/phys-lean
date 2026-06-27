import Phys.Algebra.LorentzContinuumGenerationEnlargedAlphabet

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C138): A BOGUS SO(8)·(NINTH-ROTATION) FACTORIZATION COORDINATE CLAIM —
-- "THE CONCRETE HIGHER-RANK COMPACT ROTATION enlargedTwoPlaneNinth u w (5/13) (12/13) FIXES THE
-- x-COORDINATE, READING x' = 61 AT THE INPUT (0,1,0)".
-- N106 banks the ENLARGED-ALPHABET structure: the concrete SO(8)·(ninth-rotation) element
-- enlargedTwoPlaneNinth u w c s = planeRotLin c s * genTwoPlaneLin u w is an octonion-block
-- two-plane rotation (genTwoPlaneLin, a banked biMulLin WORD, the SO(8) factor) composed with a
-- ninth-direction rotation (planeRotLin, the SO(2) factor). Applied to (0,1,0): the octonion-block
-- factor FIXES (0,1,0) (zero v-block, genTwoPlaneLin_fixes_zero_v), then the ninth rotation sends
-- x = 1 ↦ x' = c (enlargedTwoPlaneNinth_moves_x). So for the circle point (c,s) = (5/13, 12/13) the
-- genuine x-image is 5/13. Since 5/13 ≠ 1 (the input x-coordinate) the higher-rank rotation MOVES x
-- and is NOT a biMulLin word (enlargedTwoPlaneNinth_not_mem_genIsomMonoidLin) — an enlarged word no
-- octonion-block word realises. The BOGUS claim that this x-image is 61 (a stand-in for ANY wrong
-- "the SO(8)·ninth factorization fixes x / reads a different x-image / is a biMulLin word") forces
-- 5 / 13 = 61, and must NOT compile.
--   The bite is a true counterexample, not vacuous: `enlargedTwoPlaneNinth_moves_x` is a banked
-- theorem (it holds for ALL u w, since the genTwoPlaneLin factor fixes (0,1,0) for any u w), so the
-- x-image genuinely IS 5/13, and the costume's claim of 61 is genuinely FALSE.
--   The false numeric `5 / 13 = 61` is DISTINCT from the banked battery (… C128 3/2=13, C129 4/3=40,
-- C135 1=47, C136 −1=53, C137 3/5=59).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/boost/rotation/isometry/compact/orthogonal/word/
-- generation/generator/2-plane/ninth-direction/Spin/SO(9)/SO(8)/SO(2)/octonion-block/alphabet": over
-- the derived complete ordered field `Cut` and `O Cut := CD(H Cut)`, the Cut-linear operator
-- enlargedTwoPlaneNinth 1 1 (5/13) (12/13) applied to (0,1,0) reads second coordinate 5/13; claiming
-- 61 forces 5 / 13 = 61. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the concrete higher-rank `SO(8)·(ninth-rotation)` element
    `enlargedTwoPlaneNinth 1 1 (5/13) (12/13)` MOVES the `x`-coordinate — applied to `(0,1,0)` the
    `x`-image is `c = 5/13` (`enlargedTwoPlaneNinth_moves_x`); the WRONG claim that this `x`-image is
    `61` (the factorization fixes `x` / is a `biMulLin` word) forces the false numeric `5 / 13 = 61`,
    so this must NOT compile. -/
theorem enlarged_alphabet_so8_ninth_factorization_wrong_x_coord_BOGUS :
    (enlargedTwoPlaneNinth (1 : O Cut) (1 : O Cut) ((5:Cut)/13) ((12:Cut)/13)
      ((0:Cut), (1:Cut), (0:O Cut))).2.1 = (61 : Cut) := by
  rw [enlargedTwoPlaneNinth_moves_x (1 : O Cut) (1 : O Cut) ((5:Cut)/13) ((12:Cut)/13)]

end

end Counterexamples
