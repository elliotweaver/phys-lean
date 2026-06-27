import Phys.Algebra.LorentzContinuumGenerationNinthRotationCircle

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C139): A BOGUS NINTH-ROTATION DOUBLE-ANGLE / CIRCLE-SUBGROUP COMPOSITION COORD
-- CLAIM — "THE DOUBLED NINTH-DIRECTION ROTATION planeRotLin (3/5)(4/5) COMPOSED WITH ITSELF, APPLIED
-- TO (0,1,0), READS x-IMAGE 67".
-- N107 banks the NINTH-ROTATION CIRCLE SUBGROUP structure: the ninth-direction rotations
-- planeRotLin c s form a CLOSED 1-parameter abelian subgroup ≅ SO(2) under the angle-addition
-- composition law planeRotLin c₁ s₁ * planeRotLin c₂ s₂ = planeRotLin (c₁c₂−s₁s₂)(c₁s₂+s₁c₂). For
-- the circle point (3/5, 4/5) the DOUBLE-ANGLE composite is planeRotLin (−7/25)(24/25): the cosine
-- DOUBLES to c²−s² = 9/25 − 16/25 = −7/25 (the genuine SUBTRACTION law), NOT the c²+s² = 1 a wrong
-- addition law cos = c₁c₂+s₁s₂ would give. Applied to (0,1,0) (planeRotDouble_moves_x) the genuine
-- x-image is the doubled cosine −7/25. The BOGUS claim that this x-image is 67 (a stand-in for ANY
-- wrong "the composition law adds instead of subtracts the sines / the double-angle reads a different
-- x-image / the ninth rotations are not closed") forces −7/25 = 67, and must NOT compile.
--   The bite is a true counterexample, not vacuous: `planeRotDouble_moves_x` is a banked theorem
-- (the double-angle of (3/5,4/5) genuinely sends x = 1 ↦ −7/25 via the proved composition law), so
-- the x-image genuinely IS −7/25, and the costume's claim of 67 is genuinely FALSE.
--   The false numeric `−7/25 = 67` is DISTINCT from the banked battery (… C135 1=47, C136 −1=53,
-- C137 3/5=59, C138 5/13=61).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/isometry/compact/orthogonal/word/generation/
-- generator/2-plane/ninth-direction/Spin/SO(9)/SO(8)/SO(2)/octonion-block/alphabet/circle/torus/
-- angle/double-angle": over the derived complete ordered field `Cut` and `O Cut := CD(H Cut)`, the
-- Cut-linear operator (planeRotLin (3/5)(4/5) * planeRotLin (3/5)(4/5)) applied to (0,1,0) reads
-- second coordinate −7/25; claiming 67 forces −7/25 = 67. The bite is a false NUMERIC, name-independent.

/-- BOGUS: the doubled ninth-direction rotation `planeRotLin (3/5)(4/5)` composed with itself MOVES
    the `x`-coordinate — applied to `(0,1,0)` the `x`-image is the doubled cosine `−7/25`
    (`planeRotDouble_moves_x`); the WRONG claim that this `x`-image is `67` (the composition adds
    instead of subtracts / the rotations are not closed) forces the false numeric `−7/25 = 67`, so
    this must NOT compile. -/
theorem ninth_rotation_double_angle_wrong_x_coord_BOGUS :
    ((planeRotLin ((3:Cut)/5) ((4:Cut)/5) * planeRotLin ((3:Cut)/5) ((4:Cut)/5))
        ((0:Cut), (1:Cut), (0:O Cut))).2.1 = (67 : Cut) := by
  rw [planeRotDouble_moves_x]

end

end Counterexamples
