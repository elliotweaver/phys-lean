import Phys.Algebra.LorentzContinuumOpSqrtCoord

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C93): A BOGUS OCTONION-INTERNAL (3-EIGENVALUE) COORDINATE-DIAGONAL OPERATOR SQUARE
-- ROOT — claiming the coordinate-diagonal operator `coordDiag3 1 2 3` is an operator square root of
-- `coordDiag3 1 4 11`, i.e. that `(coordDiag3 1 2 3)∘(coordDiag3 1 2 3) = coordDiag3 1 4 11`. The
-- banked coordinate-diagonal operator square root is genuine: `(coordDiag3 1 2 3)∘(coordDiag3 1 2 3)
-- = coordDiag3 (1·1)(2·2)(3·3) = coordDiag3 1 4 9` (N62 `coordDiag3_comp`), and `coordDiag3 1 4 9 ≠
-- coordDiag3 1 4 11` since the octonion IM-HALF eigenblocks differ (`3·3 = 9 ≠ 11`, N62
-- `coordDiag3_inj`) — the positive operator square root of `coordDiag3 1 4 11` is
-- `coordDiag3 (cutSqrt 1)(cutSqrt 4)(cutSqrt 11) = coordDiag3 1 2 (cutSqrt 11)`, NOT `coordDiag3 1 2 3`
-- (N62 `not_coordDiag3_op_sqrt_1_2_3` proves exactly this). A sloppy spectral diagonalization that
-- guessed the wrong im-half eigenvalue root (`3` instead of `cutSqrt 11`) would commit exactly this.
--   CORRECT:  (coordDiag3 1 2 3)∘(coordDiag3 1 2 3) = coordDiag3 1 4 9,  and coordDiag3 1 2 3 is NOT
--             an operator square root of coordDiag3 1 4 11 (not_coordDiag3_op_sqrt_1_2_3), the root
--             being coordDiag3 (cutSqrt 1)(cutSqrt 4)(cutSqrt 11) (coordDiag3_op_sqrt).
-- Reading the WRONG squaring identity at the octonion IM-HALF eigenblock — `gFormC (·).2.2 e2` of
-- both sides evaluated at `(0,0,e2)` (the im-half eigenblock reader, N62 `coordDiag3_b2_read`):
--   gFormC (((coordDiag3 1 2 3)∘(coordDiag3 1 2 3))(0,0,e2)).2.2 e2
--     = gFormC ((coordDiag3 1 4 9)(0,0,e2)).2.2 e2 = 3·3 = 9.
--   gFormC ((coordDiag3 1 4 11)(0,0,e2)).2.2 e2 = 11.
-- The WRONG square-root claim asserts these are equal, i.e. `3·3 = 9 = 11`. So the BOGUS
-- octonion-internal coordinate-diagonal operator square root reduces, through the actual N62
-- `coordDiag3_comp`/`coordDiag3_b2_read` definitions, to the false numeric `9 = 11` and MUST FAIL to
-- compile. The bite is `9 = 11` (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4,
-- C89 50=0, C90 1=-1, C91 25=7, C92 9=10).
theorem coordDiag3_1_2_3_op_sqrt_1_4_11_BOGUS :
    gFormC (((coordDiag3 (1:Cut) (2:Cut) (3:Cut)).comp (coordDiag3 (1:Cut) (2:Cut) (3:Cut)))
        ((0:Cut), (0:Cut), (CD.e2 : O Cut))).2.2 (CD.e2 : O Cut)
  = gFormC ((coordDiag3 (1:Cut) (4:Cut) (11:Cut)) ((0:Cut), (0:Cut), (CD.e2 : O Cut))).2.2
      (CD.e2 : O Cut) := by
  rw [coordDiag3_comp, coordDiag3_b2_read, coordDiag3_b2_read]
  ring_nf

end

end Counterexamples
