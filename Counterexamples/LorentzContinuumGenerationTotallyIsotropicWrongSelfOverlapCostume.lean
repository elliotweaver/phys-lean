import Phys.Algebra.LorentzContinuumGenerationTotallyIsotropic

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C160): A BOGUS TOTALLY-ISOTROPIC / WITT-INDEX / SO⁺(1,9)-EXHAUSTION CLAIM — "THE
-- DOUBLE INDEFINITE REFLECTION OF THE TIMELIKE UNIT AXIS DOES NOT RETURN A UNIT-NORM VECTOR UNDER THE
-- NOW-UNCONDITIONAL EXHAUSTION: ITS MINKOWSKI SELF-OVERLAP READS 128".
-- N128 DISCHARGES haniso_exists: the negation (a BvC-isometry T ≠ id with every moved difference
-- totally isotropic) is shown VACUOUS through the trunk's Born positivity (the (1,9) spatial part
-- x² + gFormC(v,v) is positive-definite, gFormC_nonneg/gFormC_eq_zero_iff N56, so a self-BvC-null
-- vector with zero first coordinate is 0 — Witt index 1, NO finrank/dimension-restriction recursion).
-- The totally-isotropic rigidity isom_totally_isotropic_eq_id (an isometry with every moved
-- difference isotropic IS the identity), the discharge haniso_exists_thm (every non-identity
-- BvC-isometry has a moved vector with anisotropic difference), and N127's reflection_exhaustion_M_aniso
-- firing UNCONDITIONALLY give lorentz_exhaustion_M: every BvC-isometry of STVC = Cut × Cut × O Cut is a
-- finite product of indefinite Householder reflections (Submonoid.closure houseHolderMSet) — the full
-- indefinite Cartan–Dieudonné theorem CLOSED. W8: on the concrete genuinely-indefinite witness — the
-- timelike unit axis mTimeUnit = (1,0,0) (BvC = +1), its reflection a now-unconditionally-covered member
-- of the closure (lorentz_exhaustion_mTimeUnit_mem), the DOUBLE reflection returning mTimeUnit
-- (involution, houseHolderM_neg_self), so the Minkowski self-overlap of the doubly-reflected image is
-- BvC mTimeUnit mTimeUnit = 1 (lorentz_exhaustion_witness_self_overlap).
--   The BOGUS claim that BvC (houseHolderM mTimeUnit (houseHolderM mTimeUnit mTimeUnit))
-- (houseHolderM mTimeUnit (houseHolderM mTimeUnit mTimeUnit)) = 128 (a stand-in for ANY wrong
-- totally-isotropic / Witt-index / rank-1 / skew-adjoint / dimension-restriction /
-- SO⁺(1,9)-exhaustion claim: the totally-isotropic case is NOT vacuous / the unconditional exhaustion
-- does NOT preserve the Minkowski norm / the Born positivity does NOT force Witt index 1) forces
-- 1 = 128, and must NOT compile.
--   The bite is a true counterexample, not vacuous: lorentz_exhaustion_witness_self_overlap is a banked
-- theorem (the double indefinite reflection's Minkowski self-overlap GENUINELY is 1 over the derived
-- field), so the costume's claim of 128 is genuinely FALSE.
--   The false numeric `(1 : Cut) = 128` is DISTINCT from the banked battery (… C156 1=123, C157 1=125,
-- C158 1=126, C159 1=127).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/Minkowski/reflection/Householder/isometry/timelike/Witt/
-- isotropic/exhaustion/signature": over the derived complete ordered field `Cut` and
-- STVC = Cut × Cut × O Cut, the bilinear form BvC of the doubly-applied map
-- houseHolderM (1,0,0) (houseHolderM (1,0,0) (1,0,0)) on itself equals BvC (1,0,0) (1,0,0) = 1;
-- claiming 128 forces the false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the Minkowski self-overlap of the double indefinite reflection of the timelike unit axis
    `houseHolderM mTimeUnit (houseHolderM mTimeUnit mTimeUnit)` (`= mTimeUnit`) is
    `BvC mTimeUnit mTimeUnit = 1` (`lorentz_exhaustion_witness_self_overlap`). The WRONG claim that it
    reads `128` (the totally-isotropic case is NOT vacuous / the unconditional exhaustion does NOT
    preserve the Minkowski norm) forces the false numeric `(1 : Cut) = 128`, so this must NOT compile. -/
theorem totally_isotropic_exhaustion_wrong_self_overlap_BOGUS :
    BvC (houseHolderM (mTimeUnit : STVC) (houseHolderM (mTimeUnit : STVC) (mTimeUnit : STVC)))
        (houseHolderM (mTimeUnit : STVC) (houseHolderM (mTimeUnit : STVC) (mTimeUnit : STVC)))
      = (128 : Cut) := by
  rw [lorentz_exhaustion_witness_self_overlap]

end

end Counterexamples
