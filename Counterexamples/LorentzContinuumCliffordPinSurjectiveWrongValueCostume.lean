import Phys.Algebra.LorentzContinuumCliffordPinSurjective

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C183): A BOGUS SURJECTIVITY / UNIT-NORMALIZATION / SCALE-INVARIANCE /
-- SQRT-RESCALING READ-OFF — "THE QUADRATIC FORM IS NOT HOMOGENEOUS OF DEGREE 2 UNDER RESCALING
-- (so the unit-normalization unitAxis fails to land on QvC = ±1, and the cover surjectivity onto
-- SO⁺(1,9) would not descend to the unit-normalized Pin group)".
-- N151 banks THE SURJECTIVITY of the unit-normalized Pin double cover coverMapPinUnit ↠ SO⁺(1,9)
-- (coverMapPinUnit_surjective): every linear BvC-isometry of STVC = Cut × Cut × O Cut is the
-- covered operator of an element of the unit-normalized Pin group PinUnitSub. The descent rests on
-- the SCALE-INVARIANCE of the reflection (houseHolderM_smul: houseHolderM (c•a) = houseHolderM a)
-- and the UNIT-NORMALIZATION unitAxis a := (cutSqrt |QvC a|⁻¹)•a, which works because the quadratic
-- form is HOMOGENEOUS OF DEGREE 2: QvC (c•a) = c·c·QvC a (QvC_smul). The concrete W8 non-vacuity
-- anchor is the read-off QvC ((1:Cut)•mTimeUnit) = 1·1·QvC mTimeUnit = 1·1·1 = 1 (QvC_smul +
-- QvC_mTimeUnit) — the rescaling GENUINELY scales the form by the square of the scalar, so the
-- unit-normalization is a real construction, not vacuous.
--   THE BOGUS claim that this rescaled-form read-off reads 151 (a stand-in for ANY wrong
-- surjectivity / unit-normalization / scale-invariance / sqrt-rescaling value: the form fails to be
-- degree-2 homogeneous / unitAxis fails to reach QvC = ±1 / the cover does not descend) forces,
-- after rewriting by the genuine values (QvC_smul, QvC_mTimeUnit), the false numeric `(1 : Cut) = 151`
-- and must NOT compile.
--   The bite is a true counterexample, not vacuous: QvC ((1:Cut)•mTimeUnit) GENUINELY equals 1 (a
-- banked theorem over the derived field Cut via QvC_smul + QvC_mTimeUnit), so the claim of 151 is
-- genuinely FALSE (1 ≠ 151 in the derived ordered field Cut, char 0).
--   The false numeric `1 = 151` is DISTINCT from the banked battery (… C180 2=148, C181 1=149,
-- C182 2=150).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/reflection/cover/spinor/Clifford/Pin/Minkowski/metric/
-- signature/isometry/surjectivity/unit-normalized/scale-invariance/sqrt-rescaling": over the derived
-- complete ordered field Cut, the quadratic form QvC on Cut × Cut × O Cut satisfies
-- QvC ((1:Cut)•(1,0,0)) = 1·1·QvC (1,0,0) = 1; claiming it equals 151 forces the false numeric. The
-- bite is a false NUMERIC, name-independent.

/-- BOGUS: the rescaled quadratic-form read-off `QvC ((1:Cut)•mTimeUnit)` equals `151`. It GENUINELY
    equals `1` (`QvC_smul` degree-2 homogeneity + `QvC_mTimeUnit`). The WRONG claim that it is `151`
    (the form fails to be degree-2 homogeneous / the unit-normalization `unitAxis` fails to reach
    `QvC = ±1` / the cover surjectivity does not descend to the unit-normalized Pin group) reduces,
    after rewriting by the genuine values, to the false numeric `(1 : Cut) = 151`, so this must NOT
    compile. -/
theorem clifford_pin_surjective_wrong_value_BOGUS :
    QvC ((1 : Cut) • (mTimeUnit : STVC)) = (151 : Cut) := by
  rw [QvC_smul, QvC_mTimeUnit, mul_one, mul_one]

end

end Counterexamples
