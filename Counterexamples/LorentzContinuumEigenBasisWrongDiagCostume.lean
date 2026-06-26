import Phys.Algebra.LorentzContinuumEigenBasis

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C95): A BOGUS EIGENDECOMPOSITION of the concretely-presented equal-diagonal
-- symmetric operator `txOp 5 4 5` (the `(t,x)`-plane map `(t,x,v) ↦ (5t+4x, 4t+5x, 0)`) — claiming
-- it diagonalizes as `specOp 9 7 u₊ u₋` in the FIXED 45° EvC-orthonormal eigenbasis {u₊,u₋}
-- (`u₊=(s,s,0)`, `u₋=(s,−s,0)`, `s=cutSqrt (1/2)`), i.e. with second eigenvalue `7` on `u₋`. The
-- banked GENERAL eigendecomposition (`txOp_eq_specOp`) is genuine: for EVERY `a,b`,
-- `txOp a b a = specOp (a+b)(a−b) u₊ u₋`, so the equal-diagonal member `txOp 5 4 5` has eigenvalues
-- `a+b = 5+4 = 9` and `a−b = 5−4 = 1` — `txOp 5 4 5 = specOp 9 1 u₊ u₋` (`txOp_5_4_5_diag`), NOT
-- `specOp 9 2`. A sloppy change-of-basis diagonalization that read the second eigenvalue off the
-- antidiagonal as `7` instead of `1` would commit exactly this.
--   CORRECT:  txOp 5 4 5 = specOp 9 1 u₊ u₋  (txOp_5_4_5_diag), the u₋ eigenvalue being a−b = 1.
-- Reading the WRONG diagonalization at the u₋ eigenblock — `EvC (·  u₋) u₋` of both sides (the
-- rotated-basis eigenblock reader, N63 `specOp_read₂` with `uM_norm`/`uPM_orth`):
--   EvC ((txOp 5 4 5) u₋) u₋ = EvC ((specOp 9 1 u₊ u₋) u₋) u₋ = 1   (the true u₋ eigenvalue).
--   EvC ((specOp 9 7 u₊ u₋) u₋) u₋ = 7.
-- The WRONG eigendecomposition asserts these are equal, i.e. `1 = 7`. So the BOGUS eigendecomposition
-- reduces, through the actual banked `txOp_5_4_5_diag`/N63 `specOp_read₂` definitions, to the false
-- numeric `1 = 7` and MUST FAIL to compile. The bite is `1 = 7` (distinct from C84 8=4, C85 0=2,
-- C86 27=9, C87 10=8, C88 9=4, C89 50=0, C90 1=-1, C91 25=7, C92 9=10, C93 9=11, C94 16=15).
theorem txOp_5_4_5_diag_BOGUS :
    EvC ((txOp (5:Cut) 4 5) uM) uM = EvC ((specOp (9:Cut) (7:Cut) uP uM) uM) uM := by
  rw [txOp_5_4_5_diag, specOp_read₂ uM_norm uPM_orth, specOp_read₂ uM_norm uPM_orth]

end

end Counterexamples
