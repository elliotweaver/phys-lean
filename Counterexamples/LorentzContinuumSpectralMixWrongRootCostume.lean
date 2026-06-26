import Phys.Algebra.LorentzContinuumSpectralMix

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section

-- WRONG (costume C98): A BOGUS 10-DIMENSION-MIXING SPECTRAL SQUARE ROOT (wrong eigenvalue root).
-- The 10-dim-mixing spectral operator `specOp 4 9 mixA mixB` — over the EvC-orthonormal eigenbasis
-- {mixA, mixB} that MIXES the time axis with the octonion block (mixA = (3/5,0,(4/5)·1),
-- mixB = (4/5,0,(-3/5)·1)) — has genuine positive operator square root `specOp 2 3 mixA mixB`
-- (eigenvalues 2 = √4, 3 = √9 per the banked `specOp_mix_op_sqrt`). A BOGUS root claiming the
-- mixB-eigenvalue is `7` (i.e. `specOp 2 7 mixA mixB` a square root of `specOp 4 9 mixA mixB`)
-- would, by the banked `specOp_comp` composition law over the EvC-orthonormal pair, square to
-- `specOp 4 49 mixA mixB`; reading the `mixB` eigenblock of both sides via the banked
-- `specOp_read₂` gives, on the left, the squared eigenvalue `7·7 = 49`, and on the right the
-- genuine reading `9`. So the BOGUS mixing root reduces, through the actual banked definitions,
-- to the false numeric `49 = 9` and MUST FAIL to compile.
--   CORRECT: `specOp 2 3 mixA mixB` is the positive operator square root of `specOp 4 9 mixA mixB`
--            (mixB eigenvalue 3, squared reading 9 = the mixB reading of `specOp 4 9 mixA mixB`).
-- The bite is `49 = 9` (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0,
-- C90 1=-1, C91 25=7, C92 9=10, C93 9=11, C94 16=15, C95 1=7, C96 25=30, C97 25=9).
theorem specOp_mix_wrong_root_BOGUS :
    EvC (((specOp (2:Cut) 7 mixA mixB).comp (specOp (2:Cut) 7 mixA mixB)) mixB) mixB
      = EvC ((specOp (4:Cut) 9 mixA mixB) mixB) mixB := by
  rw [show EvC (((specOp (2:Cut) 7 mixA mixB).comp (specOp (2:Cut) 7 mixA mixB)) mixB) mixB = 49 from by
        rw [specOp_comp mixA_norm mixB_norm mix_orth, specOp_read₂ mixB_norm mix_orth]; norm_num,
      show EvC ((specOp (4:Cut) 9 mixA mixB) mixB) mixB = 9 from by
        rw [specOp_read₂ mixB_norm mix_orth]]

end

end Counterexamples
