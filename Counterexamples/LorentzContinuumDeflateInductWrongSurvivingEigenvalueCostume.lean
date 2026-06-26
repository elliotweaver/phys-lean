import Phys.Algebra.LorentzContinuumDeflateInduct

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open scoped BigOperators

-- WRONG (costume C104): A BOGUS SURVIVING-EIGENVALUE IN THE CLOSED DEFLATION DESCENT — the WRONG
-- eigenvalue for `mixW3` after the SECOND peel of the genuine 10-dim-mixing operator `txMix`.
-- N73 banks THE FIRST CLOSED MULTI-STEP DEFLATION DESCENT: after peeling `mixA(9)` and then `mixB(4)`,
-- the last eigenpair `mixW3` SURVIVES in the twice-deflated operator with its genuine eigenvalue `25`
-- (`deflateC_step2_survive : deflateC (specOpN ![0,4,25] mix3) 4 mixB mixW3 = 25 • mixW3`). Reading that
-- surviving eigenvalue as the EvC self-overlap scalar — `EvC (deflateC (specOpN ![0,4,25] mix3) 4 mixB
-- mixW3) mixW3` — gives, through the banked `deflateC_step2_survive` then `EvC_smul_left` and the unit
-- norm `mixW3_norm : EvC mixW3 mixW3 = 1`, the value `25 * 1 = 25` — the TRUE surviving eigenvalue of
-- the third peel. A BOGUS descent claiming that surviving eigenvalue is `11` would reduce, through those
-- actual banked definitions — on the left to the read coefficient `25`, on the right through the bogus
-- claim to `11` — to the false numeric `25 = 11`, and MUST FAIL to compile.
--   CORRECT: the surviving eigenvalue of `mixW3` after the second peel is `25` — the descent is honest
--            at every rank (no peel vacuously drops a still-present eigenpair), so the termination of the
--            full 3-step descent at the zero operator is real.
-- The bite is `25 = 11` (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0,
-- C90 1=-1, C91 25=7, C92 9=10, C93 9=11, C94 16=15, C95 1=7, C96 25=30, C97 25=9, C98 49=9,
-- C99 36=64, C100 36=25, C101 0=3, C102 9=7, C103 100=40).
theorem deflateC_descent_wrong_surviving_eigenvalue_BOGUS :
    EvC (deflateC (specOpN ![(0:Cut),4,25] mix3) (4:Cut) mixB mixW3) mixW3 = (11:Cut) := by
  rw [deflateC_step2_survive, EvC_smul_left, mixW3_norm, mul_one]

end

end Counterexamples
