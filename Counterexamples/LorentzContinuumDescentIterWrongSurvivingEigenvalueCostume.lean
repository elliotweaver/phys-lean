import Phys.Algebra.LorentzContinuumDescentIter

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open scoped BigOperators

-- WRONG (costume C105): A BOGUS SURVIVING-EIGENVALUE IN THE GENERAL ITERATED DEFLATION DESCENT — the
-- WRONG eigenvalue for `mixW3` after the GENERAL `deflateList` machine peels the strict prefix `[0,1]`
-- of the genuine 10-dim-mixing operator `txMix`. N74 banks THE GENERAL ITERATED DEFLATION DESCENT: the
-- general iterator `deflateList`, run over the strict prefix `[0,1]` (peel `mixA(9)`, then `mixB(4)`),
-- leaves the surviving eigenpair `mixW3` with its genuine eigenvalue `25`
-- (`deflateList_mix_partial_survive : deflateList ![9,4,25] mix3 (specOpN ![9,4,25] mix3) [0,1] mixW3 =
-- 25 • mixW3`). Reading that surviving eigenvalue as the EvC self-overlap scalar —
-- `EvC (deflateList ![9,4,25] mix3 (specOpN ![9,4,25] mix3) [0,1] mixW3) mixW3` — gives, through the
-- banked `deflateList_mix_partial_survive` then `EvC_smul_left` and the unit norm
-- `mixW3_norm : EvC mixW3 mixW3 = 1`, the value `25 * 1 = 25` — the TRUE surviving eigenvalue the
-- general machine reads off the partial descent. A BOGUS claim that the general machine drops `mixW3`
-- to eigenvalue `13` would reduce, through those actual banked definitions — on the left to the read
-- coefficient `25`, on the right through the bogus claim to `13` — to the false numeric `25 = 13`, and
-- MUST FAIL to compile.
--   CORRECT: the surviving eigenvalue of `mixW3` after the general machine peels `[0,1]` is `25` — the
--            general descent is honest at every rank (no peel vacuously drops a still-present eigenpair),
--            so the headline termination of the full descent at the zero operator is real.
-- The bite is `25 = 13` (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0,
-- C90 1=-1, C91 25=7, C92 9=10, C93 9=11, C94 16=15, C95 1=7, C96 25=30, C97 25=9, C98 49=9,
-- C99 36=64, C100 36=25, C101 0=3, C102 9=7, C103 100=40, C104 25=11).
theorem deflateList_descent_wrong_surviving_eigenvalue_BOGUS :
    EvC (deflateList ![(9:Cut),4,25] mix3 (specOpN ![(9:Cut),4,25] mix3) [0,1] mixW3) mixW3
      = (13:Cut) := by
  rw [deflateList_mix_partial_survive, EvC_smul_left, mixW3_norm, mul_one]

end

end Counterexamples
