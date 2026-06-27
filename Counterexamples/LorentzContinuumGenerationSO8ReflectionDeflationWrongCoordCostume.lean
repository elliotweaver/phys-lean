import Phys.Algebra.LorentzContinuumGenerationSO8ReflectionDeflation

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C149): A BOGUS OCTONION-BLOCK REFLECTION-DEFLATION COORD CLAIM — "THE
-- REFLECTED-BACK IMAGE octDeflate e₂ ιe₂ (0,0,ιe₂) HAS THIRD-COMPONENT BORN-OVERLAP WITH e₂
-- EQUAL TO 109".
-- N117 banks THE OCTONION-BLOCK AXIS-FIXING REFLECTION DEFLATION (the SO(8) analogue of N115's
-- x-deflation step). The explicit octonion-block deflating reflection octDeflate e w := biMulLin n n
-- at the normalized bisector n := r⁻¹•(e − w) (r := cutSqrt (gFormC (e−w) (e−w)), N57) reflects a
-- MOVED unit-imaginary axis image (0,0,w) BACK to the chosen axis (0,0,e) (octDeflate_apply_image,
-- via the bisector swap octRefl_swap_norm: the reflection identity octRefl_reflect_imag — the
-- alternativity-governed two-sided half-turn m·(v·m) = (gFormC m m)•v − (2·gFormC v m)•m — applied
-- at m = e−w sends w onto a scalar multiple of e, normalized to exactly e by the degree-2 scaling
-- octRefl_biMul_scale + cutSqrt_sq). For the concrete axis-moving image (0,0,ιe₂) (the unit ιe₂ ≠ e₂,
-- octDeflate_witness_ne, Born-orthogonal octDeflate_e2_je2_gFormC_zero), the reflection sends it back
-- to (0,0,e₂): its third component reads e₂ exactly (octDeflate_witness_coord), so the third-component
-- Born self-overlap with e₂ is gFormC e₂ e₂ = 1 (e2_gFormC_self — the image is the chosen UNIT axis).
-- The BOGUS claim that this reflected-back third-component overlap reads 109 (a stand-in for ANY wrong
-- octonion-block-deflation / reflection-identity / bisector-swap / reflect-back / axis-fixing claim:
-- the half-turn does not reflect w back to e / lands off the axis / breaks the unit overlap) forces
-- 1 = 109, and must NOT compile.
--   The bite is a true counterexample, not vacuous: octDeflate_witness_coord is a banked theorem (the
-- moved image ιe₂ genuinely IS reflected to e₂ by the constructed bisector half-turn, via the proved
-- reflect-back octDeflate_apply_image), and e₂ is a banked unit (e2_gFormC_self), so the overlap
-- genuinely IS 1, and the costume's claim of 109 is genuinely FALSE.
--   The false numeric `1 = 109` is DISTINCT from the banked battery (… C145 4/5=97, C146 12/13=101,
-- C147 1=103, C148 3/5=107).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/reflection/half-turn/isometry/SO(8)/SO(9)/
-- bisector/axis/deflation/peel/stabilizer/Spin/Clifford/Householder/generator/octonion-block/
-- overlap": over the derived complete ordered field `Cut` and `O Cut := CD(H Cut)`, the operator
-- biMulLin n n (with n := (cutSqrt (gFormC (e₂−ιe₂) (e₂−ιe₂)))⁻¹•(e₂−ιe₂)) applied to (0,0,ιe₂) has
-- third component e₂, and gFormC e₂ e₂ = 1; claiming 109 forces 1 = 109. The bite is a false NUMERIC,
-- name-independent.

/-- BOGUS: the reflected-back image `octDeflate e₂ ιe₂ (0,0,ιe₂)` has third component `e₂`
    (`octDeflate_witness_coord`), whose Born self-overlap is `gFormC e₂ e₂ = 1` (`e2_gFormC_self`,
    the image is the chosen UNIT axis); the WRONG claim that this reflected-back overlap reads `109`
    (the half-turn does not reflect the moved image back to the axis / breaks the unit overlap)
    forces the false numeric `1 = 109`, so this must NOT compile. -/
theorem so8_reflection_deflation_wrong_coord_BOGUS :
    gFormC ((octDeflate (CD.e2 : O Cut) (je2 : O Cut)
        ((0:Cut), (0:Cut), (je2 : O Cut))).2.2) (CD.e2 : O Cut) = (109 : Cut) := by
  rw [octDeflate_witness_coord, e2_gFormC_self]

end

end Counterexamples
