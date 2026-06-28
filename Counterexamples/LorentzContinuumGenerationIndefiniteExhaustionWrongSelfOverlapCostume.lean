import Phys.Algebra.LorentzContinuumGenerationIndefiniteExhaustion

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C159): A BOGUS INDEFINITE-EXHAUSTION / FINRANK-STRONG-RECURSION CLAIM — "THE DOUBLE
-- INDEFINITE REFLECTION OF THE TIMELIKE UNIT AXIS DOES NOT RETURN A UNIT-NORM VECTOR: ITS MINKOWSKI
-- SELF-OVERLAP READS 127".
-- N127 banks THE INDEFINITE FINRANK-STRONG-RECURSION ASSEMBLY — the indefinite-Cartan–Dieudonné
-- descent over the full 10-dim spacetime STVC = Cut × Cut × O Cut carrying the indefinite Minkowski
-- form BvC (signature (1,9)), adapting N123's positive-definite skeleton over the 8-dim O Cut. The
-- base case isom_fix_full_eq_id_M (a fixed-subspace-full-rank finrank=10 operator is the identity,
-- via finrank_STVC N122), the recursion skeleton reflection_exhaustion_M (given the peel oracle every
-- BvC-isometry is a finite product of houseHolderMSet reflections), and the concrete reduction
-- reflection_exhaustion_M_aniso (plugging N125's anisotropic peel oracle houseHolderM_oracle reduces
-- the full SO⁺(1,9) exhaustion to the single existence question every non-identity BvC-isometry has a
-- moved vector with anisotropic difference). W8: on the concrete genuinely-indefinite witness — the
-- timelike unit axis mTimeUnit = (1,0,0) (BvC = +1), its indefinite Householder reflection
-- houseHolderM mTimeUnit a genuine alphabet member of Submonoid.closure houseHolderMSet
-- (houseHolderM_mTimeUnit_mem_closure), the DOUBLE reflection returning mTimeUnit (involution at the
-- timelike axis, houseHolderM_neg_self), so the Minkowski self-overlap of the doubly-reflected image
-- is BvC mTimeUnit mTimeUnit = 1 (exhaustion_witness_self_overlap).
--   The BOGUS claim that BvC (houseHolderM mTimeUnit (houseHolderM mTimeUnit mTimeUnit))
-- (houseHolderM mTimeUnit (houseHolderM mTimeUnit mTimeUnit)) = 127 (a stand-in for ANY wrong
-- indefinite-exhaustion / finrank-strong-recursion / two-reflection-growth / totally-isotropic /
-- boost-rotation-split / operator-topology / SO⁺(1,9)-exhaustion claim: the indefinite Householder
-- reflection is NOT a BvC-isometry / the double reflection does NOT return a unit-norm vector / the
-- recursion skeleton does NOT preserve the Minkowski norm) forces 1 = 127, and must NOT compile.
--   The bite is a true counterexample, not vacuous: exhaustion_witness_self_overlap is a banked
-- theorem (the double indefinite reflection's Minkowski self-overlap GENUINELY is 1 over the derived
-- field), so the costume's claim of 127 is genuinely FALSE.
--   The false numeric `(1 : Cut) = 127` is DISTINCT from the banked battery (… C155 8=121, C156
-- 1=123, C157 1=125, C158 1=126).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/Minkowski/reflection/Householder/isometry/timelike/
-- exhaustion/recursion/signature": over the derived complete ordered field `Cut` and
-- STVC = Cut × Cut × O Cut, the bilinear form BvC of the doubly-applied map
-- houseHolderM (1,0,0) (houseHolderM (1,0,0) (1,0,0)) on itself equals BvC (1,0,0) (1,0,0) = 1;
-- claiming 127 forces the false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the Minkowski self-overlap of the double indefinite reflection of the timelike unit axis
    `houseHolderM mTimeUnit (houseHolderM mTimeUnit mTimeUnit)` (`= mTimeUnit`) is
    `BvC mTimeUnit mTimeUnit = 1` (`exhaustion_witness_self_overlap`). The WRONG claim that it reads
    `127` (the indefinite Householder reflection / the recursion skeleton does NOT preserve the
    Minkowski norm) forces the false numeric `(1 : Cut) = 127`, so this must NOT compile. -/
theorem indefinite_exhaustion_wrong_self_overlap_BOGUS :
    BvC (houseHolderM (mTimeUnit : STVC) (houseHolderM (mTimeUnit : STVC) (mTimeUnit : STVC)))
        (houseHolderM (mTimeUnit : STVC) (houseHolderM (mTimeUnit : STVC) (mTimeUnit : STVC)))
      = (127 : Cut) := by
  rw [exhaustion_witness_self_overlap]

end

end Counterexamples
