import Phys.Algebra.LorentzContinuumSpectralExist

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open scoped BigOperators

-- WRONG (costume C100): A BOGUS SQUARE ROOT OF THE COORDINATE-GIVEN EXISTENCE WITNESS `txMix`.
-- N69 banks the EXISTENCE identification `txMix = specOpN ![9,4,25] mix3` (`txMix_eq_specOpN`): the
-- coordinate (NON-eigen-form) time↔octonion-real mixing operator `txMix` IS the rank-`n` spectral
-- operator over the EvC-orthonormal mixing 3-frame `mix3 = ![mixA, mixB, mixW3]`, eigenvalues
-- `9, 4, 25`. Its genuine positive operator square root is `specOpN ![3,2,5] mix3` (eigenvalues
-- `3 = √9`, `2 = √4`, `5 = √25` per `txMix_op_sqrt`). A BOGUS root claiming the `mixW3`-eigenvalue
-- (the 3rd, index `2`) is `6` (i.e. `specOpN ![3,2,6] mix3` a square root of `txMix`) would, by the
-- banked `specOpN_comp` composition law over the EvC-orthonormal family, square to
-- `specOpN ![9,4,36] mix3`; reading the `mix3 2` (= mixW3) eigenblock of both sides via the banked
-- `specOpN_read` gives, on the left, the squared eigenvalue `6·6 = 36`, and on the right — through
-- the existence identification `txMix = specOpN ![9,4,25] mix3` — the genuine reading `25`. So the
-- BOGUS root reduces, through the actual banked definitions, to the false numeric `36 = 25` and
-- MUST FAIL to compile.
--   CORRECT: `specOpN ![3,2,5] mix3` is the positive operator square root of `txMix` (mixW3
--            eigenvalue 5, squared reading 25 = the mixW3 reading of `txMix = specOpN ![9,4,25] mix3`).
-- The bite is `36 = 25` (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0,
-- C90 1=-1, C91 25=7, C92 9=10, C93 9=11, C94 16=15, C95 1=7, C96 25=30, C97 25=9, C98 49=9,
-- C99 36=64).
theorem txMix_wrong_root_BOGUS :
    EvC (((specOpN ![(3:Cut),2,6] mix3).comp (specOpN ![(3:Cut),2,6] mix3)) (mix3 2)) (mix3 2)
      = EvC (txMix (mix3 2)) (mix3 2) := by
  rw [show EvC (((specOpN ![(3:Cut),2,6] mix3).comp (specOpN ![(3:Cut),2,6] mix3)) (mix3 2)) (mix3 2)
          = 36 from by
        rw [specOpN_comp mix3_orthonormal, specOpN_read mix3_orthonormal 2]
        show (6:Cut) * 6 = 36; norm_num,
      show EvC (txMix (mix3 2)) (mix3 2) = 25 from by
        rw [txMix_eq_specOpN, specOpN_read mix3_orthonormal 2]; show (25:Cut) = 25; norm_num]

end

end Counterexamples
