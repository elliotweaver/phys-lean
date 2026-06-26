import Phys.Algebra.LorentzContinuumSpectralN

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open scoped BigOperators

-- WRONG (costume C99): A BOGUS RANK-4 n-TERM SPECTRAL SQUARE ROOT (wrong eigenvalue root).
-- The general rank-n spectral operator `specOpN ![4,9,25,64] mix4` — over the EvC-orthonormal
-- 4-frame {mixA, mixB, mixW3, mixW4} that mixes time / space / octonion-real / octonion-imaginary
-- (mix4 = ![mixA, mixB, mixW3, mixW4]) — has genuine positive operator square root
-- `specOpN ![2,3,5,8] mix4` (eigenvalues 2 = √4, 3 = √9, 5 = √25, 8 = √64 per the banked
-- `specOpN_op_sqrt`/`specOpN_mix4_witness`). A BOGUS root claiming the mixW4-eigenvalue (the 4th,
-- index 3) is `6` (i.e. `specOpN ![2,3,5,6] mix4` a square root of `specOpN ![4,9,25,64] mix4`)
-- would, by the banked `specOpN_comp` composition law over the EvC-orthonormal family, square to
-- `specOpN ![4,9,25,36] mix4`; reading the `mix4 3` (= mixW4) eigenblock of both sides via the
-- banked `specOpN_read` gives, on the left, the squared eigenvalue `6·6 = 36`, and on the right the
-- genuine reading `64`. So the BOGUS rank-4 root reduces, through the actual banked definitions, to
-- the false numeric `36 = 64` and MUST FAIL to compile.
--   CORRECT: `specOpN ![2,3,5,8] mix4` is the positive operator square root of
--            `specOpN ![4,9,25,64] mix4` (mixW4 eigenvalue 8, squared reading 64 = the mixW4 reading
--            of `specOpN ![4,9,25,64] mix4`).
-- The bite is `36 = 64` (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0,
-- C90 1=-1, C91 25=7, C92 9=10, C93 9=11, C94 16=15, C95 1=7, C96 25=30, C97 25=9, C98 49=9).
theorem specOpN_mix4_wrong_root_BOGUS :
    EvC (((specOpN ![(2:Cut),3,5,6] mix4).comp (specOpN ![(2:Cut),3,5,6] mix4)) (mix4 3)) (mix4 3)
      = EvC ((specOpN ![(4:Cut),9,25,64] mix4) (mix4 3)) (mix4 3) := by
  rw [show EvC (((specOpN ![(2:Cut),3,5,6] mix4).comp (specOpN ![(2:Cut),3,5,6] mix4)) (mix4 3)) (mix4 3)
          = 36 from by
        rw [specOpN_comp mix4_orthonormal, specOpN_read mix4_orthonormal 3]
        show (6:Cut) * 6 = 36; norm_num,
      show EvC ((specOpN ![(4:Cut),9,25,64] mix4) (mix4 3)) (mix4 3) = 64 from by
        rw [specOpN_read mix4_orthonormal 3]; show (64:Cut) = 64; norm_num]

end

end Counterexamples
