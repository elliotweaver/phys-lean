import Phys.Algebra.LorentzContinuumGenerationSO8ReflectionInvolution

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C150): A BOGUS OCTONION-BLOCK REFLECTION-INVOLUTION / FACTORIZATION COORD CLAIM —
-- "THE ROUND-TRIPPED IMAGE octDeflate e₂ ιe₂ (octDeflate e₂ ιe₂ (0,0,ιe₂)) HAS THIRD-COMPONENT
-- BORN SELF-OVERLAP EQUAL TO 111".
-- N118 banks THE OCTONION-BLOCK REFLECTION-INVOLUTION + FACTORIZATION (the SO(8) reassembly). The
-- explicit octonion-block deflating reflection octDeflate e w := biMulLin n n at the normalized
-- bisector n := r⁻¹•(e − w) is a genuine INVOLUTION: octDeflate e w · octDeflate e w = 1
-- (octDeflate_involution, the banked N102 half-turn-square biMulLin_imag_involutive instantiated at
-- the unit-imaginary bisector — n·n = −1 by octDeflate_sq_neg_one, n·(n·z) = −z by the alternative
-- law octDeflate_mul_mul_left; the π half-turn applied twice is a 2π full turn = the identity, +1 on
-- every block, NO residual global sign). Consequently any operator T factors as
-- T = octDeflate e w · (octDeflate e w · T) (octDeflate_factorization), the right factor FIXING the
-- moved axis (octDeflate_step). For the concrete axis-moving image (0,0,ιe₂) (the unit ιe₂ ≠ e₂,
-- octDeflate_witness_ne), applying octDeflate e₂ ιe₂ TWICE returns (0,0,ιe₂) exactly
-- (octDeflate_involution_witness): the reflect-back to e₂ composed with itself is the identity, the
-- third component reading ιe₂ (octDeflate_roundtrip_coord), so its Born self-overlap is
-- gFormC ιe₂ ιe₂ = 1 (je2_gFormC_self — the round-trip returns the original UNIT).
-- The BOGUS claim that this round-tripped third-component self-overlap reads 111 (a stand-in for ANY
-- wrong reflection-involution / factorization / round-trip / axis-fixing claim: the reflection is NOT
-- a clean involution / the double-reflect lands off the start / breaks the unit overlap / the
-- factorization mis-assembles) forces 1 = 111, and must NOT compile.
--   The bite is a true counterexample, not vacuous: octDeflate_roundtrip_coord is a banked theorem
-- (the moved image ιe₂ genuinely IS returned to ιe₂ by the constructed bisector half-turn applied
-- twice, via the proved involution octDeflate_involution), and ιe₂ is a banked unit
-- (je2_gFormC_self), so the overlap genuinely IS 1, and the costume's claim of 111 is genuinely FALSE.
--   The false numeric `1 = 111` is DISTINCT from the banked battery (… C146 12/13=101, C147 1=103,
-- C148 3/5=107, C149 1=109).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/reflection/half-turn/involution/factorization/
-- isometry/SO(8)/SO(9)/bisector/axis/deflation/reassembly/stabilizer/Spin/Clifford/Householder/
-- generator/octonion-block/overlap": over the derived complete ordered field `Cut` and
-- `O Cut := CD(H Cut)`, the operator biMulLin n n (with n := (cutSqrt (gFormC (e₂−ιe₂) (e₂−ιe₂)))⁻¹
-- •(e₂−ιe₂)) applied TWICE to (0,0,ιe₂) has third component ιe₂, and gFormC ιe₂ ιe₂ = 1; claiming 111
-- forces 1 = 111. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the round-tripped image `octDeflate e₂ ιe₂ (octDeflate e₂ ιe₂ (0,0,ιe₂))` has third
    component `ιe₂` (`octDeflate_roundtrip_coord`, the reflection is an involution so the double
    application returns the start), whose Born self-overlap is `gFormC ιe₂ ιe₂ = 1`
    (`je2_gFormC_self`, the round-trip returns the original UNIT); the WRONG claim that this
    round-tripped self-overlap reads `111` (the reflection is not a clean involution / the double
    reflect lands off the start / breaks the unit overlap) forces the false numeric `1 = 111`, so
    this must NOT compile. -/
theorem so8_reflection_involution_wrong_coord_BOGUS :
    gFormC ((octDeflate (CD.e2 : O Cut) (je2 : O Cut)
        (octDeflate (CD.e2 : O Cut) (je2 : O Cut)
          ((0:Cut), (0:Cut), (je2 : O Cut)))).2.2) (je2 : O Cut) = (111 : Cut) := by
  rw [octDeflate_roundtrip_coord, je2_gFormC_self]

end

end Counterexamples
