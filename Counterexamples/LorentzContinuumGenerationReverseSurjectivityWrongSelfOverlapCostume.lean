import Phys.Algebra.LorentzContinuumGenerationReverseSurjectivity

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C164): A BOGUS GLOBAL-REVERSE-SURJECTIVITY / REFLECTION-WORD / CLASSIFICATION /
-- SO⁺(1,9)-STRUCTURE CLAIM — "THE BOOST (5/3, 4/3), REALIZED AS A FINITE PRODUCT OF INDEFINITE
-- HOUSEHOLDER REFLECTIONS, DOES NOT PRESERVE THE MINKOWSKI SELF-OVERLAP OF THE TIMELIKE AXIS: ITS
-- IMAGE OF mTimeUnit HAS BvC = 132, NOT 1".
-- N132 closes the global reverse surjectivity UNCONDITIONALLY against the REFLECTION alphabet: every
-- linear QvC-isometry of STVC is a finite product of indefinite Householder reflections
-- (linQvIsom_mem_reflection_closure), and the generated reflection submonoid EQUALS the full linear
-- BvC-isometry group SO⁺(1,9) (reflection_closure_eq_bvIsomLinMonoid). The ONE LAW reframe: N131's
-- conditional residual k ∈ genIsomMonoidLin is FALSE against the biMulLin alphabet (every biMulLin
-- word fixes (t,x), reaching only the octonion-block SO(8), N105), so the residual DISSOLVES against
-- the reflection alphabet that provably reaches the full group (lorentz_exhaustion_M N128 +
-- linIsom_BvC_preserved N51) — no open residual, no operator topology, no posited group. W8: the
-- concrete boost (5/3, 4/3) ((5/3)² − (4/3)² = 1, off-diagonal 4/3 ≠ 0, a genuine non-identity
-- BvC-isometry) IS a finite reflection word (boost_mem_reflection_closure) and PRESERVES the Minkowski
-- self-overlap of the moved timelike axis mTimeUnit, reading BvC = 1 = BvC mTimeUnit mTimeUnit
-- (boost_reflection_word_witness_self_overlap).
--   The BOGUS claim that the boost's image of mTimeUnit has Minkowski self-overlap 132 (a stand-in for
-- ANY wrong global-reverse-surjectivity / reflection-word / classification / SO⁺(1,9)-structure claim:
-- the boost is NOT a reflection word / the closure ≠ the isometry group / the surjectivity breaks)
-- forces 1 = 132, and must NOT compile.
--   The bite is a true counterexample, not vacuous: boost_reflection_word_witness_self_overlap is a
-- banked theorem (the boost's image GENUINELY has Minkowski self-overlap 1 over the derived field), so
-- the costume's claim of 132 is genuinely FALSE.
--   The false numeric `(1 : Cut) = 132` is DISTINCT from the banked battery (… C160 1=128, C161 1=129,
-- C162 1=130, C163 1=131).
--   PHYSICS-WORDS-REMOVABLE: delete "boost/rotation/reflection/Householder/Lorentz/Minkowski/timelike/
-- isometry/surjectivity/generation/Cartan/Dieudonné/Spin/SO(9)/SO(1,9)/classification/word/group": over
-- the derived complete ordered field `Cut` and STVC = Cut × Cut × O Cut, for the BvC-isometry
-- boostEndC (5/3) (4/3) the image of (1,0,0) under the operator has bilinear self-overlap BvC equal to
-- BvC (1,0,0) (1,0,0) = 1; claiming 132 forces the false numeric. The bite is a false NUMERIC,
-- name-independent.

/-- BOGUS: the boost `boostEndC (5/3) (4/3)`, a finite product of indefinite Householder reflections
    (`boost_mem_reflection_closure`), preserves the Minkowski self-overlap of the timelike unit axis
    `mTimeUnit`, so its image has `BvC = 1` (`boost_reflection_word_witness_self_overlap`). The WRONG
    claim that it reads `132` (the boost is not a reflection word / the closure ≠ the isometry group /
    the global reverse surjectivity breaks) forces the false numeric `(1 : Cut) = 132`, so this must
    NOT compile. -/
theorem reverse_surjectivity_wrong_self_overlap_BOGUS :
    BvC (boostEndC ((5:Cut)/3) ((4:Cut)/3) (mTimeUnit : STVC))
        (boostEndC ((5:Cut)/3) ((4:Cut)/3) (mTimeUnit : STVC)) = (132 : Cut) := by
  rw [boost_reflection_word_witness_self_overlap]

end

end Counterexamples
