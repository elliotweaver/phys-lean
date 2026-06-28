import Phys.Algebra.LorentzContinuumGenerationIndefiniteHouseholder

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C157): A BOGUS INDEFINITE-HOUSEHOLDER / ANISOTROPIC-PEEL-ORACLE CLAIM — "THE
-- INDEFINITE-SIGNATURE HOUSEHOLDER REFLECTION OF THE MINKOWSKI FORM AT THE TIMELIKE UNIT AXIS DOES
-- NOT NEGATE IT CLEANLY: THE MINKOWSKI SELF-OVERLAP OF ITS IMAGE READS 125".
-- N125 banks THE INDEFINITE-SIGNATURE HOUSEHOLDER REFLECTION + THE ANISOTROPIC PEEL ORACLE, lifting
-- N124's positive-definite Householder peel from the 8-dim terminal algebra O Cut to the FULL 10-dim
-- spacetime STVC = Cut × Cut × O Cut carrying the indefinite Minkowski form BvC (signature (1,9)):
-- houseHolderM a := p ↦ p − (2·(BvC a a)⁻¹·BvC a p)•a for anisotropic a (BvC a a ≠ 0). The reflection
-- PRESERVES BvC (houseHolderM_isom), is an INVOLUTION (houseHolderM_involutive), FIXES the
-- BvC-orthogonal hyperplane (houseHolderM_fixes_ortho), NEGATES the reflecting line
-- (houseHolderM_neg_self), and the anisotropic peel oracle (houseHolderM_oracle) grows the fixed
-- subspace — the reflect-back identity BvC a a = 2·BvC a (T v) surviving the indefinite signature.
-- W8: at the timelike unit axis mTimeUnit = (1,0,0) (Minkowski self-overlap 1, so BvC ≠ 0) the
-- reflection negates it, houseHolderM mTimeUnit mTimeUnit = −mTimeUnit (houseHolderM_witness_neg_T),
-- so the Minkowski self-overlap of the image is BvC (−mTimeUnit) (−mTimeUnit) = BvC mTimeUnit
-- mTimeUnit = 1 (houseHolderM_witness_self_overlap_T).
--   The BOGUS claim that BvC (houseHolderM mTimeUnit mTimeUnit) (houseHolderM mTimeUnit mTimeUnit)
-- = 125 (a stand-in for ANY wrong indefinite-Householder / anisotropic-peel-oracle / signature /
-- block-decomposition / reflect-back / isometry / involution / operator-topology / Spin(9)-cover
-- claim: the reflection does NOT preserve the Minkowski norm / does NOT negate the line / does NOT
-- reflect the moved image back) forces 1 = 125, and must NOT compile.
--   The bite is a true counterexample, not vacuous: houseHolderM_witness_self_overlap_T is a banked
-- theorem (the image's Minkowski self-overlap GENUINELY is 1 over the derived field), so the
-- costume's claim of 125 is genuinely FALSE.
--   The false numeric `1 = 125` is DISTINCT from the banked battery (… C154 8=119, C155 8=121,
-- C156 1=123).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/Minkowski/reflection/Householder/isometry/oracle/
-- signature/timelike/spacelike/peel/fixed/hyperplane/negate": over the derived complete ordered
-- field `Cut` and STVC = Cut × Cut × O Cut, the map p ↦ p − (2·(BvC a a)⁻¹·BvC a p)•a at
-- a := (1,0,0) sends (1,0,0) to −(1,0,0), whose BvC self-overlap equals BvC (1,0,0) (1,0,0) = 1;
-- claiming 125 forces 1 = 125. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the Minkowski self-overlap of the indefinite-Householder-reflected image
    `houseHolderM mTimeUnit mTimeUnit` (`= −mTimeUnit`, `houseHolderM_witness_neg_T`) is
    `BvC mTimeUnit mTimeUnit = 1` (`houseHolderM_witness_self_overlap_T`). The WRONG claim that it
    reads `125` (the reflection does NOT negate the line / does NOT preserve the Minkowski norm)
    forces the false numeric `1 = 125`, so this must NOT compile. -/
theorem indefinite_householder_wrong_reflection_BOGUS :
    BvC (houseHolderM (mTimeUnit : STVC) (mTimeUnit : STVC))
        (houseHolderM (mTimeUnit : STVC) (mTimeUnit : STVC)) = (125 : Cut) := by
  rw [houseHolderM_witness_self_overlap_T]

end

end Counterexamples
