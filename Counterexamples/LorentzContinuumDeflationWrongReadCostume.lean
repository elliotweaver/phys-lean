import Phys.Algebra.LorentzContinuumDeflation

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open scoped BigOperators

-- WRONG (costume C101): A BOGUS DEFLATION READING OF THE PEEL-OFF ENGINE ON `txMix`.
-- N70 banks THE DEFLATION / PEEL-OFF ENGINE — the inductive step of the spectral existence theorem.
-- Deflating N69's coordinate (NON-eigen-form) time↔octonion-real mixing operator `txMix` at its
-- `mixA` eigenpair (eigenvalue `9`) PEELS that eigenvalue off: `deflateC txMix 9 mixA =
-- specOpN ![0,4,25] mix3` (`deflateC_txMix_fst`), so the `mix3 0` (= mixA) eigenblock reads `0` —
-- the peeled eigenvector has LEFT the operator (`deflateC_eigen_kills` / `deflateC_image_orth`: the
-- whole image is EvC-orthogonal to `mixA`). A BOGUS deflation claiming the `mixA` eigenvalue is NOT
-- removed but left at `3` (i.e. that the `mix3 0` eigenblock of `deflateC txMix 9 mixA` reads `3`)
-- would, by the banked existence reduction `deflateC_txMix_fst` and the banked diagonal eigenblock
-- reader `specOpN_read` over the EvC-orthonormal family `mix3_orthonormal`, reduce — on the left,
-- through the bogus claim — to `3`, and on the right, through the genuine deflation, to the read
-- coefficient `0` (eigenvalue `k=0` zeroed). So the BOGUS deflation reduces, through the actual
-- banked definitions, to the false numeric `0 = 3` and MUST FAIL to compile.
--   CORRECT: `deflateC txMix 9 mixA = specOpN ![0,4,25] mix3`; its `mix3 0` (mixA) eigenblock reads
--            `0` — the eigenpair is peeled off, the effective rank drops to `{mixB(4), mixW3(25)}`.
-- The bite is `0 = 3` (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0,
-- C90 1=-1, C91 25=7, C92 9=10, C93 9=11, C94 16=15, C95 1=7, C96 25=30, C97 25=9, C98 49=9,
-- C99 36=64, C100 36=25).
theorem deflateC_txMix_wrong_read_BOGUS :
    EvC (deflateC txMix (9:Cut) mixA (mix3 0)) (mix3 0) = (3:Cut) := by
  rw [show EvC (deflateC txMix (9:Cut) mixA (mix3 0)) (mix3 0) = 0 from by
        rw [deflateC_txMix_fst, specOpN_read mix3_orthonormal 0]; rfl]

end

end Counterexamples
