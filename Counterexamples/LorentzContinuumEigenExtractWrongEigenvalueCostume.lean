import Phys.Algebra.LorentzContinuumEigenExtract

namespace Counterexamples

open Phys.Cascade Phys.Algebra
open Phys.Foundation Phys.Foundation.ContinuumQ

attribute [local instance] CD.narCD CD.srCD

noncomputable section
open scoped BigOperators

-- WRONG (costume C102): A BOGUS SEED EIGENPAIR — THE WRONG EIGENVALUE FOR THE `mixA` DIRECTION.
-- N71 banks THE SEED EIGENPAIR EXTRACTION — the genuine VECTOR eigen-equation `specOpN l u (u k) =
-- (l k) • (u k)` and the concrete eigenpairs of N69's coordinate operator `txMix`: `txMix mixA =
-- 9•mixA`, `txMix mixB = 4•mixB`, `txMix mixW3 = 25•mixW3`. Reading the `mixA` eigenblock of `txMix`
-- through the banked existence identification `txMix = specOpN ![9,4,25] mix3` (`txMix_eq_specOpN`)
-- and the banked diagonal eigenblock reader `specOpN_read` over the EvC-orthonormal family
-- `mix3_orthonormal` gives `EvC (txMix (mix3 0)) (mix3 0) = (![9,4,25]) 0 = 9` — the TRUE eigenvalue
-- of the `mixA = mix3 0` direction. A BOGUS seed eigenpair claiming the `mixA` eigenvalue is `7`
-- (i.e. that the `mix3 0` eigenblock of `txMix` reads `7`) would, through those actual banked
-- definitions, reduce — on the left to the read coefficient `9` — and on the right, through the bogus
-- claim, to `7`. So the BOGUS seed eigenpair reduces, through the genuine banked machinery, to the
-- false numeric `9 = 7` and MUST FAIL to compile.
--   CORRECT: `txMix mixA = 9•mixA`; its `mix3 0` (mixA) eigenblock reads `9` — the genuine seed
--            eigenvalue that satisfies the N70 deflation engine's eigen-equation hypothesis.
-- The bite is `9 = 7` (distinct from C84 8=4, C85 0=2, C86 27=9, C87 10=8, C88 9=4, C89 50=0,
-- C90 1=-1, C91 25=7, C92 9=10, C93 9=11, C94 16=15, C95 1=7, C96 25=30, C97 25=9, C98 49=9,
-- C99 36=64, C100 36=25, C101 0=3).
theorem txMix_eigen_mixA_wrong_eigenvalue_BOGUS :
    EvC (txMix (mix3 0)) (mix3 0) = (7:Cut) := by
  rw [show EvC (txMix (mix3 0)) (mix3 0) = 9 from by
        rw [txMix_eq_specOpN, specOpN_read mix3_orthonormal 0]; rfl]

end

end Counterexamples
