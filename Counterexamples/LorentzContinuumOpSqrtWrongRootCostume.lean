import Phys.Algebra.LorentzContinuumOpSqrt

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C91): A BOGUS OPERATOR SQUARE ROOT — claiming the scalar operator `5·id` is an
-- operator square root of `7·id`, i.e. that `(5·id)∘(5·id) = 7·id`. The banked structured
-- operator square root is genuine: `(5·id)∘(5·id) = (5·5)·id = 25·id` (N60 `cutSmul_comp`), and
-- `25·id ≠ 7·id` since `25 ≠ 7` (N60 `cutSmul_id_inj`) — the positive operator square root of
-- `7·id` is `(cutSqrt 7)·id`, NOT `5·id` (N60 `not_scalar_op_sqrt_5_7` proves exactly this). A
-- sloppy operator-level polar/KAK `exp(p) = √(g*g)` extraction that guessed the wrong scalar root
-- (`5` instead of `cutSqrt 7`) would commit exactly this error.
--   CORRECT:  (5·id)∘(5·id) = 25·id,  and 5·id is NOT an operator square root of 7·id
--             (not_scalar_op_sqrt_5_7), the root of 7·id being (cutSqrt 7)·id (scalar_op_sqrt).
-- Reading the WRONG squaring identity at the time coordinate of the unit vector `(1,0,0)`:
--   ((5·id)∘(5·id)) (1,0,0) = (25·id)(1,0,0) = 25•(1,0,0),  so the .1 component is 25.
--   (7·id)(1,0,0) = 7•(1,0,0),  so the .1 component is 7.
-- The WRONG square-root claim asserts these are equal, i.e. `25 = 7`. So the BOGUS operator
-- square root reduces, through the actual N60 `cutSmul_comp`/`cutSmul_id_apply` definitions, to the
-- false numeric `25 = 7` and MUST FAIL to compile. The bite is `25 = 7` (distinct from C84 8=4,
-- C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0, C90 1=-1).
theorem scalar_op_sqrt_5_7_BOGUS :
    ((((5:Cut) • (LinearMap.id : Module.End Cut STVC)).comp
        ((5:Cut) • (LinearMap.id : Module.End Cut STVC))) ((1:Cut), (0:Cut), (0:O Cut))).1
  = (((7:Cut) • (LinearMap.id : Module.End Cut STVC)) ((1:Cut), (0:Cut), (0:O Cut))).1 := by
  rw [cutSmul_comp, cutSmul_id_apply, cutSmul_id_apply, Prod.smul_fst, Prod.smul_fst,
    smul_eq_mul, smul_eq_mul, mul_one, mul_one]
  ring_nf

end

end Counterexamples
