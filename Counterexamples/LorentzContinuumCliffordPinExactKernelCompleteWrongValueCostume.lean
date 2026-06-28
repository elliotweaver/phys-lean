import Phys.Algebra.LorentzContinuumCliffordPinExactKernelComplete

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C182): A BOGUS CONTRACTION-KERNEL / SCALAR / DEGREE / EXACT-KERNEL READ-OFF —
-- "THE POLAR-DUAL INTERIOR PRODUCT DOES NOT DETECT GRADE 1 (its value on a grade-1 generator is
-- mis-read, so Lemma Z would be VACUOUS / the contraction-kernel would wrongly contain non-scalars)".
-- N150 banks THE GLOBAL LEMMA Z and THE FULL EXACT KERNEL mker coverMapPinUnit = {1,-1}: an element
-- of the Clifford algebra CliffC = CliffordAlgebra QvCQuad over the derived field Cut killed by EVERY
-- polar-dual interior product contractLeft (polarBilin QvCQuad v) is a scalar algebraMap μ
-- (lemmaZ — via dual surjectivity polarBilin_surjective from N149's polarBilin_separating, transport
-- equivExterior, and the exterior number operator numOp whose grade eigenvalue numOp_eigen forces
-- every grade ≥ 1 component to vanish), and hence the unit-normalized Pin double cover has exact
-- kernel {1,-1} (coverMapPinUnit_mker_eq).
--   The W8 non-vacuity anchor is the banked read-off contract_iota_timelike (N148):
-- contractLeft (polarBilin mTimeUnit) (ι mTimeUnit) = 2 — the interior product GENUINELY detects the
-- grade-1 generator ι mTimeUnit with a NONZERO value, so a non-scalar like ι mTimeUnit is NOT in the
-- contraction kernel: Lemma Z is a real constraint (the contraction-kernel really is the scalars), not
-- vacuous.
--   THE BOGUS claim that this grade-1 contraction value reads 150 (a stand-in for ANY wrong
-- contraction / scalar / degree / exact-kernel value: the interior product fails to detect grade 1 /
-- Lemma Z is mis-stated / the kernel wrongly admits a non-scalar) forces, after rewriting by the
-- genuine value (contract_iota_timelike), the false numeric `(2 : CliffC) = 150` and must NOT compile.
--   The bite is a true counterexample, not vacuous: the contraction GENUINELY equals 2 (a banked
-- theorem over CliffC), so the claim of 150 is genuinely FALSE (2 ≠ 150 in CliffC, char 0).
--   The false numeric `2 = 150` is DISTINCT from the banked battery (… C179 1=147, C180 2=148,
-- C181 1=149).
--   PHYSICS-WORDS-REMOVABLE: delete "Clifford/Pin/Spin/cover/spinor/Minkowski/metric/grade/degree/
-- contraction/interior-product/scalar/exact-kernel/kernel/Lorentz": over the derived field Cut, the
-- interior product contractLeft (polarBilin QvCQuad mTimeUnit) of the algebra-generator
-- ι QvCQuad mTimeUnit equals 2; claiming it equals 150 forces the false numeric. The bite is a false
-- NUMERIC, name-independent.

/-- BOGUS: the polar-dual interior product of the grade-1 generator
    `contractLeft (polarBilin mTimeUnit) (ι mTimeUnit)` equals `150`. It GENUINELY equals `2`
    (`contract_iota_timelike`). The WRONG claim that it is `150` (the contraction fails to detect
    grade 1 / Lemma Z is vacuous / the contraction-kernel admits a non-scalar) reduces, after
    rewriting by the genuine value, to the false numeric `(2 : CliffC) = 150`, so this must NOT
    compile. -/
theorem clifford_pin_exact_kernel_complete_wrong_value_BOGUS :
    CliffordAlgebra.contractLeft (QuadraticMap.polarBilin QvCQuad (mTimeUnit : STVC))
        (CliffordAlgebra.ι QvCQuad (mTimeUnit : STVC)) = (150 : CliffC) := by
  rw [contract_iota_timelike]

end

end Counterexamples
