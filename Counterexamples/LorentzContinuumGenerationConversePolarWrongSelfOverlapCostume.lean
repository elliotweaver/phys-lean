import Phys.Algebra.LorentzContinuumGenerationConversePolar

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C162): A BOGUS CONVERSE-POLAR-DECOMPOSITION / EvC-ADJOINT-EXISTENCE / SO⁺(1,9)-
-- STRUCTURE CLAIM — "THE CONVERSE POLAR DECOMPOSITION OF A BvC-ISOMETRY DOES NOT RECONSTRUCT IT
-- FAITHFULLY: THE RECONSTRUCTED OPERATOR k∘γ(1) OF THE BOOST a = 5/3, b = 4/3 APPLIED TO THE
-- TIMELIKE UNIT AXIS HAS MINKOWSKI SELF-OVERLAP 130, NOT 1".
-- N130 CONNECTS the indefinite-Householder/BvC world (N125–N129) to the polar/KAK strand (N89–N105):
-- every BvC-isometry S is injective (bvC_right_nondeg), preserves QvC (BvC_self), has a two-sided
-- Module.End-inverse (finite-dim bijectivity, Module.End.isUnit_iff), HAS an EvC-adjoint h = J∘S⁻¹∘J
-- with J = sigOpC (bvIsomLin_has_evCAdjoint — THE JOINT), and so polar-decomposes via the banked N97
-- packaged witness (bvIsomLin_polar_path_decomp): S = k·γ(1), k a QvC-isometry, γ the affine cone-path
-- of EvC-positive operators from id to the positive part. W8: the converse decomposition of the concrete
-- boost (5/3, 4/3) ((5/3)² − (4/3)² = 1, off-diagonal 4/3 ≠ 0, a genuine non-identity BvC-isometry)
-- RECONSTRUCTS it — the reconstructed operator preserves the indefinite Minkowski self-overlap of the
-- moved timelike axis mTimeUnit, reading BvC = 1 = BvC mTimeUnit mTimeUnit
-- (bvIsomLin_boost_witness_self_overlap).
--   The BOGUS claim that the reconstructed operator's image self-overlap reads 130 (a stand-in for ANY
-- wrong converse-polar-decomposition / adjoint-existence / SO⁺(1,9)-structure claim: the BvC-isometry has
-- NO EvC-adjoint / the polar reconstruction does NOT return the operator / the converse decomposition
-- breaks the Minkowski norm / k∘γ(1) ≠ S) forces 1 = 130, and must NOT compile.
--   The bite is a true counterexample, not vacuous: bvIsomLin_boost_witness_self_overlap is a banked
-- theorem (the reconstructed operator's self-overlap GENUINELY is 1 over the derived field), so the
-- costume's claim of 130 is genuinely FALSE.
--   The false numeric `(1 : Cut) = 130` is DISTINCT from the banked battery (… C159 1=127, C160 1=128,
-- C161 1=129).
--   PHYSICS-WORDS-REMOVABLE: delete "boost/rotation/Lorentz/Minkowski/timelike/isometry/adjoint/polar/
-- decomposition/reconstruction/signature/SO(1,9)": over the derived complete ordered field `Cut` and
-- STVC = Cut × Cut × O Cut, for the BvC-isometry boostEndC (5/3) (4/3) the existentially-supplied
-- reconstructed composite (S∘(p^{1/2})⁻¹)∘γ(1) applied to (1,0,0) has BvC self-pairing equal to
-- BvC (1,0,0) (1,0,0) = 1; claiming 130 forces the false numeric. The bite is a false NUMERIC,
-- name-independent.

/-- BOGUS: the converse polar decomposition of the BvC-isometry `boostEndC (5/3) (4/3)` reconstructs
    it, so the reconstructed operator's image of the timelike unit axis `mTimeUnit` has indefinite
    Minkowski self-overlap `BvC mTimeUnit mTimeUnit = 1` (`bvIsomLin_boost_witness_self_overlap`). The
    WRONG claim that it reads `130` (the BvC-isometry has no EvC-adjoint / the polar reconstruction
    does not return the operator / the converse decomposition breaks the Minkowski norm) forces the
    false numeric `(1 : Cut) = 130`, so this must NOT compile. -/
theorem converse_polar_wrong_self_overlap_BOGUS :
    ∃ (h : Module.End Cut STVC) (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC)
      (γ : Cut → Module.End Cut STVC),
      h.comp (boostEndC ((5:Cut)/3) ((4:Cut)/3)) = specOpN c u ∧
      BvC (((boostEndC ((5:Cut)/3) ((4:Cut)/3)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp (γ 1) (mTimeUnit : STVC))
          (((boostEndC ((5:Cut)/3) ((4:Cut)/3)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u)).comp (γ 1) (mTimeUnit : STVC)) = (130 : Cut) := by
  obtain ⟨h, n, c, u, γ, h1, h2⟩ := bvIsomLin_boost_witness_self_overlap
  exact ⟨h, n, c, u, γ, h1, by rw [h2]⟩

end

end Counterexamples
