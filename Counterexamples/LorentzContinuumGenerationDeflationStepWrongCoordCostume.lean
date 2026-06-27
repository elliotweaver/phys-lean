import Phys.Algebra.LorentzContinuumGenerationDeflationStep

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD
attribute [local instance] Phys.Algebra.dblModuleCut

noncomputable section

-- WRONG (costume C147): A BOGUS x-MOVING → x-FIXING DEFLATION COORD CLAIM — "THE CONCRETE x-MOVING
-- IMAGE (0, 3/5, (4/5)•e₂), DEFLATED BY deflateNinth (3/5) ((4/5)•e₂), HAS x-SLOT 103".
-- N115 banks THE DEFLATION STEP (the SO(9) → SO(8) reduction): for ANY compact QvC-isometry whose
-- x-axis image MOVES (T(0,1,0) = (0,x',v'), v'≠0), the explicit general-axis ninth rotation
-- deflateNinth x' v' := axisRotLin (r⁻¹•v') x' (−r) (r := cutSqrt (gFormC v' v')) rotates the moved
-- image (0,x',v') BACK to the pole (0,1,0) (deflateNinth_apply_image), so the composite
-- deflateNinth x' v' · T FIXES (0,1,0) (deflateNinth_step) — the x-motion is peeled off. The unit-sphere
-- law x'²+gFormC v' v'=1 (isom_xaxis_image_norm) falls out of QvC preservation; the rotate-back is the
-- completing-the-square: x-slot becomes x'·x' − (−r)·r = x'² + r·r = x'² + gFormC v' v' = 1, and the
-- v-block becomes (1 + (−1))•v' = 0. For the concrete x-moving image (3/5, (4/5)•e₂) (which obeys the
-- unit-sphere law (3/5)² + (4/5)²·1 = 1, deflate_witness_norm, with v' genuinely nonzero,
-- deflate_witness_v_ne), the deflated x-slot reads 1 (deflate_witness_x_val) — the moved image rotated
-- back to the pole. The BOGUS claim that this deflated x-slot reads 103 (a stand-in for ANY wrong "the
-- deflation does not return to the pole / the x-motion is not peeled off / the composite does not fix
-- (0,1,0) / the rotate-back fails") forces 1 = 103, and must NOT compile.
--   The bite is a true counterexample, not vacuous: deflate_witness_x_val is a banked theorem (the
-- genuine x-moving image (3/5,(4/5)•e₂), deflated by the constructed general-axis rotation, genuinely
-- has x-slot 1, via the proved rotate-back deflateNinth_apply_image and cutSqrt (4/5·4/5·1) = 4/5), so
-- the coordinate genuinely IS 1, and the costume's claim of 103 is genuinely FALSE.
--   The false numeric `1 = 103` is DISTINCT from the banked battery (… C144 3/5=89, C145 4/5=97,
-- C146 12/13=101).
--   PHYSICS-WORDS-REMOVABLE: delete "Lorentz/rotation/axis/isometry/compact/orthogonal/SO(9)/SO(8)/
-- sphere/circle/ninth-direction/deflation/peel/stabilizer/pole/Spin/KAK/generator": over the derived
-- complete ordered field `Cut` and `O Cut := CD(H Cut)`, the operator axisRotLin ((4/5)⁻¹•((4/5)•e₂))
-- (3/5) (−(4/5)), applied to (0, 3/5, (4/5)•e₂), has second coordinate 1; claiming 103 forces 1 = 103.
-- The bite is a false NUMERIC, name-independent.

/-- BOGUS: the concrete `x`-moving image `(0, 3/5, (4/5)•e₂)`, deflated by `deflateNinth (3/5)
    ((4/5)•e₂)`, has `x`-slot `1` (`deflate_witness_x_val`, the moved image rotated back to the pole);
    the WRONG claim that this deflated `x`-slot reads `103` (the deflation does not return to the pole
    / the x-motion is not peeled off / the composite does not fix `(0,1,0)`) forces the false numeric
    `1 = 103`, so this must NOT compile. -/
theorem deflation_step_wrong_coord_BOGUS :
    (deflateNinth ((3:Cut)/5) (((4:Cut)/5) • (CD.e2 : O Cut))
        ((0:Cut), (3:Cut)/5, ((4:Cut)/5) • (CD.e2 : O Cut))).2.1 = (103 : Cut) := by
  rw [deflate_witness_x_val]

end

end Counterexamples
