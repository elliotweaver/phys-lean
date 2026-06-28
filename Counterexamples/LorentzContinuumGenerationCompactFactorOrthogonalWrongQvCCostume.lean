import Phys.Algebra.LorentzContinuumGenerationCompactFactorOrthogonal

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C163): A BOGUS COMPACT-FACTOR-EvC-ORTHOGONALITY / REVERSE-SURJECTIVITY /
-- GENERATION-CLOSURE / SO⁺(1,9)-STRUCTURE CLAIM — "THE COMPACT FACTOR OF A BvC-ISOMETRY DOES NOT
-- PRESERVE THE BORN QUADRATIC: THE COMPACT FACTOR k = S∘(p^{1/2})⁻¹ OF THE BOOST a = 5/3, b = 4/3,
-- APPLIED TO THE TIMELIKE UNIT AXIS, HAS BORN QUADRATIC QvC = 131, NOT 1".
-- N131 WIRES N130's converse polar decomposition into N104's single-residual reduction: the compact
-- factor k := S∘(p^{1/2})⁻¹ of an ARBITRARY BvC-isometry is an EvC-ORTHOGONAL QvC-isometry — it has
-- an explicit EvC-adjoint kadj := (p^{1/2})⁻¹∘h with kadj∘k = id (bvIsomLin_compact_factor_spec) and
-- IsQvIsomC k; so IF k is a biMulLin word THEN the bridged compact factor ∈ genIsomMonoidC2
-- (bvIsomLin_compact_factor_word_mem_gen2 — the global reverse surjectivity reduced to the single
-- clean word-membership residual). W8: the compact factor of the concrete boost (5/3, 4/3)
-- ((5/3)² − (4/3)² = 1, off-diagonal 4/3 ≠ 0, a genuine non-identity BvC-isometry), derived ONLY from
-- its IsBvIsomLin property, PRESERVES the Born quadratic of the moved timelike axis mTimeUnit, reading
-- QvC = 1 = QvC mTimeUnit (bvIsomLin_boost_compact_factor_witness_qvC).
--   The BOGUS claim that the compact factor's image has Born quadratic 131 (a stand-in for ANY wrong
-- compact-factor-EvC-orthogonality / reverse-surjectivity / generation-closure / SO⁺(1,9)-structure
-- claim: the compact factor is NOT a QvC-isometry / is NOT EvC-orthogonal / the reduction to the
-- word-membership residual breaks / k∘kadj ≠ id) forces 1 = 131, and must NOT compile.
--   The bite is a true counterexample, not vacuous: bvIsomLin_boost_compact_factor_witness_qvC is a
-- banked theorem (the compact factor's image GENUINELY has Born quadratic 1 over the derived field),
-- so the costume's claim of 131 is genuinely FALSE.
--   The false numeric `(1 : Cut) = 131` is DISTINCT from the banked battery (… C160 1=128, C161
-- 1=129, C162 1=130).
--   PHYSICS-WORDS-REMOVABLE: delete "boost/rotation/Lorentz/Minkowski/timelike/isometry/compact/
-- orthogonal/adjoint/polar/decomposition/reconstruction/signature/Spin/SO(9)/SO(1,9)/generation": over
-- the derived complete ordered field `Cut` and STVC = Cut × Cut × O Cut, for the BvC-isometry
-- boostEndC (5/3) (4/3) the existentially-supplied compact factor (S∘(p^{1/2})⁻¹) applied to (1,0,0)
-- has Born quadratic QvC equal to QvC (1,0,0) = 1; claiming 131 forces the false numeric. The bite is
-- a false NUMERIC, name-independent.

/-- BOGUS: the compact factor of the BvC-isometry `boostEndC (5/3) (4/3)` preserves the Born
    quadratic, so its image of the timelike unit axis `mTimeUnit` has `QvC = 1`
    (`bvIsomLin_boost_compact_factor_witness_qvC`). The WRONG claim that it reads `131` (the compact
    factor is not a QvC-isometry / not EvC-orthogonal / the reduction breaks) forces the false numeric
    `(1 : Cut) = 131`, so this must NOT compile. -/
theorem compact_factor_wrong_qvC_BOGUS :
    ∃ (h : Module.End Cut STVC) (n : ℕ) (c : Fin n → Cut) (u : Fin n → STVC),
      h.comp (boostEndC ((5:Cut)/3) ((4:Cut)/3)) = specOpN c u ∧
      QvC ((boostEndC ((5:Cut)/3) ((4:Cut)/3)).comp
        (specOpN (fun i => (cutSqrt (c i))⁻¹) u) (mTimeUnit : STVC)) = (131 : Cut) := by
  obtain ⟨h, n, c, u, h1, h2⟩ := bvIsomLin_boost_compact_factor_witness_qvC
  exact ⟨h, n, c, u, h1, by rw [h2]⟩

end

end Counterexamples
