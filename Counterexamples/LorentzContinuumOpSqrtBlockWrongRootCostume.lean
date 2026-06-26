import Phys.Algebra.LorentzContinuumOpSqrtBlock

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C92): A BOGUS 2-BLOCK (NON-SCALAR) OPERATOR SQUARE ROOT — claiming the diagonal
-- operator `blockDiag 2 3` is an operator square root of `blockDiag 4 10`, i.e. that
-- `(blockDiag 2 3)∘(blockDiag 2 3) = blockDiag 4 10`. The banked 2-block operator square root is
-- genuine: `(blockDiag 2 3)∘(blockDiag 2 3) = blockDiag (2·2)(3·3) = blockDiag 4 9` (N61
-- `blockDiag_comp`), and `blockDiag 4 9 ≠ blockDiag 4 10` since the `b` eigenblocks differ
-- (`3·3 = 9 ≠ 10`, N61 `blockDiag_inj`) — the positive operator square root of `blockDiag 4 10` is
-- `blockDiag (cutSqrt 4)(cutSqrt 10) = blockDiag 2 (cutSqrt 10)`, NOT `blockDiag 2 3` (N61
-- `not_blockDiag_op_sqrt_2_3` proves exactly this). A sloppy spectral/polar `√(g*g)` extraction that
-- guessed the wrong eigenblock root (`3` instead of `cutSqrt 10`) would commit exactly this error.
--   CORRECT:  (blockDiag 2 3)∘(blockDiag 2 3) = blockDiag 4 9,  and blockDiag 2 3 is NOT an operator
--             square root of blockDiag 4 10 (not_blockDiag_op_sqrt_2_3), the root being
--             blockDiag (cutSqrt 4)(cutSqrt 10) (blockDiag_op_sqrt).
-- Reading the WRONG squaring identity at the octonion eigenblock — `gFormC (·).2.2 1` of both sides
-- evaluated at `(0,0,1)` (the `b`-eigenblock reader, N61 `blockDiag_b_read`):
--   gFormC (((blockDiag 2 3)∘(blockDiag 2 3))(0,0,1)).2.2 1 = gFormC ((blockDiag 4 9)(0,0,1)).2.2 1 = 3·3 = 9.
--   gFormC ((blockDiag 4 10)(0,0,1)).2.2 1 = 10.
-- The WRONG square-root claim asserts these are equal, i.e. `3·3 = 9 = 10`. So the BOGUS 2-block
-- operator square root reduces, through the actual N61 `blockDiag_comp`/`blockDiag_b_read`
-- definitions, to the false numeric `9 = 10` and MUST FAIL to compile. The bite is `9 = 10`
-- (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0, C90 1=-1, C91 25=7).
theorem blockDiag_2_3_op_sqrt_4_10_BOGUS :
    gFormC (((blockDiag (2:Cut) (3:Cut)).comp (blockDiag (2:Cut) (3:Cut)))
        ((0:Cut), (0:Cut), (1:O Cut))).2.2 (1:O Cut)
  = gFormC ((blockDiag (4:Cut) (10:Cut)) ((0:Cut), (0:Cut), (1:O Cut))).2.2 (1:O Cut) := by
  rw [blockDiag_comp, blockDiag_b_read, blockDiag_b_read]
  ring_nf

end

end Counterexamples
