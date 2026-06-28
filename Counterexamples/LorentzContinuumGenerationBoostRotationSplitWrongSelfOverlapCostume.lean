import Phys.Algebra.LorentzContinuumGenerationBoostRotationSplit

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C161): A BOGUS BOOST/ROTATION BLOCK-DECOMPOSITION / SO⁺(1,9)-STRUCTURE CLAIM —
-- "THE BLOCK-DIAGONAL boost × rotation MAP DOES NOT PRESERVE THE INDEFINITE MINKOWSKI FORM: THE BOOST
-- a = 5/3, b = 4/3 APPLIED TO THE TIMELIKE UNIT AXIS HAS MINKOWSKI SELF-OVERLAP 129, NOT 1".
-- N129 STITCHES the (t,x) boost strand (boostEndC, N49–N51) and the octonion-block exhaustion
-- (gFormC_isom_mem_closure, N124) to the closed indefinite Householder exhaustion (lorentz_exhaustion_M,
-- N128): the block-diagonal boost × rotation operator blockDiagC a b R = boostEndC a b * octBlockEndC R
-- is a BvC-isometry on the unit hyperbola a² − b² = 1 with R a gFormC-isometry (blockDiagC_isBvIsomLin),
-- hence covered by the closed exhaustion (blockDiagC_mem_closure). W8: the concrete boost a = 5/3, b = 4/3
-- ((5/3)² − (4/3)² = 1) GENUINELY MOVES the timelike unit axis mTimeUnit = (1,0,0) ↦ (5/3, 4/3, 0)
-- (blockDiagC_boost_witness_image — non-vacuous, a true (t,x) boost), yet PRESERVES the indefinite
-- Minkowski self-overlap, reading BvC = 1 = BvC mTimeUnit mTimeUnit (blockDiagC_boost_witness_self_overlap).
--   The BOGUS claim that the moved image's Minkowski self-overlap reads 129 (a stand-in for ANY wrong
-- boost/rotation-split / block-decomposition / SO⁺(1,9)-structure claim: the block-diagonal map does NOT
-- preserve the indefinite form / the boost is NOT a BvC-isometry / the (t,x) and octonion blocks are NOT
-- BvC-orthogonal / the polar split breaks the Minkowski norm) forces 1 = 129, and must NOT compile.
--   The bite is a true counterexample, not vacuous: blockDiagC_boost_witness_self_overlap is a banked
-- theorem (the moved timelike axis's Minkowski self-overlap GENUINELY is 1 over the derived field), so the
-- costume's claim of 129 is genuinely FALSE.
--   The false numeric `(1 : Cut) = 129` is DISTINCT from the banked battery (… C158 1=126, C159 1=127,
-- C160 1=128).
--   PHYSICS-WORDS-REMOVABLE: delete "boost/rotation/Lorentz/Minkowski/block/timelike/isometry/signature/
-- polar/octonion-block": over the derived complete ordered field `Cut` and STVC = Cut × Cut × O Cut, the
-- bilinear form BvC of (boostEndC (5/3) (4/3) * octBlockEndC LinearMap.id) (1,0,0) on itself equals
-- BvC (1,0,0) (1,0,0) = 1; claiming 129 forces the false numeric. The bite is a false NUMERIC,
-- name-independent.

/-- BOGUS: the indefinite Minkowski self-overlap of the block-diagonal boost × rotation image of the
    timelike unit axis `blockDiagC (5/3) (4/3) LinearMap.id mTimeUnit` (`= (5/3, 4/3, 0)`) is
    `BvC mTimeUnit mTimeUnit = 1` (`blockDiagC_boost_witness_self_overlap`). The WRONG claim that it
    reads `129` (the block-diagonal map does NOT preserve the indefinite form / the boost is NOT a
    BvC-isometry / the block split breaks the Minkowski norm) forces the false numeric
    `(1 : Cut) = 129`, so this must NOT compile. -/
theorem boost_rotation_split_wrong_self_overlap_BOGUS :
    BvC (blockDiagC ((5 : Cut) / 3) ((4 : Cut) / 3) LinearMap.id (mTimeUnit : STVC))
        (blockDiagC ((5 : Cut) / 3) ((4 : Cut) / 3) LinearMap.id (mTimeUnit : STVC))
      = (129 : Cut) := by
  rw [blockDiagC_boost_witness_self_overlap]

end

end Counterexamples
