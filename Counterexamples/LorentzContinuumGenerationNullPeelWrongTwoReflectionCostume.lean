import Phys.Algebra.LorentzContinuumGenerationNullPeel

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C158): A BOGUS NULL-DIFFERENCE TWO-REFLECTION PEEL CLAIM — "THE TWO-REFLECTION
-- COMPOSITE DOES NOT PEEL THE NULL-DIFFERENCE IMAGE BACK CLEANLY: THE MINKOWSKI SELF-OVERLAP OF THE
-- PEELED IMAGE READS 126".
-- N126 banks THE NULL-DIFFERENCE TWO-REFLECTION PEEL-BACK — the indefinite-Cartan–Dieudonné null
-- case N125's anisotropic peel oracle explicitly scoped out. For a BvC-isometry T with an anisotropic
-- moved v whose DIFFERENCE T v − v is NULL (BvC (T v − v)(T v − v) = 0), the single N125 reflection
-- houseHolderM (T v − v) is undefined (its normalizer (BvC (T v − v)(T v − v))⁻¹ divides by zero);
-- the null obstruction DISSOLVES through the anisotropic SUM auxiliary b := T v + v, forced
-- anisotropic by the norm-sum identity BvC a a + BvC b b = 4·BvC v v (BvC_isom_diff_sum_norm) whenever
-- v is anisotropic, and the two-reflection composite houseHolderM v ∘ houseHolderM b sends T v ↦ −v ↦ v
-- (houseHolderM_null_peel_back). W8: on the genuinely-indefinite concrete witness — the spacelike unit
-- axis mSpaceUnit = (0,1,0) (BvC = −1), its isometric image wVec = (1,1,e₂) whose moved difference
-- wVec − mSpaceUnit = nullVec = (1,0,e₂) is GENUINELY NULL (BvC nullVec nullVec = 0,
-- wVec_sub_mSpaceUnit_null), peeled through the anisotropic sum bVec = (1,2,e₂) (BvC = −4) — the
-- composite houseHolderM mSpaceUnit (houseHolderM bVec wVec) = mSpaceUnit
-- (houseHolderM_null_two_reflection_witness), so the Minkowski self-overlap of the peeled image is
-- BvC mSpaceUnit mSpaceUnit = −1 (houseHolderM_null_peel_self_overlap).
--   The BOGUS claim that BvC (houseHolderM mSpaceUnit (houseHolderM bVec wVec))
-- (houseHolderM mSpaceUnit (houseHolderM bVec wVec)) = 126 (a stand-in for ANY wrong null-peel /
-- two-reflection / boost-rotation-split / norm-sum / dichotomy / sum-auxiliary / SO⁺(1,9)-exhaustion /
-- operator-topology claim: the two-reflection composite does NOT peel the null-difference image back /
-- does NOT preserve the Minkowski norm) forces −1 = 126, and must NOT compile.
--   The bite is a true counterexample, not vacuous: houseHolderM_null_peel_self_overlap is a banked
-- theorem (the peeled image's Minkowski self-overlap GENUINELY is −1 over the derived field), so the
-- costume's claim of 126 is genuinely FALSE.
--   The false numeric `(1 : Cut) = 126` (after −1 = 126 ⟹ via the read-off) is DISTINCT from the
-- banked battery (… C155 8=121, C156 1=123, C157 1=125).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/Minkowski/reflection/Householder/isometry/null/peel/
-- spacelike/anisotropic/two-reflection/signature": over the derived complete ordered field `Cut` and
-- STVC = Cut × Cut × O Cut, the composite map houseHolderM (0,1,0) (houseHolderM (1,2,e₂) (1,1,e₂))
-- equals (0,1,0), whose BvC self-overlap equals BvC (0,1,0) (0,1,0) = −1; claiming 126 forces the
-- false numeric. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the Minkowski self-overlap of the null-difference two-reflection-peeled image
    `houseHolderM mSpaceUnit (houseHolderM bVec wVec)` (`= mSpaceUnit`,
    `houseHolderM_null_two_reflection_witness`) is `BvC mSpaceUnit mSpaceUnit = −1`
    (`houseHolderM_null_peel_self_overlap`). The WRONG claim that it reads `126` (the two-reflection
    composite does NOT peel the null image back / does NOT preserve the Minkowski norm) forces the
    false numeric `(-1 : Cut) = 126`, i.e. `1 = 126` after sign, so this must NOT compile. -/
theorem null_peel_wrong_two_reflection_BOGUS :
    BvC (houseHolderM (mSpaceUnit : STVC) (houseHolderM (bVec : STVC) (wVec : STVC)))
        (houseHolderM (mSpaceUnit : STVC) (houseHolderM (bVec : STVC) (wVec : STVC))) = (126 : Cut) := by
  rw [houseHolderM_null_peel_self_overlap]

end

end Counterexamples
